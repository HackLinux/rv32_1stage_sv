interface CSRReq #(parameter AW=32) ();
   logic          rw;
   logic [AW-1:0] addr;
   logic [64-1:0] data;
endinterface


interface HTIFIO ();
  logic reset;
  logic debug_stats_csr;
  integer id = UInt(INPUT, 1)
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
