----------------------------------------------------------------------------------
-- Company: IIHE - ULB and CERN
-- Engineers: M. Dabrowski and J. Rosa
-- 
-- Create Date: 19.04.2017 11:49:47
-- Design Name: 
-- Module Name: fifo_tx
-- Project Name: VFAT3 TESTING FIRMWARE
-- Target Devices: Kintex-7 KC705 Evaluation Platform
-- Tool Versions: Vivado 2016.3
-- Description: Block transmitting data from TX_fifo to serializer (VFAT3). 
--				It takes care of the counter BCd value to send the command at the time requested
-- 				It also converts the 4-bit command to 8-bits
--				If there is no data, it sends alternately fillers FCC_A and FCC_P
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.cst_pkg.all;

entity fifo_tx is

	generic(
		BCd_w	: natural := BCD_I_W;
        d_w  	: natural := D_I_W;
        cmd_i_w : natural := CMD_SW_W;
		cmd_o_w	: natural := CMD_VFAT_W;
		fwst_w  : natural := FW_ST_W
	);
	
	port(
		rst 		: in std_logic;
		clk 		: in std_logic;
		fifo_d 		: in std_logic_vector(d_w - 1 downto 0);
		fifo_dv		: in std_logic;
		fifo_empty	: in std_logic;
		d_out 		: out std_logic_vector(cmd_o_w - 1 downto 0);
		rd_en	    : out std_logic;
		fw_st_rd	: in std_logic_vector(fwst_w - 1 downto 0);
		ack_to_sw	: out std_logic
	);
	
end fifo_tx;

architecture rtl of fifo_tx is

	type state_type is (IDLE, READ, WAIT_BCD);
	
	constant FCC_A : std_logic_vector(cmd_o_w - 1 downto 0) := "11111111";
	constant FCC_P : std_logic_vector(cmd_o_w - 1 downto 0) := "00000000";
	
	signal d_4b_n, d_4b_p : std_logic_vector(cmd_i_w - 1 downto 0);
	signal dv_int_n, dv_int_p : std_logic;
	signal state_n, state_p : state_type := IDLE;
	signal BCd_cnt_n, BCd_cnt_p: std_logic_vector(BCd_w - 1 downto 0);
	signal FCC_cnt_p, FCC_cnt_n: std_logic;
	signal d_out_reg_n, d_out_reg_p : std_logic_vector(cmd_o_w - 1 downto 0);
	signal fifo_d_int : std_logic_vector(cmd_i_w - 1 downto 0);
	signal fifo_BCd_int : std_logic_vector(BCd_w - 1 downto 0);
	signal d_8b_int : std_logic_vector(cmd_o_w - 1 downto 0);
	
	signal reset_BCd : std_logic;
	signal start_BCd : std_logic;
			
begin
	
	d_out <= d_out_reg_p;
	d_out_reg_n <= d_8b_int when (dv_int_p = '1') else 
					FCC_A when (dv_int_p = '0' and FCC_cnt_p = '1') else 
					FCC_P when (dv_int_p = '0' and FCC_cnt_p = '0');
					
	FCC_cnt_n <= FCC_cnt_p when (dv_int_p = '1') else not FCC_cnt_p;
	
	fifo_d_int <= fifo_d(cmd_i_w - 1 downto 0);
	fifo_BCd_int <= fifo_d(d_w - 1 downto cmd_i_w);
	
	conv4b8b: process
	
	begin
		d_8b_int <= (others => '0');
		case(d_4b_p) is
			when "0000" => d_8b_int <= "00010111"; -- 0 => 17
			when "0001" => d_8b_int <= "00001111"; -- 1 => 0F
			when "0010" => d_8b_int <= "00110011"; -- 2 => 33
			when "0011" => d_8b_int <= "00111100"; -- 3 => 3C
			when "0100" => d_8b_int <= "01010101"; -- 4 => 55
			when "0101" => d_8b_int <= "01011010"; -- 5 => 5A
			when "0110" => d_8b_int <= "01100110"; -- 6 => 66
			when "0111" => d_8b_int <= "01101001"; -- 7 => 69
			when "1000" => d_8b_int <= "10010110"; -- 8 => 96
			when "1001" => d_8b_int <= "10011001"; -- 9 => 99
			when "1010" => d_8b_int <= "10100101"; -- A => A5
			when "1011" => d_8b_int <= "10101010"; -- B => AA
			when "1100" => d_8b_int <= "11000011"; -- C => C3
			when "1101" => d_8b_int <= "11001100"; -- D => CC
			when "1110" => d_8b_int <= "11110000"; -- E => F0
			when "1111" => d_8b_int <= "11101000"; -- F => E8
		end case;
	end process;
	
	combinatorial:process
	
	begin
		state_n <= state_p;
		d_4b_n <= d_4b_p;
		dv_int_n <= '0';
		BCd_cnt_n <= BCd_cnt_p;
		rd_en <= '0';
		
		case(state_p) is
			when IDLE =>
				if(fifo_empty = '0' and fw_st_rd /= "0000") then
					ack_to_sw <= '1';
					rd_en <= '1';
					state_n <= READ;
				else
					ack_to_sw <= '0';
				end if;
			when READ =>
				if(fifo_dv = '1') then
					d_4b_n <= fifo_d_int;
					if(fifo_BCd_int = X"000") then
						dv_int_n <= '1';
						if(fifo_empty = '0') then
							rd_en <= '1';
						else
							state_n <= IDLE;
						end if;
					else
						state_n <= WAIT_BCD;
						BCd_cnt_n <= fifo_BCd_int - 1;
					end if;
				end if;
			when WAIT_BCD =>
				if(BCd_cnt_p = X"000") then
					dv_int_n <= '1';
					if(fifo_empty = '0') then
						rd_en <= '1';
						state_n <= READ;
					else
						state_n <= IDLE;
					end if;
				else
					BCd_cnt_n <= BCd_cnt_p - 1;
				end if;
		end case;			
	end process;
	
	sequential: process(clk,rst)
	
	begin
		
		if rising_edge(clk) then
			if rst = '1' then
				state_p <= IDLE;
				d_4b_p <= (others => '0');
				dv_int_p <= '0';
				BCd_cnt_p <= (others => '0');
				FCC_cnt_p <= '0';
				d_out_reg_p <= (others => '0');
			else
				state_p <= state_n;
				d_4b_p <= d_4b_n;
				dv_int_p <= dv_int_n;
				BCd_cnt_p <= BCd_cnt_n;
				FCC_cnt_p <= FCC_cnt_n;
				d_out_reg_p <= d_out_reg_n;
			end if;
		end if;
		
	end process;
end rtl;
