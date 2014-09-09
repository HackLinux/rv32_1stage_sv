//**************************************************************************
// RISCV Processor 
//--------------------------------------------------------------------------
//
// Christopher Celio
// 2011 Jul 30
//
// Describes a simple RISCV 1-stage processor
//   - No div/mul/rem
//   - No FPU
//   - implements a minimal supervisor mode (can trap to handle the
//       above instructions)
//
// The goal of the 1-stage is to provide the simpliest, easiest-to-read code to
// demonstrate the RISC-V ISA.
 
module core (
  // system signals
  input  logic clk,
  input  logic rst,
  // interfaces
  HTIFIO    host,
  MemPortIo imem,
  MemPortIo dmem
);

DatToCtlIo dat ();
CtlToDatIo ctl ();

cpath cpath (
  // system signals
  .clk (clk),  // clock
  .rst (rst),  // reset
  // interfaces
  .imem (imem),
  .dmem (dmem),
  .dat (dat),
  .ctl (ctl),
  // ?
  .resetSignal (0)
);

dpath dpath (
  // system signals
  .clk (clk),  // clock
  .rst (rst),  // reset
  // interfaces
  .host (host),
  .imem (imem),
  .dmem (dmem),
  .dat (dat),
  .ctl (ctl)
);

endmodule: core
