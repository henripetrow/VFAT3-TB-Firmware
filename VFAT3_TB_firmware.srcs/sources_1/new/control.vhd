----------------------------------------------------------------------------------
-- Company: IIHE
-- Engineer: Jason Rosa
-- 
-- Create Date: 22.02.2017 08:45:17
-- Design Name: 
-- Module Name: control - rtl
-- Project Name: 
-- Target Devices: Kintex 7
-- Tool Versions: Vivado 2016.3
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.cst_pkg.all;

entity control is

	generic(
		fifo_w 	: natural := FIFO_W;
		fw_st_w	: natural := FW_ST_W
	);
	port(
		clk 			: in std_logic;
		rst 			: in std_logic;
		ipbus_in 		: in ipb_wbus;
		fifo_out_valid 	: in std_logic;
		fifo_underflow  : in std_logic;
		data_from_fifo 	: in std_logic_vector (fifo_w - 1 downto 0);
		fw_st_rd 		: in std_logic_vector(fw_st_w - 1 downto 0);
		fw_st_wr		: out std_logic_vector(fw_st_w - 1 downto 0);
		fw_st_wr_en		: out std_logic;
		vfat_rst_wr_en	: out std_logic;
		vfat_rst_wr		: out std_logic;
		ipbus_out 		: out ipb_rbus;
		data_to_fifo 	: out std_logic_vector (fifo_w - 1 downto 0);
		fifo_in_w_en 	: out std_logic;
		fifo_out_r_en 	: out std_logic;
		fifo_out_empty  : in std_logic;
		leds : out std_logic_vector(7 downto 0)
	);
end control;

architecture rtl of control is
	type state_type is (IDLE, W, R, ACK, ERROR, RESET, ONE_CLOCK);
	
	signal state 		: state_type;
	signal read_fw_st 	: std_logic_vector(fifo_w - 1 downto 0);
begin
	
	process(clk, rst)
			
	begin
		if rising_edge(clk) then
			if rst = '1' then
				state 			<= IDLE;
				ipbus_out 		<= (ipb_ack => '0', ipb_err => '0', ipb_rdata => (others => '0'));
				data_to_fifo 	<= (others => '0');
				fifo_in_w_en 	<= '0';
				fifo_out_r_en 	<= '0';
			else
				case state is
					when IDLE =>
					    ipbus_out <= (ipb_ack => '0', ipb_err => '0', ipb_rdata => (others => '0'));
						if ipbus_in.ipb_strobe = '1' and ipbus_in.ipb_write = '1' then
							if ipbus_in.ipb_addr = X"00003001" then
								fw_st_wr <= ipbus_in.ipb_wdata(fw_st_w - 1 downto 0);
								fw_st_wr_en <= '1';
								ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => (others => '0'));
								state <= RESET;
							elsif ipbus_in.ipb_addr = X"00003002" then
								vfat_rst_wr <= ipbus_in.ipb_wdata(0);
								vfat_rst_wr_en <= '1';
								ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => (others => '0'));
								state <= ONE_CLOCK;
							else
								state <= W;
							end if;
						elsif ipbus_in.ipb_strobe = '1' and ipbus_in.ipb_write = '0' then
							if ipbus_in.ipb_addr = X"00003001" then
								read_fw_st <= X"0000000" & fw_st_rd;
								ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => read_fw_st);
								state <= RESET;
							else
								if fifo_out_empty = '1' then
									state <= RESET;
									ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => (others => '0'));
								else
									state <= R;
									fifo_out_r_en <= '1';
								end if;
							end if;
						end if;
					when W =>
						data_to_fifo <= ipbus_in.ipb_wdata(fifo_w - 1 downto 0);
						fifo_in_w_en <= '1';
						ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => (others => '0')); 
						
						state <= RESET;
					when R =>
						fifo_out_r_en <= '0';
						leds <= "01010101";
						if fifo_out_valid = '1' then
							state <= ACK;
						end if;
						if fifo_underflow = '1' then
							state <= ERROR;
						end if;
					when ACK =>	
						ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => data_from_fifo);
						state <= RESET;
					when ONE_CLOCK =>	
                         state <= RESET;
					when ERROR =>
						ipbus_out <= (ipb_ack => '1', ipb_err => '1', ipb_rdata => (others => '0'));		
						state <= RESET;					
					when RESET =>
						data_to_fifo <= (others => '0');
						fifo_in_w_en <= '0';
						fw_st_wr_en <= '0';
						vfat_rst_wr_en <= '0';
						ipbus_out.ipb_ack <= '0';
						ipbus_out.ipb_rdata <= (others => '0');
						leds <= "00000000";
						state <= IDLE;
					when others =>
						data_to_fifo <= (others => '0');
						fifo_in_w_en <= '0';
						fifo_out_r_en <= '0';
						ipbus_out <= (ipb_ack => '0', ipb_err => '0', ipb_rdata => (others => '0'));
						state <= IDLE;
				end case;
			end if; --if rst
		end if; --if rising edge
	end process;
end rtl;
