# -timescale=1ns/10ps

//filelist created for JTAG integration
# +define+tracer
+define+VCS_SIM
+define+JTAG
+define+JTAG_verf
+define+dump_wave
+define+dump_mem
// +define+PD_BUILD

./modules/rtl_team/rv32imf/soc/dump_mem.sv
./modules/tracer_modules/Tracer/pkg.sv
./modules/tracer_modules/Tracer/tracer_pkg.sv
./modules/rtl_team/rv32imf/soc/uncore/debug/debug_pkg.sv
./modules/rtl_team/rv32imf/soc/uncore/i2c/rtl/i2c_master_defines.v
./modules/rtl_team/rv32imf/soc/glbl.v
./modules/rtl_team/rv32imf/soc/core/lib.sv
./modules/rtl_team/rv32imf/soc/core/rv32i_top.sv
./modules/rtl_team/rv32imf/soc/WishboneInterconnect/wb_intercon_1.2.2-r1/wb_mux.v
./modules/rtl_team/rv32imf/soc/WishboneInterconnect/wb_intercon.sv
./modules/rtl_team/rv32imf/soc/WishboneInterconnect/wishbone_controller.sv
./modules/rtl_team/rv32imf/soc/core/alignment_units.sv
./modules/rtl_team/rv32imf/soc/core/alu.sv
./modules/rtl_team/rv32imf/soc/core/alu_control.sv
./modules/rtl_team/rv32imf/soc/core/branch_controller.sv
./modules/rtl_team/rv32imf/soc/core/data_mem.sv
./modules/rtl_team/rv32imf/soc/core/forwarding_unit.sv
./modules/rtl_team/rv32imf/soc/core/green_team/block_sqrt/Register.sv
./modules/rtl_team/rv32imf/soc/core/green_team/block_sqrt/fp_add.sv
./modules/rtl_team/rv32imf/soc/core/green_team/block_sqrt/fp_sqrt_Multicycle.sv
./modules/rtl_team/rv32imf/soc/core/green_team/fadd_sub_modules/add_sub_FP.sv
./modules/rtl_team/rv32imf/soc/core/green_team/fadd_sub_modules/extract_align_FP.sv
./modules/rtl_team/rv32imf/soc/core/green_team/fadd_sub_modules/normalize_FP.sv
./modules/rtl_team/rv32imf/soc/core/green_team/fadd_sub_modules/round_FP.sv
./modules/rtl_team/rv32imf/soc/core/green_team/fadd_sub_modules/FP_add_sub_top.sv
./modules/rtl_team/rv32imf/soc/core/green_team/fpu_units/fcvt/FP_converter.sv
./modules/rtl_team/rv32imf/soc/core/green_team/fpu_units/fcvt/float2int.sv
./modules/rtl_team/rv32imf/soc/core/green_team/fpu_units/fcvt/float2ints.sv
./modules/rtl_team/rv32imf/soc/core/green_team/fpu_units/fcvt/int2float.sv
./modules/rtl_team/rv32imf/soc/core/green_team/fpu_units/fcvt/int2floats.sv
./modules/rtl_team/rv32imf/soc/core/green_team/fpu_units/fpu.sv
./modules/rtl_team/rv32imf/soc/core/green_team/raw_waw_units/FP_busy_registers.sv
./modules/rtl_team/rv32imf/soc/core/green_team/raw_waw_units/clear_units_decoder.sv
./modules/rtl_team/rv32imf/soc/core/green_team/raw_waw_units/n_bit_delayer.sv
./modules/rtl_team/rv32imf/soc/core/green_team/raw_waw_units/value_capture.sv
./modules/rtl_team/rv32imf/soc/core/green_team/raw_waw_units/busy_registers.sv
./modules/rtl_team/rv32imf/soc/core/hazard_controller.sv
./modules/rtl_team/rv32imf/soc/core/imm_gen.sv
./modules/rtl_team/rv32imf/soc/core/program_counter.sv
./modules/rtl_team/rv32imf/soc/core/red_team/FP_units/FP_final_multiplier.sv
./modules/rtl_team/rv32imf/soc/core/red_team/FP_units/R4_unit.sv
./modules/rtl_team/rv32imf/soc/core/red_team/FP_units/fdiv.sv
./modules/rtl_team/rv32imf/soc/core/red_team/int_units/int_div_rem.sv
./modules/rtl_team/rv32imf/soc/core/red_team/int_units/int_mul.sv
./modules/rtl_team/rv32imf/soc/core/red_team/priority_units/P_Decoder.sv
./modules/rtl_team/rv32imf/soc/core/red_team/priority_units/priority_controller.sv
./modules/rtl_team/rv32imf/soc/core/red_team/priority_units/priority_mux.sv
./modules/rtl_team/rv32imf/soc/core/reg_file.sv
./modules/rtl_team/rv32imf/soc/core/rom.sv
./modules/rtl_team/rv32imf/soc/core/control_unit.sv
./modules/rtl_team/rv32imf/soc/core/core_dbg_fsm.sv
./modules/rtl_team/rv32imf/soc/core/data_path.sv
./modules/rtl_team/rv32imf/soc/core/linearization.sv
./modules/rtl_team/rv32imf/soc/core/main_control.sv
./modules/rtl_team/rv32imf/soc/core/pipeline_controller.sv
./modules/rtl_team/rv32imf/soc/uncore/gpio/gpio_defines.v
./modules/rtl_team/rv32imf/soc/uncore/gpio/gpio_top.sv
./modules/rtl_team/rv32imf/soc/uncore/spi/fifo4.v
./modules/rtl_team/rv32imf/soc/uncore/spi/simple_spi_top.v
./modules/rtl_team/rv32imf/soc/uncore/uart/raminfr.v
./modules/rtl_team/rv32imf/soc/uncore/uart/uart_defines.v
./modules/rtl_team/rv32imf/soc/uncore/uart/uart_receiver.v
./modules/rtl_team/rv32imf/soc/uncore/uart/uart_regs.v
./modules/rtl_team/rv32imf/soc/uncore/uart/uart_rfifo.v
./modules/rtl_team/rv32imf/soc/uncore/uart/uart_sync_flops.v
./modules/rtl_team/rv32imf/soc/uncore/uart/uart_tfifo.v
./modules/rtl_team/rv32imf/soc/uncore/uart/uart_top.v
./modules/rtl_team/rv32imf/soc/uncore/uart/uart_transmitter.v
./modules/rtl_team/rv32imf/soc/uncore/uart/uart_wb.v
// ./modules/rtl_team/rv32imf/soc/uncore/debug/bscan_tap.sv
./modules/rtl_team/rv32imf/soc/uncore/debug/debug_top.sv
./modules/rtl_team/rv32imf/soc/uncore/debug/dm.sv
./modules/rtl_team/rv32imf/soc/uncore/debug/dtm.sv
./modules/rtl_team/rv32imf/soc/uncore/i2c/rtl/i2c_master_bit_ctrl.v
./modules/rtl_team/rv32imf/soc/uncore/i2c/rtl/i2c_master_byte_ctrl.v
./modules/rtl_team/rv32imf/soc/uncore/i2c/rtl/i2c_master_top.v
# ./modules/rtl_team/rv32imf/soc/uncore/i2c/software/include/oc_i2c_master.h
./modules/rtl_team/rv32imf/soc/uncore/ptc/ptc_defines.v
./modules/rtl_team/rv32imf/soc/uncore/ptc/ptc_top.v
./modules/rtl_team/rv32imf/soc/io_mux.sv
./modules/rtl_team/rv32imf/soc/rv32i_soc.sv
./modules/tracer_modules/Tracer/tracer.sv
./modules/tracer_modules/rvfi_tracker.sv
./modules/tracer_modules/rvfi_tracker_delay.sv
// ./testbench/tb/remote_bitbang.h
// ./testbench/tb/remote_bitbang.cc
// ./testbench/tb/SimJTAG.cc
./testbench/SimJTAG.sv
./testbench/rv32i_soc_jtag_tb.sv
// ./testbench/tb/rv32_soc_with_pad_tb.sv
# ./testbench/data_formatted.hex
# ./testbench/inst_formatted.hex
// ./testbench/rv32i_soc_tb.sv
// ./testbench/rv32i_tb.sv
// ./testbench/tracer_rv32i_soc_tb.sv
