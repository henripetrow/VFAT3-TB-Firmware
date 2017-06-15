proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
set_msg_config  -ruleid {2}  -id {Project 1-200}  -new_severity {CRITICAL WARNING} 

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7k325tffg900-2
  set_property board_part xilinx.com:kc705:part0:1.3 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.cache/wt [current_project]
  set_property parent.project_path /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.xpr [current_project]
  set_property ip_output_repo /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.runs/synth_1/top.dcp
  read_edif /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipcore_dir/mac_fifo_axi4.ngc
  read_edif /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/imports/firmware/ipcore_dir/tri_mode_eth_mac_v5_4.ngc
  add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0.dcp
  set_property netlist_only true [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0.dcp]
  add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0.dcp
  set_property netlist_only true [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0.dcp]
  add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_rx/fifo_rx.dcp
  set_property netlist_only true [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_rx/fifo_rx.dcp]
  add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_0/ila_0.dcp
  set_property netlist_only true [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_0/ila_0.dcp]
  add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ser_8/ser_8.dcp
  set_property netlist_only true [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ser_8/ser_8.dcp]
  add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/dser_8/dser_8.dcp
  set_property netlist_only true [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/dser_8/dser_8.dcp]
  add_files -quiet /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_5/ila_5.dcp
  set_property netlist_only true [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_5/ila_5.dcp]
  read_xdc -mode out_of_context -ref clk_wiz_0 -cells inst /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0_ooc.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0_ooc.xdc]
  read_xdc -prop_thru_buffers -ref clk_wiz_0 -cells inst /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0_board.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0_board.xdc]
  read_xdc -ref clk_wiz_0 -cells inst /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0.xdc]
  read_xdc -mode out_of_context -ref fifo_generator_0 -cells U0 /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_ooc.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_ooc.xdc]
  read_xdc -ref fifo_generator_0 -cells U0 /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0.xdc]
  read_xdc -mode out_of_context -ref fifo_rx -cells U0 /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_rx/fifo_rx_ooc.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_rx/fifo_rx_ooc.xdc]
  read_xdc -ref fifo_rx -cells U0 /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_rx/fifo_rx/fifo_rx.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_rx/fifo_rx/fifo_rx.xdc]
  read_xdc -mode out_of_context -ref ila_0 -cells U0 /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_0/ila_0_ooc.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_0/ila_0_ooc.xdc]
  read_xdc -ref ila_0 -cells U0 /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila.xdc]
  read_xdc -mode out_of_context -ref ser_8 -cells inst /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ser_8/ser_8_ooc.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ser_8/ser_8_ooc.xdc]
  read_xdc -ref ser_8 -cells inst /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ser_8/ser_8.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ser_8/ser_8.xdc]
  read_xdc -mode out_of_context -ref dser_8 -cells inst /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/dser_8/dser_8_ooc.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/dser_8/dser_8_ooc.xdc]
  read_xdc -ref dser_8 -cells inst /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/dser_8/dser_8.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/dser_8/dser_8.xdc]
  read_xdc -mode out_of_context -ref ila_5 -cells U0 /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_5/ila_5_ooc.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_5/ila_5_ooc.xdc]
  read_xdc -ref ila_5 -cells U0 /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_5/ila_v6_2/constraints/ila.xdc
  set_property processing_order EARLY [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/ila_5/ila_v6_2/constraints/ila.xdc]
  read_xdc /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/constrs_1/new/kc705_VBv1.xdc
  read_xdc -ref fifo_generator_0 -cells U0 /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0_clocks.xdc
  set_property processing_order LATE [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0_clocks.xdc]
  read_xdc -ref fifo_rx -cells U0 /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_rx/fifo_rx/fifo_rx_clocks.xdc
  set_property processing_order LATE [get_files /home/a0312687/Vivado/VFAT3-Testbench_hybrid+I2C/Firmware/vfat3_testing_firmware/vfat3_testing_firmware.srcs/sources_1/ip/fifo_rx/fifo_rx/fifo_rx_clocks.xdc]
  link_design -top top -part xc7k325tffg900-2
  write_hwdef -file top.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force top_opt.dcp
  catch { report_drc -file top_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force top_placed.dcp
  catch { report_io -file top_io_placed.rpt }
  catch { report_utilization -file top_utilization_placed.rpt -pb top_utilization_placed.pb }
  catch { report_control_sets -verbose -file top_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force top_routed.dcp
  catch { report_drc -file top_drc_routed.rpt -pb top_drc_routed.pb -rpx top_drc_routed.rpx }
  catch { report_methodology -file top_methodology_drc_routed.rpt -rpx top_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file top_timing_summary_routed.rpt -rpx top_timing_summary_routed.rpx }
  catch { report_power -file top_power_routed.rpt -pb top_power_summary_routed.pb -rpx top_power_routed.rpx }
  catch { report_route_status -file top_route_status.rpt -pb top_route_status.pb }
  catch { report_clock_utilization -file top_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force top_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force top.mmi }
  write_bitstream -force -no_partial_bitfile top.bit 
  catch { write_sysdef -hwdef top.hwdef -bitfile top.bit -meminfo top.mmi -file top.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

