puts "-I- Start Sourcing [info script]"
# If pre-compile  flow  is  intended  then  below  app
#        option should be set after setting the current_design in the flow:
#                   set_app_options    -name    dft.insertion_pre_compile_fusion
#        -value true

#        If in-compile or post-compile flow is intended then 'create_test_proto-
#        col',   'preview_dft'  and  'insert_dft'  should  be  run  after  'com-
#        pile_fusion -to logic_opto' or 'compile' step.

## DFT File
#set_app_options    -name    dft.insertion_pre_compile_fusion       -value true

set_scan_configuration -chain_count 1
set_dft_signal -view existing -type ScanClock -port clk -timing [list 20 25]
set_dft_signal -view existing -type Reset -port reset -active_state 1

set_dft_signal -view spec -type ScanDataIn -port scan_in
set_dft_signal -view spec -type ScanDataOut -port scan_out

set_dft_signal -view spec -type ScanEnable -port scan_enable

create_test_protocol 

#preview_dft

insert_dft

dft_drc -test_mode Internal_scan

# Generate post dft_drc verbose report
report_dft_drc_violations -test_mode Internal_scan -rule all > ${DESIGN_NAME}.insert_dft.drc.rpt
# Write out Scandef
write_scan_def -output ${DESIGN_NAME}.insert_dft.scan.def
# Write out test model
write_test_model -output ${DESIGN_NAME}.insert_dft.ctl
# Save output for TetraMAX
write_test_protocol -output ${DESIGN_NAME}.scan.insert_dft.spf -test_mode Internal_scan

puts "-I- End Sourcing [info script]"

