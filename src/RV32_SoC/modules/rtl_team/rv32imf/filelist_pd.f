+define+PD_BUILD

./soc/core/lib.sv
./soc/uncore/debug/debug_pkg.sv
./soc/core/pipeline_controller.sv

./soc/core/green_team/block_sqrt/Register.sv
./soc/core/red_team/FP_units/FP_final_Multiplier.sv
./soc/core/red_team/int_units/int_mul.sv
./soc/core/red_team/int_units/int_div_rem.sv
./soc/core/green_team/fadd_sub_modules/round_FP.sv
./soc/core/green_team/fadd_sub_modules/normalize_FP.sv
#./soc/core/green_team/block_sqrt/fp_add.sv
./soc/core/green_team/fadd_sub_modules/add_sub_FP.sv
./soc/core/green_team/fadd_sub_modules/extract_align_FP.sv
./soc/core/green_team/fadd_sub_modules/FP_add_sub_top.sv
./soc/core/red_team/FP_units/fdiv.sv
./soc/core/green_team/block_sqrt/fp_sqrt_Multicycle.sv
./soc/core/alignment_units.sv
./soc/core/alu_control.sv
./soc/core/alu.sv
./soc/core/branch_controller.sv
./soc/core/control_unit.sv
./soc/core/core_dbg_fsm.sv


./soc/core/forwarding_unit.sv


./soc/core/green_team/fpu_units/fcvt/float2ints.sv
./soc/core/green_team/fpu_units/fcvt/float2int.sv
./soc/core/green_team/fpu_units/fcvt/FP_converter.sv
./soc/core/green_team/fpu_units/fcvt/int2floats.sv
./soc/core/green_team/fpu_units/fcvt/int2float.sv
./soc/core/green_team/fpu_units/fpu.sv
./soc/core/green_team/raw_waw_units/busy_registers.sv
./soc/core/green_team/raw_waw_units/clear_units_decoder.sv
./soc/core/green_team/raw_waw_units/FP_busy_registers.sv
./soc/core/green_team/raw_waw_units/n_bit_delayer.sv
./soc/core/green_team/raw_waw_units/value_capture.sv
./soc/core/hazard_controller.sv
./soc/core/imm_gen.sv

./soc/core/linearization.sv
./soc/core/main_control.sv

./soc/core/program_counter.sv


./soc/core/red_team/FP_units/R4_unit.sv

./soc/core/red_team/priority_units/P_Decoder.sv
./soc/core/red_team/priority_units/priority_controller.sv
./soc/core/red_team/priority_units/priority_mux.sv
./soc/core/reg_file.sv

./soc/sram_wrappers.sv
./soc/dump_mem.sv

./soc/io_mux.sv

./soc/uncore/debug/bscan_tap.sv
./soc/uncore/debug/debug_top.sv
./soc/uncore/debug/dm.sv
./soc/uncore/debug/dtm.sv
./soc/uncore/gpio/gpio_defines.v
./soc/uncore/gpio/gpio_top.sv
#./soc/uncore/i2c/bench/verilog/i2c_slave_model.v
#./soc/uncore/i2c/bench/verilog/spi_slave_model.v

./soc/uncore/i2c/rtl/i2c_master_bit_ctrl.v
./soc/uncore/i2c/rtl/i2c_master_byte_ctrl.v
./soc/uncore/i2c/rtl/i2c_master_defines.v
./soc/uncore/i2c/rtl/i2c_master_top.v
./soc/uncore/ptc/ptc_defines.v
./soc/uncore/ptc/ptc_top.v
./soc/uncore/spi/fifo4.v
./soc/uncore/spi/simple_spi_top.v
./soc/uncore/uart/raminfr.v
./soc/uncore/uart/uart_defines.v
./soc/uncore/uart/uart_receiver.v
./soc/uncore/uart/uart_regs.v
./soc/uncore/uart/uart_rfifo.v
./soc/uncore/uart/uart_sync_flops.v
./soc/uncore/uart/uart_tfifo.v
./soc/uncore/uart/uart_top.v
./soc/uncore/uart/uart_transmitter.v
./soc/uncore/uart/uart_wb.v
./soc/WishboneInterconnect/wb_intercon_1.2.2-r1/wb_mux.v
./soc/WishboneInterconnect/wb_intercon.sv
./soc/WishboneInterconnect/wishbone_controller.sv
./soc/core/data_path.sv
./soc/core/rv32i_top.sv

./soc/rv32i_soc.sv

./soc/pads.sv