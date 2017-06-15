----------------------------------------------------------------------------------
-- Company: ULB - IIHE
-- Engineer: Jason Rosa
-- 
-- Create Date: 02.05.2017 12:00:35
-- Design Name: 
-- Module Name: cst_pkg - Behavioral
-- Project Name: VFAT3 TESTING FIRMWARE
-- Target Devices: Kintex-7 KC705 Evaluation Platform
-- Tool Versions: Vivado 2016.3
-- Description: Package holding all the constants for better modularity
-- 
-- Dependencies: 
-- 
-- Revision: FINAL
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package cst_pkg is
	
	constant FIFO_W 	: natural; -- width of a data packet in fifos
	constant D_I_W 		: natural; -- width of an incoming (BCd + command) packet
	constant D_O_W		: natural; -- width of an outgoing (BCd + command) packet
	constant BCD_I_W 	: natural; -- width of the incoming BCd value
	constant BCD_O_W	: natural; -- width of the outgoing BCd value
	constant CMD_SW_W 	: natural; -- width of a command sent from software
	constant CMD_VFAT_W : natural; -- width of a command to send to the VFAT3
	constant FW_ST_W	: natural; -- width of the firmware status register

end cst_pkg;

package body cst_pkg is

	constant FIFO_W 	: natural := 32;
	constant CMD_SW_W 	: natural := 4;
	constant CMD_VFAT_W	: natural := 8;
	constant BCD_I_W 	: natural := 12;
	constant BCD_O_W	: natural := 24;
	constant D_I_W 		: natural := BCD_I_W + CMD_SW_W;
	constant D_O_W 		: natural := BCD_O_W + CMD_VFAT_W;
	constant FW_ST_W	: natural := 4;
	
end package body;
