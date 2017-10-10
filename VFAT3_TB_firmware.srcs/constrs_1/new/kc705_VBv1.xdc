
####################################################################################
# Generated by PlanAhead 14.7 built on 'Fri Sep 27 19:29:51 MDT 2013' by 'xbuild'
####################################################################################


####################################################################################
# Constraints from file : 'kc705_extphy.ucf'
####################################################################################

set_property IOSTANDARD LVDS [get_ports sysclk_p]
set_property PACKAGE_PIN AD12 [get_ports sysclk_p]
set_property PACKAGE_PIN AD11 [get_ports sysclk_n]
set_property IOSTANDARD LVDS [get_ports sysclk_n]

# All timing constraint translations are rough conversions, intended to act as a template for further manual refinement. The translations should not be expected to produce semantically identical results to the original ucf. Each xdc timing constraint must be manually inspected and verified to ensure it captures the desired intent

# In xdc, all clocks are related by default. This differs from ucf, where clocks are unrelated unless specified otherwise. As a result, you may now see cross-clock paths that were previously unconstrained in ucf. Commented out xdc false path constraints have been generated and can be uncommented, should you wish to remove these new paths. These commands are located after the last clock definition

# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:7
create_clock -period 5.000 -name sysclk_p [get_ports sysclk_p]

# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:11
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:12

# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:14
set_false_path -through [get_nets clocks/rst]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:15
#set_false_path -through [get_nets clocks/nuke_i]

set_property PACKAGE_PIN AB8 [get_ports {leds[0]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:18
# The conversion of 'IOSTANDARD' constraint on 'net' object 'leds[0]' has been applied to the port object 'leds[0]'.
set_property IOSTANDARD LVCMOS18 [get_ports {leds[0]}]
set_property PACKAGE_PIN AA8 [get_ports {leds[1]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:20
# The conversion of 'IOSTANDARD' constraint on 'net' object 'leds[1]' has been applied to the port object 'leds[1]'.
set_property IOSTANDARD LVCMOS18 [get_ports {leds[1]}]
set_property PACKAGE_PIN AC9 [get_ports {leds[2]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:22
# The conversion of 'IOSTANDARD' constraint on 'net' object 'leds[2]' has been applied to the port object 'leds[2]'.
set_property IOSTANDARD LVCMOS18 [get_ports {leds[2]}]
set_property PACKAGE_PIN AB9 [get_ports {leds[3]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:24
# The conversion of 'IOSTANDARD' constraint on 'net' object 'leds[3]' has been applied to the port object 'leds[3]'.
set_property IOSTANDARD LVCMOS18 [get_ports {leds[3]}]

set_property PACKAGE_PIN AE26 [get_ports {leds[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {leds[4]}]
set_property PACKAGE_PIN G19 [get_ports {leds[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {leds[5]}]
set_property PACKAGE_PIN E18 [get_ports {leds[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {leds[6]}]
set_property PACKAGE_PIN F16 [get_ports {leds[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {leds[7]}]

#set_property PACKAGE_PIN AG5 [get_ports {swb}]
#set_property IOSTANDARD LVCMOS15 [get_ports {swb}]

# Ethernet PHY
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:28
# OFFSET constraint specified with no value. It will not be translated and should be converted manually

set_property PACKAGE_PIN K30 [get_ports gmii_gtx_clk]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:31
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_gtx_clk' has been applied to the port object 'gmii_gtx_clk'.
set_property IOSTANDARD LVCMOS25 [get_ports gmii_gtx_clk]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:32
# The conversion of 'SLEW' constraint on 'net' object 'gmii_gtx_clk' has been applied to the port object 'gmii_gtx_clk'.
set_property SLEW FAST [get_ports gmii_gtx_clk]
set_property PACKAGE_PIN N27 [get_ports {gmii_txd[0]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:34
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_txd[0]' has been applied to the port object 'gmii_txd[0]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_txd[0]}]
set_property PACKAGE_PIN N25 [get_ports {gmii_txd[1]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:36
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_txd[1]' has been applied to the port object 'gmii_txd[1]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_txd[1]}]
set_property PACKAGE_PIN M29 [get_ports {gmii_txd[2]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:38
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_txd[2]' has been applied to the port object 'gmii_txd[2]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_txd[2]}]
set_property PACKAGE_PIN L28 [get_ports {gmii_txd[3]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:40
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_txd[3]' has been applied to the port object 'gmii_txd[3]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_txd[3]}]
set_property PACKAGE_PIN J26 [get_ports {gmii_txd[4]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:42
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_txd[4]' has been applied to the port object 'gmii_txd[4]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_txd[4]}]
set_property PACKAGE_PIN K26 [get_ports {gmii_txd[5]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:44
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_txd[5]' has been applied to the port object 'gmii_txd[5]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_txd[5]}]
set_property PACKAGE_PIN L30 [get_ports {gmii_txd[6]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:46
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_txd[6]' has been applied to the port object 'gmii_txd[6]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_txd[6]}]
set_property PACKAGE_PIN J28 [get_ports {gmii_txd[7]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:48
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_txd[7]' has been applied to the port object 'gmii_txd[7]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_txd[7]}]
set_property PACKAGE_PIN M27 [get_ports gmii_tx_en]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:50
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_tx_en' has been applied to the port object 'gmii_tx_en'.
set_property IOSTANDARD LVCMOS25 [get_ports gmii_tx_en]
set_property PACKAGE_PIN N29 [get_ports gmii_tx_er]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:52
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_tx_er' has been applied to the port object 'gmii_tx_er'.
set_property IOSTANDARD LVCMOS25 [get_ports gmii_tx_er]

set_property PACKAGE_PIN U27 [get_ports gmii_rx_clk]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:56
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_rx_clk' has been applied to the port object 'gmii_rx_clk'.
set_property IOSTANDARD LVCMOS25 [get_ports gmii_rx_clk]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:57
create_clock -period 8.000 -name gmii_rx_clk [get_ports gmii_rx_clk]

# The following cross clock domain false path constraints can be uncommented in order to mimic ucf constraints behavior (see message at the beginning of this file)
# set_false_path -from [get_clocks sysclk_p] -to [get_clocks gmii_rx_clk]
# set_false_path -from [get_clocks gmii_rx_clk] -to [get_clocks sysclk_p]

# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:58
set_input_delay -clock [get_clocks gmii_rx_clk] -max 5.500 [get_ports gmii_rx_clk]
set_input_delay -clock [get_clocks gmii_rx_clk] -min 0.500 [get_ports gmii_rx_clk]
set_property PACKAGE_PIN U30 [get_ports {gmii_rxd[0]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:60
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_rxd[0]' has been applied to the port object 'gmii_rxd[0]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_rxd[0]}]
set_property PACKAGE_PIN U25 [get_ports {gmii_rxd[1]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:62
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_rxd[1]' has been applied to the port object 'gmii_rxd[1]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_rxd[1]}]
set_property PACKAGE_PIN T25 [get_ports {gmii_rxd[2]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:64
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_rxd[2]' has been applied to the port object 'gmii_rxd[2]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_rxd[2]}]
set_property PACKAGE_PIN U28 [get_ports {gmii_rxd[3]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:66
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_rxd[3]' has been applied to the port object 'gmii_rxd[3]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_rxd[3]}]
set_property PACKAGE_PIN R19 [get_ports {gmii_rxd[4]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:68
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_rxd[4]' has been applied to the port object 'gmii_rxd[4]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_rxd[4]}]
set_property PACKAGE_PIN T27 [get_ports {gmii_rxd[5]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:70
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_rxd[5]' has been applied to the port object 'gmii_rxd[5]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_rxd[5]}]
set_property PACKAGE_PIN T26 [get_ports {gmii_rxd[6]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:72
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_rxd[6]' has been applied to the port object 'gmii_rxd[6]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_rxd[6]}]
set_property PACKAGE_PIN T28 [get_ports {gmii_rxd[7]}]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:74
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_rxd[7]' has been applied to the port object 'gmii_rxd[7]'.
set_property IOSTANDARD LVCMOS25 [get_ports {gmii_rxd[7]}]
set_property PACKAGE_PIN R28 [get_ports gmii_rx_dv]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:76
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_rx_dv' has been applied to the port object 'gmii_rx_dv'.
set_property IOSTANDARD LVCMOS25 [get_ports gmii_rx_dv]
set_property PACKAGE_PIN V26 [get_ports gmii_rx_er]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:78
# The conversion of 'IOSTANDARD' constraint on 'net' object 'gmii_rx_er' has been applied to the port object 'gmii_rx_er'.
set_property IOSTANDARD LVCMOS25 [get_ports gmii_rx_er]

set_property IDELAY_VALUE 27 [get_cells {eth/iodelgen[7].iodelay}]
set_property IDELAY_VALUE 27 [get_cells {eth/iodelgen[6].iodelay}]
set_property IDELAY_VALUE 27 [get_cells {eth/iodelgen[5].iodelay}]
set_property IDELAY_VALUE 27 [get_cells {eth/iodelgen[4].iodelay}]
set_property IDELAY_VALUE 27 [get_cells {eth/iodelgen[3].iodelay}]
set_property IDELAY_VALUE 27 [get_cells {eth/iodelgen[2].iodelay}]
set_property IDELAY_VALUE 27 [get_cells {eth/iodelgen[1].iodelay}]
set_property IDELAY_VALUE 27 [get_cells eth/iodelay_dv]
set_property IDELAY_VALUE 27 [get_cells eth/iodelay_er]
set_property IDELAY_VALUE 27 [get_cells {eth/iodelgen[0].iodelay}]

set_property PACKAGE_PIN L20 [get_ports phy_rstb]
# C:/Users/Jason/Dropbox/ULB/MA2/Memoire/Vivado/IPBUS/project_ipbus_extphy/project_ipbus_extphy.runs/impl_1/.constrs/kc705_extphy.ucf:83
# The conversion of 'IOSTANDARD' constraint on 'net' object 'phy_rstb' has been applied to the port object 'phy_rstb'.
set_property IOSTANDARD LVCMOS25 [get_ports phy_rstb]





set_property PACKAGE_PIN AG25 [get_ports por_disable]
# POR_DISABLE: AG25 for VBv2+TBv1.4, B25 for VBv2+TBv1.3
set_property IOSTANDARD LVCMOS12 [get_ports por_disable]

set_property PACKAGE_PIN AB20 [get_ports bor_disable]
# BOR_DISABLE: AB20 for VBv2+TBv1.4, H24 for VBv2+TBv1.3
set_property IOSTANDARD LVCMOS12 [get_ports bor_disable]

set_property PACKAGE_PIN AH25 [get_ports vfat_reset]
# EXT_RST: AH25 for VBv2+TBv1.4, C25 for VBv2+TBv1.3
set_property IOSTANDARD LVCMOS12 [get_ports vfat_reset]

set_property PACKAGE_PIN AK20 [get_ports out0]
set_property IOSTANDARD LVCMOS12 [get_ports out0]

set_property PACKAGE_PIN AJ24 [get_ports out1]
set_property IOSTANDARD LVCMOS12 [get_ports out1]

set_property PACKAGE_PIN AD21 [get_ports out2]
set_property IOSTANDARD LVCMOS12 [get_ports out2]

set_property PACKAGE_PIN AD27 [get_ports out3]
set_property IOSTANDARD LVCMOS25 [get_ports out3]

set_property PACKAGE_PIN AD28 [get_ports out4]
set_property IOSTANDARD LVCMOS25 [get_ports out4]

set_property PACKAGE_PIN AJ28 [get_ports out5]
set_property IOSTANDARD LVCMOS25 [get_ports out5]

set_property PACKAGE_PIN AJ29 [get_ports out6]
set_property IOSTANDARD LVCMOS25 [get_ports out6]

set_property PACKAGE_PIN AB27 [get_ports out7]
set_property IOSTANDARD LVCMOS25 [get_ports out7]

set_property PACKAGE_PIN AC27 [get_ports out8]
set_property IOSTANDARD LVCMOS25 [get_ports out8]

# SDA: VBv1 AF23 - VBv2 AF20

# SCL: VBv1 AE23 - VBv2 AF21

# TU SoT
set_property IOSTANDARD LVDS_25 [get_ports tu_sot_p]
set_property IOSTANDARD LVDS_25 [get_ports tu_sot_n]
set_property PACKAGE_PIN AF26 [get_ports tu_sot_p]
set_property PACKAGE_PIN AF27 [get_ports tu_sot_n]

# TU TXD0
set_property IOSTANDARD LVDS_25 [get_ports tu_txd0_p]
set_property IOSTANDARD LVDS_25 [get_ports tu_txd0_n]
set_property PACKAGE_PIN AJ26 [get_ports tu_txd0_p]
set_property PACKAGE_PIN AK26 [get_ports tu_txd0_n]

# TU TXD1
set_property IOSTANDARD LVDS_25 [get_ports tu_txd1_p]
set_property IOSTANDARD LVDS_25 [get_ports tu_txd1_n]
set_property PACKAGE_PIN AJ27 [get_ports tu_txd1_p]
set_property PACKAGE_PIN AK28 [get_ports tu_txd1_n]

# TU TXD2
set_property IOSTANDARD LVDS_25 [get_ports tu_txd2_p]
set_property IOSTANDARD LVDS_25 [get_ports tu_txd2_n]
set_property PACKAGE_PIN AG27 [get_ports tu_txd2_p]
set_property PACKAGE_PIN AG28 [get_ports tu_txd2_n]

# TU TXD3
set_property IOSTANDARD LVDS_25 [get_ports tu_txd3_p]
set_property IOSTANDARD LVDS_25 [get_ports tu_txd3_n]
set_property PACKAGE_PIN AC26 [get_ports tu_txd3_p]
set_property PACKAGE_PIN AD26 [get_ports tu_txd3_n]

# TU TXD4
set_property IOSTANDARD LVDS_25 [get_ports tu_txd4_p]
set_property IOSTANDARD LVDS_25 [get_ports tu_txd4_n]
set_property PACKAGE_PIN AG30 [get_ports tu_txd4_p]
set_property PACKAGE_PIN AH30 [get_ports tu_txd4_n]

# TU TXD5
set_property IOSTANDARD LVDS_25 [get_ports tu_txd5_p]
set_property IOSTANDARD LVDS_25 [get_ports tu_txd5_n]
set_property PACKAGE_PIN AE28 [get_ports tu_txd5_p]
set_property PACKAGE_PIN AF28 [get_ports tu_txd5_n]

# TU TXD6
set_property IOSTANDARD LVDS_25 [get_ports tu_txd6_p]
set_property IOSTANDARD LVDS_25 [get_ports tu_txd6_n]
set_property PACKAGE_PIN AE30 [get_ports tu_txd6_p]
set_property PACKAGE_PIN AF30 [get_ports tu_txd6_n]

# TU TXD7
set_property IOSTANDARD LVDS_25 [get_ports tu_txd7_p]
set_property IOSTANDARD LVDS_25 [get_ports tu_txd7_n]
set_property PACKAGE_PIN AD29 [get_ports tu_txd7_p]
set_property PACKAGE_PIN AE29 [get_ports tu_txd7_n]


# VBv1 : TX_LVDS_1_N AG22 (P and N have been reversed)
set_property IOSTANDARD LVDS_25 [get_ports tx_p]

set_property PACKAGE_PIN AC29 [get_ports tx_p]
set_property PACKAGE_PIN AC30 [get_ports tx_n]
# VBv1 : TX_LVDS_1_P AH22
set_property IOSTANDARD LVDS_25 [get_ports tx_n]


# VBv1 : RX_LVDS_1_N AG30 (P and N have been reversed)
set_property IOSTANDARD LVDS_25 [get_ports rx_p]

# VBv1 : RX_LVDS_1_P AH30
set_property IOSTANDARD LVDS_25 [get_ports rx_n]


set_property PACKAGE_PIN Y30 [get_ports clk320_p]
set_property IOSTANDARD LVDS_25 [get_ports clk320_p]
#set_property PACKAGE_PIN AG25 [get_ports clk40_p]
#set_property IOSTANDARD LVDS_25 [get_ports clk40_p]

#set_property PACKAGE_PIN AG27 [get_ports clk40_back_p]
#set_property IOSTANDARD LVDS_25 [get_ports clk40_back_p]
#set_property PACKAGE_PIN AB29 [get_ports clk320_back_p]
#set_property IOSTANDARD LVDS_25 [get_ports clk320_back_p]

set_property IOSTANDARD LVCMOS18 [get_ports sw_button]
set_property PACKAGE_PIN AB12 [get_ports sw_button]


set_property IOSTANDARD LVCMOS12 [get_ports mon_clk_en]
set_property PACKAGE_PIN AC25 [get_ports mon_clk_en]
set_property PACKAGE_PIN AB29 [get_ports rx_p]


# I2C
set_property IOSTANDARD LVCMOS12 [get_ports sda]
set_property IOSTANDARD LVCMOS12 [get_ports scl]
#V3
set_property PACKAGE_PIN AD23 [get_ports sda]
set_property PACKAGE_PIN AE24 [get_ports scl]

#V2
#set_property PACKAGE_PIN AF20 [get_ports sda]
#set_property PACKAGE_PIN AF21 [get_ports scl]



set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk40]
