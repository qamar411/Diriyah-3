puts "-I- Start Sourcing [info script]"

create_net -power $NDM_POWER_NET
create_net -power $NDM_GROUND_NET
connect_pg_net -net $NDM_POWER_NET  [get_pins -physical_context *$NDM_POWER_PORT]
connect_pg_net -net $NDM_GROUND_NET [get_pins -physical_context *$NDM_GROUND_PORT]
set_pg_routing_mode -mode tapeout
report_pg_routing_mode -nosplit

#connect_pg_net -automatic



puts "-I- End Sourcing [info script]"
