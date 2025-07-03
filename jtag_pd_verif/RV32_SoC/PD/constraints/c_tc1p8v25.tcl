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

set_temperature $TEMP_TC
set_voltage $V_VDD_TC

set_voltage $V_VDD_TC -object_list [get_supply_nets VDD] -corners tc1p8v25c
set_voltage $V_VSS -object_list [get_supply_nets VSS] -corners tc1p8v25c
set_voltage $V_IOVDD_TC -object_list [get_cells iovdd_*] -corners tc1p8v25c
set_voltage $V_VSS -object_list [get_cells iovss_*] -corners tc1p8v25c

set_timing_derate -late $TIMING_DERATE_TYPICAL_LATE



###### EXAMPLES AND COMMENTS ###############


# set_process_number 1


# set_voltage 1.800 -object_list [get_supply_ports VDD_*] -corners tc1p8v25c 
# set_voltage 3.3 -object_list [get_supply_ports VDDPST_*] -corners tc1p8v25c
# set_voltage 0.0 -object_list [get_supply_ports VSSPST_*] -corners tc1p8v25c
# set_voltage 0.0 -object_list [get_supply_ports VSS_*] -corners tc1p8v25c

# set_voltage $V_VSS -object_list [get_ports VSS_*] -corners tc1p8v25c
# set_voltage $V_VDD_TC -object_list [get_supply_nets VDD_*] -corners tc1p8v25c
# set_voltage $V_VSS -object_list [get_supply_nets VSS_*] -corners tc1p8v25c


# set_voltage $V_VDD_TC -object_list [get_ports VDD_*] -corners tc1p8v25c
# set_voltage $V_IOVDD_TC -object_list [get_ports VDDPST_*] -corners tc1p8v25c
# set_voltage $V_VSS -object_list [get_ports VSSPST_*] -corners tc1p8v25c