import riscv_types::*;
`timescale 1ns / 1ps
// `define USE_RS3=1;  // for RTL: uncomment to use it


// Define the RVFI output structure type
typedef struct packed {
    logic rvfi_branch_hazard;
    logic rvfi_valid;
    logic finished_flag;  // for RTL team
    logic [31:0] rvfi_insntruction;
    logic [31:0] rvfi_rd_wdata;     // result (p_mux)
    logic [4:0]  rvfi_rs1_address;
    logic [4:0]  rvfi_rs2_address;
    logic [31:0] rvfi_rs1_rdata;
    logic [31:0] rvfi_rs2_rdata;
    `ifdef USE_RS3
    logic [4:0]  rvfi_rs3_address;
    logic [31:0] rvfi_rs3_rdata;
    `endif
    logic [4:0]  rvfi_rd_address;  // ID stage
    logic [31:0] rvfi_pc_id;    // rvfi_pc_rdata
    logic [31:0] rvfi_next_pc;  // pc+4  or next pc if jump
    alu_t alu_ctrl_id;
    // logic [31:0] rvfi_mem_address;
    // logic [ 3:0] rvfi_mem_rmask;  // we don't have 
    // logic [ 3:0] rvfi_mem_wmask;  // we don't have
    // logic [31:0] rvfi_mem_wdata;
    // logic [31:0] rvfi_mem_rdata;
} rvfi_trace_t;


module rvfi_tracker_delay(
    input  logic clk,
    input  logic reset_n,
    
    // Instruction information inputs
    input  alu_t alu_ctrl_id,
    input  logic [31:0] inst_id,
    input  logic [4:0]  rs1_address_id,
    input  logic [4:0]  rs2_address_id,
    input  logic [31:0] reg_rdata1_id,
    input  logic [31:0] reg_rdata2_id,
    `ifdef USE_RS3
    input  logic [4:0]  rs3_address_id,
    input  logic [31:0] reg_rdata3_id,
    `endif
    input  logic [4:0]  rd_address_id,
    input  logic [31:0] p_mux_result,  // "rvfi_rd_wdata"  -> result from p_mux
    input  logic [31:0] current_pc_id,
    input  logic [31:0] p_mux_pc_plus_4,  // PC+4 from p_mux signals
    
    input logic pc_sel_mem,  // not used
    input logic [31:0] pc_jump_mem,  // not used
    input logic mem_write_mem,  // control signal used with store instructions
    input logic [31:0] mem_wdata_mem, // value of writing on DMEM (writing data)
    input logic mem_to_reg_mem,  // control signal used with load instructions (mem stage)
    input logic mem_to_reg_wb, // control signal used with load instructions (wb stage)
    input logic [31:0] reg_wdata_wb, // value of loaded-data from DMEM to reg_file (loading data -- wb stage) 

    // signals for RTL team
    input logic stalled,
    input logic branch_hazard_mem,
    input logic [31:0] pc_plus_4_mem,
    
    // RVFI output interface
    output logic        rvfi_valid,
    output logic [31:0] rvfi_insn,
    output logic [4:0]  rvfi_rs1_addr,
    output logic [4:0]  rvfi_rs2_addr,
    output logic [31:0] rvfi_rs1_rdata,
    output logic [31:0] rvfi_rs2_rdata,
    `ifdef USE_RS3
    output logic [4:0]  rvfi_rs3_addr,
    output logic [31:0] rvfi_rs3_rdata,
    `endif
    output logic [4:0]  rvfi_rd_addr,  // rd
    output logic [31:0] rvfi_rd_wdata, // result
    output logic [31:0] rvfi_pc_rdata, // current pc
    output logic [31:0] rvfi_pc_wdata,  // next pc

    output logic [31:0] rvfi_mem_addr,
    output logic [3:0] rvfi_mem_rmask,  // we don't have 
    output logic [3:0] rvfi_mem_wmask,  // we don't have
    output logic [31:0] rvfi_mem_wdata,
    output logic [31:0] rvfi_mem_rdata
);

    // Declare a dynamic array of rvfi_trace_t to store instruction traces
    rvfi_trace_t inst_file[$];  // Dynamic array to hold instruction traces     
    rvfi_trace_t new_trace;

    // debugging signals
    logic inst_got_result, inst_out_finish_flag;
    logic valid_inst;
    logic tracer_branch_hazard;
    logic branch_hazard_occured;
    logic [31:0] index_written;
    logic [31:0] pc_index_written;

    // signals for lw instructions
    logic [31:0] pc_plus_4_wb_ff;
    logic load_inst_got_result_wb;
    always @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            pc_plus_4_wb_ff  <= 'b0;
        end else begin
            pc_plus_4_wb_ff <= p_mux_pc_plus_4;
        end
    end

    // int ctr;
    logic inst_0_got_result;
    logic inst_0_load_got_result;
    logic invalid_inst;
    logic wb_pc_matched, wb_pc_0_matched;
    logic [31:0] pc_wb_now, pc_inst_0;
    logic inst_0_flag;

    // writing to the dynamic array
    always @(posedge clk) begin
    //    if (stalled) begin
    //        rvfi_valid = 'b0;
    //        rvfi_insn = 'b0;
    //        rvfi_rs1_addr = 'b0;
    //        rvfi_rs2_addr = 'b0;
    //        rvfi_rs3_addr = 'b0;  // handled by alu_ctrl
    //        rvfi_rs1_rdata ='b0;
    //        rvfi_rs2_rdata ='b0;
    //        rvfi_rs3_rdata ='b0;  // handled by alu_ctrl
    //        rvfi_rd_addr = 'b0;
    //        rvfi_rd_wdata = 'b0;  // result
    //        rvfi_pc_rdata = 'b0;
    //        rvfi_pc_wdata = 'b0;  // next pc
    //    end else if (!stalled) begin

            // Fill the new_trace with information
        invalid_inst = (inst_id==32'd0);
        if (~invalid_inst) begin  // not invalid
            rvfi_valid = 1'b1;  // valid instruction
            new_trace.rvfi_valid = 1'b1;
            new_trace.rvfi_insntruction = inst_id;
            new_trace.rvfi_rs1_address = rs1_address_id;
            new_trace.rvfi_rs2_address = rs2_address_id;
            new_trace.rvfi_rs1_rdata = reg_rdata1_id;
            new_trace.rvfi_rs2_rdata = reg_rdata2_id;
            `ifdef USE_RS3
            new_trace.rvfi_rs3_address = rs3_address_id;
            new_trace.rvfi_rs3_rdata = reg_rdata3_id;
            `endif
            new_trace.rvfi_rd_address = rd_address_id;
            new_trace.rvfi_rd_wdata = 1'b0;  // result
            new_trace.rvfi_pc_id = current_pc_id;
            new_trace.rvfi_next_pc = p_mux_pc_plus_4;
            new_trace.alu_ctrl_id = alu_ctrl_id;
            new_trace.finished_flag = 1'b0; // indicates that instruction has finished
            new_trace.rvfi_branch_hazard = 1'b0;
            
            valid_inst = new_trace.rvfi_insntruction!=32'b0;
            if( valid_inst ) begin
                // if(ctr>0)
                inst_file.push_back(new_trace);  // Append to the end of the dynamic array
            end
            // ctr++;
        end

            if(inst_file.size()>1) begin 
                if (inst_file[inst_file.size()-1].rvfi_pc_id==inst_file[inst_file.size()-2].rvfi_pc_id)
                    inst_file.delete(inst_file.size()-1);
            end

            inst_0_got_result = p_mux_pc_plus_4-4==inst_file[0].rvfi_pc_id   &&   inst_file[0].finished_flag==0;

            pc_wb_now = pc_plus_4_wb_ff - 4;
            pc_inst_0 = inst_file[0].rvfi_pc_id;
            inst_0_flag = inst_file[0].finished_flag;
            wb_pc_0_matched = (pc_plus_4_wb_ff-4==inst_file[0].rvfi_pc_id);
            inst_0_load_got_result = pc_plus_4_wb_ff-4==inst_file[0].rvfi_pc_id   &&   inst_file[0].finished_flag==0 && mem_to_reg_wb;

            // put that instruction as "ready to verify" if its result received
            for (int i=0; i<inst_file.size(); i++) begin

                // logic for load instructions (WB-stage)
                wb_pc_matched = pc_plus_4_wb_ff-4==inst_file[i].rvfi_pc_id;
                // load_inst_got_result_wb = pc_plus_4_wb_ff-4==inst_file[i].rvfi_pc_id   &&   inst_file[i].finished_flag==0 && mem_to_reg_wb;
                load_inst_got_result_wb = wb_pc_matched   &&   inst_file[i].finished_flag==0 && mem_to_reg_wb;
                if (load_inst_got_result_wb) begin
                    inst_file[i].rvfi_rd_wdata = reg_wdata_wb;
                    inst_file[i].finished_flag = 1'b1;
                end

                // logic for results of other instructoins (MEM-stage)
                inst_got_result = p_mux_pc_plus_4-4==inst_file[i].rvfi_pc_id   &&   inst_file[i].finished_flag==0;
                if (inst_got_result) begin   // same instruction and not finished
                    inst_file[i].rvfi_rd_wdata = mem_to_reg_mem?  1'b0 : (mem_write_mem? mem_wdata_mem : p_mux_result);  // it comes from mem-stage
                    inst_file[i].finished_flag = mem_to_reg_mem? 1'b0 : 1'b1;  // if load instruction applied, wait to take value from wb stage
                    inst_file[i].rvfi_branch_hazard = branch_hazard_mem;
                    index_written= i;
                    pc_index_written = p_mux_pc_plus_4 - 4;
                    break;
                end
            end
    //    end  // End writing logic
        
        // // debugging ...
        // $display("time: %d",$time);
        // // foreach(inst_file[i]) begin
        // for(int i=0; i<5; i++) begin
        //     $display(" element %d: pc = %h  operation = %s --rs1 =%h  --rs2 =%h  --rs3=%h --result=%h  --F= %b --pc = %h , --branch_hazard = %b",
        //         i,
        //         inst_file[i].rvfi_pc_id,
        //         inst_file[i].alu_ctrl_id.name(),
        //         inst_file[i].rvfi_rs1_rdata,
        //         inst_file[i].rvfi_rs2_rdata,
        //         `ifdef USE_RS3
        //         inst_file[i].rvfi_rs3_rdata,
        //         `else
        //         5'd0,
        //         `endif
        //         inst_file[i].rvfi_rd_wdata,
        //         inst_file[i].finished_flag,
        //         inst_file[i].rvfi_pc_id,
        //         inst_file[i].rvfi_branch_hazard);
        // end
        // $display("====================================");  // End debugging
 

        // regadless if the system stalled or not, read informations of the first instruction entered (FIFO memory)
        inst_out_finish_flag = inst_file[0].finished_flag;

        // read instruction information
        if (inst_out_finish_flag) begin
            rvfi_valid = inst_file[0].rvfi_valid;
            rvfi_insn = inst_file[0].rvfi_insntruction;
            rvfi_rs1_addr = inst_file[0].rvfi_rs1_address;
            rvfi_rs2_addr = inst_file[0].rvfi_rs2_address;
            rvfi_rs1_rdata = inst_file[0].rvfi_rs1_rdata;
            rvfi_rs2_rdata = inst_file[0].rvfi_rs2_rdata;
            `ifdef USE_RS3
            rvfi_rs3_addr = inst_file[0].rvfi_rs3_address;  // handled by alu_ctrl
            rvfi_rs3_rdata = inst_file[0].rvfi_rs3_rdata;  // handled by alu_ctrl
            `endif
            rvfi_rd_addr = inst_file[0].rvfi_rd_address;
            rvfi_rd_wdata = inst_file[0].rvfi_rd_wdata;
            rvfi_pc_rdata = inst_file[0].rvfi_pc_id;
            rvfi_pc_wdata = inst_file[0].rvfi_next_pc;
            tracer_branch_hazard = inst_file[0].rvfi_branch_hazard;
            
            // remove the instruction has read
            inst_file.pop_front();
            
            // remove the next skipped instruction instructions if branch or jump applied
            if (tracer_branch_hazard == 1'b1) begin
                inst_file.pop_front();
                inst_file.pop_front();
            end
            
        end  // end reading logic
        else begin
            rvfi_valid = 'b0;
            rvfi_insn = 'b0;
            rvfi_rs1_addr = 'b0;
            rvfi_rs2_addr = 'b0;
            rvfi_rs1_rdata ='b0;
            rvfi_rs2_rdata ='b0;
            `ifdef USE_RS3
            rvfi_rs3_addr = 'b0;  // handled by alu_ctrl
            rvfi_rs3_rdata ='b0;  // handled by alu_ctrl
            `endif
            rvfi_rd_addr = 'b0;
            rvfi_rd_wdata = 'b0;  // result
            rvfi_pc_rdata = 'b0;
            rvfi_pc_wdata = 'b0;  // next pc
        end
    end  // End always block
    
endmodule