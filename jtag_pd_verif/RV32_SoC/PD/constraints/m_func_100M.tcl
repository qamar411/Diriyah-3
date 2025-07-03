# ============================================================
# Author  :    Talha bin azmat - the honored one
# 
# Role    :    Hardware Design Engineer
# 
# Email   :    talhabinazmat@gmail.com
# 
# Contact :    +923325306662
# ============================================================



# Fast clocks
create_clock -name $FAST_CLOCK_NAME     -add -period $FAST_CLOCK_PERIOD      [get_ports CLK_PAD]
# create_clock -name $FAST_TEST_CLOCK_NAME -add -period $FAST_TEST_CLOCK_PERIOD [get_ports I_TCK_PAD]
# create_clock -name $FAST_TEST_VIRTUAL_CLOCK_NAME       -period $FAST_TEST_VIRTUAL_CLOCK_PERIOD
create_clock -name $FAST_VIRTUAL_CLOCK_NAME            -period $FAST_CLOCK_PERIOD

set clock_ports  [filter_collection [get_attribute [get_clocks] sources] object_class==port]
set input_ports  [remove_from_collection [all_inputs] $clock_ports]
set output_ports [all_outputs]


group_path -from [get_clocks $FAST_VIRTUAL_CLOCK_NAME] -to [get_clocks $FAST_CLOCK_NAME] \
            -name INPUT 
            # -group_name "input_to_clock_paths"

group_path -from [get_clocks $FAST_CLOCK_NAME] -to [get_clocks $FAST_VIRTUAL_CLOCK_NAME] \
            -name OUTPUT 
            # -group_name "clock_to_input_paths"

group_path -from [get_clocks $FAST_CLOCK_NAME] -to [get_clocks $FAST_CLOCK_NAME] \
            -name R2R 
            # -group_name "clock_to_clock_paths"


set_clock_groups -group "$FAST_CLOCK_NAME $FAST_VIRTUAL_CLOCK_NAME" \
                 -logically_exclusive
# set_clock_groups -group "$FAST_TEST_CLOCK_NAME $FAST_TEST_VIRTUAL_CLOCK_NAME" \
#                  -logically_exclusive

# set_false_path -from [get_clocks $FAST_CLOCK_NAME]      \
#                -to   [get_clocks $FAST_TEST_CLOCK_NAME]
# set_false_path -from [get_clocks $FAST_TEST_CLOCK_NAME] \
#                -to   [get_clocks $FAST_CLOCK_NAME]


