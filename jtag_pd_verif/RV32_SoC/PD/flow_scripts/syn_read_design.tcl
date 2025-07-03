puts "Begin Sourcing : [info script]"

  # analyze -format sverilog -vcs  {-F /home/Danah_Albarkah/shared_folder/Team_Nehal_PD/180_node/design/RTL2/filelist.f}
analyze -format sverilog -vcs  {-F ../../../modules/rtl_team/rv32imf/filelist_pd.f}
##analyze -format sverilog -vcs  {-F /home/Amr_Ali/180_node/design/filelist.f}
 #it will read the rtl 

elaborate $DESIGN_NAME 
 #it will convert the rtl to gate level 

set_top_module -verbose $DESIGN_NAME

puts "End Sourcing : [info script]"
