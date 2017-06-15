----------------------------------------------------------------------------------
-- Company: ULB - IIHE
-- Engineer: Jason Rosa
-- 
-- Create Date: 17.02.2017 15:57:50
-- Design Name: 
-- Module Name: slave_vfat3 - rtl
-- Project Name: VFAT3 TESTING FIRMWARE
-- Target Devices: Kintex-7 KC705 Evaluation Platform
-- Tool Versions: Vivado 2016.3
-- Description: VFAT3 testing firmware ipbus slave
-- 
-- Dependencies: 
-- 
-- Revision: FINAL
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.cst_pkg.all;

entity slave_vfat3 is
	generic(
		d_w 	: natural := D_I_W;
		fifo_w  : natural := FIFO_W;
		BCd_w	: natural := BCD_I_W;
		cmd_i_w	: natural := CMD_SW_W;
		cmd_o_w	: natural := CMD_VFAT_W;
		fwst_w  : natural := FW_ST_W
		);
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
	
end slave_vfat3;

architecture rtl of slave_vfat3 is

	signal fifo_out_data_in		: std_logic_vector(fifo_w - 1 downto 0);
	signal fifo_in_data_out		: std_logic_vector(fifo_w - 1 downto 0);
	signal fifo_out_data_out	: std_logic_vector(fifo_w - 1 downto 0);
	signal fifo_in_data_in		: std_logic_vector(fifo_w - 1 downto 0);
	signal fifo_in_full			: std_logic;
	signal fifo_in_empty		: std_logic;
	signal fifo_out_full		: std_logic;
	signal fifo_out_empty		: std_logic;
	signal fifo_in_w_en			: std_logic;
	signal fifo_in_r_en			: std_logic;
	signal fifo_out_w_en		: std_logic;
	signal fifo_out_r_en		: std_logic;
	signal fifo_in_valid		: std_logic;
	signal fifo_out_valid		: std_logic;
	signal fifo_out_w_ack		: std_logic;
	signal fifo_out_underflow	: std_logic;
	signal fifo_in_underflow	: std_logic;
	signal fifo_in_ack			: std_logic;
	signal reset_fifo			: std_logic;
	
	signal counter_rst			: integer := 0;
			
	signal command				: std_logic_vector(cmd_i_w - 1 downto 0);
	signal no_data				: std_logic;
	
	signal data_bus_out			: std_logic_vector(cmd_o_w - 1 downto 0);
	signal data_bus_in			: std_logic_vector(cmd_o_w - 1 downto 0);
	signal data_buf_received	: std_logic;
	
	signal fw_st_p, fw_st		: std_logic_vector(fwst_w - 1 downto 0) := "0000";
	signal fw_st_rd, fw_st_wr	: std_logic_vector(fwst_w - 1 downto 0);
	signal fw_st_wr_en			: std_logic;
	signal fw_st_latch 			: std_logic;
	signal ack_to_sw			: std_logic;
	
	signal bitslip				: std_logic;
	signal ser_d_in             : std_logic_vector(cmd_o_w - 1 downto 0);
	signal d_sync				: std_logic_vector(cmd_o_w - 1 downto 0);
	signal sync_flag			: std_logic;
	signal d_out_valid			: std_logic;
	
	signal vfat_rst_wr_en, vfat_rst_wr : std_logic;
	signal input_resync : std_logic;
	
	
	component fifo_generator_0 is
		PORT (
	    	wr_clk     		: IN  std_logic := '0';
	     	rd_clk      	: IN  std_logic := '0';
	        wr_ack			: OUT std_logic;
	        underflow		: OUT std_logic;
	        rst          	: IN  std_logic := '0';
	        wr_en        	: IN  std_logic := '0';
	        rd_en        	: IN  std_logic := '0';
	        din          	: IN  std_logic_vector(fifo_w - 1 DOWNTO 0) := (OTHERS => '0');
	        dout         	: OUT std_logic_vector(fifo_w - 1 DOWNTO 0);
	        full         	: OUT std_logic;
	        empty        	: OUT std_logic;
	        valid			: OUT std_logic
		);
	  end component;
	  
	  component fifo_rx is
	  		PORT (
	  	    	wr_clk     		: IN  std_logic := '0';
	  	     	rd_clk      	: IN  std_logic := '0';
	  	        wr_ack			: OUT std_logic;
	  	        underflow		: OUT std_logic;
	  	        rst          	: IN  std_logic := '0';
	  	        wr_en        	: IN  std_logic := '0';
	  	        rd_en        	: IN  std_logic := '0';
	  	        din          	: IN  std_logic_vector(fifo_w - 1 DOWNTO 0) := (OTHERS => '0');
	  	        dout         	: OUT std_logic_vector(fifo_w - 1 DOWNTO 0);
	  	        full         	: OUT std_logic;
	  	        empty        	: OUT std_logic;
	  	        valid			: OUT std_logic
	  		);
	  	  end component;
	  
	  component rx_fifo_int is
	  		port(
	  			clk 	: IN std_logic;
	  			rst 	: IN std_logic;
	  			d_in 	: IN std_logic_vector(cmd_o_w - 1 downto 0);
	  			d_out 	: OUT std_logic_vector(fifo_w - 1 downto 0);
	  			dv 		: OUT std_logic
	  		);
	  end component;
	  
	  component dser_sync is
	  	port(
	  		clk40 	: IN std_logic;
	  		rst 	: IN std_logic;
	  		re_sync : IN std_logic;
	  		d_in 	: IN std_logic_vector(cmd_o_w - 1 downto 0);
	  		bslip 	: OUT std_logic;
	  		in_sync : OUT std_logic_vector(cmd_o_w - 1 downto 0);
	  		sync_o 	: OUT std_logic
	  	);
	  end component;
	  
	  component dser_8 is
          port(
              data_in_from_pins : IN std_logic;
              data_in_to_device : OUT std_logic_vector(cmd_o_w - 1 downto 0);
              bitslip 			: IN std_logic;
              clk_in 			: IN std_logic;
              clk_div_in 		: IN std_logic;
              io_reset 			: IN std_logic
          );
      end component;

	  component ser_8 is
	  	port(
	  		data_out_to_pins 		: OUT std_logic;
	  		data_out_from_device 	: IN std_logic_vector(cmd_o_w - 1 downto 0);
	  		clk_in 					: IN std_logic;
	  		clk_div_in 				: IN std_logic;
	  		io_reset 				: IN std_logic
	  	);
	  end component;
	  
	  component fifo_tx is 
	       port(
          clk 			: IN std_logic;
          rst 			: IN std_logic;
          fifo_d 		: IN std_logic_vector(d_w - 1 DOWNTO 0);
          fifo_dv 		: IN std_logic;
          fifo_empty 	: IN std_logic;
          rd_en 		: OUT std_logic;
          d_out 		: OUT std_logic_vector(cmd_o_w - 1 DOWNTO 0);
          fw_st_rd		: IN std_logic_vector(fwst_w - 1 DOWNTO 0);
          ack_to_sw		: OUT std_logic
      );
      end component;
	  
	component ila_0 is -- debugging purpose
	port(
		clk 	: IN std_logic;
		probe0 	: IN std_logic;
		probe1 	: IN std_logic;
		probe2 	: IN std_logic;
		probe3 	: IN std_logic;
		probe4 	: IN std_logic;
		probe5 	: IN std_logic;
		probe6 	: IN std_logic_vector(fifo_w - 1 downto 0);
		probe7 	: IN std_logic_vector(fifo_w - 1 downto 0);
		probe8 	: IN std_logic_vector(fifo_w - 1 downto 0);
		probe9 	: IN std_logic_vector(fifo_w - 1 downto 0);
		probe10 : IN std_logic;
		probe11 : IN std_logic;
		probe12 : IN std_logic;
		probe13 : IN std_logic;
		probe14 : IN std_logic_vector(cmd_o_w - 1 DOWNTO 0);
		probe15 : IN std_logic;
		probe16 : IN std_logic;
		probe17 : IN std_logic;
		probe18 : IN std_logic_vector(cmd_o_w - 1 DOWNTO 0);
		probe19 : IN std_logic_vector(cmd_o_w - 1 DOWNTO 0);
		probe20 : IN std_logic;
		probe21 : IN std_logic;
		probe22 : IN std_logic;
		probe23 : IN std_logic;
		probe24 : IN std_logic;
		probe25 : IN std_logic_vector(fwst_w - 1 DOWNTO 0);
		probe26 : IN std_logic_vector(fwst_w - 1 DOWNTO 0);
		probe27 : IN std_logic		
	);
	end component;
	  
	function reverse_vector (a: in std_logic_vector) return std_logic_vector is
		variable result: std_logic_vector(a'RANGE);
		alias aa: std_logic_vector(a'REVERSE_RANGE) is a;
	begin
		for i in aa'RANGE loop
			result(i) := aa(i);
		end loop;
		return result;
	end; -- function reverse_vector
	
	function inverse_vector (a: in std_logic_vector) return std_logic_vector is
		variable result: std_logic_vector(a'RANGE);
	begin
		for i in a'RANGE loop
			result(i) := not(a(i));
		end loop;
		return result;
	end; -- function inverse_vector
	  
begin
	
	control_block: entity work.control
	port map(
		clk 			=> clk,
		rst 			=> reset,
		ipbus_in 		=> ipbus_in,
		ipbus_out 		=> ipbus_out,
		fifo_in_w_en	=> fifo_in_w_en,
		fifo_out_r_en 	=> fifo_out_r_en,
		fifo_out_valid	=> fifo_out_valid,
		data_to_fifo 	=> fifo_in_data_in,
		data_from_fifo 	=> fifo_out_data_out,
		fifo_underflow	=> fifo_out_underflow,
		fifo_out_empty  => fifo_out_empty,
		fw_st_rd 		=> fw_st_rd,
		fw_st_wr 		=> fw_st_wr,
		fw_st_wr_en 	=> fw_st_wr_en,
		vfat_rst_wr_en  => vfat_rst_wr_en,
		leds            => leds
	);
		
-- #### INPUT FIFO
	fifo_in: fifo_generator_0
	port map(
		rst 			=> reset_fifo,
	    wr_clk 			=> clk,
	    rd_clk 			=> clk40,
	    din				=> fifo_in_data_in,
	    wr_en 			=> fifo_in_w_en,
	    rd_en 			=> fifo_in_r_en,
	    dout 			=> fifo_in_data_out,
	    full 			=> fifo_in_full,
	    valid			=> fifo_in_valid,
	    wr_ack 			=> fifo_in_ack,
	    empty 			=> fifo_in_empty,
	    underflow 		=> fifo_in_underflow
	);
	
    ftx: fifo_tx
        port map(
            clk 		=> clk40, 
            rst 		=> rst40,
            fifo_d 		=> fifo_in_data_out(d_w - 1 downto 0),
            fifo_dv 	=> fifo_in_valid,
            fifo_empty 	=> fifo_in_empty,
            rd_en 		=> fifo_in_r_en,
            d_out 		=> ser_d_in,
            fw_st_rd	=> fw_st_rd,
            ack_to_sw 	=> ack_to_sw
        );
        
    ser: ser_8
	port map(
		clk_in 					=> clk320,
		clk_div_in 				=> clk40,
		io_reset 				=> '0', -- ?
		data_out_to_pins 		=> tx,
--		data_out_from_device 	=> reverse_vector(ser_d_in)
		data_out_from_device 	=> reverse_vector(inverse_vector(ser_d_in))
	);
    
-- #### OUTPUT FIFO	
	fifo_out: fifo_rx
		port map(
			rst 		=> reset_fifo,
		    wr_clk 		=> clk40,
		    rd_clk 		=> clk,
		    din 		=> fifo_out_data_in,
		    wr_en 		=> fifo_out_w_en,
		    rd_en 		=> fifo_out_r_en,
		    dout 		=> fifo_out_data_out,
		    full 		=> fifo_out_full,
		    wr_ack		=> fifo_out_w_ack,
		    empty 		=> fifo_out_empty,
		    valid		=> fifo_out_valid,
		    underflow 	=> fifo_out_underflow
		);
		
		fifo_out_w_en <= d_out_valid;
		
	filter: rx_fifo_int
		port map(
			clk 	=> clk40,
			rst 	=> rst40,
			d_in 	=> d_sync,
			d_out 	=> fifo_out_data_in,
			dv 		=> d_out_valid
		);
    
    input_resync <= vfat_rst_wr_en or sw_button;
		
	dsersync: dser_sync
		port map(
			clk40 	=> clk40,
			rst 	=> rst40,
			re_sync => sw_button, -- south gpio button to resync
			d_in 	=> reverse_vector(data_bus_in),
			bslip 	=> bitslip,
			in_sync => d_sync,
			sync_o => sync_flag			
		);

    des: dser_8
        port map(
            clk_in 				=> clk320,
            clk_div_in 			=> clk40,
            io_reset 			=> '0', -- ?
            bitslip 			=> bitslip,
            data_in_from_pins 	=> rx,
            data_in_to_device 	=> data_bus_in
        );

	chipscope: ila_0 -- virtual IO's to debug
		port map(
			clk 	=> clk40,
			probe0 	=> fifo_out_w_en,
			probe1 	=> fifo_in_w_en,
			probe2 	=> fifo_out_r_en,
			probe3 	=> fifo_in_r_en,
			probe4 	=> fifo_out_valid,
			probe5 	=> fifo_in_valid,
	
			probe6 	=> fifo_out_data_in,
			probe7 	=> fifo_out_data_out,
			probe8 	=> fifo_in_data_in,
			probe9 	=> fifo_in_data_out,
			
			probe10 => fifo_out_empty,
			probe11 => fifo_in_empty,
			probe12 => fifo_out_full,
			probe13 => fifo_in_full,
			
			probe14 => ser_d_in,
			
			probe15 => reset,
			probe16 => rst40,
			probe17 => reset_fifo,
			
			probe18 => data_bus_in,
			probe19 => d_sync,
			
			probe20 => sync_flag,
			probe21 => bitslip,
			probe22 => rx,
			probe23 => sw_button,
			
			probe24 => ack_to_sw,
			probe25 => fw_st_rd,
			probe26 => fw_st_wr,
			probe27 => fw_st_wr_en
			
		);
	
    process(clk, reset) 
    begin
        if rising_edge(clk) then
            if counter_rst < 16 then -- need to maintain reset on FIFO a few clk cycles first
                reset_fifo <= '1';
                counter_rst <= counter_rst + 1;
            else
                reset_fifo <= reset;
            end if;
        end if;
    end process;
    
    fw_status: process(clk, reset, fifo_out_empty, ack_to_sw, fw_st, fw_st_p)
    begin
    	if rising_edge(clk) then
    		if fw_st_latch = '1' then
    			fw_st <= fw_st_p;
    		end if;
    		
    		case(fw_st) is
    			when "0000" =>
    			
    			when "0001" =>
    				if ack_to_sw = '1' then
    					fw_st <= "0010";
    				end if;
    			when "0010" =>
    				if fifo_out_empty = '0' then
    					fw_st <= "0011";
    				end if;
    			when "0011" =>
    				if fifo_out_empty = '1' then
    					fw_st <= "0010";
    				end if;
    			when others =>
    				fw_st <= "0000";
    		end case;
    	end if;
    end process;
    
    fw_st_bidir: process(clk, reset)
    
    begin
    	if rising_edge(clk) then
    		if reset = '1' then
    			fw_st_p <= "0000";
    		else
    			if fw_st_wr_en = '1' then
    				fw_st_p <= fw_st_wr; 
    				fw_st_latch <= '1';
    			else 
    				fw_st_latch <= '0';
    			end if;
    			fw_st_rd <= fw_st;
    		end if;
    	end if;
    end process;
    
--    vfat_reset: process(clk, vfat_rst_wr, vfat_rst_wr_en)
--    begin
--       	if rising_edge(clk) then
--       		if vfat_rst_wr_en = '1' then
--       			vfat_rst <= vfat_rst_wr;
--       		else
--       			vfat_rst <= '0';
--       		end if;
--       	end if;
--    end process;
end rtl;