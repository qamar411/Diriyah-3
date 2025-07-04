# =========================
# Antenna Constraint Rules
# =========================

# Define global antenna rules (Mode 1: metal area vs. poly gate)
define_antenna_rule -mode 1 -diode_mode 1 -metal_ratio 400 -cut_ratio 20



# Per-layer rules based on TSMC A.R.2–A.R.6

#Maybe 2200 is better than 400 bc OD is used 

define_antenna_layer_rule -mode 1 -layer METAL1 -ratio 400   -diode_ratio {400 400 400 400}  
define_antenna_layer_rule -mode 1 -layer METAL2 -ratio 400   -diode_ratio {400 400 400 400}
define_antenna_layer_rule -mode 1 -layer METAL3 -ratio 400   -diode_ratio {400 400 400 400}
define_antenna_layer_rule -mode 1 -layer METAL4 -ratio 400   -diode_ratio {400 400 400 400}
define_antenna_layer_rule -mode 1 -layer METAL5 -ratio 400   -diode_ratio {400 400 400 400}
define_antenna_layer_rule -mode 1 -layer METAL6 -ratio 30000 -diode_ratio {8000 8000 8000 8000};# if OD > 0.203 µm² (A.R.3) we can have a relaxed M6 ratio but to be safe i assigned this value 
define_antenna_layer_rule -mode 1 -layer CONT   -ratio 10    -diode_ratio {10 10 10 10}
define_antenna_layer_rule -mode 1 -layer VIA12  -ratio 20    -diode_ratio {84 84 84 84}

#to check after route
check_routes -antenna true

#to fix antenna violation 
create_diodes 
 report_port_protection_diodes 