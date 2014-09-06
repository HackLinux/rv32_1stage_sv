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
 
package Sodor
{

import Chisel._
import Node._
import Common._

module core (
(implicit conf: SodorConfiguration)
  HTIFIO()               host,
  MemPortIo(conf.xprlen) imem,
  MemPortIo(conf.xprlen) dmem
);

class Core(resetSignal: Bool = null)(implicit conf: SodorConfiguration) extends Module(_reset = resetSignal)
{
  
  val io = new CoreIo()
  val c  = Module(new CtlPath())
  val d  = Module(new DatPath())
  
  c.io.ctl  <> d.io.ctl
  c.io.dat  <> d.io.dat
  c.io.resetSignal := resetSignal
  
  c.io.imem <> io.imem
  d.io.imem <> io.imem
  
  c.io.dmem <> io.dmem
  d.io.dmem <> io.dmem
  
  d.io.host <> io.host

endmodule: core
