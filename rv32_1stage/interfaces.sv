interface CSRReq #(parameter AW=32) ();
   logic          rw;
   logic [AW-1:0] addr;
   logic [64-1:0] data;
endinterface

interface ValidIO #(DW=32) ();
  logic          valid;
  logic [DW-1:0] bits;
endinterface

interface HTIFIO ();
  logic reset;
  logic debug_stats_csr;
  integer        id;
  CSRReq #(12)   csr_req;
  logic [64-1:0] csr_rep;
  logic          ipi_req;
  logic          ipi_rep;
  CSRReq #(64)   mem_req;
  ValidIO #(64)  mem_rep;
endinterface

//class SCRIO extends Bundle
//{
//   val n = 64
//   val rdata = Vec.fill(n) { Bits(INPUT, 64) }
//   val wen = Bool(OUTPUT)
//   val waddr = UInt(OUTPUT, log2Up(n))
//   val wdata = Bits(OUTPUT, 64)
//}

interface MemReq ();
  logic [32-1:0] addr;
  logic [32-1:0] data;
  logic [1-1:0] fcn;  // memory function code
  logic [3-1:0] typ;  // memory type
endinterface

interface MemResp ();
  logic [32-1:0] data;
endinterface

// from the pov of the datapath
interface MemPortIo ();
  MemReq  req ;
  MemResp resp;
endinterface

interface CtlToDatIo ();
  logic         stall         ;
  logic [3-1:0] pc_sel        ;
  logic [2-1:0] op1_sel       ;
  logic [2-1:0] op2_sel       ;
  logic [4-1:0] alu_fun       ;
  logic [3-1:0] wb_sel        ;
  logic         rf_wen        ;
  logic [2-1:0] csr_cmd       ;
  logic         exception     ;
  logic [6-1:0] exc_cause     ;
  logic         sret          ;
  logic         debug_dmem_val;
  logic [3-1:0] debug_dmem_typ;
endinterface

interface DatToCtlIo ();
  logic [32-1:0] inst  ;
  logic          br_eq ;
  logic          br_lt ;
  logic          br_ltu;
  Status         status;
endinterface: DatToCtlIo
