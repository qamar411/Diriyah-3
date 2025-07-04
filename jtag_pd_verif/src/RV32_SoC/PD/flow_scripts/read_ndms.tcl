set NDMS_PATH   "/mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/"
set REFERENCE_LIBRARY [concat [glob -directory "$NDMS_PATH" *.ndm]];
set TECH_FILE "$TSMC_LIB_DIR/tcb018gbwp7t_290a/0P87003_20241221/TSMCHOME/digital/Back_End/milkyway/tcb018gbwp7t_270a/techfiles/tsmc018_6lm.tf";
create_lib -technology $TECH_FILE -ref_libs $REFERENCE_LIBRARY $DESIGN_LIBRARY



