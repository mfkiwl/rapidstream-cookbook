// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module vecp_mux_vecp_mux_Pipeline_q (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        sext_ln451,
        q_in1_s_dout,
        q_in1_s_empty_n,
        q_in1_s_read,
        q_out_din,
        q_out_full_n,
        q_out_write
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [28:0] sext_ln451;
input  [512:0] q_in1_s_dout;
input   q_in1_s_empty_n;
output   q_in1_s_read;
output  [512:0] q_out_din;
input   q_out_full_n;
output   q_out_write;

reg ap_idle;
reg q_in1_s_read;
reg q_out_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] icmp_ln128_fu_97_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [31:0] i_fu_46;
wire   [31:0] i_6_fu_126_p2;
wire    ap_loop_init;
reg   [31:0] ap_sig_allocacmp_i_5;
wire   [0:0] and_ln131_fu_103_p2;
wire   [0:0] tmp_nbreadreq_fu_56_p3;
wire  signed [31:0] sext_ln451_cast_fu_85_p1;
wire   [0:0] and_ln131_fu_103_p1;
wire   [511:0] trunc_ln146_fu_113_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

vecp_mux_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        if (((1'd1 == and_ln131_fu_103_p2) & (icmp_ln128_fu_97_p2 == 1'd1))) begin
            i_fu_46 <= i_6_fu_126_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_46 <= 32'd0;
        end
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln128_fu_97_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_i_5 = 32'd0;
    end else begin
        ap_sig_allocacmp_i_5 = i_fu_46;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln131_fu_103_p2) & (q_in1_s_empty_n == 1'b1) & (icmp_ln128_fu_97_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        q_in1_s_read = 1'b1;
    end else begin
        q_in1_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln131_fu_103_p2) & (q_out_full_n == 1'b1) & (icmp_ln128_fu_97_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        q_out_write = 1'b1;
    end else begin
        q_out_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign and_ln131_fu_103_p1 = q_out_full_n;

assign and_ln131_fu_103_p2 = (tmp_nbreadreq_fu_56_p3 & and_ln131_fu_103_p1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign i_6_fu_126_p2 = (ap_sig_allocacmp_i_5 + 32'd1);

assign icmp_ln128_fu_97_p2 = (($signed(ap_sig_allocacmp_i_5) < $signed(sext_ln451_cast_fu_85_p1)) ? 1'b1 : 1'b0);

assign q_out_din = {{1'd0}, {trunc_ln146_fu_113_p1}};

assign sext_ln451_cast_fu_85_p1 = $signed(sext_ln451);

assign tmp_nbreadreq_fu_56_p3 = q_in1_s_empty_n;

assign trunc_ln146_fu_113_p1 = q_in1_s_dout[511:0];

endmodule //vecp_mux_vecp_mux_Pipeline_q
