package consts;

// Control Signals 
typedef enum logic [1-1:0] {
  Y      = 1'b1,
  N      = 1'b0
} t_bool;
 
// PC Select Signal
typedef enum logic [3-1:0] {
  PC_4   = 3'd0,  // PC + 4
  PC_BR  = 3'd1,  // branch_target
  PC_J   = 3'd2,  // jump_target
  PC_JR  = 3'd3,  // jump_reg_target
  PC_EXC = 3'd4   // exception 
} t_pc;
                               
// Branch Type
typedef enum logic [4-1:0] {
  BR_N   = 4'd0,  // Next
  BR_NE  = 4'd1,  // Branch on NotEqual
  BR_EQ  = 4'd2,  // Branch on Equal
  BR_GE  = 4'd3,  // Branch on Greater/Equal
  BR_GEU = 4'd4,  // Branch on Greater/Equal Unsigned
  BR_LT  = 4'd5,  // Branch on Less Than
  BR_LTU = 4'd6,  // Branch on Less Than Unsigned
  BR_J   = 4'd7,  // Jump 
  BR_JR  = 4'd8   // Jump Register
} t_br;

// RS1 Operand Select Signal
typedef enum logic [2-1:0] {
  OP1_RS1 = 2'd0,  // Register Source #1
  OP1_IMU = 2'd1,  // immediate, U-type
  OP1_IMZ = 2'd2,  // Zero-extended rs1 field of inst, for CSRI instructions
  OP1_X   = 2'dx
} t_op1;

// RS2 Operand Select Signal
typedef enum logic [2-1:0] {
  OP2_RS2 = 2'd0,  // Register Source #2
  OP2_IMI = 2'd1,  // immediate, I-type
  OP2_IMS = 2'd2,  // immediate, S-type
  OP2_PC  = 2'd3,  // PC 
  OP2_X   = 2'dx
} t_op2;
 
// Register File Write Enable Signal
typedef enum logic [1-1:0] {
  REN_0  = 1'b0,
  REN_1  = 1'b1,
  REN_X  = 1'bx
} t_ren;
        
// ALU Operation Signal
typedef enum logic [4-1:0] {
  ALU_ADD   = 4'd 1,
  ALU_SUB   = 4'd 2,
  ALU_SLL   = 4'd 3,
  ALU_SRL   = 4'd 4,
  ALU_SRA   = 4'd 5,
  ALU_AND   = 4'd 6,
  ALU_OR    = 4'd 7,
  ALU_XOR   = 4'd 8,
  ALU_SLT   = 4'd 9,
  ALU_SLTU  = 4'd10,
  ALU_COPY1 = 4'd11,
  ALU_X     = 4'd 0
} t_alu;
 
// Writeback Select Signal
typedef enum logic [2-1:0] {
  WB_ALU  = 2'd0,
  WB_MEM  = 2'd1,
  WB_PC4  = 2'd2,
  WB_CSR  = 2'd3,
  WB_X    = 2'dx
} t_wb;

// Memory Function Type (Read,Write,Fence) Signal
typedef enum logic [2-1:0] {
  MWR_R   = 2'd0,
  MWR_W   = 2'd1,
  MWR_F   = 2'd2,
  MWR_X   = 2'dx
} t_mwr;
       
// Memory Enable Signal
typedef enum logic [1-1:0] {
  MEN_0   =  1'b0,
  MEN_1   =  1'b1,
  MEN_X   =  1'bx
} t_men;
                     
// Memory Mask Type Signal
typedef enum logic [3-1:0] {
  MSK_B   = 3'd0,
  MSK_BU  = 3'd1,
  MSK_H   = 3'd2,
  MSK_HU  = 3'd3,
  MSK_W   = 3'd4,
  MSK_X   = 3'dx
} t_msk;
                  
// Memory Op Constants 
typedef enum logic [3-1:0] {
  MT_X  = 3'd0,
  MT_B  = 3'd1,
  MT_H  = 3'd2,
  MT_W  = 3'd3,
  MT_D  = 3'd4,
  MT_BU = 3'd5,
  MT_HU = 3'd6,
  MT_WU = 3'd7
} t_mt;

typedef enum logic [1-1:0] {
  M_X   = 1'bx, 
  M_XRD = 1'b0,  // int load
  M_XWR = 1'b1   // int store
} t_m;

// control status register access
typedef enum logic [1-1:0] {
  CSR_X = 2d'x,
  CSR_N = 2d'0,
  CSR_W = 2d'1,
  CSR_S = 2d'2,
  CSR_C = 2d'3
} t_csr;

endpackage: consts
