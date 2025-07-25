/* wb_mux. Part of wb_intercon
 *
 * ISC License
 *
 * Copyright (C) 2013-2019  Olof Kindgren <olof.kindgren@gmail.com>
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

/*
 Wishbone multiplexer, burst-compatible

 Simple mux with an arbitrary number of slaves.

 The parameters MATCH_ADDR and MATCH_MASK are flattened arrays
 aw*NUM_SLAVES sized arrays that are used to calculate the
 active slave. slave i is selected when
 (wb_adr_i & MATCH_MASK[(i+1)*aw-1:i*aw] is equal to
 MATCH_ADDR[(i+1)*aw-1:i*aw]
 If several regions are overlapping, the slave with the lowest
 index is selected. This can be used to have fallback
 functionality in the last slave, in case no other slave was
 selected.

 If no match is found, the wishbone transaction will stall and
 an external watchdog is required to abort the transaction

 Todo:
 Registered master/slave connections
 Rewrite with System Verilog 2D arrays when tools support them
*/

`default_nettype wire

module wb_mux
  #(parameter dw = 32,        // Data width
    parameter aw = 32,        // Address width
    parameter num_slaves = 2, // Number of slaves
    parameter [num_slaves*aw-1:0] MATCH_ADDR = 0,
    parameter [num_slaves*aw-1:0] MATCH_MASK = 0)

   (input                      wb_clk_i,
    input 		       wb_rst_i,

    // Master Interface
    input [aw-1:0] 	       wbm_adr_i,
    input [dw-1:0] 	       wbm_dat_i,
    input [3:0] 	       wbm_sel_i,
    input 		       wbm_we_i,
    input 		       wbm_cyc_i,
    input 		       wbm_stb_i,
   //  input [2:0] 	       wbm_cti_i, // Qamar delete it
   //  input [1:0] 	       wbm_bte_i, // Qamar delete it
    output [dw-1:0] 	       wbm_dat_o,
    output 		       wbm_ack_o,
    output 		       wbm_err_o,
    output 		       wbm_rty_o,
    // Wishbone Slave interface
    output [num_slaves*aw-1:0] wbs_adr_o,
    output [num_slaves*dw-1:0] wbs_dat_o,
    output [num_slaves*4-1:0]  wbs_sel_o,
    output [num_slaves-1:0]    wbs_we_o,
    output [num_slaves-1:0]    wbs_cyc_o,
    output [num_slaves-1:0]    wbs_stb_o,
   //  output [num_slaves*3-1:0]  wbs_cti_o, // Qamar delete it
   //  output [num_slaves*2-1:0]  wbs_bte_o, // Qamar delete it
    input [num_slaves*dw-1:0]  wbs_dat_i,
    input [num_slaves-1:0]     wbs_ack_i,
    input [num_slaves-1:0]     wbs_err_i,
    input [num_slaves-1:0]     wbs_rty_i);

///////////////////////////////////////////////////////////////////////////////
// Master/slave connection
///////////////////////////////////////////////////////////////////////////////

   //Use parameter instead of localparam to work around a bug in Xilinx ISE
   localparam slave_sel_bits = num_slaves > 1 ? $clog2(num_slaves) : 1;

   reg  			 wbm_err;
   wire [slave_sel_bits-1:0] 	 slave_sel;
   reg  [slave_sel_bits-1:0] 	 slave_sel_ff;
   wire [num_slaves-1:0] 	 match;

   genvar 			 idx;
   generate
      for(idx=0; idx<num_slaves ; idx=idx+1) begin : addr_match
	 assign match[idx] = (wbm_adr_i & MATCH_MASK[idx*aw+:aw]) == MATCH_ADDR[idx*aw+:aw];
      end
   endgenerate

//
// Find First 1 - Start from MSB and count downwards, returns 0 when no bit set
//
   function [slave_sel_bits-1:0] ff1;
      input [num_slaves-1:0] in;
      integer 		     i;

      begin
	 ff1 = 0;
	 for (i = num_slaves-1; i >= 0; i=i-1) begin
	    if (in[i])
/* verilator lint_off WIDTH */
	      ff1 = i;
/* verilator lint_on WIDTH */
	 end
      end
   endfunction

   assign slave_sel = ff1(match);


   always @(posedge wb_clk_i)
     wbm_err <= wbm_cyc_i & !(|match);

   assign wbs_adr_o = {num_slaves{wbm_adr_i}};
   assign wbs_dat_o = {num_slaves{wbm_dat_i}};
   assign wbs_sel_o = {num_slaves{wbm_sel_i}};
   assign wbs_we_o  = {num_slaves{wbm_we_i}};
/* verilator lint_off WIDTH */

   assign wbs_cyc_o = match & (wbm_cyc_i << slave_sel);
/* verilator lint_on WIDTH */
   assign wbs_stb_o = {num_slaves{wbm_stb_i}};

   // assign wbs_cti_o = {num_slaves{wbm_cti_i}}; // Qamar delete it
   // assign wbs_bte_o = {num_slaves{wbm_bte_i}}; // Qamar delete it


   // assign wbm_dat_o = wbs_dat_i[slave_sel*dw+:dw];
   // assign wbm_ack_o = wbs_ack_i[slave_sel];
   // assign wbm_err_o = wbs_err_i[slave_sel] | wbm_err;
   // assign wbm_rty_o = wbs_rty_i[slave_sel];

   always @(posedge wb_clk_i) slave_sel_ff <= slave_sel;
   // always @(posedge wb_clk_i) wbs_dat_i_ff <= wbs_dat_i; // and others it won't change anthing i think


   assign wbm_dat_o = wbs_dat_i[slave_sel_ff*dw+:dw];
   assign wbm_ack_o = wbs_ack_i[slave_sel_ff];
   assign wbm_err_o = wbs_err_i[slave_sel_ff] | wbm_err;
   assign wbm_rty_o = wbs_rty_i[slave_sel_ff];

endmodule
