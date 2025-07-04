## Just updated
## Point to the new 14nm SAED libs
puts "Begin Sourcing: [info script]"
set_host_options -max_cores 4



set LINK_LIBRARY_FILES    " \
/mnt/SATA1/PDKS/SAED14nm_EDK_08_2024/SAED14nm_EDK_STD_RVT/liberty/nldm/base/saed14rvt_base_tt0p8v25c.db \
"

set TARGET_LIBRARY_FILES " \
 /mnt/SATA1/PDKS/SAED14nm_EDK_08_2024/SAED14nm_EDK_STD_RVT/liberty/nldm/base/saed14rvt_base_tt0p8v25c.db \
"

set NDM_REFERENCE_LIB_DIRS  " \
	/mnt/SATA1/PDKS/SAED14nm_EDK_08_2024/SAED14nm_EDK_STD_RVT/ndm/saed14rvt_frame_only.ndm \
	"

set TECH_FILE    "/mnt/SATA1/PDKS/SAED14nm_EDK_08_2024/SAED14nm_EDK_TECH_DATA/tf/saed14nm_1p9m.tf"  ;#  Milkyway technology file
set MAP_FILE     "/mnt/SATA1/PDKS/SAED14nm_EDK_08_2024/SAED14nm_EDK_TECH_DATA/map/saed14nm_tf_itf_tluplus.map"  ;#  Mapping file for TLUplus
set TLUPLUS_MAX_FILE   "/mnt/SATA1/PDKS/SAED14nm_EDK_08_2024/SAED14nm_EDK_TECH_DATA/tlup/saed14nm_1p9m_Cmax.tlup"  ;#  Max TLUplus file
set TLUPLUS_MIN_FILE   "/mnt/SATA1/PDKS/SAED14nm_EDK_08_2024/SAED14nm_EDK_TECH_DATA/tlup/saed14nm_1p9m_Cmin.tlup"  ;#  Min TLUplus file


set NDM_POWER_NET                "VDD" ;#
set NDM_POWER_PORT               "VDD" ;#
set NDM_GROUND_NET               "VSS" ;#
set NDM_GROUND_PORT              "VSS" ;#

set MIN_ROUTING_LAYER            "M2"   ;# Min routing layer
set MAX_ROUTING_LAYER            "M8"   ;# Max routing layer

set LIBRARY_DONT_USE_FILE        "../../DATA_SAED/use_tie.tcl"   ;# Tcl file with library modifications for dont_use

set link_library  $LINK_LIBRARY_FILES
set target_library $TARGET_LIBRARY_FILES
set synthetic_library {dw_foundation.sldb}

#set_app_options -name formality.svf.integrate_in_ndm -value true

create_lib -technology $TECH_FILE $DESIGN_LIB_NAME -ref_libs $NDM_REFERENCE_LIB_DIRS
save_lib
puts "End Sourcing: [info script]"



 
