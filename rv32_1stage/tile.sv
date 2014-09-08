//**************************************************************************
// RISCV Processor Tile
//--------------------------------------------------------------------------
//

module tile (
  // system signals
  input  logic clk,
  input  logic rst
  // interfaces
);

HTIFIO    host ();
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

memory memory (
  // system signals
  .clk (clk),
  // interfaces
  .imem (imem),
  .dmem (dmem)
);

endmodule: tile
