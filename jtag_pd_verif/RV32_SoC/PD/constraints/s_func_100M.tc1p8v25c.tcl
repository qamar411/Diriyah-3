# ============================================================
# Author  :    Talha bin azmat - the honored one
# 
# Role    :    Hardware Design Engineer
# 
# Email   :    talhabinazmat@gmail.com
# 
# Contact :    +923325306662
# ============================================================


###### MAIN CLOCK CONSTRAINTS 

set_clock_uncertainty $CLOCK_UNCERTAINTY_FAST_CLOCK_TYPICAL [get_clocks $FAST_CLOCK_NAME]

set_clock_latency -early $CLOCK_LATENCY_FAST_CLOCK_TYPICAL_MIN -source [get_clocks $FAST_CLOCK_NAME]
set_clock_latency -late $CLOCK_LATENCY_FAST_CLOCK_TYPICAL_MAX -source [get_clocks $FAST_CLOCK_NAME]

set_clock_transition $MAX_TRANSITION_FAST_CLOCK_TYPICAL [get_clocks $FAST_CLOCK_NAME]

set_input_delay -max -clock [get_clocks $FAST_VIRTUAL_CLOCK_NAME] $INPUT_DELAY_FAST_CLOCK_TYPICAL_MAX  [all_inputs]  

set_input_delay -min -clock [get_clocks $FAST_VIRTUAL_CLOCK_NAME] $INPUT_DELAY_FAST_CLOCK_TYPICAL_MIN  [all_inputs] 


set_output_delay -max -clock [get_clocks $FAST_VIRTUAL_CLOCK_NAME] $OUTPUT_DELAY_FAST_CLOCK_TYPICAL_MAX  [all_outputs] 

set_output_delay -min -clock [get_clocks $FAST_VIRTUAL_CLOCK_NAME] $OUTPUT_DELAY_FAST_CLOCK_TYPICAL_MIN  [all_outputs] 

set_max_transition $MAX_TRANSITION_DATA_FAST_CLOCK_TYPICAL -data_path [get_clocks $FAST_CLOCK_NAME]

set_max_capacitance $MAX_CAPACITANCE_FAST_CLOCK_TYPICAL -clock [get_clocks $FAST_CLOCK_NAME]






##### TEST CLOCK CONSTRAINTS

# set_clock_uncertainty $CLOCK_UNCERTAINTY_FAST_TEST_CLOCK_TYPICAL [get_clocks $FAST_TEST_CLOCK_NAME]

# set_clock_latency -early $CLOCK_LATENCY_FAST_TEST_CLOCK_TYPICAL_MIN -source [get_clocks $FAST_TEST_CLOCK_NAME]
# set_clock_latency -late $CLOCK_LATENCY_FAST_TEST_CLOCK_TYPICAL_MAX -source [get_clocks $FAST_TEST_CLOCK_NAME]

# set_clock_transition $MAX_TRANSITION_FAST_TEST_CLOCK_TYPICAL [get_clocks $FAST_TEST_CLOCK_NAME]

# set_input_delay -max -clock [get_clocks $FAST_TEST_VIRTUAL_CLOCK_NAME] $INPUT_DELAY_FAST_TEST_CLOCK_TYPICAL_MAX [get_ports {*TMS* *TDI*}]

# set_input_delay -min -clock [get_clocks $FAST_TEST_VIRTUAL_CLOCK_NAME] $INPUT_DELAY_FAST_TEST_CLOCK_TYPICAL_MIN [get_ports {*TMS* *TDI*}]

# set_output_delay -max -clock [get_clocks $FAST_TEST_VIRTUAL_CLOCK_NAME] $OUTPUT_DELAY_FAST_TEST_CLOCK_TYPICAL_MAX  [get_ports {*TDO*}]

# set_output_delay -min -clock [get_clocks $FAST_TEST_VIRTUAL_CLOCK_NAME] $OUTPUT_DELAY_FAST_TEST_CLOCK_TYPICAL_MIN  [get_ports {*TDO*}]

# set_max_transition $MAX_TRANSITION_DATA_FAST_TEST_CLOCK_TYPICAL -data_path [get_clocks $FAST_TEST_CLOCK_NAME]

# set_max_capacitance $MAX_CAPACITANCE_FAST_TEST_CLOCK_TYPICAL -clock [get_clocks $FAST_TEST_CLOCK_NAME]





set_load $LOAD_TYPICAL [all_outputs]