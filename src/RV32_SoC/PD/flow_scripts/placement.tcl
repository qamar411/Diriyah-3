puts "Begin Sourcing [info script]"

# create_placement -congestion_effort high -buffering_aware_timing_driven   

# get_app_option_value  -name place_opt.initial_drc.global_route_based


# set_app_options -name place.coarse.fix_hard_macros \
# -value true
# set_app_options -name plan.place.auto_create_blockages \
# -value auto
create_placement -timing_driven \
-buffering_aware_timing_driven -congestion -effort high \
-congestion_effort high

   set_app_options \
      -name place_opt.initial_drc.global_route_based -value 1
   set_app_options \
      -name place_opt.initial_place.two_pass -value true
   set_app_options \
      -name opt.buffering.enable_rebuffering -value "true"


   add_tie_cells -tie_high_lib_cells TIEH* -tie_low_lib_cells TIEL*

   refine_placement -congestion_effort high
   refine_placement -congestion_effort high
   refine_placement -congestion_effort high -effort high -perturbation_level high
   
   legalize_placement
   
   place_opt

 

   # report_utilization > ${DESIGN_NAME}.place_opt.utilization.rpt
   # report_placement  > ${DESIGN_NAME}.place_opt.placement.rpt
   ## Analyze in GUI
    # 1) Global Route Congestion Map 2) Cell Density Map 3) Pin Density Map
   # report_qor  > ${DESIGN_NAME}.place_opt.qor.rpt
   # report_constraints -all_violators  > ${DESIGN_NAME}.place_optall_vios.rpt
   # report_timing  > ${DESIGN_NAME}.place_opt.timing.rpt
   # report_power  > ${DESIGN_NAME}.place_opt.power.rpt


puts "End Sourcing [info script]"
