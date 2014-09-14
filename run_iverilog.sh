#!/bin/sh

# cleanup
rm -rf tb.vvp
rm -f  tb.vcd

# run Verilator to translate Verilog into C++, include C++ testbench
# TODO remove -Wno-fatal so warnings are not ignored
iverilog -g2012 -otb.vvp -tvvp -Wall\
-DSYNTHESIS \
rv32_1stage/Top.v \
rv32_1stage/memory_iverilog.sv \
rv32_1stage/tb_iverilog.sv

#verilator --lint-only --top-module tile \
#rv32_1stage/instructions.sv \
#rv32_1stage/consts.sv \
#rv32_1stage/interfaces.sv \
#rv32_1stage/memory.sv \
#rv32_1stage/tile.sv \
#rv32_1stage/core.sv \
#rv32_1stage/cpath.sv \
#rv32_1stage/dpath.sv

# run executable simulation
vvp tb.vvp

# view waveforms
#gtkwave tb.vcd tb.sav &
