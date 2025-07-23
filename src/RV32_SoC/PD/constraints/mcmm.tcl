# ============================================================
# Author  :    Talha bin azmat - the honored one
# 
# Role    :    Hardware Design Engineer
# 
# Email   :    talhabinazmat@gmail.com
# 
# Contact :    +923325306662
# ============================================================

remove_scenarios -all
remove_modes -all
remove_corners -all

# set mode_constraints(func_50M) "m_func_50M.tcl"
set mode_constraints(func_100M) "../../constraints/m_func_100M.tcl"

set corner_constraints(wc1p6v125c) "../../constraints/c_wc1p6v125c.tcl"
set corner_constraints(tc1p8v25c) "../../constraints/c_tc1p8v25.tcl"
set corner_constraints(bc2p0v0c) "../../constraints/c_bc2p0v0c.tcl"

set scenario_constraints(func_100M.wc1p6v125c) "../../constraints/s_func_100M.wc1p6v125c.tcl"
set scenario_constraints(func_100M.tc1p8v25c) "../../constraints/s_func_100M.tc1p8v25c.tcl"
set scenario_constraints(func_100M.bc2p0v0c) "../../constraints/s_func_100M.bc2p0v0c.tcl"

# set scenario_constraints(func_50M.wc1p6v125c) "s_func_50M.wc1p6v125c.tcl"
# set scenario_constraints(func_50M.tc1p8v25c) "s_func_50M.tc1p8v25c.tcl"
# set scenario_constraints(func_50M.bc2p0v0c) "s_func_50M.bc2p0v0c.tcl"

foreach mode [array names mode_constraints] { 
    create_mode ${mode}
}

foreach corner [array names corner_constraints] {
    create_corner ${corner}
}

# foreach scenario [array names scenario_constraints] {
#     lassign [split ${scenario} "."] mode corner
#     create_scenario -name ${scenario} -mode ${mode} -corner ${corner}
# }


# func_100M scenarios
create_scenario -name func_100M.wc1p6v125c -mode func_100M -corner wc1p6v125c
create_scenario -name func_100M.tc1p8v25c -mode func_100M -corner tc1p8v25c
create_scenario -name func_100M.bc2p0v0c -mode func_100M -corner bc2p0v0c

# func_50M scenarios
# create_scenario -name func_50M.wc1p6v125c -mode func_50M -corner wc1p6v125c
# create_scenario -name func_50M.tc1p8v25c -mode func_50M -corner tc1p8v25c
# create_scenario -name func_50M.bc2p0v0c -mode func_50M -corner bc2p0v0c

foreach mode [array names mode_constraints] { 
    current_mode ${mode}
    source -echo $mode_constraints(${mode})
}

foreach corner [array names corner_constraints] {
    current_corner ${corner}
    source -echo $corner_constraints(${corner})
}

# foreach scenario [array names scenario_constraints] {
#     current_scenario ${scenario}
#     source -echo $scenario_constraints(${scenario})
# }

# func_100M.wc1p6v125c
current_scenario func_100M.wc1p6v125c
source -echo $scenario_constraints(func_100M.wc1p6v125c)

# func_100M.tc1p8v25c
current_scenario func_100M.tc1p8v25c
source -echo $scenario_constraints(func_100M.tc1p8v25c)

# func_100M.bc2p0v0c
current_scenario func_100M.bc2p0v0c
source -echo $scenario_constraints(func_100M.bc2p0v0c)

# # func_50M.wc1p6v125c
# current_scenario func_50M.wc1p6v125c
# source -echo $scenario_constraints(func_50M.wc1p6v125c)

# # func_50M.tc1p8v25c
# current_scenario func_50M.tc1p8v25c
# source -echo $scenario_constraints(func_50M.tc1p8v25c)

# # func_50M.bc2p0v0c
# current_scenario func_50M.bc2p0v0c
# source -echo $scenario_constraints(func_50M.bc2p0v0c)

set_scenario_status {func_100M.wc1p6v125c func_50M.tc1p8v25c} \
    -setup true -hold false \
    -leakage_power true -dynamic_power false \
    -max_transition true -max_capacitance true -min_capacitance false

set_scenario_status {func_100M.bc2p0v0c func_50M.tc1p8v25c} \
    -setup false -hold true \
    -leakage_power true -dynamic_power false \
    -max_transition false -max_capacitance false -min_capacitance true

set_scenario_status {func_100M.tc1p8v25c} \
    -setup true -hold true \
    -leakage_power true -dynamic_power true \
    -max_transition true -max_capacitance true -min_capacitance true    


# set_scenario_status {func_50M.wc1p6v125c func_50M.tc1p8v25c} \
#     -setup true -hold false \
#     -leakage_power true -dynamic_power false \
#     -max_transition true -max_capacitance true -min_capacitance false

# set_scenario_status {func_50M.bc2p0v0c func_50M.tc1p8v25c} \
#     -setup false -hold true \
#     -leakage_power true -dynamic_power false \
#     -max_transition false -max_capacitance false -min_capacitance true

# set_scenario_status {func_50M.tc1p8v25c} \
#     -setup true -hold true \
#     -leakage_power true -dynamic_power true \
#     -max_transition false -max_capacitance false -min_capacitance true    