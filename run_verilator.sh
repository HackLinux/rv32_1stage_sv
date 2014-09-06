#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f  rp1_tb_verilator.vcd

# run Verilator to translate Verilog into C++, include C++ testbench
# TODO remove -Wno-fatal so warnings are not ignored
#verilator -Wall --cc --trace --top-module rp1_tb_verilator \
verilator -Wall --cc --trace --exe tbn/rp1_tb_verilator.cpp --top-module rp1_tb_verilator \
-Wno-fatal \
rtl/rv32_isa_pkg.sv \
rtl/rp1_pkg.sv \
rtl/rp1_fetch.sv \
rtl/rp1_decode.sv \
rtl/rp1_alu.sv \
rtl/rp1_regfile.sv \
rtl/rp1_stage.sv \
rtl/rp1_core.sv \
tbn/memory_model.sv \
tbn/rp1_tb_verilator.sv
#rtl/rp1_mls.sv \

# build C++ project
make -j -C obj_dir/ -f Vrp1_tb_verilator.mk Vrp1_tb_verilator
# run executable simulation
#obj_dir/Vrp1_tb_verilator
/lib64/ld-linux-x86-64.so.2 obj_dir/Vrp1_tb_verilator

# view waveforms
#gtkwave rp1_tb_verilator.vcd rp1_tb_verilator.sav &
