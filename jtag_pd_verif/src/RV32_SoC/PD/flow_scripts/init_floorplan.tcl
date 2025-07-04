# Floorplan Initialization
puts "Begin Sourcing [info script]"

#3162 total area
#2762 core area 

initialize_floorplan -boundary  {{0 0} {0 2762} {2762 2762} {2762 0}} -core_offset 200


set_attribute [get_cells rv32_soc/data_mem_inst/tsmc_ram] origin {983.9950 798.5800}
set_attribute [get_cells rv32_soc/inst_mem_inst/tsmc_ram] origin {1730.7450 1395.5550}
# set_attribute [get_cells rv32_soc/inst_mem_inst/tsmc_ram] origin {1688.6450 1427.8800}
set_attribute [get_cells rv32_soc/rom_instance] origin {2066.3100 2599.2500}
# set_attribute [get_cells rv32_soc/rom_instance] origin {2093.4050 2616.3650}
set_attribute [get_cells rv32_soc/data_mem_inst/tsmc_ram] orientation {MYR90}
set_attribute [get_cells rv32_soc/inst_mem_inst/tsmc_ram] orientation {R90}
set_attribute [get_cells rv32_soc/rom_instance]  orientation {R0}


# set_attribute 

set_fixed_objects [get_cells rv32_soc/data_mem_inst/tsmc_ram]
set_fixed_objects [get_cells rv32_soc/inst_mem_inst/tsmc_ram]
set_fixed_objects [get_cells rv32_soc/rom_instance]

set_app_options -name  compile.auto_floorplan.place_pins -value all


set_individual_pin_constraints -ports [all_inputs] -side 4 -offset {40% 60%} -allowed_layers {METAL3 METAL4 METAL5}
set_individual_pin_constraints -ports [all_outputs] -side 4 -offset {40% 60%} -allowed_layers {METAL3 METAL4 METAL5}
set_individual_pin_constraints -ports [get_ports CLK_PAD] -allowed_layers {METAL5}

create_io_ring -corner_height 130
create_io_corner_cell -reference_cell PCORNER {_default_io_ring1.bottom _default_io_ring1.right}
create_io_corner_cell -reference_cell PCORNER {_default_io_ring1.right _default_io_ring1.top}
create_io_corner_cell -reference_cell PCORNER {_default_io_ring1.top _default_io_ring1.left}


set_signal_io_constraints -file "../../flow_scripts/IO.ios"
place_io

set_attribute -objects [get_cells iovdd_*] -name physical_status -value fixed
set_attribute -objects [get_cells iovss_*] -name physical_status -value fixed




#both boundry cells work  fine 
# Boundary cells

set_boundary_cell_rules -left_boundary_cell {*/*DCAP16*} -right_boundary_cell {*/*DCAP16*} -bottom_boundary_cell {*/*DCAP16*} -top_boundary_cell {*/*DCAP16*}
compile_advanced_boundary_cells -target_objects [get_core_area]





# Keepout margins for the macro cells
set_attribute -objects [get_cells rv32_soc/inst_mem_inst/tsmc_ram] -name outer_keepout_margin_hard -value {162 10 10 116}
set_attribute -objects [get_cells rv32_soc/inst_mem_inst/tsmc_ram] -name outer_keepout_margin_soft -value {162 10 10 116}
set_attribute -objects [get_cells rv32_soc/inst_mem_inst/tsmc_ram] -name outer_keepout_margin_route_blockage -value {10 10 10 10}
set_attribute -objects [get_cells rv32_soc/inst_mem_inst/tsmc_ram] -name outer_keepout_margin_hard_macro -value {10 10 10 10}

set_attribute -objects [get_cells rv32_soc/data_mem_inst/tsmc_ram] -name outer_keepout_margin_hard -value {10 10 137 81}
set_attribute -objects [get_cells rv32_soc/data_mem_inst/tsmc_ram] -name outer_keepout_margin_soft -value {10 10 137 81}
set_attribute -objects [get_cells rv32_soc/data_mem_inst/tsmc_ram] -name outer_keepout_margin_route_blockage -value {10 10 10 10}
set_attribute -objects [get_cells rv32_soc/data_mem_inst/tsmc_ram] -name outer_keepout_margin_hard_macro -value {10 10 10 10}

set_attribute -objects [get_cells rv32_soc/rom_instance] -name outer_keepout_margin_hard -value {10 0 10 10}
set_attribute -objects [get_cells rv32_soc/rom_instance] -name outer_keepout_margin_soft -value {10 0 10 10}
set_attribute -objects [get_cells rv32_soc/rom_instance] -name outer_keepout_margin_route_blockage -value {10 10 10 10}
set_attribute -objects [get_cells rv32_soc/rom_instance] -name outer_keepout_margin_hard_macro -value {10 10 10 10}





 # Boundary cells

# set_boundary_cell_rules -left_boundary_cell DCAP16* 
# set_boundary_cell_rules -top_boundary_cell DCAP16* 
# set_boundary_cell_rules -bottom_boundary_cell DCAP16* 
# set_boundary_cell_rules -right_boundary_cell DCAP16* 
# set_boundary_cell_rules -top_left_outside_corner_cell DCAP16* 
# set_boundary_cell_rules -top_right_outside_corner_cell DCAP16* 
# set_boundary_cell_rules -bottom_left_outside_corner_cell DCAP16* 
# set_boundary_cell_rules -bottom_right_outside_corner_cell DCAP16* 




  # -------------------------------
# Insert IO Filler Cells
# -------------------------------
create_io_filler_cells -reference_cells "PFILLER0005 PFILLER05 PFILLER1 PFILLER10 PFILLER20" -overlap_cells "PFILLER0005 PFILLER05"



# -- Insert Tap Cells
# create_tap_cells -lib_cell TAPCELLBWP7T -distance 55


# # -- Insert Tie Cells

# set_app_options -name opt.tie_cell.max_fanout -value 4
# add_tie_cells -tie_hi TIEHBWP7T -tie_lo TIELBWP7T


puts "End Sourcing [info script]"