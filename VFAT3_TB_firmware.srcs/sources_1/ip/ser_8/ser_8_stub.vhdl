-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
-- Date        : Mon Oct  2 18:28:31 2017
-- Host        : lut4431 running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub
--               /home/a0312687/program_files/test/VFAT3-TB-Firmware/VFAT3_TB_firmware.srcs/sources_1/ip/ser_8/ser_8_stub.vhdl
-- Design      : ser_8
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ser_8 is
  Port ( 
    data_out_from_device : in STD_LOGIC_VECTOR ( 7 downto 0 );
    data_out_to_pins : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk_in : in STD_LOGIC;
    clk_div_in : in STD_LOGIC;
    io_reset : in STD_LOGIC
  );

end ser_8;

architecture stub of ser_8 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "data_out_from_device[7:0],data_out_to_pins[0:0],clk_in,clk_div_in,io_reset";
begin
end;
