// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Mon Oct  2 18:29:07 2017
// Host        : lut4431 running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/a0312687/program_files/test/VFAT3-TB-Firmware/VFAT3_TB_firmware.srcs/sources_1/ip/dser_8/dser_8_stub.v
// Design      : dser_8
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module dser_8(data_in_from_pins, data_in_to_device, 
  bitslip, clk_in, clk_div_in, io_reset)
/* synthesis syn_black_box black_box_pad_pin="data_in_from_pins[0:0],data_in_to_device[7:0],bitslip[0:0],clk_in,clk_div_in,io_reset" */;
  input [0:0]data_in_from_pins;
  output [7:0]data_in_to_device;
  input [0:0]bitslip;
  input clk_in;
  input clk_div_in;
  input io_reset;
endmodule
