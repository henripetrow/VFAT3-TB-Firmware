# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
set_msg_config  -ruleid {2}  -id {Project 1-200}  -new_severity {CRITICAL WARNING} 
create_project -in_memory -part xc7k325tffg900-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.cache/wt [current_project]
set_property parent.project_path /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib work [current_project]
set_property target_language VHDL [current_project]
set_property board_part xilinx.com:kc705:part0:1.3 [current_project]
set_property ip_output_repo /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0.dcp
set_property used_in_implementation false [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0.dcp]
add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0.dcp
set_property used_in_implementation false [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0.dcp]
add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_rx/fifo_rx.dcp
set_property used_in_implementation false [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_rx/fifo_rx.dcp]
add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_0/ila_0.dcp
set_property used_in_implementation false [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_0/ila_0.dcp]
add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ser_8/ser_8.dcp
set_property used_in_implementation false [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ser_8/ser_8.dcp]
add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/dser_8/dser_8.dcp
set_property used_in_implementation false [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/dser_8/dser_8.dcp]
add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_5/ila_5.dcp
set_property used_in_implementation false [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_5/ila_5.dcp]
read_vhdl -library work {
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/ipbus_trans_decl.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/ipbus_package.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_tx_mux.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_txtransactor_if_simple.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_status_buffer.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_rxtransactor_if_simple.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_rxram_shim.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_rxram_mux.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_rarp_block.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_packet_parser.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_ipaddr_block.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_dualportram_tx.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_dualportram_rx.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_dualportram.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_do_rx_reset.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_clock_crossing_if.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_byte_sum.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_build_status.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_build_resend.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_build_ping.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_build_payload.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_build_arp.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_buffer_selector.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/transactor_sm.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/transactor_if.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/transactor_cfg.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/example_designs/hdl/ipbus_addr_decode.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/example_designs/hdl/clock_div.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/udp_if_flat.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/trans_arb.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/transactor.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/stretcher.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/ipbus_fabric.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipbus_core/hdl/ipbus_ctrl.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/example_designs/hdl/slaves.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/example_designs/hdl/clocks_7s_extphy.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ethernet/hdl/eth_7s_gmii.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/example_designs/hdl/demo_kc705_extphy/top_kc705_extphy.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/new/slave_vfat3.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/new/control.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipcore_dir/emac_hostbus_decl.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/new/i2c.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/new/control_i2c.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/new/fifo_tx.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/new/rx_fifo_int.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/new/dser_sync.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/new/cst_pkg.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/new/slave_adc.vhd
  /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/new/control_adc.vhd
}
read_edif /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipcore_dir/mac_fifo_axi4.ngc
read_edif /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipcore_dir/tri_mode_eth_mac_v5_4.ngc
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/constrs_1/new/kc705_VBv1.xdc
set_property used_in_implementation false [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/constrs_1/new/kc705_VBv1.xdc]


synth_design -top top -part xc7k325tffg900-2


write_checkpoint -force -noxdef top.dcp

catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }