#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f  tb.vcd

# run Verilator to translate Verilog into C++, include C++ testbench
# TODO remove -Wno-fatal so warnings are not ignored
verilator -Wall --cc --trace --exe tbn/tb_verilator.cpp --top-module tb \
-DSYNTHESIS \
-Wno-fatal \
--debug --gdbbt \
rv32_1stage/interfaces.sv \
rv32_1stage/Top.v \
rv32_1stage/memory.sv \
rv32_1stage/tb_verilator.sv

#verilator --lint-only --top-module tile \
#rv32_1stage/instructions.sv \
#rv32_1stage/consts.sv \
#rv32_1stage/interfaces.sv \
#rv32_1stage/memory.sv \
#rv32_1stage/tile.sv \
#rv32_1stage/core.sv \
#rv32_1stage/cpath.sv \
#rv32_1stage/dpath.sv

# build C++ project
make -j -C obj_dir/ -f Vtb.mk Vtb
# run executable simulation
obj_dir/Vtb

# view waveforms
#gtkwave tb.vcd tb.sav &
