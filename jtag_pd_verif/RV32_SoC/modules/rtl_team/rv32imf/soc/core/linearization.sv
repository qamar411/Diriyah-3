module linearization (

        input clk,
        input rst,
        input debug_on,
        input flush_flag,
        input ex_busy,
        input multi_pipe,
        output logic empty_core,
        output logic line_stall,
        output logic line_clr

);
    enum logic [1:0] {NORMAL, DEBUG, CHECK_PIPE} pstate, nstate;

    //CLOCKED LOGIC 
    always_ff@(posedge clk or negedge rst)
    begin
        if(~rst)
            pstate <= NORMAL;
        else
            pstate <= nstate;
    end

    // NEXT STATE LOGIC 
    always_comb
    begin
        case(pstate)
            NORMAL: nstate = flush_flag? CHECK_PIPE:debug_on ?DEBUG:NORMAL;
            DEBUG: nstate = flush_flag? CHECK_PIPE:debug_on ?DEBUG:NORMAL;
            CHECK_PIPE:	nstate = ex_busy? CHECK_PIPE:debug_on?DEBUG:NORMAL;
            default: nstate = NORMAL;
        endcase
    end

    //OUTPUT LOGIC 
    assign empty_core= ~ex_busy ;  // TODO: edge-case: if rd=x0 and multi_pipe=1, then it won't stall because x0 always not busy
    assign line_stall= (ex_busy  | multi_pipe) &(pstate!=NORMAL);
    assign line_clr  = multi_pipe&(pstate!=NORMAL);

endmodule : linearization
