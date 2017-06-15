-- clocks_v6
--
-- Generates a 125MHz ethernet clock and 31MHz ipbus clock from the 200MHz reference
-- Also an unbuffered 200MHz clock for IO delay calibration block
-- Includes reset logic for ipbus
--
-- Dave Newbold, April 2011
--
-- $Id$

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.VComponents.all;

entity clocks_7s_extphy is port(
	sysclk_p, sysclk_n: in std_logic;
	clko_125: out std_logic;
	clko_200: out std_logic;
	clko_ipb: out std_logic;
	clko_40: out std_logic;
	clko_320: out std_logic;
	locked: out std_logic;
	nuke: in std_logic;
	rsto_125: out std_logic;
	rsto_ipb: out std_logic;
	rsto_320: out std_logic;
	rsto_40: out std_logic;
	onehz: out std_logic
	);

end clocks_7s_extphy;

architecture rtl of clocks_7s_extphy is
	
	signal dcm_locked, sysclk, clk_ipb_i, clk_125_i, clkfb, clk_ipb_b, clk_125_b, clk40, clk320, wiz_locked: std_logic;
	signal d17, d17_d: std_logic;
	signal nuke_i, nuke_d, nuke_d2: std_logic := '0';
	signal rst, rst_ipb, rst_125, rst40, rst320: std_logic := '1';
	
	component clk_wiz_0 is
	port(
		clk_in1 : in std_logic;
		clk_out1 : out std_logic;
		clk_out2 : out std_logic;
		reset : in std_logic;
		locked : out std_logic
	);
	end component;
begin

	ibufgds0: IBUFGDS port map(
		i => sysclk_p,
		ib => sysclk_n,
		o => sysclk
	);
	
	clko_200 <= sysclk; -- io delay ref clock only, no bufg

	bufg125: BUFG port map(
		i => clk_125_i,
		o => clk_125_b
	);
	
	clko_125 <= clk_125_b;
	
	bufgipb: BUFG port map(
		i => clk_ipb_i,
		o => clk_ipb_b
	);
	
	clko_ipb <= clk_ipb_b;
	
	mmcm: MMCME2_BASE
		generic map(
			clkfbout_mult_f => 5.0,
			clkout1_divide => 8,
			clkout2_divide => 32,
			clkin1_period => 5.0
		)
		port map(
			clkin1 => sysclk,
			clkfbin => clkfb,
			clkfbout => clkfb,
			clkout1 => clk_125_i,
			clkout2 => clk_ipb_i,
			locked => dcm_locked,
			rst => '0',
			pwrdwn => '0'
		);
	
	clkdiv: entity work.clock_div port map(
		clk => sysclk,
		d17 => d17,
		d28 => onehz
	);
	
	clk_wiz: clk_wiz_0 port map(
		clk_in1 => sysclk,
		clk_out1 => clk40,
		clk_out2 => clk320,
		reset => '0',
		locked => wiz_locked
	);
	
	clko_40 <= clk40;
	clko_320 <= clk320;
	
	process(sysclk)
	begin
		if rising_edge(sysclk) then
			d17_d <= d17;
			if d17='1' and d17_d='0' then
				rst <= nuke_d2 or not dcm_locked;
				nuke_d <= nuke_i; -- Time bomb (allows return packet to be sent)
				nuke_d2 <= nuke_d;
			end if;
		end if;
	end process;
	
	locked <= dcm_locked and wiz_locked; -- if locked <= dcm_locked; everything crashes wtf

	process(clk_ipb_b)
	begin
		if rising_edge(clk_ipb_b) then
			rst_ipb <= rst;
			nuke_i <= nuke;
		end if;
	end process;
	
	rsto_ipb <= rst_ipb;
	
	process(clk_125_b)
	begin
		if rising_edge(clk_125_b) then
			rst_125 <= rst;
		end if;
	end process;
	
	rsto_125 <= rst_125;
	
	process(clk40)
	begin
		if rising_edge(clk40) then
			rst40 <= rst;
		end if;
	end process;
	
	rsto_40 <= rst40;
	
	process(clk320)
	begin
		if rising_edge(clk320) then
			rst320 <= rst;
		end if;
	end process;
	
	rsto_320 <= rst320;
			
end rtl;

