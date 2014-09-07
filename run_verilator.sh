#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f  rp1_tb_verilator.vcd

# run Verilator to translate Verilog into C++, include C++ testbench
# TODO remove -Wno-fatal so warnings are not ignored
#verilator -Wall --cc --trace --exe tbn/rp1_tb_verilator.cpp --top-module rp1_tb_verilator \
#-Wno-fatal \

verilator --lint-only \
rv32_1stage/instructions.sv \
rv32_1stage/consts.sv \
rv32_1stage/interfaces.sv \
rv32_1stage/memory.sv

## build C++ project
#make -j -C obj_dir/ -f Vrp1_tb_verilator.mk Vrp1_tb_verilator
## run executable simulation
##obj_dir/Vrp1_tb_verilator
#/lib64/ld-linux-x86-64.so.2 obj_dir/Vrp1_tb_verilator
#
## view waveforms
##gtkwave rp1_tb_verilator.vcd rp1_tb_verilator.sav &
