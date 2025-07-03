exec clear
close_lib -all
##------------------------------------------
## Define Global Variables Here
set DESIGN_NAME pads
set DESIGN_LIB_NAME ${DESIGN_NAME}_LIB
#it's better not to change units
set_user_units -type time -value 1ps
set_user_units -type capacitance -value 1fF
#  set_host_options -max_cores 32


set RUN_DFT 0 ; # used for running (1) or not running(0) Insert DFT
set RUN_PWRGRD 1 ; # used for disabling (0) power grid generation
set RUN_SYN 0   ; # used for disabling (0) full synthesis
set RUN_PLACE 0; # used for disabling (0) placing 
set RUN_CTS 0; # used for disabling (0) 
set RUN_ROUTE 0 ; # used to disable(0) routing

if {[file exists ${DESIGN_NAME}_LIB]} {
    puts "Dir ${DESIGN_NAME}_LIB exists ---- deleting"
    exec rm -rf  ${DESIGN_NAME}_LIB
}

##--------------------------------------------
## NDM Creation
##-------------------------------------------
 
source   ../../constraints/set_variables.tcl
source  ../../flow_scripts/lib_setup_180.tcl
set_host_options -max_cores 32

##------------------------------------------------
## Read Design
##------------------------------------------------

source  ../../flow_scripts/syn_read_design.tcl

##-----------------------------------------------
## Create power pads + UPF                        TODO -SOMETHING 
##----------------------------------------------
create_net -power VDD
create_net -ground VSS
create_supply_net VDD -resolve parallel
create_supply_net VSS -resolve parallel
set_voltage 1.8 -object_list [get_supply_nets VDD]
set_voltage 0.0 -object_list [get_supply_nets VSS]

create_power_domain PD_TOP
set_domain_supply_net PD_TOP -primary_power_net VDD -primary_ground_net VSS

commit_upf

source ../../flow_scripts/create_power_pads.tcl

##-----------------------------------------------
## Read Timing Constraints for multi corner design 
##-----------------------------------------------
source ../../constraints/mcmm.tcl

 
##-----------------------------------------------
## setting app options 
##-----------------------------------------------

source  ../../flow_scripts/app_options.tcl 

##------------------------------------------------
## Setting Interconnect options
##-------------------------------------------------

  source ../../flow_scripts/read_tlup.tcl

##---------------------------------------------------
## Floorplan Initializations
##--------------------------------------------------
 
  save_block -as ${DESIGN_NAME}_before_init_floorplan
  source ../../flow_scripts/init_floorplan.tcl
  save_block -as ${DESIGN_NAME}_after_init_floorplan

# ##---------------------------------------------------
# ## POWER GROUND logical/physical connections
# ##--------------------------------------------------
if {$RUN_PWRGRD==1} {
  source ../../flow_scripts/pg_planning.tcl
  source ../../flow_scripts/power_grid_procs.tcl
}

save_block -as ${DESIGN_NAME}_before_first_compile

if {$RUN_SYN==1} {
set cts_cells [get_lib_cells */*CK*]
set_lib_cell_purpose -include none [get_lib_cells $cts_cells]
set_lib_cell_purpose -include cts [get_lib_cells $cts_cells]


compile_fusion
save_block
save_block -as ${DESIGN_NAME}_after_compile_fusion_forgot_pg
add_tie_cells -tie_high_lib_cells TIEH* -tie_low_lib_cells TIEL*
}

if {$RUN_PLACE==1} {
# ##----------------------------------------
# ## Placement
# ##------------------------------------------
  source ../../flow_scripts/placement.tcl

add_tie_cells -tie_high_lib_cells TIEH* -tie_low_lib_cells TIEL*

  save_block
  save_block -as ${DESIGN_NAME}_placeopt
  save_lib
}


if {$RUN_CTS==1} {
# ##----------------------------------------
# ## CTS
# ##------------------------------------------
  source ../../flow_scripts/cts_opt.tcl

  save_block
  save_block -as ${DESIGN_NAME}_ctsopt
  save_lib
}


if {$RUN_ROUTE==1} {
##----------------------------------------
## Routing
##------------------------------------------
  source ../../flow_scripts/route_opt.tcl
add_tie_cells -tie_high_lib_cells TIEH* -tie_low_lib_cells TIEL*

  create_stdcell_fillers -lib_cell FILL8BWP7T

  save_block
  save_block -as ${DESIGN_NAME}_routeopt
  save_lib
}



