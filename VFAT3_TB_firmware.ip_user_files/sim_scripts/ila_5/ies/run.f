-makelib ies/xil_defaultlib -sv \
  "/home/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "/home/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/work \
  "../../../../vfat3_testing_firmware.srcs/sources_1/ip/ila_5/sim/ila_5.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

