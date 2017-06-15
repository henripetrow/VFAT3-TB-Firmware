vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/work

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap work activehdl/work

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../vfat3_testing_firmware.srcs/sources_1/ip/ila_5/hdl/verilog" "+incdir+../../../../vfat3_testing_firmware.srcs/sources_1/ip/ila_5/hdl/verilog" \
"/home/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/home/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work work -93 \
"../../../../vfat3_testing_firmware.srcs/sources_1/ip/ila_5/sim/ila_5.vhd" \

vlog -work work "glbl.v"

