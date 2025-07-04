puts "-I- Start Sourcing [info script]"

puts "-I- Begin Sourcing [info script]"

##------------------------------------------------------------------
## Create Ring around the core
##-----------------------------------------------------------------
create_pg_ring_around_core

##--------------------------------------------------------------
## Create Mesh of M7-M2
##-------------------------------------------------------------
## Second argument is the MinPitch multiplier


create_mesh_straps Metal 6 40 VDD
create_mesh_straps Metal 6 40 VSS

create_mesh_straps Metal 5 40 VDD
create_mesh_straps Metal 5 40 VSS

create_mesh_straps Metal 4 40 VDD
create_mesh_straps Metal 4 40 VSS

create_mesh_straps Metal 3 40 VDD
create_mesh_straps Metal 3 40 VSS

create_mesh_straps Metal 2 40 VDD
create_mesh_straps Metal 2 40 VSS

#-----------------------------------------------------
puts "-I- End Sourcing [info script]"
