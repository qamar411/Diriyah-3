## Point to the new 14nm SAED libs
#set_app_options -name formality.svf.integrate_in_ndm -value true

puts "Begin Sourcing: [info script]"
set_host_options -max_cores 32

set DESIGN_REF_PATH "/mnt/SATA1/PDKS/TSMC_180/tcb018gbwp7t_290a/0P87003_20241221/TSMCHOME/digital"
#it just a path

set DESIGN_REF_TECH_PATH          "/mnt/SATA1/PDKS/TSMC_180/tcb018gbwp7t_290a/0P87003_20241221/TSMCHOME/digital/Back_End/milkyway/tcb018gbwp7t_270a/techfiles"



set LINK_LIBRARY_FILES    "/mnt/SATA1/PDKS/TSMC_180/tpz018nv_280c/0P87003_20241221/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tpz018nv_280b/tpz018nvtc.db"
# #it will contain the ptv carctris

# set TARGET_LIBRARY_FILES "\
# ${DESIGN_REF_PATH}/Front_End/timing_power_noise/NLDM/tcb018gbwp7t_270a/tcb018gbwp7ttc.db \
# /mnt/SATA1/PDKS/TSMC_180/ts1da32kx32_100c/0P87003_20241221/TSMCHOME/sram/synopsys/ts1da32kx32_100a/ts1da32kx32_100a_tc.db
# "
# #it will have the phy carctr

set NDM_REFERENCE_LIB_DIRS  " \

	/mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/tcb018gbwp7t_c.ndm \
	/mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/tpz018nv_c.ndm \
	/mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/io_physical_only.ndm \
	/mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/lib_creation_macros.ndm \
	/mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/stdcell_physical_only.ndm \
/mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/tsmc_32k_sq_lib_tsmc_32k_sq_lib.ndm \
	/mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/tsmc_rom_1k_lib_tsmc_rom_1k_lib.ndm \

"
	# /mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/tpz018nv_c.ndm \
	# /mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/TS1DA32KX32_TS1DA32KX32.ndm \
	# /mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/tsmc_32k_sq_lib_tsmc_32k_sq_lib.ndm \
	# /mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/tsmc_rom_1k_lib_tsmc_rom_1k_lib.ndm \
	# /mnt/SATA1/PDKS/TSMC_180/NDMS_TT/tcb018gbwp7ttc_tcb018gbwp7ttc.ndm \
	# /mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/io_physical_only.ndm \
	# /mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/lib_creation_macros.ndm \
	# /mnt/SATA1/PDKS/TSMC_180/NDMS_mcmm/stdcell_physical_only.ndm \


#it will have everythig 

set TECH_FILE                     "${DESIGN_REF_TECH_PATH}/tsmc018_6lm.tf"  ;#  Milkyway technology file , it will have all information about everything exapt cells
set MAP_FILE                      "${DESIGN_REF_TECH_PATH}/tluplus/star.map_6M"  ;#  Mapping file for TLUplus , the table of wiers and cap
set TLUPLUS_MAX_FILE              "${DESIGN_REF_TECH_PATH}/tluplus/t018lo_1p6m_typical.tluplus"  ;#  Max TLUplus file ,for routong max 
set TLUPLUS_MIN_FILE              "${DESIGN_REF_TECH_PATH}/tluplus/t018lo_1p6m_typical.tluplus"  ;#  Min TLUplus file , for routing min


set NDM_POWER_NET                "VDD" ;#
set NDM_POWER_PORT               "VDD" ;#
set NDM_GROUND_NET               "VSS" ;#
set NDM_GROUND_PORT              "VSS" ;#

set MIN_ROUTING_LAYER            "METAL1"   ;# Min routing layer
set MAX_ROUTING_LAYER            "METAL6"   ;# Max routing layer


# set link_library  $LINK_LIBRARY_FILES
# set target_library $TARGET_LIBRARY_FILES
 set synthetic_library {dw_foundation.sldb}


create_lib -technology $TECH_FILE $DESIGN_LIB_NAME -ref_libs $NDM_REFERENCE_LIB_DIRS
puts "End Sourcing: [info script]"



 
