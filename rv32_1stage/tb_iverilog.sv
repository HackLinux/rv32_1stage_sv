module tb ();

// request for a dump file
initial begin
  $dumpfile("tb.vcd");
  $dumpvars(0, tb);
end

// system signals
logic clk;
logic rst;

initial   clk = 1'b1;
always #5 clk = ~clk;

initial begin
  rst = 1'b1;
  repeat (4) @ (posedge clk);
  rst = 1'b0;
  repeat (10000) @ (posedge clk);
  $finish();
end

// interfaces
//HTIFIO    host ();
//MemPortIo imem ();
//MemPortIo dmem ();

// instruction memory
logic          imem_req_ready ;
logic          imem_req_valid ;
logic [32-1:0] imem_req_addr  ;
logic [32-1:0] imem_req_data  ;
logic          imem_req_fcn   ;
logic  [3-1:0] imem_req_typ   ;
logic          imem_resp_valid;
logic [32-1:0] imem_resp_data ;
// data memory
logic          dmem_req_ready ;
logic          dmem_req_valid ;
logic [32-1:0] dmem_req_addr  ;
logic [32-1:0] dmem_req_data  ;
logic          dmem_req_fcn   ;
logic  [3-1:0] dmem_req_typ   ;
logic          dmem_resp_valid;
logic [32-1:0] dmem_resp_data ;

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
  .io_imem_req_ready      (imem_req_ready ),
  .io_imem_req_valid      (imem_req_valid ),
  .io_imem_req_bits_addr  (imem_req_addr  ),
//.io_imem_req_bits_data  (imem_req_data  ),
  .io_imem_req_bits_fcn   (imem_req_fcn   ),
  .io_imem_req_bits_typ   (imem_req_typ   ),
  .io_imem_resp_valid     (imem_resp_valid),
  .io_imem_resp_bits_data (imem_resp_data ),
  // data memory
  .io_dmem_req_ready      (dmem_req_ready ),
  .io_dmem_req_valid      (dmem_req_valid ),
  .io_dmem_req_bits_addr  (dmem_req_addr  ),
  .io_dmem_req_bits_data  (dmem_req_data  ),
  .io_dmem_req_bits_fcn   (dmem_req_fcn   ),
  .io_dmem_req_bits_typ   (dmem_req_typ   ),
  .io_dmem_resp_valid     (dmem_resp_valid),
  .io_dmem_resp_bits_data (dmem_resp_data )
);

memory memory (
  // system signals
  .clk (clk),
  // instruction memory
  .imem_req_ready  (imem_req_ready ),
  .imem_req_valid  (imem_req_valid ),
  .imem_req_addr   (imem_req_addr  ),
  .imem_req_data   (imem_req_data  ),
  .imem_req_fcn    (imem_req_fcn   ),
  .imem_req_typ    (imem_req_typ   ),
  .imem_resp_valid (imem_resp_valid),
  .imem_resp_data  (imem_resp_data ),
  // data memory
  .dmem_req_ready  (dmem_req_ready ),
  .dmem_req_valid  (dmem_req_valid ),
  .dmem_req_addr   (dmem_req_addr  ),
  .dmem_req_data   (dmem_req_data  ),
  .dmem_req_fcn    (dmem_req_fcn   ),
  .dmem_req_typ    (dmem_req_typ   ),
  .dmem_resp_valid (dmem_resp_valid),
  .dmem_resp_data  (dmem_resp_data )
);

endmodule: tb
