puts "Begin Sourcing [info script]"

# check_routability
# set_ignored_layers -min_routing_layer M2 -max_routing_layer M8

# route_opt

# report_congestion -rerun_global_router

# check_design -checks routes

# set_app_options -name signoff.check_drc.runset \
#             -value "/home/icdesign/Desktop/centos_shared/SAED-14/tech/icv_drc/saed14nm_1p9m_drc_rules.rs"
add_tie_cells -tie_high_lib_cells TIEH* -tie_low_lib_cells TIEL*
# set_app_option -name route.common.eco_route_fix_existing_drc -value true

# create_shields -shielding_mode new -with_ground [get_nets -design [current_block] {VSS}]

check_routability

route_auto -max_detail_route_iterations 50


add_redundant_vias -timing_preserve_nets CLK_PAD
route_eco -reuse_existing_global_route true -max_detail_route_iterations 200

route_opt

add_redundant_vias -timing_preserve_nets CLK_PAD
report_congestion -rerun_global_router
route_opt
check_design -checks routes

  # report_qor  > ${DESIGN_NAME}.route_opt.qor.rpt
  # report_constraints -all_violators  > ${DESIGN_NAME}.route_opt.all_vios.rpt
  # report_timing  > ${DESIGN_NAME}.route_opt.timing.rpt
  # report_power  > ${DESIGN_NAME}.route_opt.power.rpt


puts "End Sourcing [info script]"
