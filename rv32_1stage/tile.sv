//**************************************************************************
// RISCV Processor Tile
//--------------------------------------------------------------------------
//

module tile (
  // system signals
  logic  input clk,
  logic  input rst,
  // interfaces
  HTIFIO host
);

MemPortIo imem ();
MemPortIo dmem ();

core core (
  // system signals
  .clk (clk),
  .rst (rst),
  // interfaces
  .host (host),
  .imem (imem),
  .dmem (dmem)
);

mamory memory (
  // system signals
  .clk (clk),
  .rst (rst),
  // interfaces
  .imem (imem),
  .dmem (dmem)
);

endpackage: tile
