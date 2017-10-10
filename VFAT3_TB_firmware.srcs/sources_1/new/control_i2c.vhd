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
		clk40          : in std_logic;
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

    signal start_meas : std_logic;
    signal run_meas : std_logic;
    signal flag : std_logic;
	type m_state_type is (IDLE,W_1, W, R1, R, RESET);
	type state_type is (IDLE, RESET);
	signal state 	: state_type;
	signal m_state 	: m_state_type;
	signal fresh_data    : std_logic_vector(31 downto 0):= (others => '0');
	
begin
	process(clk,rst)
	begin
		if rising_edge(clk) then
		    if flag = '1' then
		      start_meas <= '0';
		    end if;
			if rst = '1' then
			    state <= IDLE;
			    --w_start <= '0';
                --rw <= '0';
                --en <= '0';
				ipbus_out <= (ipb_ack => '0', ipb_err => '0', ipb_rdata => (others => '0'));
			else
				case state is
					when IDLE =>
					    ipbus_out <= (ipb_ack => '0', ipb_err => '0', ipb_rdata => (others => '0'));
					    
						if ipbus_in.ipb_strobe = '1' and ipbus_in.ipb_write = '0' then
							if ipbus_in.ipb_addr = X"00004000" then
								ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => fresh_data);
								state <= RESET;
							
							end if;
						end if;
						if ipbus_in.ipb_strobe = '1' and ipbus_in.ipb_write = '1' then
                                if ipbus_in.ipb_addr = X"00004001" then
                                    start_meas <= '1';
                                    run_meas <= ipbus_in.ipb_wdata(0);
                                    ipbus_out <= (ipb_ack => '1', ipb_err => '0', ipb_rdata => (others => '0'));
                                    state <= RESET;
                                end if;
                        end if;										
										
					when RESET =>
						ipbus_out <= (ipb_ack => '0', ipb_err => '0', ipb_rdata => (others => '0'));
						state <= IDLE;
				end case;
			end if;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
		    if run_meas = '1' then
                if start_meas = '1' then
                    m_state <= IDLE;
                    wdata <= (0 => '1', others => '0'); -- Register address.
                    w_start <= '1';
                    rw <= '0';
                    en <= '1';
                    --if data_valid = '1' then
                        flag <= '1';
                    --end if;
                else
                    case m_state is
                        when IDLE =>
                             wdata <= (others => '0'); -- Register address.
                             rw <= '0';
                             en <= '1';
                             m_state <= W_1;
                                        
                        when W_1 =>
                            en <= '0';
                            m_state <= W;
                            
                        when W =>
                            if data_valid = '1' then
                                rw <= '1';
                                en <= '1';
                                m_state <= R;
                            end if;
                            if error = '1' then
                                m_state <= RESET;
                            end if;
                        when R1 =>
                            rw <= '1';
                            en <= '1';
                            m_state <= R;                                          
                        when R =>
                            en <= '0';
                            if data_valid = '1' then
                                fresh_data <= rdata;
                                m_state <= RESET;
                            end if;
                            if error = '1' then
                                m_state <= RESET;
                            end if;
                                                
                        when RESET =>
                            
                            w_start <= '0';
                            en <= '0';
                            rw <= '0';
                            m_state <= IDLE;
                    end case;
                end if;
           end if;
		end if;
	end process;


end Behavioral;

