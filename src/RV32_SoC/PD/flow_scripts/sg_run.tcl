# To run this file use the command "sg_shell -f sg_run.tcl"

#-----------------------------------------------------------
# SpyGlass Project Setup
#-----------------------------------------------------------




set sg_proj_dir ./spyglass_project
set sg_proj_name soc_lint_analysis
set sg_log_file $sg_proj_dir/spyglass.log




file mkdir $sg_proj_dir

# Create SpyGlass project
# new_project $sg_proj_dir/$sg_proj_name


 if { [catch { new_project $sg_proj_dir/$sg_proj_name } error_string] } {
    puts "ERROR: New_Project : $error_string"
    puts "Closing current project forcefully"
    close_project -force
    puts "Creating new project..."
    new_project $sg_proj_dir/$sg_proj_name -force
 }


set_option top pads

# Enable SystemVerilog and Mixed-Language Support
set_option language_mode mixed
set_option enableSV yes
set_option enableSV09 yes
#-----------------------------------------------------------
# Enable Lint + Advanced Lint
#-----------------------------------------------------------

# CHnage the names of the files accordingly


read_file -type hdl ../design/RTL2/lib.sv
read_file -type hdl ../design/RTL2/add_sub_FP.sv
read_file -type hdl ../design/RTL2/alignment_units.sv
read_file -type hdl ../design/RTL2/alu_control.sv
read_file -type hdl ../design/RTL2/alu.sv
read_file -type hdl ../design/RTL2/bidirec.sv
read_file -type hdl ../design/RTL2/branch_controller.sv
read_file -type hdl ../design/RTL2/busy_registers.sv
read_file -type hdl ../design/RTL2/clear_units_decoder.sv
read_file -type hdl ../design/RTL2/control_unit.sv
read_file -type hdl ../design/RTL2/data_mem.sv
#read_file -type hdl../design/RTL2/ fdiv.sv
read_file -type hdl ../design/RTL2/extract_align_FP.sv
read_file -type hdl ../design/RTL2/fifo4.v
read_file -type hdl ../design/RTL2/float2ints.sv
read_file -type hdl ../design/RTL2/float2int.sv
read_file -type hdl ../design/RTL2/forwarding_unit.sv
read_file -type hdl ../design/RTL2/FP_add_sub_top.sv
read_file -type hdl ../design/RTL2/fp_add.sv
read_file -type hdl ../design/RTL2/FP_busy_registers.sv
read_file -type hdl ../design/RTL2/FP_converter.sv
read_file -type hdl ../design/RTL2/FP_final_multiplier.sv
read_file -type hdl ../design/RTL2/fp_mul.v
read_file -type hdl ../design/RTL2/fpu.sv
read_file -type hdl ../design/RTL2/gpio_defines.v
read_file -type hdl ../design/RTL2/gpio_top.sv
read_file -type hdl ../design/RTL2/hazard_controller.sv
read_file -type hdl ../design/RTL2/imm_gen.sv
read_file -type hdl ../design/RTL2/int2floats.sv
read_file -type hdl ../design/RTL2/int2float.sv
read_file -type hdl ../design/RTL2/int_div_rem.sv
read_file -type hdl ../design/RTL2/int_mul.sv
read_file -type hdl ../design/RTL2/main_control.sv
# read_file -type hd../design/RTL2/l multi_cylce_multiplier.sv
read_file -type hdl ../design/RTL2/n_bit_delayer.sv
read_file -type hdl ../design/RTL2/normalize_FP.sv
read_file -type hdl ../design/RTL2/P_Decoder.sv
read_file -type hdl ../design/RTL2/pipeline_controller.sv
read_file -type hdl ../design/RTL2/priority_controller.sv
read_file -type hdl ../design/RTL2/priority_mux.sv
read_file -type hdl ../design/RTL2/program_counter.sv
read_file -type hdl ../design/RTL2/R4_unit.sv
read_file -type hdl ../design/RTL2/raminfr.v
read_file -type hdl ../design/RTL2/reg_file.sv
read_file -type hdl ../design/RTL2/Register.sv
read_file -type hdl ../design/RTL2/rom.sv
read_file -type hdl ../design/RTL2/round_FP.sv
read_file -type hdl ../design/RTL2/simple_spi_top.v
read_file -type hdl ../design/RTL2/uart_defines.v
read_file -type hdl ../design/RTL2/uart_receiver.v
read_file -type hdl ../design/RTL2/uart_regs.v
read_file -type hdl ../design/RTL2/uart_rfifo.v
read_file -type hdl ../design/RTL2/uart_sync_flops.v
read_file -type hdl ../design/RTL2/uart_tfifo.v
read_file -type hdl ../design/RTL2/uart_top.v
read_file -type hdl ../design/RTL2/uart_transmitter.v
read_file -type hdl ../design/RTL2/uart_wb.v
read_file -type hdl ../design/RTL2/value_capture.sv
#read_file -type hdl../design/RTL2/ //wallace_tree_multiplier.sv
read_file -type hdl ../design/RTL2/wb_intercon.sv
read_file -type hdl ../design/RTL2/wb_mux.v
read_file -type hdl ../design/RTL2/wishbone_controller.sv
read_file -type hdl ../design/RTL2/data_path.sv
#read_file -type hdl../design/RTL2/ //fp_sqrt_Multicycle.sv
read_file -type hdl ../design/RTL2/rv32i_top.sv
read_file -type hdl ../design/RTL2/rv32i_soc.sv
read_file -type hdl ../design/RTL2/pads.v
read_file -type hdl ../design/RTL2/tsmc_8k.v
read_file -type hdl ../design/RTL2/tsmc_32k_sq.v
read_file -type hdl ../design/RTL2/tsmc_rom_1k.v



read_file -type awl ../flow_scripts/waiver.awl

# set_goal_option default_waiver_file ./waiver.awl

current_goal Design_Read -top pads


link_design -force




current_methodology /mnt/NVME2/synopsys/spyglass/W-2024.09-SP1/SPYGLASS_HOME/GuideWare/2023.12/soc/rtl_handoff


current_goal lint/lint_abstract_validate -top pads
run_goal
current_goal lint/lint_rtl -top pads
run_goal
current_goal lint/lint_rtl_enhanced -top pads
run_goal
current_goal lint/lint_turbo_rtl -top pads
run_goal
current_goal lint/lint_functional_rtl -top pads
run_goal
current_goal lint/lint_abstract -top pads
run_goal
current_goal lint/lint_top_down -top pads
run_goal






