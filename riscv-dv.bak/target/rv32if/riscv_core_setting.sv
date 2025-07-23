/*
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//-----------------------------------------------------------------------------
// Processor feature configuration
//-----------------------------------------------------------------------------
// XLEN
parameter int XLEN = 32;

// Parameter for SATP mode, set to BARE if address translation is not supported
parameter satp_mode_t SATP_MODE = BARE;

// Supported Privileged mode
privileged_mode_t supported_privileged_mode[] = {MACHINE_MODE};

// // Unsupported instructions
riscv_instr_name_t unsupported_instr[$] = {
    // completely passed ...
    // FLW, FSW,  // to see it on .log file, you have to change function "decode_fload_insn" in "tracer.sv" file
    // FMIN_S, FMAX_S,
    // FEQ_S, FLT_S, FLE_S,
    // FMV_X_W, FMV_W_X,
    // FSGNJ_S, FSGNJN_S, FSGNJX_S,
    // FCLASS_S,

    // passed but not accurate ...
    FADD_S,
    FSUB_S,
    // FMUL_S,  // we're using "FP_final_multiplier.sv" (Nehal version) -> delete the 2nd one (FP_final_Multiplier.sv)
    FMADD_S, FMSUB_S, FNMSUB_S, FNMADD_S,
    
    // passed but there are some special cases with small numbers (subnormal) ...
    FCVT_W_S, FCVT_WU_S, FCVT_S_W, FCVT_S_WU,
    FSQRT_S,
    
    // failed ...
    FDIV_S,

    // ===========================================
    // instructions details ...
    // FLW,     // Load Word to FP register
    // FSW,     // Store Word from FP register
    // C_FLW,   // Compressed FLW
    // C_FSW,   // Compressed FSW
    // C_FLWSP, // Compressed FLW from SP
    // C_FSWSP, // Compressed FSW to SP
    // FADD_S,
    // FSUB_S,
    // FMUL_S,
    // FDIV_S,
    // FSQRT_S,
    // FSGNJ_S,
    // FSGNJN_S,
    // FSGNJX_S,
    // FMIN_S,
    // FMAX_S,
    // FCVT_W_S,     // Convert FP to signed int
    // FCVT_WU_S,    // Convert FP to unsigned int
    // FCVT_S_W,     // Convert signed int to FP
    // FCVT_S_WU,    // Convert unsigned int to FP
    // FMV_X_W,      // Move from FP to int
    // FMV_W_X,      // Move from int to FP
    // FCLASS_S,     // Classify FP value
    // FEQ_S,
    // FLT_S,
    // FLE_S,
    // FMADD_S,
    // FMSUB_S,
    // FNMSUB_S,
    // FNMADD_S,

    // ==========================================
    // unsupported in our system ...
    CSRRW, CSRRS, CSRRC, CSRRWI, CSRRSI, CSRRCI, 
    // CSRW, CSRR,  // not working because it's not decalred
    C_FLW, C_FSW, C_FLWSP, C_FSWSP
};



// ISA supported by the processor
riscv_instr_group_t supported_isa[$] = { RV32I, RV32F};
// Interrupt mode support
mtvec_mode_t supported_interrupt_mode[$] = {DIRECT, VECTORED};

// The number of interrupt vectors to be generated, only used if VECTORED interrupt mode is
// supported
int max_interrupt_vector_num = 16;

// Physical memory protection support
bit support_pmp = 0;

// Enhanced physical memory protection support
bit support_epmp = 0;

// Debug mode support
bit support_debug_mode = 0;

// Support delegate trap to user mode
bit support_umode_trap = 0;

// Support sfence.vma instruction
bit support_sfence = 0;

// Support unaligned load / store
bit support_unaligned_load_store = 1'b1;

// GPR setting
parameter int NUM_FLOAT_GPR = 32;
parameter int NUM_GPR = 32;
parameter int NUM_VEC_GPR = 32;

// ----------------------------------------------------------------------------
// Vector extension configuration
// ----------------------------------------------------------------------------

// Parameter for vector extension
parameter int VECTOR_EXTENSION_ENABLE = 0;

parameter int VLEN = 512;

// Maximum size of a single vector element
parameter int ELEN = 32;

// Minimum size of a sub - element, which must be at most 8 - bits.
parameter int SELEN = 8;

// Maximum size of a single vector element(encoded in vsew format)
parameter int VELEN = int'($ln(ELEN) /$ln(2)) - 3;

// Maxium LMUL supported by the core
parameter int MAX_LMUL = 8;

// ----------------------------------------------------------------------------
// Multi - harts configuration
// ----------------------------------------------------------------------------

// Number of harts
parameter int NUM_HARTS = 1;

// ----------------------------------------------------------------------------
// Previleged CSR implementation
// ----------------------------------------------------------------------------

// Implemented previlieged CSR list
`ifdef DSIM
privileged_reg_t implemented_csr[] = {
`else
const privileged_reg_t implemented_csr[] = {
`endif
    // Machine mode mode CSR
    MVENDORID, // Vendor ID
    MARCHID, // Architecture ID
    MIMPID, // Implementation ID
    MHARTID, // Hardware thread ID
    MSTATUS, // Machine status
    MISA, // ISA and extensions
    MIE, // Machine interrupt - enable register
    MTVEC, // Machine trap - handler base address
    MCOUNTEREN, // Machine counter enable
    MSCRATCH, // Scratch register for machine trap handlers
    MEPC, // Machine exception program counter
    MCAUSE, // Machine trap cause
    MTVAL, // Machine bad address or instruction
    MIP // Machine interrupt pending
};

// Implementation - specific custom CSRs
bit[11:0] custom_csr[] = {
};

// ----------------------------------------------------------------------------
// Supported interrupt / exception setting, used for functional coverage
// ----------------------------------------------------------------------------

`ifdef DSIM
interrupt_cause_t implemented_interrupt[] = {
`else
const interrupt_cause_t implemented_interrupt[] = {
`endif
    M_SOFTWARE_INTR,
    M_TIMER_INTR,
    M_EXTERNAL_INTR
};

`ifdef DSIM
exception_cause_t implemented_exception[] = {
`else
const exception_cause_t implemented_exception[] = {
`endif
    INSTRUCTION_ACCESS_FAULT,
    ILLEGAL_INSTRUCTION,
    BREAKPOINT,
    LOAD_ADDRESS_MISALIGNED,
    LOAD_ACCESS_FAULT,
    ECALL_MMODE
};