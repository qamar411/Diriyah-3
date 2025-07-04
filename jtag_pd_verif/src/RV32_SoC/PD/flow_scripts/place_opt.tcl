puts "Begin Sourcing [info script]"

   # move_objects [get_cell count_reg_1_] -to {150 100}
   # move_objects [get_cell count_reg_0_] -to {180 180}
   # move_objects [get_cell count_reg_1_] -to {180 130}
   # move_objects [get_cell count_reg_2_] -to {180 80}
   # move_objects [get_cell count_reg_3_] -to {180 30}
   # move_objects [get_cell clock_gate_count_reg] -to {80 110}

   # change_selection [get_cells -hier *count*reg*]
   # snap_objects [get_selection]
   # check_legality > ${DESIGN_NAME}.before_placement.check_legality.rpt
   # set_fixed_objects  [get_cells -hierarchical  *count*reg*]

   # get_app_option_value  -name place_opt.initial_drc.global_route_based
   # set_app_options \
   #    -name place_opt.initial_drc.global_route_based -value 1
   # set_app_options \
   #    -name place_opt.initial_place.two_pass -value true
   # set_app_options \
   #    -name opt.buffering.enable_rebuffering -value "true"

   place_opt
   report_utilization > ${DESIGN_NAME}.place_opt.utilization.rpt
   report_placement  > ${DESIGN_NAME}.place_opt.placement.rpt
   ## Analyze in GUI
    # 1) Global Route Congestion Map 2) Cell Density Map 3) Pin Density Map
   report_qor  > ${DESIGN_NAME}.place_opt.qor.rpt
   report_constraints -all_violators  > ${DESIGN_NAME}.place_optall_vios.rpt
   report_timing  > ${DESIGN_NAME}.place_opt.timing.rpt
   report_power  > ${DESIGN_NAME}.place_opt.power.rpt


puts "End Sourcing [info script]"
