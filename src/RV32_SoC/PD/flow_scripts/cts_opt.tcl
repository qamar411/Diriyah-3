puts "Begin Sourcing [info script]"


# remove_clock_uncertainty  [get_clocks $FAST_CLOCK_NAME]
# clock_latency -source [get_clocks $FAST_CLOCK_NAME]

check_legality -verbose
#place it before compile_fusion
# set cts_cells [get_lib_cells */*CKND*]
# set_lib_cell_purpose -include cts [get_lib_cells $cts_cells]

set buff_cells [get_lib_cells */*BUFFD*]
set_lib_cell_purpose -exclude cts [get_lib_cells $buff_cells]

set inv_cells [get_lib_cells */*INVD*]
set_lib_cell_purpose -exclude cts [get_lib_cells $inv_cells]

set_clock_tree_options -target_skew 1000
#re-vist this option
# set_clock_tree_options -target_latency 10000

set CKND_buff [get_lib_cells */*CKND*]
set_lib_cell_purpose -exclude cts [get_lib_cells $cts_cells]


# set_input_transition 100 [get_ports clk]
# set_max_transition 1000 [all_clocks]
# set_app_options -list {cts.compile.enable_local_skew true}
# set_app_options -list {cts.optimize.enable_local_skew true}
# get_app_option_value -name cts.compile.power_opt_mode



#moved these to myflow
# create_routing_rule clock_ndr -multiplier_spacing 3 -multiplier_width 3 -shield
# set_clock_routing_rules -rules clock_ndr -min_routing_layer METAL2 -max_routing_layer METAL4



# create_shields -shielding_mode new -with_ground [get_nets [all_clocks]] {VSS}

# set_clock_routing_rules -min_routing_layer METAL3 -max_routing_layer METAL6  -default_rule


   # add_tie_cells -tie_high_lib_cells TIEH* -tie_low_lib_cells TIEL*

# set_routing_rule \
# [get_nets -of [all_fanout -from clk -flat]] \
# -min_routing_layer METAL2 -max_routing_layer METAL6

clock_opt -from build_clock -to route_clock
#synthesize_clock_tree -clocks CLKA
set_propagated_clock [get_clocks *]
update_timing -full

  save_block
  save_block -as ${DESIGN_NAME}_cts_to_route_clk
  save_lib

clock_opt -from final_opto -to final_opto
set_dont_touch_network -clock_only [get_clocks CLK*]

report_clock_qor -all > ${DESIGN_NAME}.cts.qor_all.rpt
report_clock_qor -type local_skew -nosplit  > ${DESIGN_NAME}.cts.local_skew.rpt
report_clock_qor -type latency -nosplit  > ${DESIGN_NAME}.cts.latency.rpt
report_clock_qor -type level -nosplit  > ${DESIGN_NAME}.cts.level.rpt
report_clock_qor -type drc_violators -nosplit  > ${DESIGN_NAME}.cts.drc.rpt



puts "End Sourcing [info script]"
