#==================== Configurable Variables ====================
DATE            := $(shell date +%Y-%m-%d)
DV_DIR          := ../riscv-dv
SIM_DIR         := ../src
OUT_DIR         := $(DV_DIR)/out_$(DATE)

# For normal runs, TEST_LIST drives everything.
TEST_LIST       := riscv_arithmetic_basic_test
TEST_LIST       := riscv_arithmetic_basic_test riscv_rand_jump_test riscv_jump_stress_test riscv_mmu_stress_test riscv_amo_test riscv_loop_test
ITER            := 1
SEED            := 564205861
POST_SYNTH      := 0
POST_ROUTE      := 0
LINKER_SCRIPT   := $(DV_DIR)/scripts/link.ld
TARGET          := rv32im
INTERRUPT_TEST  := 0
CUSTOM          ?= 0

# Your directed-ASM source
# ASM_TEST        := $(DV_DIR)/../src/tb/assembly_tests/crypto_tests/riscv_crypto_test_0.S
# ASM_TEST        := $(DV_DIR)/custom_tests/sha_tests/riscv_sha_test_0.S
ASM_TEST        := $(DV_DIR)/custom_tests/riscv-dv/arithmetic_test_0.S



OBJCOPY         := riscv32-unknown-elf-objcopy
CONVERT_HEX     := python3 $(DV_DIR)/scripts/convert_hex.py
CORE_LOG_2_CSV  := python3 $(DV_DIR)/scripts/core_log_to_trace_csv.py
SPIKE_LOG_2_CSV := python3 $(DV_DIR)/scripts/spike_log_to_trace_csv.py
COMPARE         := python3 $(DV_DIR)/scripts/instr_trace_compare.py
FORMAT          := python3 $(DV_DIR)/scripts/format_csv.py
SUMMARY_SCRIPT  := python3 $(DV_DIR)/scripts/regression_summary.py

TRACE_LOG_BASE  := $(SIM_DIR)/trace_core_00000001.log
REGRESSION_SUM  := $(OUT_DIR)/regression_summary.csv

.PHONY: all clean dv_gen custom_run build_simv sim trace format_csvs compare summarize

# derive base name, e.g. riscv_crypto_test_0
ASM_BASE := $(basename $(notdir $(ASM_TEST)))

ifneq ($(CUSTOM),0)
    TEST_LIST := custom_test
    TARGET    := rv32imac_zkne_zknd_zknh_zbkb_zbkc_zbkx_zbb
	ITER      := 1
endif

# Top‐level: pick custom_run or dv_gen, then sim→trace→compare→summarize
all: clean $(if $(filter 1,$(CUSTOM)),custom_run,dv_gen) build_simv sim trace format_csvs compare summarize
	@echo "\n===== ✅ ALL DONE. Check Summary: $(REGRESSION_SUM) ====="



#-------------------------------------------------------------------
# 1a) Stock DV tests
#-------------------------------------------------------------------
dv_gen:
	@echo "\n🚀 Generating stock DV tests ($(TEST_LIST))…"
	@mkdir -p $(OUT_DIR)
	@for test in $(TEST_LIST); do \
	  cd $(DV_DIR) && \
	  python3 run.py \
	    --test $$test \
	    --simulator vcs \
	    --target $(TARGET) \
	    --iterations $(ITER) \
	    --output $(OUT_DIR)/$$test; \
	done

#-------------------------------------------------------------------
# 1b) Single custom test drops straight into the same OUT_DIR/TEST_LIST
#-------------------------------------------------------------------
custom_run:
	@echo "\n🚀 Generating custom directed ASM ($(ASM_BASE))…"
	@mkdir -p $(OUT_DIR)
	cd $(DV_DIR) && \
	  python3 run.py \
	    --asm_test $(ASM_TEST) \
	    --simulator vcs \
	    --target $(TARGET) \
	    --output $(OUT_DIR)/$(TEST_LIST)
	@# Move the generated .o into asm_test/TEST_LIST_0.o
	@mkdir -p $(OUT_DIR)/$(TEST_LIST)/asm_test
	@cp $(OUT_DIR)/$(TEST_LIST)/directed_asm_test/$(ASM_BASE).o \
	     $(OUT_DIR)/$(TEST_LIST)/asm_test/$(TEST_LIST)_0.o
	@# Rename the Spike log into spike_sim/TEST_LIST_0.log
	@mkdir -p $(OUT_DIR)/$(TEST_LIST)/spike_sim
	@mv $(OUT_DIR)/$(TEST_LIST)/spike_sim/$(ASM_BASE).log \
	      $(OUT_DIR)/$(TEST_LIST)/spike_sim/$(TEST_LIST)_0.log

#-------------------------------------------------------------------
# 2) Build simv
#-------------------------------------------------------------------
build_simv:
	@echo "\n🔨 Building simv…"
ifeq ($(POST_SYNTH),1)
	cd $(SIM_DIR) && \
	  vcs -full64 \
	      -sdf max:rv32i_soc_tb.DUT:post_synth_route/post_syn.sdf \
	      -f filelist-synth.f +POST_SYNTH -o simv
else ifeq ($(POST_ROUTE),1)
	cd $(SIM_DIR) && \
	  vcs -full64 \
	      -sdf max:rv32i_soc_tb.DUT:post_synth_route/post_route.sdf \
	      -f filelist-synth.f +POST_ROUTE -o simv
else ifeq ($(INTERRUPT_TEST), 1)
	cd $(SIM_DIR) && vcs -full64 -f filelist.f +define+BOOT -o simv
else 
	cd $(SIM_DIR) && vcs -full64 -f filelist.f -o simv
endif

#-------------------------------------------------------------------
# 3) Run sim (loops inside loops untouched!)
#-------------------------------------------------------------------
sim: build_simv
	@echo "\n▶️ Running simulations…"
	@for test in $(TEST_LIST); do \
	  for i in `seq 0 $$(($(ITER)-1))`; do \
	    echo "Running $$test iteration $$i…"; \
	    $(OBJCOPY) -O verilog -j .text \
	      $(OUT_DIR)/$$test/asm_test/$$test\_$$i.o \
	      $(OUT_DIR)/inst.hex; \
	    $(OBJCOPY) -O verilog -j .data \
	      $(OUT_DIR)/$$test/asm_test/$$test\_$$i.o \
	      $(OUT_DIR)/data.hex; \
		$(CONVERT_HEX) $(OUT_DIR)/inst.hex      $(OUT_DIR)/inst_conv.hex; \
	    $(CONVERT_HEX) $(OUT_DIR)/data.hex      $(OUT_DIR)/data_conv.hex; \
	    cp $(OUT_DIR)/inst_conv.hex $(SIM_DIR)/tb/inst_formatted.hex; \
	    cp $(OUT_DIR)/data_conv.hex $(SIM_DIR)/tb/data_formatted.hex; \
	    cd $(SIM_DIR) && ./simv > /dev/null; \
	    cp $(TRACE_LOG_BASE) $(OUT_DIR)/$$test/core_trace_$$i.log; \
	  done \
	done

#-------------------------------------------------------------------
# 4) Trace → CSV
#-------------------------------------------------------------------
trace: sim
	@echo "\n📊 Generating trace CSVs…"
	@for test in $(TEST_LIST); do \
	  for i in `seq 0 $$(($(ITER)-1))`; do \
	    $(CORE_LOG_2_CSV)  --log $(OUT_DIR)/$$test/core_trace_$$i.log \
	                       --csv $(OUT_DIR)/$$test/core_trace_$$i.csv \
	      || echo "❌ Core trace $$i failed"; \
	    $(SPIKE_LOG_2_CSV) --log $(OUT_DIR)/$$test/spike_sim/$$test\_$$i.log \
	                       --csv $(OUT_DIR)/$$test/spike_trace_$$i.csv; \
	  done \
	done

#-------------------------------------------------------------------
# 4b) Optional CSV formatting
#-------------------------------------------------------------------
format_csvs: trace
	@echo "\n🔍 Formatting CSVs…"
	@for test in $(TEST_LIST); do \
	  for i in `seq 0 $$(($(ITER)-1))`; do \
	    echo "Formatting $$test iteration $$i…"; \
	    $(FORMAT) \
	      $(OUT_DIR)/$$test/spike_trace_$$i.csv \
	      $(OUT_DIR)/$$test/core_trace_$$i.csv \
	      $(OUT_DIR)/$$test/core_trace_n$$i.csv; \
	  done; \
	done

#-------------------------------------------------------------------
# 5) Compare
#-------------------------------------------------------------------
compare: format_csvs
	@echo "\n🔍 Comparing traces…"
	@for test in $(TEST_LIST); do \
	  for i in `seq 0 $$(($(ITER)-1))`; do \
	    sed -i '2d' $(OUT_DIR)/$$test/spike_trace_$$i.csv \
	    sed -i '2d' $(OUT_DIR)/$$test/core_trace_$$i.csv \
		$(COMPARE) \
	      --csv_file_1 $(OUT_DIR)/$$test/spike_trace_$$i.csv \
	      --csv_file_2 $(OUT_DIR)/$$test/core_trace_$$i.csv \
	      --csv_name_1 spike --csv_name_2 core \
	      > $(OUT_DIR)/$$test/diff_$$i.log \
	    || echo "❌ Compare $$i failed"; \
	  done \
	done

only_compare: 
	@echo "\n🔍 Comparing traces…"
	@for test in $(TEST_LIST); do \
	  for i in `seq 0 $$(($(ITER)-1))`; do \
	    sed -i '2d' $(OUT_DIR)/$$test/spike_trace_$$i.csv \
	    sed -i '2d' $(OUT_DIR)/$$test/core_trace_$$i.csv \
		$(COMPARE) \
	      --csv_file_1 $(OUT_DIR)/$$test/spike_trace_$$i.csv \
	      --csv_file_2 $(OUT_DIR)/$$test/core_trace_$$i.csv \
	      --csv_name_1 spike --csv_name_2 core \
	      > $(OUT_DIR)/$$test/diff_$$i.log \
	    || echo "❌ Compare $$i failed"; \
	  done \
	done

#-------------------------------------------------------------------
# 6) Summarize
#-------------------------------------------------------------------
summarize: compare
	@echo "\n📝 Final Summary:"
	$(SUMMARY_SCRIPT) $(OUT_DIR) > $(REGRESSION_SUM)
	cat $(REGRESSION_SUM)
	@echo "\n🎉 ALL ITERATIONS COMPLETE!"

#-------------------------------------------------------------------
# Clean
#-------------------------------------------------------------------
clean:
	rm -rf $(OUT_DIR)