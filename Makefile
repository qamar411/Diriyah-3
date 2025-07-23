# Makefile to generate hex files for instruction and data memory from riscv-dv,
# treating the generated .o file as the ELF.

# Paths and configuration
DV_DIR         :=$(CURDIR)/riscv-dv
SIM_DIR        := $(CURDIR)/

# filelist dir
TODAY := $(shell date +%Y-%m-%d)
OUT_DIR := $(DV_DIR)/out_$(TODAY)
#**************************************************
#--------------------rv32i ----------------------
#riscv_rand_jump_test
#riscv_jump_stress_test
#riscv_arithmetic_basic_test
#riscv_mmu_stress_test 
#-------------------rv32im ----------------------
#riscv_rand_jump_test
#riscv_jump_stress_test
#riscv_arithmetic_basic_test
#riscv_mmu_stress_test 
#-------------------rv32if ----------------------
#riscv_floating_point_arithmetic_test
#riscv_floating_point_rand_test
#riscv_floating_point_mmu_stress_test
#**************************************************  
# ONLY CHANGE TEST_NAME
TARGET         :=  rv32if # first rv32i, rv32im, rv32imf
TEST_NAME      := riscv_floating_point_arithmetic_test
#**************************************************

LINKER_SCRIPT  := $(DV_DIR)/scripts/link.ld
CORE_LOG       := $(CURDIR)/trace_core_00000001.log
SPIKE_LOG      := $(OUT_DIR)/spike_sim/$(TEST_NAME)_0.log
CORE_CSV       := $(OUT_DIR)/core.csv
SPIKE_CSV      := $(OUT_DIR)/spike.csv

TOP_MODULE_NAME:= tracer_rv32i_soc_tb
TOLERANCE:= 0.00001


# Auto-save proccess
INST_NAME := Lsl
SAVE_BASE := results_saved/$(INST_NAME)_mismatches
# Find next batch function
define find_next_batch
$(shell \
  i=1; \
  while [ -d "$(SAVE_BASE)/batch$$i" ]; do \
    i=$$((i+1)); \
  done; \
  echo $$i \
)
endef
BATCH_NUM := $(call find_next_batch)
SAVE_DIR := $(SAVE_BASE)/batch$(BATCH_NUM)


# The generated ELF is actually a .o file.
RV_ELF         := $(OUT_DIR)/asm_test/$(TEST_NAME)_0.o
cus_lef		   := $(OUT_DIR)/directed_asm_test/asm_custom_test.o

# Toolchain
OBJCOPY        := riscv32-unknown-elf-objcopy

# Conversion script
CONVERT_HEX    := python3 $(DV_DIR)/scripts/convert_hex.py
REMOVE_PC		:= python3 $(DV_DIR)/scripts/remove_some_pcs.py

# Output file names after conversion
INST_CONV_HEX  := $(CURDIR)/RV32_SoC/testbench/inst_formatted.hex
DATA_CONV_HEX  := $(CURDIR)/RV32_SoC/testbench/data_formatted.hex

# Temporary hex files (extracted from ELF)
INST_HEX       := $(OUT_DIR)/inst.hex
DATA_HEX       := $(OUT_DIR)/data.hex

# CSV conversion and comparison
CORE_LOG_2_CSV   := python3 $(DV_DIR)/scripts/fp_core_log_to_trace_csv_shahd.py
SPIKE_LOG_2_CSV  := python3 $(DV_DIR)/scripts/spike_log_to_trace_csv_shahd.py
COMPARE          := python3 $(DV_DIR)/scripts/instr_trace_compare_shahd.py

.PHONY: all all_cus clean dv_gen extract_hex convert_hex_files simv

# Step 0: install requirements
init:
	cd $(DV_DIR) && \
	pip3 install -r requirements.txt

# Step 1: Full flow
all: dv_gen extract_hex convert_hex_files simv compare
all_cus: custom_asmtest extract_hex convert_hex_files simv compare

# Step 2: riscv-dv generation
dv_gen:
	@echo "Running riscv-dv to generate test files..."
	cd $(DV_DIR) && \
	python3 run.py --test $(TEST_NAME) --simulator vcs --target $(TARGET)
	@echo "Test generation complete. (ELF is at $(RV_ELF))"

custom_asmtest:
	cd $(DV_DIR) && \
	python3 run.py --asm_test asm_cus_tests/asm_custom_test.S

# Step 3: Extract hex files from ELF
extract_hex: $(RV_ELF)
	@echo "Extracting instruction hex file from ELF (.o)..."
	$(OBJCOPY) -O verilog -j .text $(RV_ELF) $(INST_HEX)
	@echo "Extracting data hex file from ELF (.o)..."
	$(OBJCOPY) -O verilog -j .data  $(RV_ELF) $(DATA_HEX)

# Step 4: Convert hex files
convert_hex_files: $(INST_HEX) $(DATA_HEX)
	@echo "Converting instruction hex file..."
	$(CONVERT_HEX) $(INST_HEX) $(INST_CONV_HEX)
	@echo "Converting data hex file..."
	$(CONVERT_HEX) $(DATA_HEX) $(DATA_CONV_HEX)
	@echo "Conversion complete. Files available in $(OUT_DIR):"
	@echo "  Instruction: $(INST_CONV_HEX)"
	@echo "  Data:        $(DATA_CONV_HEX)"

# Step 5: Compile RTL with VCS
simv:
	cd $(CURDIR) && \
	vcs -full32 -sverilog -f filelist.f -o simv +lint=TFIPC-L +lint=PCWM -top $(TOP_MODULE_NAME)

# Step 6: Run simulation
$(CORE_LOG): $(INST_CONV_HEX) $(DATA_CONV_HEX) simv
	@echo "Running the VCS simulation to generate core.log ..."
	cd $(CURDIR) && \
	./simv # > sim_output.log
	cd $(DV_DIR)

# Step 7: Convert core log to CSV
$(CORE_CSV): $(CORE_LOG)
	$(CORE_LOG_2_CSV) --log $(CORE_LOG) --csv $(CORE_CSV)

# Step 8: Convert spike log to CSV
$(SPIKE_CSV): $(SPIKE_LOG)
	$(SPIKE_LOG_2_CSV) --log $(SPIKE_LOG) --csv $(SPIKE_CSV)

# Step 9: Compare traces
compare: $(SPIKE_CSV) $(CORE_CSV)
	sed -i '2d' $(SPIKE_CSV)
	sed -i '2d' $(CORE_CSV)
	$(COMPARE) --csv_file_1 $(SPIKE_CSV) --csv_file_2 $(CORE_CSV) --csv_name_1 spike --csv_name_2 core --float_tolerance $(TOLERANCE) > compare_output.log
	cat compare_output.log

# Optional: just compare
only_compare:
	$(COMPARE) --csv_file_1 $(SPIKE_CSV) --csv_file_2 $(CORE_CSV) --csv_name_1 spike --csv_name_2 core --float_tolerance $(TOLERANCE) > compare_output.log
	cat compare_output.log

# Optional: just compare and write all mismatches in a file
get_all_mismatches:
	$(COMPARE) --csv_file_1 $(SPIKE_CSV) --csv_file_2 $(CORE_CSV) --csv_name_1 spike --csv_name_2 core --float_tolerance $(TOLERANCE) --all_mismatches > compare_output.log
	@echo -e "\nDONE!"
	@echo "You can check all mismatch-cases in $(CURDIR)/compare_output.log file"

# Optional: just compare and write all mismatches in a file
get_all_mismatches_ignore_rm_error:
	$(COMPARE) --csv_file_1 $(SPIKE_CSV) --csv_file_2 $(CORE_CSV) --csv_name_1 spike --csv_name_2 core --float_tolerance $(TOLERANCE) --all_mismatches --ignore_rm_error > compare_output.log
	@echo -e "\nDONE!"
	@echo "You can check all mismatch-cases in $(CURDIR)/compare_output.log file"

# Optional: just compare with zero tolerance
zero_tolerance:
	$(COMPARE) --csv_file_1 $(SPIKE_CSV) --csv_file_2 $(CORE_CSV) --csv_name_1 spike --csv_name_2 core --float_tolerance 0.000000 > compare_output.log
	cat compare_output.log

# Optional: just compare all mismatches with zero tolerance
zero_tolerance_all:
	$(COMPARE) --csv_file_1 $(SPIKE_CSV) --csv_file_2 $(CORE_CSV) --csv_name_1 spike --csv_name_2 core --float_tolerance 0.000000 --all_mismatches > compare_output.log
	@echo -e "\nDONE!"
	@echo "You can check all mismatch-cases in $(CURDIR)/compare_output.log file"

# Optional: just compare all mismatches with zero tolerance
zero_tolerance_all_ignore_rm_error:
	$(COMPARE) --csv_file_1 $(SPIKE_CSV) --csv_file_2 $(CORE_CSV) --csv_name_1 spike --csv_name_2 core --float_tolerance 0.000000 --all_mismatches --ignore_rm_error > compare_output.log
	@echo -e "\nDONE!"
	@echo "You can check all mismatch-cases in $(CURDIR)/compare_output.log file"

# Optional: just compare with NaN cases
get_all_NaN:
	$(COMPARE) --csv_file_1 $(SPIKE_CSV) --csv_file_2 $(CORE_CSV) --csv_name_1 spike --csv_name_2 core --float_tolerance 0.00 --print_all_NaN > compare_output.log
	cat compare_output.log

# Clean everything
clean:
	rm -rf $(OUT_DIR)

# Save test results
save_results:
	mkdir -p $(SAVE_DIR)
	cp $(SPIKE_CSV) $(CORE_CSV) $(SPIKE_LOG) $(CORE_LOG) compare_output.log $(SAVE_DIR)
	@echo -e "\nThe results have been saved in the directory ${SAVE_DIR}"

# Help message
help:
	@echo ""
	@echo "=== Available Make Targets ==="
	@echo "make init              - install Python requirements"
	@echo "make all               - Full flow: generate, extract, convert, simulate, compare"
	@echo "make dv_gen            - Generate test using riscv-dv"
	@echo "make extract_hex       - Extract .text and .data sections from ELF"
	@echo "make convert_hex_files - Convert hex files to formatted output"
	@echo "make simv              - Compile RTL with VCS"
	@echo "make compare           - Compare spike and core traces"
	@echo "make clean             - Delete the output directory"
	@echo "make help              - Show this help message"
	@echo ""
