# ============================================================
# Author  :    Talha bin azmat - the honored one
# 
# Role    :    Hardware Design Engineer
# 
# Email   :    talhabinazmat@gmail.com
# 
# Contact :    +923325306662
# ============================================================

read_parasitic_tech -tlup $TLUPLUS_MAX_FILE -name earlycap
read_parasitic_tech -tlup $TLUPLUS_MIN_FILE -name latecap

set_parasitics_parameters -early_spec earlycap -late_spec latecap
set_temperature $TEMP_BC
set_voltage $V_VDD_BC

set_voltage $V_VDD_BC -object_list [get_supply_nets VDD] -corners bc2p0v0c
set_voltage $V_VSS -object_list [get_supply_nets VSS] -corners bc2p0v0c
set_voltage $V_IOVDD_BC -object_list [get_cells iovdd_*] -corners bc2p0v0c 
set_voltage $V_VSS -object_list [get_cells iovss_*] -corners bc2p0v0c 

set_timing_derate -early $TIMING_DERATE_BEST_EARLY



###### EXAMPLES AND COMMENTS ###############


# set_process_number 1
# set_voltage 1.980 -object_list [get_supply_ports VDD_*] -corners bc2p0v0c
# set_voltage 3.6 -object_list [get_supply_ports VDDPST_*] -corners bc2p0v0c 
# set_voltage 0.0 -object_list [get_supply_ports VSSPST_*] -corners bc2p0v0c 
# set_voltage 0.0 -object_list [get_supply_ports VSS_*] -corners bc2p0v0c 

# create_supply_port -name VDD_LEFT -corner bc2p0v0c -voltage 1.980 -type power -object_list [get_ports vdd_*/VDD]


# set_voltage $V_VSS -object_list [get_ports VSS_*] -corners bc2p0v0c
# set_voltage $V_VSS -object_list [get_supply_nets VSS_*] -corners bc2p0v0c
# set_voltage $V_VDD_BC -object_list [get_supply_nets VDD_*] -corners bc2p0v0c


# set_voltage $V_VDD_BC -object_list [get_ports VDD_*] -corners bc2p0v0c
# set_voltage $V_IOVDD_BC -object_list [get_ports VDDPST_*] -corners bc2p0v0c 
# set_voltage $V_VSS -object_list [get_ports VSSPST_*] -corners bc2p0v0c 