puts "Begin Sourcing [info script]"


remove_modes -all
remove_corner -all

create_mode combine
create_corner main_pvt
create_scenario -mode combine -corner main_pvt -name combine_main_pvt
current_scenario combine_main_pvt

puts "End Sourcing [info script]"
