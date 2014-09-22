//**************************************************************************
// Scratchpad Memory (asynchronous)
//--------------------------------------------------------------------------
//
// Christopher Celio
// 2013 Jun 12
//
// Provides a variable number of ports to the core, and one port to the HTIF
// (host-target interface).
//
// Assumes that if the port is ready, it will be performed immediately.
// For now, don't detect write collisions.
//
// Optionally uses synchronous read (default is async). For example, a 1-stage
// processor can only ever work using asynchronous memory!

module memory #(
  parameter AW = 32,
  parameter DW = 32,
  parameter SW = DW/8,
  parameter MS = 65536
)(
  // system signals
  input logic clk,
  // instruction interface
  output logic        imem_req_ready ,
  input  logic        imem_req_valid ,
  input  logic [31:0] imem_req_addr  ,
  input  logic [31:0] imem_req_data  ,
  input  logic        imem_req_fcn   ,
  input  logic  [2:0] imem_req_typ   ,
  output logic        imem_resp_valid,
  output logic [31:0] imem_resp_data ,
  // data interface
  output logic        dmem_req_ready ,
  input  logic        dmem_req_valid ,
  input  logic [31:0] dmem_req_addr  ,
  input  logic [31:0] dmem_req_data  ,
  input  logic        dmem_req_fcn   ,
  input  logic  [2:0] dmem_req_typ   ,
  output logic        dmem_resp_valid,
  output logic [31:0] dmem_resp_data 
);

logic [SW-1:0] [8-1:0] mem [0:MS/SW-1];

// read access
assign imem_resp_data = mem [imem_req_addr >> 2];
assign dmem_resp_data = mem [dmem_req_addr >> 2];

assign imem_req_ready = 1'b1;
assign dmem_req_ready = 1'b1;

assign imem_resp_valid = 1'b1;
assign dmem_resp_valid = 1'b1;

// write access
always @ (posedge clk)
if (dmem_req_ready & dmem_req_valid & dmem_req_fcn) begin
  for (int i=0; i<SW; i++) begin
    // TODO
    if (i<=dmem_req_typ) mem [dmem_req_addr >> 2] [i] <= dmem_req_data[i*8+:8];
  end
end

initial $readmemh ("dhrystone.riscv.hex", mem);

endmodule: memory
