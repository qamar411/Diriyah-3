
puts "-I- Start Sourcing [info script]"

# UPF for Simple Two-Domain Design (VDD=1.8V, VSS=0.0V)

# # Create Power Domains
# create_power_domain rv32i_soc -include_scope

# # Create Supply Ports
# create_supply_port VDD -direction in -domain rv32i_soc
# create_supply_port VSS -direction in -domain rv32i_soc

# # Create Supply Nets
# create_supply_net VDD -domain rv32i_soc
# create_supply_net VSS -domain rv32i_soc

# # Connect Supply Nets with corresponding Ports
# # connect_supply_net VDD -ports VDD -resolve parrallel
# # connect_supply_net VSS -ports VSS -resolve parrallel
# connect_supply_net VDD -ports VDD 
# connect_supply_net VSS -ports VSS 



# # Establish Power Connections
# set_domain_supply_net rv32i_soc -primary_power_net VDD -primary_ground_net VSS

# # Create Power State Table
# # add_port_state VDD -state {ON 1.8}
# add_port_state VDD -state {ON 1.8} -state {OFF off}
# add_port_state VSS -state {GND 0.0}

# create_pst PST_table -supplies {VDD VSS}

# # Define Power States
# add_pst_state NORMAL -pst PST_table -state {ON GND}
# add_pst_state OFF -pst PST_table -state {OFF GND}


# commit_upf

# create_net -power VDD
# create_net -ground VSS
# create_supply_net VDD -resolve parallel
# create_supply_net VSS -resolve parallel
# set_voltage 1.8 -object_list [get_supply_nets VDD]
# set_voltage 0.0 -object_list [get_supply_nets VSS]

# create_power_domain PD_TOP
# set_domain_supply_net PD_TOP -primary_power_net VDD -primary_ground_net VSS

# commit_upf


# set_app_options \
# -name plan.pgroute.treat_fat_blockage_as_fat_metal -value true


set_attribute -objects [get_cells rv32_soc_inst/inst_mem_inst] -name outer_keepout_margin_hard -value {10 10 10 10}
set_attribute -objects [get_cells rv32_soc_inst/inst_mem_inst] -name outer_keepout_margin_soft -value {10 10 10 10}
set_attribute -objects [get_cells rv32_soc_inst/inst_mem_inst] -name outer_keepout_margin_route_blockage -value {10 10 10 10}
set_attribute -objects [get_cells rv32_soc_inst/inst_mem_inst] -name outer_keepout_margin_hard_macro -value {10 10 10 10}

set_attribute -objects [get_cells rv32_soc_inst/data_mem_inst] -name outer_keepout_margin_hard -value {10 10 10 10}
set_attribute -objects [get_cells rv32_soc_inst/data_mem_inst] -name outer_keepout_margin_soft -value {10 10 10 10}
set_attribute -objects [get_cells rv32_soc_inst/data_mem_inst] -name outer_keepout_margin_route_blockage -value {10 10 10 10}
set_attribute -objects [get_cells rv32_soc_inst/data_mem_inst] -name outer_keepout_margin_hard_macro -value {10 10 10 10}

set_attribute -objects [get_cells rv32_soc_inst/rom_instance] -name outer_keepout_margin_hard -value {10 10 10 10}
set_attribute -objects [get_cells rv32_soc_inst/rom_instance] -name outer_keepout_margin_soft -value {10 10 10 10}
set_attribute -objects [get_cells rv32_soc_inst/rom_instance] -name outer_keepout_margin_route_blockage -value {10 10 10 10}
set_attribute -objects [get_cells rv32_soc_inst/rom_instance] -name outer_keepout_margin_hard_macro -value {10 10 10 10}



create_pg_ring_pattern ring_pattern -nets {VSS VDD} -horizontal_layer METAL5 -vertical_layer METAL6 -horizontal_width {20} -vertical_width {20} -horizontal_spacing {20} -vertical_spacing {20} -track_alignment track
set_pg_strategy core_ring -pattern {{name: ring_pattern} {nets: {VSS VDD}} {offset: {5 5}}} -core
compile_pg -strategies core_ring




set_app_options -name plan.pgroute.disable_via_creation -value false

#Rails


    create_pg_mesh_pattern mesh_pattern_v -layers {  {{vertical_layer: METAL6} {width: 20} {pitch: 100} {spacing: interleaving}} }
    set_pg_strategy mesh_strategy_v -core  -extension {stop: outermost_ring}  -pattern {{pattern: mesh_pattern_v}{nets: {VDD VSS}}} 
    compile_pg  -strategies mesh_strategy_v


    create_pg_mesh_pattern mesh_pattern_h -layers { {{horizontal_layer: METAL5} {width: 6} {pitch: 39.2} {spacing: interleaving}} }
    set_pg_strategy mesh_strategy_h -core -extension {stop: outermost_ring} -pattern {{pattern: mesh_pattern_h}{nets: {VDD VSS}}}
    compile_pg  -strategies mesh_strategy_h


set_pg_via_master_rule -contact_code {VIA12 VIA23 VIA34 VIA45 VIA56} -allow_multiple {40 0} -via_array_dimension {3 1} \
         -snap_reference_point {10 0} talha

set_app_options -name plan.pgroute.disable_via_creation -value true 

create_pg_std_cell_conn_pattern rail_pat -layers {METAL1}

set_pg_strategy rail_strat1 -core -pattern {{name: rail_pat} {nets:"VSS VDD"} } -extension {{stop: {outermost_ring}}} -blockage {{macros_with_keepout: all}}

compile_pg -strategies {rail_strat1} -via_rule {talha}





create_pg_vias -from_layers METAL1 -to_layers METAL6 -via_masters {talha} -nets {VDD VSS}




# VIAS 

create_pg_vias -within_bbox {{2659.2150 3187.4950} {3330.2750 3331.5550}} -nets {VDD VSS} -drc no_check -from_layers METAL6 -to_layers {METAL3}
connect_pg_net -automatic

create_tap_cells -distance 50 -lib_cell  TAP* -skip_fixed_cells -pattern every_other_row
# set_attribute -objects [get_cells tapfiller!TAPCELLBWP7T!15014] -name physical_status -value placed
# set_attribute -objects [get_cells tapfiller!TAPCELLBWP7T!15014] -name physical_status -value placed

connect_pg_net -automatic




puts "-I- End Sourcing [info script]"

