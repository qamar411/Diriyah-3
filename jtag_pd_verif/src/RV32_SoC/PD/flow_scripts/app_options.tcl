
puts "Begin Sourcing [info script]"


set_clock_gating_objects -exclude [get_cells]
set_clock_gating_objects -exclude *


set_app_options -name compile.clockgate.max_number_of_levels             -value 0
 

set_app_options -name compile.clockgate.use_clock_latency                -value false  
set_disable_clock_gating_check *
 
set_app_options -name compile.clockgate.fanin_sequential      -value false

set_app_options -name compile.clockgate.enable_activity_driven_level_expansion -value false
set_app_options -name compile.clockgate.enable_level_expansion -value false

set_app_options -name compile.clockgate.physically_aware_estimate_timing -value false
set_app_options -name compile.clockgate.self_gating -value false

set_app_option -name opt.common.estimate_clock_gate_latency -value false

set_app_options -name time.disable_clock_gating_checks -value true

set_app_options -name compile.flow.autoungroup -value false
set_app_options -name compile.flow.boundary_optimization -value false
set_app_options -name compile.flow.constant_and_unloaded_propagation_with_no_boundary_opt -value false
set_app_options -name compile.seqmap.remove_unloaded_registers -value false
set_app_options -name compile.seqmap.remove_constant_registers -value false
set_app_options -name compile.seqmap.print_cross_probing_info_for_removed_registers -value false
set_app_options -name compile.seqmap.enable_register_merging -value false 
set_app_options -name compile.seqmap.identify_shift_registers -value false
set_app_options -name compile.seqmap.exact_map -value true
set_register_merging [all_registers] false

set_app_options -name place.coarse.continue_on_missing_scandef -value true




set_register_merging [all_registers] false

set_app_options -list {compile.seqmap.scan {false}}

set_routing_rule -min_routing_layer METAL2 -max_routing_layer METAL4 [get_nets]
Set_ignored_layers -min_routing_layer METAL2 -max_routing_layer METAL4


create_routing_rule clock_ndr -multiplier_spacing 3 -multiplier_width 3 -shield
set_clock_routing_rules -rules clock_ndr -min_routing_layer METAL2 -max_routing_layer METAL4


set_app_options -list {cts.compile.enable_local_skew true}
set_app_options -list {cts.optimize.enable_local_skew true}
set_app_options -name clock_opt.flow.enable_ccd -value true
set_app_options -list {clock_opt.place.congestion_effort {high}}
set_app_options -name cts.compile.enable_global_route -value true
set_app_option -name cts.compile.path_based_criticality -value true
set_app_option -name cts.compile.enable_cell_relocation -value all


set_app_options -name place.coarse.fix_hard_macros \
-value true
set_app_options -name plan.place.auto_create_blockages \
-value auto


   set_app_options \
      -name place_opt.initial_drc.global_route_based -value 1
   set_app_options \
      -name place_opt.initial_place.two_pass -value true
   set_app_options \
      -name opt.buffering.enable_rebuffering -value "true"

set_app_option -name route.common.eco_route_fix_existing_drc -value true


set_app_option -name opt.common.advanced_logic_restructuring_mode -value timing



puts "End Sourcing [info script]"
