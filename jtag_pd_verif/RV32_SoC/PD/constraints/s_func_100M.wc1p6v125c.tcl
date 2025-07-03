# ============================================================
# Author  :    Talha bin azmat - the honored one
# 
# Role    :    Hardware Design Engineer
# 
# Email   :    talhabinazmat@gmail.com
# 
# Contact :    +923325306662
# ============================================================

# Fast clock
set_clock_uncertainty $CLOCK_UNCERTAINTY_FAST_CLOCK_WORST   [get_clocks $FAST_CLOCK_NAME]
set_clock_latency -late $CLOCK_LATENCY_FAST_CLOCK_WORST_MAX -source [get_clocks $FAST_CLOCK_NAME] 
set_clock_latency -early $CLOCK_LATENCY_FAST_CLOCK_WORST_MIN -source [get_clocks $FAST_CLOCK_NAME]
set_clock_transition  $MAX_TRANSITION_FAST_CLOCK_WORST      [get_clocks $FAST_CLOCK_NAME]

set_input_delay  -max -clock [get_clocks $FAST_VIRTUAL_CLOCK_NAME] $INPUT_DELAY_FAST_CLOCK_WORST_MAX \
                   [all_inputs] 
set_input_delay  -min -clock [get_clocks $FAST_VIRTUAL_CLOCK_NAME] $INPUT_DELAY_FAST_CLOCK_WORST_MIN \
                   [all_inputs] 

set_output_delay -max -clock [get_clocks $FAST_VIRTUAL_CLOCK_NAME] $OUTPUT_DELAY_FAST_CLOCK_WORST_MAX \
                   [all_outputs] 
set_output_delay -min -clock [get_clocks $FAST_VIRTUAL_CLOCK_NAME] $OUTPUT_DELAY_FAST_CLOCK_WORST_MIN \
                   [all_outputs] 

set_max_transition   $MAX_TRANSITION_DATA_FAST_CLOCK_WORST  -data_path [get_clocks $FAST_CLOCK_NAME]
set_max_capacitance  $MAX_CAPACITANCE_FAST_CLOCK_WORST      -clock     [get_clocks $FAST_CLOCK_NAME]




# Fast Test clock
# set_clock_uncertainty $CLOCK_UNCERTAINTY_FAST_TEST_CLOCK_WORST   [get_clocks $FAST_TEST_CLOCK_NAME]
# set_clock_latency     -late $CLOCK_LATENCY_FAST_TEST_CLOCK_WORST_MAX -source [get_clocks $FAST_TEST_CLOCK_NAME]
# set_clock_latency     -early $CLOCK_LATENCY_FAST_TEST_CLOCK_WORST_MIN -source [get_clocks $FAST_TEST_CLOCK_NAME]
# set_clock_transition  $MAX_TRANSITION_FAST_TEST_CLOCK_WORST      [get_clocks $FAST_TEST_CLOCK_NAME]

# set_input_delay  -max -clock [get_clocks $FAST_TEST_VIRTUAL_CLOCK_NAME] $INPUT_DELAY_FAST_TEST_CLOCK_WORST_MAX \
#                    [get_ports {*TMS* *TDI*}]
# set_input_delay  -min -clock [get_clocks $FAST_TEST_VIRTUAL_CLOCK_NAME] $INPUT_DELAY_FAST_TEST_CLOCK_WORST_MIN \
#                    [get_ports {*TMS* *TDI*}]

# set_output_delay -max -clock [get_clocks $FAST_TEST_VIRTUAL_CLOCK_NAME] $OUTPUT_DELAY_FAST_TEST_CLOCK_WORST_MAX \
#                    [get_ports {*TDO*}]
# set_output_delay -min -clock [get_clocks $FAST_TEST_VIRTUAL_CLOCK_NAME] $OUTPUT_DELAY_FAST_TEST_CLOCK_WORST_MIN \
#                    [get_ports {*TDO*}]

# set_max_transition  $MAX_TRANSITION_DATA_FAST_TEST_CLOCK_WORST  -data_path [get_clocks $FAST_TEST_CLOCK_NAME]
# set_max_capacitance $MAX_CAPACITANCE_FAST_TEST_CLOCK_WORST      -clock     [get_clocks $FAST_TEST_CLOCK_NAME]


set_load $LOAD_WORST [all_outputs]


