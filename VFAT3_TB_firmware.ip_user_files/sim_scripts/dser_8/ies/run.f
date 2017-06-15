-makelib ies/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "D:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/work \
  "../../../../firmware_v2016.2.srcs/sources_1/ip/dser_8/dser_8_selectio_wiz.v" \
  "../../../../firmware_v2016.2.srcs/sources_1/ip/dser_8/dser_8.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

