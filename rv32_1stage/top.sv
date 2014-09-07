module top (
  // system signals
  input  logic clk,
  input  logic rst,

  output logic debug_stats_csr,
  HTIFIO       htif
)

HTIFIO host ();

tile tile (
  // system signals
  .clk (clk),
  .rst (rst),
  // interfaces
  .host (host)
);



   val reset_signal = Reg(next=Reg(next=io.htif.reset))
   val tile = Module(new SodorTile)
  
   tile.io.host.reset := reset_signal
   tile.io.host.id := UInt(0,1)
   tile.io.host.csr_req <> Queue(io.htif.csr_req)
   io.htif.csr_rep <> Queue(tile.io.host.csr_rep)

   tile.io.host.mem_req <> Queue(io.htif.mem_req)
   io.htif.mem_rep <> tile.io.host.mem_rep

   io.debug_stats_csr := Reg(next=tile.io.host.debug_stats_csr)
}

object elaborate {
  def main(args: Array[String]): Unit = {
    chiselMain(args, () => Module(new Top()))
  }
}
endmodule: top
