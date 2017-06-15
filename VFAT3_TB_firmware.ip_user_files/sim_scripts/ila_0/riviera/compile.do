vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/work

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap work riviera/work

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../vfat3_testing_firmware.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+../../../../vfat3_testing_firmware.srcs/sources_1/ip/ila_0/hdl/verilog" \
"D:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work work -93 \
"../../../../vfat3_testing_firmware.srcs/sources_1/ip/ila_0/sim/ila_0.vhd" \

vlog -work work "glbl.v"

