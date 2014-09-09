#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f  rp1_tb_verilator.vcd

# run Verilator to translate Verilog into C++, include C++ testbench
# TODO remove -Wno-fatal so warnings are not ignored
iverilog -Wall -g2012 -otb.vvp -tvvp \
rv32_1stage/memory_iverilog.sv \
rv32_1stage/tb_iverilog.sv \
rv32_1stage/Top.v
#-DSYNTHESIS \

# run executable simulation
vvp tb.vvp

# view waveforms
#gtkwave tb.vcd tb.sav &
