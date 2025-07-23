# UPF for Simple Two-Domain Design (VDD=1.8V, VSS=0.0V)

# Create Power Domains
create_power_domain rv32i_soc -include_scope

# Create Supply Ports
create_supply_port VDD -direction in -domain rv32i_soc
create_supply_port VSS -direction in -domain rv32i_soc

# Create Supply Nets
create_supply_net VDD -domain rv32i_soc -resolve parallel
create_supply_net VSS -domain rv32i_soc -resolve parallel

# Connect Supply Nets with corresponding Ports
connect_supply_net VDD -ports VDD 
connect_supply_net VSS -ports VSS 



# Establish Power Connections
set_domain_supply_net rv32i_soc -primary_power_net VDD -primary_ground_net VSS

# Create Power State Table
# add_port_state VDD -state {ON 1.8}
add_port_state VDD -state {ON 1.8} -state {OFF off}
add_port_state VSS -state {GND 0.0}

create_pst PST_table -supplies {VDD VSS}

# Define Power States
add_pst_state NORMAL -pst PST_table -state {ON GND}
add_pst_state OFF -pst PST_table -state {OFF GND}


commit_upf










