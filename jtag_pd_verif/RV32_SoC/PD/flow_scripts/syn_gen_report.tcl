puts "-I- Start Sourcing [info script]"

set STAGE syn_final

## general reports
report_qor -nosplit > ${DESIGN_NAME}.${STAGE}.qor.rpt
report_constraints -all_violators -nosplit > ${DESIGN_NAME}.${STAGE}.all_vios.rpt
report_timing -input_pins -nosplit > ${DESIGN_NAME}.${STAGE}.timing.rpt
report_area -nosplit  > ${DESIGN_NAME}.${STAGE}.area.rpt
report_clock_gating -nosplit > ${DESIGN_NAME}.${STAGE}.clock_gating.rpt
report_logic_levels -nosplit > ${DESIGN_NAME}.${STAGE}.logic_levels.rpt
report_transformed_registers > ${DESIGN_NAME}.${STAGE}.transf_regs.rpt
report_transformed_registers -summary > ${DESIGN_NAME}.${STAGE}.transf_regs_summ.rpt




## SCAN Reports
report_dft_drc_violations -test_mode Internal_scan -rule all > ${DESIGN_NAME}.${STAGE}.drc.rpt
# Write out Scandef
write_scan_def -output ${DESIGN_NAME}.${STAGE}.scan.def
# Write out test model
write_test_model -output ${DESIGN_NAME}.${STAGE}.ctl
# Save output for TetraMAX
write_test_protocol -output ${DESIGN_NAME}.scan.${STAGE}.spf -test_mode Internal_scan

puts "-I- End Sourcing [info script]"

