///////////////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////////////////////////////////////////////

module decode (
  // system signals
  input  logic                  clk,      // clock
  input  logic                  rst,      // reset
  // MemPortIo imem
  // MemPortIo dmem
  // DatToCtlIo
  // CtlToDatIo
  output logic                  ctl__stall    ,
  output logic          [3-1:0] ctl__pc_sel   ,
  output logic          [2-1:0] ctl__op1_sel  ,
  output logic          [2-1:0] ctl__op2_sel  ,
  output logic          [4-1:0] ctl__alu_fun  ,
  output logic          [3-1:0] ctl__wb_sel   ,
  output logic                  ctl__rf_wen   ,
  output logic          [2-1:0] ctl__csr_cmd  ,
  output logic                  ctl__exception,
  output logic          [6-1:0] ctl__exc_cause,
  output logic                  ctl__sret     ,
  output logic                  ctl__debug_dmem_val,
  output logic                  ctl__debug_dmem_typ = Bits(OUTPUT, MT_X.getWidth),
  // ?
  input  logic                  resetSignal
);

import instructions::*;
import constanst::*;

struct packed {
  t_bool err;  // unknown instruction error
  t_br   br ;  // branch type
  t_op1  op1;  // RS1 Operand Select Signal
  t_op2  op2;  // RS2 Operand Select Signal
  t_alu  alu;  // ALU Operation Signal
  t_wb   wb ;  // Writeback Select Signal
  t_ren  ren;  // Register File Write Enable Signal
  t_men  men;  // Memory Enable Signal
  t_m    m  ;  // Memory load/store (read/write)
  t_mt   mt ;  // Memory Op Constants
  t_csr  cst;  // control status register access
  t_bool sret;
  t_bool syscall;
  t_bool sbreak;
  t_bool privileged;
} decode;

always_comb begin
case (dat__inst)
//                                                                                                          | is sret
//                                                                                                          |  | is syscall
//                    val  |  BR   | op1    |  op2    |   ALU    |  wb   | rf   | mem  | mem  | mask |  csr |  |  | is sbreak
//                    inst | type  |  sel   |   sel   |    fcn   |  sel  | wen  |  en  |  wr  | type |  cmd |  |  |  | is privileged
  ISA_LW      : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_ADD  , WB_MEM, REN_1, MEN_1, M_XRD, MT_W , CSR_N, N, N, N, N};
  ISA_LB      : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_ADD  , WB_MEM, REN_1, MEN_1, M_XRD, MT_B , CSR_N, N, N, N, N};
  ISA_LBU     : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_ADD  , WB_MEM, REN_1, MEN_1, M_XRD, MT_BU, CSR_N, N, N, N, N};
  ISA_LH      : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_ADD  , WB_MEM, REN_1, MEN_1, M_XRD, MT_H , CSR_N, N, N, N, N};
  ISA_LHU     : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_ADD  , WB_MEM, REN_1, MEN_1, M_XRD, MT_HU, CSR_N, N, N, N, N};
  ISA_SW      : decode = '{Y, BR_N  , OP1_RS1, OP2_IMS , ALU_ADD  , WB_X  , REN_0, MEN_1, M_XWR, MT_W , CSR_N, N, N, N, N};
  ISA_SB      : decode = '{Y, BR_N  , OP1_RS1, OP2_IMS , ALU_ADD  , WB_X  , REN_0, MEN_1, M_XWR, MT_B , CSR_N, N, N, N, N};
  ISA_SH      : decode = '{Y, BR_N  , OP1_RS1, OP2_IMS , ALU_ADD  , WB_X  , REN_0, MEN_1, M_XWR, MT_H , CSR_N, N, N, N, N};

  ISA_AUIPC   : decode = '{Y, BR_N  , OP1_IMU, OP2_PC  , ALU_ADD  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_LUI     : decode = '{Y, BR_N  , OP1_IMU, OP2_X   , ALU_COPY1, WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};

  ISA_ADDI    : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_ADD  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_ANDI    : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_AND  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_ORI     : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_OR   , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_XORI    : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_XOR  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_SLTI    : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_SLT  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_SLTIU   : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_SLTU , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_SLLI    : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_SLL  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_SRAI    : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_SRA  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_SRLI    : decode = '{Y, BR_N  , OP1_RS1, OP2_IMI , ALU_SRL  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};

  ISA_SLL     : decode = '{Y, BR_N  , OP1_RS1, OP2_RS2 , ALU_SLL  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_ADD     : decode = '{Y, BR_N  , OP1_RS1, OP2_RS2 , ALU_ADD  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_SUB     : decode = '{Y, BR_N  , OP1_RS1, OP2_RS2 , ALU_SUB  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_SLT     : decode = '{Y, BR_N  , OP1_RS1, OP2_RS2 , ALU_SLT  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_SLTU    : decode = '{Y, BR_N  , OP1_RS1, OP2_RS2 , ALU_SLTU , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_AND     : decode = '{Y, BR_N  , OP1_RS1, OP2_RS2 , ALU_AND  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_OR      : decode = '{Y, BR_N  , OP1_RS1, OP2_RS2 , ALU_OR   , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_XOR     : decode = '{Y, BR_N  , OP1_RS1, OP2_RS2 , ALU_XOR  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_SRA     : decode = '{Y, BR_N  , OP1_RS1, OP2_RS2 , ALU_SRA  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_SRL     : decode = '{Y, BR_N  , OP1_RS1, OP2_RS2 , ALU_SRL  , WB_ALU, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};

  ISA_JAL     : decode = '{Y, BR_J  , OP1_X  , OP2_X   , ALU_X    , WB_PC4, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_JALR    : decode = '{Y, BR_JR , OP1_RS1, OP2_IMI , ALU_X    , WB_PC4, REN_1, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_BEQ     : decode = '{Y, BR_EQ , OP1_X  , OP2_X   , ALU_X    , WB_X  , REN_0, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_BNE     : decode = '{Y, BR_NE , OP1_X  , OP2_X   , ALU_X    , WB_X  , REN_0, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_BGE     : decode = '{Y, BR_GE , OP1_X  , OP2_X   , ALU_X    , WB_X  , REN_0, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_BGEU    : decode = '{Y, BR_GEU, OP1_X  , OP2_X   , ALU_X    , WB_X  , REN_0, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_BLT     : decode = '{Y, BR_LT , OP1_X  , OP2_X   , ALU_X    , WB_X  , REN_0, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
  ISA_BLTU    : decode = '{Y, BR_LTU, OP1_X  , OP2_X   , ALU_X    , WB_X  , REN_0, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};

  ISA_CSRRWI  : decode = '{Y, BR_N  , OP1_IMZ, OP2_X   , ALU_COPY1, WB_CSR, REN_1, MEN_0, M_X  , MT_X , CSR_W, N, N, N, N};
  ISA_CSRRSI  : decode = '{Y, BR_N  , OP1_IMZ, OP2_X   , ALU_COPY1, WB_CSR, REN_1, MEN_0, M_X  , MT_X , CSR_S, N, N, N, N};
  ISA_CSRRW   : decode = '{Y, BR_N  , OP1_RS1, OP2_X   , ALU_COPY1, WB_CSR, REN_1, MEN_0, M_X  , MT_X , CSR_W, N, N, N, N};
  ISA_CSRRS   : decode = '{Y, BR_N  , OP1_RS1, OP2_X   , ALU_COPY1, WB_CSR, REN_1, MEN_0, M_X  , MT_X , CSR_S, N, N, N, N};
  ISA_CSRRC   : decode = '{Y, BR_N  , OP1_RS1, OP2_X   , ALU_COPY1, WB_CSR, REN_1, MEN_0, M_X  , MT_X , CSR_C, N, N, N, N};
  ISA_CSRRCI  : decode = '{Y, BR_N  , OP1_IMZ, OP2_X   , ALU_COPY1, WB_CSR, REN_1, MEN_0, M_X  , MT_X , CSR_C, N, N, N, N};

  ISA_SCALL   : decode = '{Y, BR_N  , OP1_X  , OP2_X   , ALU_X    , WB_X  , REN_0, MEN_0, M_X  , MT_X , CSR_N, N, Y, N, N}; 
  ISA_SRET    : decode = '{Y, BR_N  , OP1_X  , OP2_X   , ALU_X    , WB_X  , REN_0, MEN_0, M_X  , MT_X , CSR_N, Y, N, N, Y}; 
  ISA_SBREAK  : decode = '{Y, BR_N  , OP1_X  , OP2_X   , ALU_X    , WB_X  , REN_0, MEN_0, M_X  , MT_X , CSR_N, N, N, Y, N}; 

  ISA_FENCE_I : decode = '{Y, BR_N  , OP1_X  , OP2_X   , ALU_X    , WB_X  , REN_0, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N}; 
  ISA_FENCE   : decode = '{Y, BR_N  , OP1_X  , OP2_X   , ALU_X    , WB_X  , REN_0, MEN_1, M_X  , MT_X , CSR_N, N, N, N, N};

  default     : decode = '{N, BR_N  , OP1_X  , OP2_X   , ALU_X    , WB_X  , REN_0, MEN_0, M_X  , MT_X , CSR_N, N, N, N, N};
endcase
end

logic stall;
assign stall = !imem__resp.valid || !((cs_mem_en && dmem__resp.valid) || !cs_mem_en) || resetSignal;

assign ctl__stall   = stall;
assign ctl__pc_sel  = ctrl_pc_sel;
assign ctl__op1_sel = cs_op1_sel;
assign ctl__op2_sel = cs_op2_sel;
assign ctl__alu_fun = cs_alu_fun;
assign ctl__wb_sel  = cs_wb_sel;
assign ctl__rf_wen  = stall ? 1'b0 : cs_rf_wen);
assign ctl__csr_cmd = stall ? CSR_N : cs_csr_cmd);
   
// Memory Requests
assign imem__req__valid     = 1'b1;
assign imem__req__bits__fcn = M_XRD;
assign imem__req__bits__typ = MT_WU;

assign dmem__req__valid     = cs_mem_en;
assign dmem__req__bits__fcn = cs_mem_fcn;
assign dmem__req__bits__typ = cs_msk_sel;

// Exception Handling ---------------------

logic exc_illegal;   
assign exc_illegal = (!cs_val_inst && imem__resp__valid) 

// check for interrupts 
// an interrupt must be both pending (ip) and enabled on the interrupt mask (im)
logic exc_interrupts;
logic exc_interrupt_unmasked, exc_interrupt_cause;
logic exc_interrupt;
assign exc_interrupts = (0 until io.dat.status.ip.getWidth).map(i => (io.dat.status.im(i) && io.dat.status.ip(i), UInt(BigInt(1) << (conf.xprlen-1) | i)))
assign {exc_interrupt_unmasked, exc_interrupt_cause} = checkExceptions(exc_interrupts);
assign exc_interrupt = io.dat.status.ei && exc_interrupt_unmasked;

   def checkExceptions(x: Seq[(Bool, UInt)]) =
      (x.map(_._1).reduce(_||_), PriorityMux(x))
     
   // check for illegal CSR instructions or CSR access violations
   val fp_csrs        = Common.CSRs.fcsr :: Common.CSRs.frm :: Common.CSRs.fflags :: Nil
   val legal_csrs     = Common.CSRs.all32.toSet -- fp_csrs
   val rs1_addr       = io.dat.inst(RS1_MSB,RS1_LSB)
   val csr_addr       = io.dat.inst(CSR_ADDR_MSB, CSR_ADDR_LSB)
   val csr_en         = cs_csr_cmd != CSR.N
   val csr_wen        = rs1_addr != UInt(0) || !Vec(CSR.S, CSR.C).contains(cs_csr_cmd)
   val exc_csr_privileged = csr_en &&
                        (csr_addr(11,10) === UInt(3) && csr_wen ||
                         csr_addr(11,10) === UInt(2) ||
                         csr_addr(11,10) === UInt(1) && !io.dat.status.s ||
                         csr_addr(9,8) >= UInt(2) ||
                         csr_addr(9,8) === UInt(1) && !io.dat.status.s && csr_wen)
   val csr_invalid    = csr_en && !Vec(legal_csrs.map(UInt(_))).contains(csr_addr)

logic exc_privileged;
assign exc_privileged = exc_csr_privileged || (cs_privileged && !(dat__status.s));
   
assign ctl__sret      = cs_sret;

assign ctl__exception = cs_syscall       ||
                        cs_sbreak        ||
                        exc_illegal      ||
                        csr_invalid      ||
                        exc_privileged   ||
                        exc_interrupt;

   // note: priority here is very important
   io.ctl.exc_cause := Mux(exc_interrupt,              exc_interrupt_cause,
                       Mux(exc_illegal || csr_invalid, UInt(Common.Causes.illegal_instruction),
                       Mux(exc_privileged,             UInt(Common.Causes.privileged_instruction),
                       Mux(cs_syscall,                 UInt(Common.Causes.syscall),
                       Mux(cs_sbreak,                  UInt(Common.Causes.breakpoint),
                                                       UInt(0,5))))))
   
   
   // ----------------------------------------       
   
   // only here to thread ctrl signals to printf in dpath.scala                  
assign ctl__debug_dmem_val = cs_mem_en;
assign ctl__debug_dmem_typ = cs_msk_sel;

endmodule: cpath
