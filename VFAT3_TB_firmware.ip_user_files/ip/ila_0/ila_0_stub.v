// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Mon Oct  2 18:29:22 2017
// Host        : lut4431 running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/a0312687/program_files/test/VFAT3-TB-Firmware/VFAT3_TB_firmware.srcs/sources_1/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2016.3" *)
module ila_0(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14, probe15, probe16, probe17, 
  probe18, probe19, probe20, probe21, probe22, probe23, probe24, probe25, probe26, probe27)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[0:0],probe2[0:0],probe3[0:0],probe4[0:0],probe5[0:0],probe6[31:0],probe7[31:0],probe8[31:0],probe9[31:0],probe10[0:0],probe11[0:0],probe12[0:0],probe13[0:0],probe14[7:0],probe15[0:0],probe16[0:0],probe17[0:0],probe18[7:0],probe19[7:0],probe20[0:0],probe21[0:0],probe22[0:0],probe23[0:0],probe24[0:0],probe25[3:0],probe26[3:0],probe27[0:0]" */;
  input clk;
  input [0:0]probe0;
  input [0:0]probe1;
  input [0:0]probe2;
  input [0:0]probe3;
  input [0:0]probe4;
  input [0:0]probe5;
  input [31:0]probe6;
  input [31:0]probe7;
  input [31:0]probe8;
  input [31:0]probe9;
  input [0:0]probe10;
  input [0:0]probe11;
  input [0:0]probe12;
  input [0:0]probe13;
  input [7:0]probe14;
  input [0:0]probe15;
  input [0:0]probe16;
  input [0:0]probe17;
  input [7:0]probe18;
  input [7:0]probe19;
  input [0:0]probe20;
  input [0:0]probe21;
  input [0:0]probe22;
  input [0:0]probe23;
  input [0:0]probe24;
  input [3:0]probe25;
  input [3:0]probe26;
  input [0:0]probe27;
endmodule
