///////////////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////////////////////////////////////////////


module cpath (
  // system signals
  input  logic clk,  // clock
  input  logic rst,  // reset
  // interfaces
  MemPortIo imem,
  MemPortIo dmem,
  DatToCtlIo dat,
  CtlToDatIo ctl,
  // ?
  input  logic resetSignal
);

import instructions::*;
import consts::*;

// Put these control signals into variables
struct packed {
  t_bool cs_val_inst;  // unknown instruction error
  t_br   cs_br_type ;  // branch type
  t_op1  cs_op1_sel ;  // RS1 Operand Select Signal
  t_op2  cs_op2_sel ;  // RS2 Operand Select Signal
  t_alu  cs_alu_fun ;  // ALU Operation Signal
  t_wb   cs_wb_sel  ;  // Writeback Select Signal
  t_ren  cs_rf_wen  ;  // Register File Write Enable Signal
  t_men  cs_mem_en  ;  // Memory Enable Signal
  t_m    cs_mem_fcn ;  // Memory load/store (read/write)
  t_mt   cs_msk_sel ;  // Memory Op Constants
  t_csr  cs_csr_cmd ;  // control status register access
  t_bool cs_sret    ;
  t_bool cs_syscall ;
  t_bool cs_sbreak  ;
  t_bool cs_privileged;
} decode;

always_comb begin
casez (dat.inst)
//                                                                                                           | is sret
//                                                                                                           |  | is syscall
//                     val  |  BR   | op1    |  op2    |   ALU    |  wb   | rf   | mem  | mem  | mask |  csr |  |  | is sbreak
//                     inst | type  |  sel   |   sel   |    fcn   |  sel  | wen  |  en  |  wr  | type |  cmd |  |  |  | is privileged
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

logic [3-1:0] ctrl_pc_sel;
// Branch Logic
always_comb begin
  if (ctl.exception || decode.cs_sret) ctrl_pc_sel = PC_EXC;
  else case (decode.cs_br_type)
    BR_N   : ctrl_pc_sel =                       PC_4;
    BR_NE  : ctrl_pc_sel = !dat.br_eq  ? PC_BR : PC_4;
    BR_EQ  : ctrl_pc_sel =  dat.br_eq  ? PC_BR : PC_4;
    BR_GE  : ctrl_pc_sel = !dat.br_lt  ? PC_BR : PC_4;
    BR_GEU : ctrl_pc_sel = !dat.br_ltu ? PC_BR : PC_4;
    BR_LT  : ctrl_pc_sel =  dat.br_lt  ? PC_BR : PC_4;
    BR_LTU : ctrl_pc_sel =  dat.br_ltu ? PC_BR : PC_4;
    BR_J   : ctrl_pc_sel = PC_J;
    BR_JR  : ctrl_pc_sel = PC_JR;
    default: ctrl_pc_sel = PC_4;
  endcase
end

logic stall;
assign stall = !imem.resp.valid || !((decode.cs_mem_en && dmem.resp.valid) || !decode.cs_mem_en) || resetSignal;

assign ctl.stall   = stall;
assign ctl.pc_sel  = ctrl_pc_sel;
assign ctl.op1_sel = decode.cs_op1_sel;
assign ctl.op2_sel = decode.cs_op2_sel;
assign ctl.alu_fun = decode.cs_alu_fun;
assign ctl.wb_sel  = decode.cs_wb_sel;
assign ctl.rf_wen  = stall ? 1'b0  : decode.cs_rf_wen ;
assign ctl.csr_cmd = stall ? CSR_N : decode.cs_csr_cmd;
   
// Memory Requests
assign imem.req.valid = 1'b1;
assign imem.req.fcn   = M_XRD;
assign imem.req.typ   = MT_WU;

assign dmem.req.valid = decode.cs_mem_en;
assign dmem.req.fcn   = decode.cs_mem_fcn;
assign dmem.req.typ   = decode.cs_msk_sel;

// Exception Handling ---------------------

logic exc_illegal;   
assign exc_illegal = (!decode.cs_val_inst && imem.resp.valid);

// check for interrupts 
function integer checkExceptions (input logic [8-1:0] irq);
begin
  checkExceptions = 0;
  for (int i=8; i>0; i--) begin
    if (irq[i]) checkExceptions = i;
  end
end
endfunction
     
// an interrupt must be both pending (ip) and enabled on the interrupt mask (im)
logic [8-1:0] exc_interrupts;
logic         exc_interrupt_unmasked;
logic [6-1:0] exc_interrupt_cause;
logic         exc_interrupti;
// TODO
assign exc_interrupts = dat.status.im & dat.status.ip;
//assign exc_interrupts = (0 until dat.status.ip.getWidth).map(i => (dat.status.im(i) && io.dat.status.ip(i), UInt(BigInt(1) << (conf.xprlen-1) | i)))
assign exc_interrupt_unmasked = |exc_interrupts;
assign exc_interrupt_cause = checkExceptions(exc_interrupts);
assign exc_interrupt = dat.status.ei && exc_interrupt_unmasked;

// check for illegal CSR instructions or CSR access violations

logic  [5-1:0] rs1_addr;
logic [12-1:0] csr_addr;
logic csr_en;
logic csr_wen;
logic exc_csr_privileged;
logic csr_invalid;
logic exc_privileged;

assign rs1_addr = dat.inst[RS1_MSB:RS1_LSB];
assign csr_addr = dat.inst[CSR_ADDR_MSB:CSR_ADDR_LSB];

assign csr_en         =                decode.cs_csr_cmd != CSR_N;
assign csr_wen        = |rs1_addr || !(decode.cs_csr_cmd == CSR_S ||
                                       decode.cs_csr_cmd == CSR_C );
assign exc_csr_privileged = csr_en &&
                        (csr_addr[11:10] === 2'd3) &&                   csr_wen ||
                        (csr_addr[11:10] === 2'd2)                              ||
                        (csr_addr[11:10] === 2'd1) && !dat.status.s            ||
                        (csr_addr[ 9: 8] >=  2'd2)                              ||
                        (csr_addr[ 9: 8] === 2'd1) && !dat.status.s && csr_wen;

always_comb begin
  if (csr_en) begin
    case (csr_addr) // TODO
//    csr_fflags   ,
//    csr_frm      ,
//    csr_fcsr     ,
      csr_sup0     ,
      csr_sup1     ,
      csr_epc      ,
      csr_badvaddr ,
      csr_ptbr     ,
      csr_asid     ,
      csr_count    ,
      csr_compare  ,
      csr_evec     ,
      csr_cause    ,
      csr_status   ,
      csr_hartid   ,
      csr_impl     ,
      csr_fatc     ,
      csr_send_ipi ,
      csr_clear_ipi,
      csr_stats    ,
      csr_reset    ,
      csr_tohost   ,
      csr_fromhost ,
      csr_cycle    ,
      csr_time     ,
      csr_instret  ,
      csr_uarch0   ,
      csr_uarch1   ,
      csr_uarch2   ,
      csr_uarch3   ,
      csr_uarch4   ,
      csr_uarch5   ,
      csr_uarch6   ,
      csr_uarch7   ,
      csr_uarch8   ,
      csr_uarch9   ,
      csr_uarch10  ,
      csr_uarch11  ,
      csr_uarch12  ,
      csr_uarch13  ,
      csr_uarch14  ,
      csr_uarch15  ,
      csr_counth   ,
      csr_cycleh   ,
      csr_timeh    ,
      csr_instreth : csr_invalid = 1'b1;
      default      : csr_invalid = 1'b1;
    endcase
  end else begin
    csr_invalid = 1'b0;
  end
end

assign exc_privileged = exc_csr_privileged || (decode.cs_privileged && !(dat.status.s));
   
assign ctl.sret      = decode.cs_sret;

assign ctl.exception = decode.cs_syscall ||
                       decode.cs_sbreak  ||
                       exc_illegal       ||
                       csr_invalid       ||
                       exc_privileged    ||
                       exc_interrupt;

   // note: priority here is very important
assign ctl.exc_cause = (exc_interrupt              ? exc_interrupt_cause          :
                       (exc_illegal || csr_invalid ? cause_illegal_instruction    :
                       (exc_privileged             ? cause_privileged_instruction :
                       (decode.cs_syscall          ? cause_syscall                :
                       (decode.cs_sbreak           ? cause_breakpoint             : 5'd0)))));
   
   
   // ----------------------------------------       
   
   // only here to thread ctrl signals to printf in dpath.scala                  
assign ctl.debug_dmem_val = decode.cs_mem_en;
assign ctl.debug_dmem_typ = decode.cs_msk_sel;

endmodule: cpath
