puts "-I- Start Sourcing [info script]"

set STAGE syn_final

write_verilog ${DESIGN_NAME}.${STAGE}.vg

write_def ${DESIGN_NAME}.${STAGE}.def
write_floorplan -force -output ${DESIGN_NAME}.${STAGE}.floorplan
write_sdc -output ${DESIGN_NAME}.${STAGE}.sdc
write_sdf ${DESIGN_NAME}.${STAGE}.sdf
write_scan_def -output ${DESIGN_NAME}.${STAGE}.scan.def


puts "-I- End Sourcing [info script]"

