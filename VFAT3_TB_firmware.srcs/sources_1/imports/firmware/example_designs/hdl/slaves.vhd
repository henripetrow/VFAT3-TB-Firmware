-- The ipbus slaves live in this entity - modify according to requirements
--
-- Ports can be added to give ipbus slaves access to the chip top level.
--
-- Dave Newbold, February 2011

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.ALL;

entity slaves is
	port(
		ipb_clk: in std_logic;
		ipb_rst: in std_logic;
		clk40: in std_logic;
		clk320: in std_logic;
		rst40: in std_logic;
		rst320: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		rst_out: out std_logic;
		eth_err_ctrl: out std_logic_vector(35 downto 0);
		eth_err_stat: in std_logic_vector(47 downto 0) := X"000000000000";
		pkt_rx: in std_logic := '0';
		pkt_tx: in std_logic := '0';
		vfat_reset : out std_logic;
		tx : out std_logic;
		rx : in std_logic;	
		scl : out std_logic;
		leds : out std_logic_vector(7 downto 0);
		sda_o : out std_logic;
		sda_i : in std_logic;
		sda_tri : out std_logic;
		sw_button : in std_logic
	);

end slaves;

architecture rtl of slaves is

	constant NSLV: positive := 2;
	signal ipbw: ipb_wbus_array(NSLV-1 downto 0);
	signal ipbr, ipbr_d: ipb_rbus_array(NSLV-1 downto 0);

    component slave_vfat3 is
        port(
            clk			: in STD_LOGIC;
            reset		: in STD_LOGIC;
            clk40		: in STD_LOGIC;
            rst40 		: in STD_LOGIC;
            clk320 		: in STD_LOGIC;
            rst320 		: in STD_LOGIC;
            ipbus_in	: in ipb_wbus;
            ipbus_out	: out ipb_rbus;
            vfat_rst	: out STD_LOGIC;
            tx    		: out STD_LOGIC;
            rx    		: in STD_LOGIC;
            sw_button	: in STD_LOGIC;
            leds        : out std_logic_vector(7 downto 0)
           );
    end component;

    component slave_adc is

	port(
	    clock		: in STD_LOGIC;
        reset        : in STD_LOGIC;
        rst40        : in STD_LOGIC;
		clk40		: in STD_LOGIC;
		ipbus_in	: in ipb_wbus;
		scl			: out std_logic;
		sda_O		: out std_logic; 
		sda_i		: in std_logic;
		sda_tri		: out std_logic;  
		ipbus_out	: out ipb_rbus
	   );
	   end component;


begin

  fabric: entity work.ipbus_fabric
    generic map(NSLV => NSLV)
    port map(
      ipb_in => ipb_in,
      ipb_out => ipb_out,
      ipb_to_slaves => ipbw,
      ipb_from_slaves => ipbr
    );

 -- VFAT3 SLAVES
 
	slavevfat3: entity work.slave_vfat3
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			clk40 => clk40,
			rst40 => rst40,
			clk320 => clk320,
			rst320 => rst320,
			ipbus_in => ipbw(0),
			ipbus_out => ipbr(0),
			vfat_rst => vfat_reset,
			tx => tx,
			rx => rx,
			sw_button => sw_button,
			leds => leds
		);

    slaveadc: entity work.slave_adc
        port map(
            clock => ipb_clk,
            reset => ipb_rst,
            rst40 => rst40,
            clk40 => clk40,
            ipbus_in => ipbw(1),
            ipbus_out => ipbr(1),
            scl => scl,
            sda_i => sda_i,
            sda_o => sda_o,
            sda_tri => sda_tri
        );

end rtl;
