module tb (
  // system signals
  input  logic clk,
  input  logic rst
  // interfaces
);

//HTIFIO    host ();
MemPortIo imem ();
MemPortIo dmem ();

//core core (
//  // system signals
//  .clk (clk),
//  .rst (rst),
//  // interfaces
//  .host (host),
//  .imem (imem),
//  .dmem (dmem)
//);

Core core (
  // system signals
  .clk   (clk),
  .reset (rst),
  // host interface
  .io_host_reset             ( 1'b0),  // input  io_host_reset,
  .io_host_debug_stats_pcr   (     ),  // output io_host_debug_stats_pcr,
  .io_host_id                ( 1'b0),  // input  io_host_id,
  .io_host_pcr_req_ready     (     ),  // output io_host_pcr_req_ready,
  .io_host_pcr_req_valid     ( 1'b0),  // input  io_host_pcr_req_valid,
  .io_host_pcr_req_bits_rw   ( 1'b0),  // input  io_host_pcr_req_bits_rw,
  .io_host_pcr_req_bits_addr (12'd0),  // input [11:0] io_host_pcr_req_bits_addr,
  .io_host_pcr_req_bits_data (64'd0),  // input [63:0] io_host_pcr_req_bits_data,
  .io_host_pcr_rep_ready     ( 1'b0),  // input  io_host_pcr_rep_ready,
  .io_host_pcr_rep_valid     (     ),  // output io_host_pcr_rep_valid,
  .io_host_pcr_rep_bits      (     ),  // output[63:0] io_host_pcr_rep_bits,
  .io_host_ipi_req_ready     ( 1'b0),  // input  io_host_ipi_req_ready,
  .io_host_ipi_req_valid     (     ),  // output io_host_ipi_req_valid,
  .io_host_ipi_req_bits      (     ),  // output io_host_ipi_req_bits,
  .io_host_ipi_rep_ready     (     ),  // output io_host_ipi_rep_ready,
  .io_host_ipi_rep_valid     ( 1'b0),  // input  io_host_ipi_rep_valid,
  .io_host_ipi_rep_bits      ( 1'b0),  // input  io_host_ipi_rep_bits,
//.io_host_mem_req_ready     (     ),  // //output io_host_mem_req_ready
  .io_host_mem_req_valid     ( 1'b0),  // input  io_host_mem_req_valid,
  .io_host_mem_req_bits_rw   ( 1'b0),  // input  io_host_mem_req_bits_rw,
  .io_host_mem_req_bits_addr (64'd0),  // input [63:0] io_host_mem_req_bits_addr,
  .io_host_mem_req_bits_data (64'd0),  // input [63:0] io_host_mem_req_bits_data,
//.io_host_mem_rep_valid     (     ),  // //output io_host_mem_rep_valid
//.io_host_mem_rep_bits      (     ),  // //output[63:0] io_host_mem_rep_bits
  // instruction memory
  .io_imem_req_ready      (imem.req.ready ),
  .io_imem_req_valid      (imem.req.valid ),
  .io_imem_req_bits_addr  (imem.req.addr  ),
//.io_imem_req_bits_data  (imem.req.data  ),
  .io_imem_req_bits_fcn   (imem.req.fcn   ),
  .io_imem_req_bits_typ   (imem.req.typ   ),
  .io_imem_resp_valid     (imem.resp.valid),
  .io_imem_resp_bits_data (imem.resp.data ),
  // data memory
  .io_dmem_req_ready      (dmem.req.ready ),
  .io_dmem_req_valid      (dmem.req.valid ),
  .io_dmem_req_bits_addr  (dmem.req.addr  ),
  .io_dmem_req_bits_data  (dmem.req.data  ),
  .io_dmem_req_bits_fcn   (dmem.req.fcn   ),
  .io_dmem_req_bits_typ   (dmem.req.typ   ),
  .io_dmem_resp_valid     (dmem.resp.valid),
  .io_dmem_resp_bits_data (dmem.resp.data )
);

memory memory (
  // system signals
  .clk (clk),
  // interfaces
  .imem (imem),
  .dmem (dmem)
);

endmodule: tb
