-makelib ies/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "D:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/work \
  "../../../../vfat3_testing_firmware.srcs/sources_1/ip/ila_0/sim/ila_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

