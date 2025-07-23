puts "Begin Sourcing [info script]"
#read_parasitic_tech -tlup $TLUPLUS_MAX_FILE -name earlycap
#read_parasitic_tech -tlup $TLUPLUS_MIN_FILE -name latecap

read_parasitic_tech -tlup $TLUPLUS_MAX_FILE -name earlycap
read_parasitic_tech -tlup $TLUPLUS_MIN_FILE -name latecap

set_parasitics_parameters -early_spec earlycap -late_spec latecap

puts "End Sourcing [info script]"


