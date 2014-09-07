//**************************************************************************
// RISCV Processor 1-Stage Datapath
//--------------------------------------------------------------------------
//
// Christopher Celio
// 2012 Jan 11

module dpath (
  // system signals
  input  logic clk, // clock
  input  logic rst, // reset
  // interfaces
  HTIFIO    host
  MemPortIo imem,
  MemPortIo dmem,
  CtlToDatIo ctl,
  DatToCtlIo dat
);

import Constants._
import Common._
import Common.Constants._

// Instruction Fetch
logic [32-1:0] pc_next         ;
logic [32-1:0] pc_plus4        ;
logic [32-1:0] br_target       ;
logic [32-1:0] jmp_target      ;
logic [32-1:0] jump_reg_target ;
logic [32-1:0] exception_target;
 
// PC Register
logic [32-1:0] pc_reg;

always_ff (posedge clk, posedge rst)
if (rst)               pc_reg <= START_ADDR;
else if (!ctl__stall)  pc_reg <= pc_next

assign pc_plus4 = pc_reg + 4;               

always_comb begin
  case (io.ctl.pc_sel)
    PC_4   : pc_next = pc_plus4;
    PC_BR  : pc_next = br_target;
    PC_J   : pc_next = jmp_target;
    PC_JR  : pc_next = jump_reg_target;
    PC_EXC : pc_next = exception_target;
    default: pc_next = pc_plus4;
end
   
   io.imem.req.bits.addr := pc_reg
   val inst = Mux(io.imem.resp.valid, io.imem.resp.bits.data, BUBBLE) 
                 
   
   // Decode
logic [5-1:0] rs1_addr;
logic [5-1:0] rs2_addr;
logic [5-1:0] wb_addr ;
assign rs1_addr = inst[RS1_MSB:RS1_LSB];
assign rs2_addr = inst[RS2_MSB:RS2_LSB];
assign wb_addr  = inst[ RD_MSB: RD_LSB];
   
logic [32-1:0] wb_data;
 
// Register File
logic [32-1:0] regfile [0:32-1];

always_ff (posedge clk)
if (ctl__rf_wen && |wb_addr)
regfile[wb_addr] <= wb_data;

logic [32-1:0] rs1_data;
logic [32-1:0] rs2_data;
assign rs1_data = |rs1_addr ? regfile[rs1_addr] : 32'd0;
assign rs2_data = |rs2_addr ? regfile[rs2_addr] : 32'd0;
   
   // immediates
   val imm_i =     inst(31, 20) 
   val imm_s = Cat(inst(31, 25), inst(11,7))
   val imm_b = Cat(inst(31), inst(7), inst(30,25), inst(11,8))
   val imm_u =     inst(31, 12)
   val imm_j = Cat(inst(31), inst(19,12), inst(20), inst(30,21))
   val imm_z = Cat(Fill(UInt(0), 27), inst(19,15))

   // sign-extend immediates
   val imm_i_sext = Cat(Fill(imm_i(11), 20), imm_i)
   val imm_s_sext = Cat(Fill(imm_s(11), 20), imm_s)
   val imm_b_sext = Cat(Fill(imm_b(11), 19), imm_b, UInt(0))
   val imm_u_sext = Cat(imm_u, Fill(UInt(0), 12))
   val imm_j_sext = Cat(Fill(imm_j(19), 11), imm_j, UInt(0))
   
   
always_comb begin
  case (io.ctl.op1_sel)
    OP1_RS1: alu_op1 = rs1_data;
    OP1_IMU: alu_op1 = imm_u_sext;
    OP1_IMZ: alu_op1 = imm_z;
    default: alu_op1 = 0;
  endcase
end

always_comb begin
  case (io.ctl.op2_sel)
    OP2_RS2: alu_op2 = rs2_data;
    OP2_PC : alu_op2 = pc_reg;
    OP2_IMI: alu_op2 = imm_i_sext;
    OP2_IMS: alu_op2 = imm_s_sext;
    default: alu_op1 = 0;
  endcase
end

// ALU
logic [32-1:0] alu_out;
   
logic [4:0] alu_shamt;
assign alu_shamt = alu_op2[4:0];
   
always_comb begin
  case (io.ctl.alu_fun)
    ALU_ADD  : alu_out =         alu_op1   +         alu_op2;
    ALU_SUB  : alu_out =         alu_op1   -         alu_op2;
    ALU_AND  : alu_out =         alu_op1   &         alu_op2;
    ALU_OR   : alu_out =         alu_op1   |         alu_op2;
    ALU_XOR  : alu_out =         alu_op1   ^         alu_op2;
    ALU_SLT  : alu_out = $signed(alu_op1)  < $signed(alu_op2);
    ALU_SLTU : alu_out =         alu_op1   <         alu_op2;
    ALU_SLL  : alu_out =         alu_op1  <<< alu_shamt;
    ALU_SRA  : alu_out = $signed(alu_op1) >>> alu_shamt;
    ALU_SRL  : alu_out =         alu_op1  >>> alu_shamt;
    ALU_COPY1: alu_out =         alu_op1;
    default  : alu_out = 0;
  endcase
end

// Branch/Jump Target Calculation
assign br_target       = pc_reg + imm_b_sext;
assign jmp_target      = pc_reg + imm_j_sext;
assign jump_reg_target = rs1_datat + imm_i_sext;
                                  
// Control Status Registers
   val csr = Module(new CSRFile())
   val csr_cmd = io.ctl.csr_cmd
   csr.io.host <> io.host
   csr.io.rw.addr  := inst(CSR_ADDR_MSB,CSR_ADDR_LSB)
   csr.io.rw.wdata := Mux(csr_cmd=== CSR.S, csr.io.rw.rdata |  alu_out,
                      Mux(csr_cmd=== CSR.C, csr.io.rw.rdata & ~alu_out,
                                            alu_out))
   csr.io.rw.cmd   := csr_cmd
   val csr_out = csr.io.rw.rdata

   csr.io.retire    := Bool(false) // TODO 
   csr.io.exception := io.ctl.exception
   io.dat.status    := csr.io.status
   csr.io.cause     := io.ctl.exc_cause
   csr.io.sret      := io.ctl.sret
   csr.io.pc        := pc_reg
   exception_target := csr.io.evec

   // Add your own uarch counters here!
   csr.io.uarch_counters.foreach(_ := Bool(false))

// WB Mux
always_comb begin
  case (io.ctl.wb_sel)
    WB_ALU : wb_data = alu_out,
    WB_MEM : wb_data = io.dmem.resp.bits.data, 
    WB_PC4 : wb_data = pc_plus4,
    WB_CSR : wb_data = csr_out
    default: wb_data = alu_out;
  endcase
end
                                  
// datapath to controlpath outputs
assign dat.inst   = inst;
assign dat.br_eq  = (rs1_data === rs2_data);
assign dat.br_lt  = (rs1_data.toSInt < rs2_data.toSInt);
assign dat.br_ltu = (rs1_data.toUInt < rs2_data.toUInt);
   
// datapath to data memory outputs
assign dmem.req.bits.addr = alu_out;
assign dmem.req.bits.data = rs2_data;
   
   // Printout
   val tsc_reg = Reg(init=UInt(0,32))
   tsc_reg := tsc_reg + UInt(1)

//   printf("Cyc= %d PC= 0x%x %s %s%s Op1=[0x%x] Op2=[0x%x] W[%s,%d= 0x%x] %s Mem[%s %d: 0x%x]\n"
//      , tsc_reg(31,0)
//      , pc_reg
//      , Disassemble(inst)
//      , Mux(io.ctl.stall, Str("stall"), Str("     "))
//      , Mux(io.ctl.pc_sel  === UInt(1), Str("BR"),
//         Mux(io.ctl.pc_sel === UInt(2), Str("J "),
//         Mux(io.ctl.pc_sel === UInt(3), Str("JR"),
//         Mux(io.ctl.pc_sel === UInt(4), Str("EX"),
//         Mux(io.ctl.pc_sel === UInt(0), Str("  "), Str("??"))))))
//      , alu_op1
//      , alu_op2
//      , Mux(io.ctl.rf_wen, Str("W"), Str("_"))
//      , wb_addr
//      , wb_data
//      , Mux(io.ctl.exception, Str("EXC"), Str("   "))
//      , Mux(io.ctl.debug_dmem_val, Str("V"), Str("_"))
//      , io.ctl.debug_dmem_typ
//      , io.dmem.resp.bits.data
//      )

endmodule: dpath
