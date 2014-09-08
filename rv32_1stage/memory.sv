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
  int unsigned AW = 32,
  int unsigned DW = 32,
  int unsigned SW = DW/8,
  int unsigned MS = 1024
)(
  // system signals
  input logic clk,
  // interfaces
  MemPortIo imem,
  MemPortIo dmem
);

import consts::*;

logic [SW-1:0] [8-1:0] mem [0:MS/SW-1];

// read access
assign imem.resp.data = imem.req.addr >> 2;
assign dmem.resp.data = dmem.req.addr >> 2;

// write access
always_ff @ (posedge clk)
if (dmem.req.fcn == M_XWR) begin
  for (int i=0; i<SW; i++) begin
    // TODO
    if (i<=dmem.req.typ) mem [dmem.req.addr >> 2] [i] <= dmem.req.data[i*8+:8];
  end
end

endmodule
