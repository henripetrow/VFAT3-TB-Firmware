vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/work

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap work msim/work

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../vfat3_testing_firmware.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+../../../../vfat3_testing_firmware.srcs/sources_1/ip/ila_0/hdl/verilog" \
"D:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work work -64 -93 \
"../../../../vfat3_testing_firmware.srcs/sources_1/ip/ila_0/sim/ila_0.vhd" \

vlog -work work "glbl.v"

