# VFAT3-TB-Firmware
Firmware for the VFAT3 verification platform.

- Support for the use of external ADC for calibration routines.

- Ease of switching between VBv2 and VBv3
  - Comment/uncomment I2C pins in kc705_VBv1.xcd
  - VBv2: uncomment/VBv3: comment lines:
    	bor_disable <= '1';
	    por_disable <= '1';
	    mon_clk_en <= '1';
   in top_kc705_extphy.vhd
  - remove inversion from the ser_8 port map in the file slave_vfat3.vhd
  
  
- Synchronization procedure:
  - Press sync from SW.
  - SW freezes for a while, hold down sw4 for few seconds on FPGA board.
  - Press again sync fro SW, sync should be successful.
