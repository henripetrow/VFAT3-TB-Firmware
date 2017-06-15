vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/work

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap work msim/work

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../ipstatic/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/clk_wiz_v5_3_1" \
"C:/EDA/Xilinx/v2016_2/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/EDA/Xilinx/v2016_2/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"C:/EDA/Xilinx/v2016_2/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"C:/EDA/Xilinx/v2016_2/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"C:/EDA/Xilinx/v2016_2/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"C:/EDA/Xilinx/v2016_2/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"C:/EDA/Xilinx/v2016_2/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"C:/EDA/Xilinx/v2016_2/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -64 -93 \
"C:/EDA/Xilinx/v2016_2/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work work -64 -incr "+incdir+../../../ipstatic/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/clk_wiz_v5_3_1" \
"../../../../firmware_v2016.2.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0_clk_wiz.v" \
"../../../../firmware_v2016.2.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0.v" \

vlog -work work "glbl.v"

