// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module kernel3_C_drain_IO_L1_out_39_Pipeline_VITIS_LOOP_994_1_VITIS_LOOP_996_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        fifo_C_drain_PE_9_1107_dout,
        fifo_C_drain_PE_9_1107_num_data_valid,
        fifo_C_drain_PE_9_1107_fifo_cap,
        fifo_C_drain_PE_9_1107_empty_n,
        fifo_C_drain_PE_9_1107_read,
        local_C_V_address0,
        local_C_V_ce0,
        local_C_V_q0,
        local_C_V_address1,
        local_C_V_ce1,
        local_C_V_we1,
        local_C_V_d1
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] fifo_C_drain_PE_9_1107_dout;
input  [1:0] fifo_C_drain_PE_9_1107_num_data_valid;
input  [1:0] fifo_C_drain_PE_9_1107_fifo_cap;
input   fifo_C_drain_PE_9_1107_empty_n;
output   fifo_C_drain_PE_9_1107_read;
output  [8:0] local_C_V_address0;
output   local_C_V_ce0;
input  [63:0] local_C_V_q0;
output  [8:0] local_C_V_address1;
output   local_C_V_ce1;
output   local_C_V_we1;
output  [63:0] local_C_V_d1;

reg ap_idle;
reg fifo_C_drain_PE_9_1107_read;
reg local_C_V_ce0;
reg local_C_V_ce1;
reg local_C_V_we1;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1039_fu_123_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    fifo_C_drain_PE_9_1107_blk_n;
wire    ap_block_pp0_stage0;
reg    ap_block_pp0_stage0_11001;
wire   [3:0] trunc_ln1039_fu_161_p1;
reg   [3:0] trunc_ln1039_reg_279;
reg   [4:0] conv_i65_i_mid2_v_reg_284;
wire   [0:0] trunc_ln1039_13_fu_183_p1;
reg   [0:0] trunc_ln1039_13_reg_289;
reg   [0:0] trunc_ln1039_13_reg_289_pp0_iter1_reg;
reg   [8:0] local_C_V_addr_reg_295;
reg   [8:0] local_C_V_addr_reg_295_pp0_iter2_reg;
wire   [31:0] buf_data_split_V_77_fu_233_p3;
reg   [31:0] buf_data_split_V_77_reg_301;
wire   [31:0] buf_data_split_V_78_fu_240_p3;
reg   [31:0] buf_data_split_V_78_reg_306;
wire   [63:0] zext_ln1001_fu_214_p1;
reg   [4:0] c7_V_fu_70;
wire   [4:0] add_ln840_36_fu_187_p2;
wire    ap_loop_init;
reg   [4:0] ap_sig_allocacmp_c7_V_load;
reg   [6:0] c6_V_fu_74;
wire   [6:0] select_ln1039_47_fu_165_p3;
reg   [6:0] ap_sig_allocacmp_c6_V_load;
reg   [10:0] indvar_flatten_fu_78;
wire   [10:0] add_ln1039_fu_129_p2;
reg   [10:0] ap_sig_allocacmp_indvar_flatten_load;
wire   [0:0] icmp_ln103932_fu_147_p2;
wire   [4:0] select_ln1039_fu_153_p3;
wire   [6:0] add_ln840_fu_141_p2;
wire   [8:0] tmp_fu_208_p3;
wire   [31:0] buf_data_split_V_73_fu_223_p4;
wire   [31:0] buf_data_split_V_fu_219_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_done_reg = 1'b0;
end

kernel3_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln1039_fu_123_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            c6_V_fu_74 <= select_ln1039_47_fu_165_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            c6_V_fu_74 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln1039_fu_123_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            c7_V_fu_70 <= add_ln840_36_fu_187_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            c7_V_fu_70 <= 5'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln1039_fu_123_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            indvar_flatten_fu_78 <= add_ln1039_fu_129_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_78 <= 11'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        local_C_V_addr_reg_295 <= zext_ln1001_fu_214_p1;
        trunc_ln1039_13_reg_289_pp0_iter1_reg <= trunc_ln1039_13_reg_289;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        buf_data_split_V_77_reg_301 <= buf_data_split_V_77_fu_233_p3;
        buf_data_split_V_78_reg_306 <= buf_data_split_V_78_fu_240_p3;
        local_C_V_addr_reg_295_pp0_iter2_reg <= local_C_V_addr_reg_295;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1039_fu_123_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        conv_i65_i_mid2_v_reg_284 <= {{select_ln1039_47_fu_165_p3[5:1]}};
        trunc_ln1039_13_reg_289 <= trunc_ln1039_13_fu_183_p1;
        trunc_ln1039_reg_279 <= trunc_ln1039_fu_161_p1;
    end
end

always @ (*) begin
    if (((icmp_ln1039_fu_123_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_c6_V_load = 7'd0;
    end else begin
        ap_sig_allocacmp_c6_V_load = c6_V_fu_74;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_c7_V_load = 5'd0;
    end else begin
        ap_sig_allocacmp_c7_V_load = c7_V_fu_70;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten_load = 11'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_78;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        fifo_C_drain_PE_9_1107_blk_n = fifo_C_drain_PE_9_1107_empty_n;
    end else begin
        fifo_C_drain_PE_9_1107_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        fifo_C_drain_PE_9_1107_read = 1'b1;
    end else begin
        fifo_C_drain_PE_9_1107_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_C_V_ce0 = 1'b1;
    end else begin
        local_C_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        local_C_V_ce1 = 1'b1;
    end else begin
        local_C_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        local_C_V_we1 = 1'b1;
    end else begin
        local_C_V_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln1039_fu_129_p2 = (ap_sig_allocacmp_indvar_flatten_load + 11'd1);

assign add_ln840_36_fu_187_p2 = (select_ln1039_fu_153_p3 + 5'd1);

assign add_ln840_fu_141_p2 = (ap_sig_allocacmp_c6_V_load + 7'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((fifo_C_drain_PE_9_1107_empty_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((fifo_C_drain_PE_9_1107_empty_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = (fifo_C_drain_PE_9_1107_empty_n == 1'b0);
end

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign buf_data_split_V_73_fu_223_p4 = {{local_C_V_q0[63:32]}};

assign buf_data_split_V_77_fu_233_p3 = ((trunc_ln1039_13_reg_289_pp0_iter1_reg[0:0] == 1'b1) ? fifo_C_drain_PE_9_1107_dout : buf_data_split_V_73_fu_223_p4);

assign buf_data_split_V_78_fu_240_p3 = ((trunc_ln1039_13_reg_289_pp0_iter1_reg[0:0] == 1'b1) ? buf_data_split_V_fu_219_p1 : fifo_C_drain_PE_9_1107_dout);

assign buf_data_split_V_fu_219_p1 = local_C_V_q0[31:0];

assign icmp_ln103932_fu_147_p2 = ((ap_sig_allocacmp_c7_V_load == 5'd16) ? 1'b1 : 1'b0);

assign icmp_ln1039_fu_123_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 11'd1024) ? 1'b1 : 1'b0);

assign local_C_V_address0 = zext_ln1001_fu_214_p1;

assign local_C_V_address1 = local_C_V_addr_reg_295_pp0_iter2_reg;

assign local_C_V_d1 = {{buf_data_split_V_77_reg_301}, {buf_data_split_V_78_reg_306}};

assign select_ln1039_47_fu_165_p3 = ((icmp_ln103932_fu_147_p2[0:0] == 1'b1) ? add_ln840_fu_141_p2 : ap_sig_allocacmp_c6_V_load);

assign select_ln1039_fu_153_p3 = ((icmp_ln103932_fu_147_p2[0:0] == 1'b1) ? 5'd0 : ap_sig_allocacmp_c7_V_load);

assign tmp_fu_208_p3 = {{trunc_ln1039_reg_279}, {conv_i65_i_mid2_v_reg_284}};

assign trunc_ln1039_13_fu_183_p1 = select_ln1039_47_fu_165_p3[0:0];

assign trunc_ln1039_fu_161_p1 = select_ln1039_fu_153_p3[3:0];

assign zext_ln1001_fu_214_p1 = tmp_fu_208_p3;

endmodule //kernel3_C_drain_IO_L1_out_39_Pipeline_VITIS_LOOP_994_1_VITIS_LOOP_996_2
