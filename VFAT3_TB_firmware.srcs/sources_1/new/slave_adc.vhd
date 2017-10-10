----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2017 10:52:51
-- Design Name: 
-- Module Name: slave_adc - Behavioral
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
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.all;

entity slave_adc is
	generic(
		d_width	: natural := 32
		);
	port(
	    clock		: in STD_LOGIC;
	    reset		: in STD_LOGIC;
		rst40		: in STD_LOGIC;
		clk40		: in STD_LOGIC;
		ipbus_in	: in ipb_wbus;
		scl			: out std_logic;
		sda_O		: out std_logic; 
		sda_i		: in std_logic;
		sda_tri		: out std_logic;  
		ipbus_out	: out ipb_rbus

	);
	
end slave_adc;

architecture Behavioral of slave_adc is

	signal enable 			: std_logic;
	signal addr 			: std_logic_vector(6 downto 0);
	signal r_w 				: std_logic;
	signal w_data 			: std_logic_vector(7 downto 0);
	signal data_valid 		: std_logic;
	signal error 			: std_logic;
	signal wstart 			: std_logic;
	signal rdata		 	: std_logic_vector(d_width-1 downto 0);
	signal master_select	: std_logic;
	signal sda_oi,sda_ii, scl_i   	: std_logic;  
	
	
	component control_adc is
        port(
            clk         : in std_logic;
            clk40         : in std_logic;
            rst         : in std_logic;
            ipbus_in    : in ipb_wbus;
            ipbus_out   : out ipb_rbus;
            rw          : out std_logic;
            en          : out std_logic;
            data_valid  : in std_logic;
            rdata       : in std_logic_vector(31 downto 0);
            error       : in std_logic;
            w_start     : out std_logic;
            wdata       : out std_logic_vector(7 downto 0)
        );
    end component;

    component i2c is
        port(
            ref_clk_i   : in std_logic;
            reset_i     : in std_logic;
            en_i        : in std_logic;
            address_i   : in std_logic_vector(6 downto 0);
            rw_i        : in std_logic;
            data_i      : in std_logic_vector(7 downto 0);
            valid_o     : out std_logic;
            error_o     : out std_logic;
            data_o      : out std_logic_vector(31 downto 0);
            scl_o       : out std_logic;
            sda_o   	: out std_logic;
            sda_i 	    : in std_logic;
            sda_tri_o   : out std_logic;
            w_start     : in std_logic
            );
    end component;	

    component ila_5 IS
        PORT (
            clk : IN STD_LOGIC;
            probe0 : IN std_logic;
            probe1 : IN std_logic;
            probe2 : IN std_logic;
            probe3 : IN std_logic;
            probe4 : IN std_logic;
            probe5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            probe6 : IN std_logic;
            probe7 : IN std_logic;
            probe8 : IN std_logic;
            probe9 : IN std_logic;
            probe10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            probe11 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            probe12 : IN std_logic;
            probe13 : IN std_logic
        );
    end component;	
	
begin
	
	controladc: entity work.control_adc
		port map(
			clk => clock,
			clk40 => clk40,
			rst => reset,
			ipbus_in => ipbus_in,
			ipbus_out => ipbus_out,
			rw => r_w,
			en => enable,
			data_valid => data_valid,
			rdata => rdata,
			error => error,
			w_start => wstart,
			wdata => w_data
		);
	
	addr <= "1001001";         -- Fixed slave address of the ADC

	
	scl <= scl_i;
	sda_ii <= sda_i;
	sda_o <= sda_oi;
	
	i2c_i: entity work.i2c
		port map(
			ref_clk_i => clk40,
			reset_i => rst40,
			en_i => enable,
			address_i => addr,
			rw_i => r_w,
			data_i => w_data,
			valid_o => data_valid,
			error_o => error,
			data_o => rdata,
			scl_o => scl_i,
			sda_o => sda_oi,
			sda_i => sda_ii,
			sda_tri_o => sda_tri,
			w_start => wstart
		);
		 
		 	chipscope1: ila_5 -- virtual IO's to debug
            port map(
                clk     => clk40,
                probe0     => ipbus_in.ipb_strobe,
                probe1     => ipbus_in.ipb_write,
                probe2     => clock,
                probe3     => wstart,
                probe4     => enable,
                probe5     => rdata,
                probe6     => ipbus_in.ipb_write,
                probe7     => r_w,
                probe8     => scl_i,
                probe9     => sda_oi,
                probe10    => ipbus_in.ipb_addr,
                probe11    => ipbus_in.ipb_addr,
                probe12    => data_valid,
                probe13    => error
            );
		 
		          
end Behavioral;