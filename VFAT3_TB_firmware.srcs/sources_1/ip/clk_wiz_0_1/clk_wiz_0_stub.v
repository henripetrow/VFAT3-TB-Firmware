// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Mon Oct  2 18:25:40 2017
// Host        : lut4431 running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/a0312687/program_files/test/VFAT3-TB-Firmware/VFAT3_TB_firmware.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_in1, clk_out1, clk_out2, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="clk_in1,clk_out1,clk_out2,reset,locked" */;
  input clk_in1;
  output clk_out1;
  output clk_out2;
  input reset;
  output locked;
endmodule
