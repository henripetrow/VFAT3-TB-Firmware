----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2017 14:13:12
-- Design Name: 
-- Module Name: control_adc - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use work.ipbus.all;

entity control_adc is
	port(
		clk           : in std_logic;
		rst           : in std_logic;
		ipbus_in      : in ipb_wbus;
		ipbus_out     : out ipb_rbus;
		rw            : out std_logic;
	    en            : out std_logic;
		data_valid    : in std_logic;
		rdata         : in std_logic_vector(31 downto 0);
		error         : in std_logic;
		w_start       : out std_logic;
		wdata         : out std_logic_vector(7 downto 0):= (others => '0')
	);
end control_adc;

architecture Behavioral of control_adc is
	
	type state_type is (IDLE,W_1, W, R, RESET);
	signal state 	: state_type;
	
begin
	process(clk,rst)
	begin
		if rising_edge(clk) then
			if rst = '1' then
			    state <= IDLE;
			    w_start <= '0';
                rw <= '0';
                en <= '0';
				ipbus_out <= (ipb_ack => '0', ipb_err => '0', ipb_rdata => (others => '0'));
			else
				case state is
					when IDLE =>
					    ipbus_out <= (ipb_ack => '0', ipb_err => '0', ipb_rdata => (others => '0'));
					    
						if ipbus_in.ipb_strobe = '1' and ipbus_in.ipb_write = '0' then
							if ipbus_in.ipb_addr = X"00004000" then
								ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => rdata);
								state <= RESET;

							end if;
						end if;
						if ipbus_in.ipb_strobe = '1' and ipbus_in.ipb_write = '1' then
                                if ipbus_in.ipb_addr = X"00004000" then
                                    wdata <= (others => '0');
                                    rw <= '0';
                                    en <= '1';
                                    --ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => (others => '0'));
                                    state <= W_1;

                                end if;
                                else if ipbus_in.ipb_addr = X"00004001" then
                                    wdata <= (0 => '1', others => '0');
                                    w_start <= '1';
                                    rw <= '0';
                                    en <= '1';
                                    ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => (others => '0'));
                                    state <= RESET;

                                end if;
						end if;											

                    when W_1 =>
                        ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => (others => '0'));
                        en <= '0';
                        state <= W;
						
                    when W =>
                        if data_valid = '1' then
                            rw <= '1';
                            en <= '1';
                            state <= R;
                        end if;
                        if error = '1' then
                            ipbus_out <= (ipb_ack => '1', ipb_err => '1', ipb_rdata => (others => '0'));
                            state <= RESET;
                        end if;
                                               
					when R =>
					    en <= '0';
						if data_valid = '1' then
							--ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => rdata);
							ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => (others => '0'));
							state <= RESET;
						end if;
						if error = '1' then
						    ipbus_out <= (ipb_ack => '1', ipb_err => '1', ipb_rdata => (others => '0'));
                            state <= RESET;
                        end if;
											
					when RESET =>
						ipbus_out <= (ipb_ack => '0', ipb_err => '0', ipb_rdata => (others => '0'));
						w_start <= '0';
						en <= '0';
						rw <= '0';
						state <= IDLE;
				end case;
			end if;
		end if;
	end process;




end Behavioral;

