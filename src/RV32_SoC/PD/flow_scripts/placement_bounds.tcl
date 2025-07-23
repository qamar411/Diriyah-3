puts "Begin Sourcing [info script]"

# create_bound -boundary {{120.1020 149.8000} {170.1020 199.8000}} -type hard \
#     -name clka_reg_bound [all_registers -clock CLKA]

# create_bound -boundary {{119.7320 77.2000} {169.7320 127.2000}} -type hard \
#     -name clkb_reg_bound [all_registers -clock CLKB]

# create_bound -boundary {{117.9560 7.6000} {167.9560 57.6000}} -type hard \
#     -name clkc_reg_bound [all_registers -clock CLKC] 

create_bound -boundary {{820 149.8000} {870.1020 199.8000}} -type hard \
    -name clka_reg_bound [all_registers -clock CLKA]

create_bound -boundary {{820.7320 77.2000} {870.7320 127.2000}} -type hard \
    -name clkb_reg_bound [all_registers -clock CLKB]

create_bound -boundary {{820.9560 7.6000} {870.9560 57.6000}} -type hard \
    -name clkc_reg_bound [all_registers -clock CLKC] 


puts "End Sourcing [info script]"
