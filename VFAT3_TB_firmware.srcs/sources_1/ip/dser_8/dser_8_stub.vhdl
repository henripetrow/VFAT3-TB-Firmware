-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
-- Date        : Mon Oct  2 18:29:07 2017
-- Host        : lut4431 running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub
--               /home/a0312687/program_files/test/VFAT3-TB-Firmware/VFAT3_TB_firmware.srcs/sources_1/ip/dser_8/dser_8_stub.vhdl
-- Design      : dser_8
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dser_8 is
  Port ( 
    data_in_from_pins : in STD_LOGIC_VECTOR ( 0 to 0 );
    data_in_to_device : out STD_LOGIC_VECTOR ( 7 downto 0 );
    bitslip : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_in : in STD_LOGIC;
    clk_div_in : in STD_LOGIC;
    io_reset : in STD_LOGIC
  );

end dser_8;

architecture stub of dser_8 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "data_in_from_pins[0:0],data_in_to_device[7:0],bitslip[0:0],clk_in,clk_div_in,io_reset";
begin
end;
