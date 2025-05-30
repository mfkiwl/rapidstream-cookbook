`timescale 1 ns / 1 ps
// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

module kernel3_B_IO_L3_in_Pipeline_VITIS_LOOP_267_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_gmem_B_AWVALID,
        m_axi_gmem_B_AWREADY,
        m_axi_gmem_B_AWADDR,
        m_axi_gmem_B_AWID,
        m_axi_gmem_B_AWLEN,
        m_axi_gmem_B_AWSIZE,
        m_axi_gmem_B_AWBURST,
        m_axi_gmem_B_AWLOCK,
        m_axi_gmem_B_AWCACHE,
        m_axi_gmem_B_AWPROT,
        m_axi_gmem_B_AWQOS,
        m_axi_gmem_B_AWREGION,
        m_axi_gmem_B_AWUSER,
        m_axi_gmem_B_WVALID,
        m_axi_gmem_B_WREADY,
        m_axi_gmem_B_WDATA,
        m_axi_gmem_B_WSTRB,
        m_axi_gmem_B_WLAST,
        m_axi_gmem_B_WID,
        m_axi_gmem_B_WUSER,
        m_axi_gmem_B_ARVALID,
        m_axi_gmem_B_ARREADY,
        m_axi_gmem_B_ARADDR,
        m_axi_gmem_B_ARID,
        m_axi_gmem_B_ARLEN,
        m_axi_gmem_B_ARSIZE,
        m_axi_gmem_B_ARBURST,
        m_axi_gmem_B_ARLOCK,
        m_axi_gmem_B_ARCACHE,
        m_axi_gmem_B_ARPROT,
        m_axi_gmem_B_ARQOS,
        m_axi_gmem_B_ARREGION,
        m_axi_gmem_B_ARUSER,
        m_axi_gmem_B_RVALID,
        m_axi_gmem_B_RREADY,
        m_axi_gmem_B_RDATA,
        m_axi_gmem_B_RLAST,
        m_axi_gmem_B_RID,
        m_axi_gmem_B_RFIFONUM,
        m_axi_gmem_B_RUSER,
        m_axi_gmem_B_RRESP,
        m_axi_gmem_B_BVALID,
        m_axi_gmem_B_BREADY,
        m_axi_gmem_B_BRESP,
        m_axi_gmem_B_BID,
        m_axi_gmem_B_BUSER,
        fifo_B_B_IO_L2_in_016_din,
        fifo_B_B_IO_L2_in_016_num_data_valid,
        fifo_B_B_IO_L2_in_016_fifo_cap,
        fifo_B_B_IO_L2_in_016_full_n,
        fifo_B_B_IO_L2_in_016_write,
        sext_ln267
);
parameter    ap_ST_fsm_pp0_stage0 = 2'd1;
parameter    ap_ST_fsm_pp0_stage1 = 2'd2;
input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_gmem_B_AWVALID;
input   m_axi_gmem_B_AWREADY;
output  [63:0] m_axi_gmem_B_AWADDR;
output  [0:0] m_axi_gmem_B_AWID;
output  [31:0] m_axi_gmem_B_AWLEN;
output  [2:0] m_axi_gmem_B_AWSIZE;
output  [1:0] m_axi_gmem_B_AWBURST;
output  [1:0] m_axi_gmem_B_AWLOCK;
output  [3:0] m_axi_gmem_B_AWCACHE;
output  [2:0] m_axi_gmem_B_AWPROT;
output  [3:0] m_axi_gmem_B_AWQOS;
output  [3:0] m_axi_gmem_B_AWREGION;
output  [0:0] m_axi_gmem_B_AWUSER;
output   m_axi_gmem_B_WVALID;
input   m_axi_gmem_B_WREADY;
output  [511:0] m_axi_gmem_B_WDATA;
output  [63:0] m_axi_gmem_B_WSTRB;
output   m_axi_gmem_B_WLAST;
output  [0:0] m_axi_gmem_B_WID;
output  [0:0] m_axi_gmem_B_WUSER;
output   m_axi_gmem_B_ARVALID;
input   m_axi_gmem_B_ARREADY;
output  [63:0] m_axi_gmem_B_ARADDR;
output  [0:0] m_axi_gmem_B_ARID;
output  [31:0] m_axi_gmem_B_ARLEN;
output  [2:0] m_axi_gmem_B_ARSIZE;
output  [1:0] m_axi_gmem_B_ARBURST;
output  [1:0] m_axi_gmem_B_ARLOCK;
output  [3:0] m_axi_gmem_B_ARCACHE;
output  [2:0] m_axi_gmem_B_ARPROT;
output  [3:0] m_axi_gmem_B_ARQOS;
output  [3:0] m_axi_gmem_B_ARREGION;
output  [0:0] m_axi_gmem_B_ARUSER;
input   m_axi_gmem_B_RVALID;
output   m_axi_gmem_B_RREADY;
input  [511:0] m_axi_gmem_B_RDATA;
input   m_axi_gmem_B_RLAST;
input  [0:0] m_axi_gmem_B_RID;
input  [8:0] m_axi_gmem_B_RFIFONUM;
input  [0:0] m_axi_gmem_B_RUSER;
input  [1:0] m_axi_gmem_B_RRESP;
input   m_axi_gmem_B_BVALID;
output   m_axi_gmem_B_BREADY;
input  [1:0] m_axi_gmem_B_BRESP;
input  [0:0] m_axi_gmem_B_BID;
input  [0:0] m_axi_gmem_B_BUSER;
output  [255:0] fifo_B_B_IO_L2_in_016_din;
input  [1:0] fifo_B_B_IO_L2_in_016_num_data_valid;
input  [1:0] fifo_B_B_IO_L2_in_016_fifo_cap;
input   fifo_B_B_IO_L2_in_016_full_n;
output   fifo_B_B_IO_L2_in_016_write;
input  [57:0] sext_ln267;
reg ap_idle;
reg m_axi_gmem_B_RREADY;
reg[255:0] fifo_B_B_IO_L2_in_016_din;
reg fifo_B_B_IO_L2_in_016_write;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
reg   [0:0] icmp_ln1027_reg_141;
reg    ap_block_state2_pp0_stage1_iter0;
reg    ap_block_state4_pp0_stage1_iter1;
reg    ap_block_pp0_stage1_subdone;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    gmem_B_blk_n_R;
wire    ap_block_pp0_stage1;
reg    fifo_B_B_IO_L2_in_016_blk_n;
wire    ap_block_pp0_stage0;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln1027_fu_92_p2;
wire   [255:0] trunc_ln628_fu_115_p1;
reg   [255:0] trunc_ln628_reg_145;
reg    ap_block_pp0_stage1_11001;
reg   [255:0] p_0_reg_150;
reg    ap_enable_reg_pp0_iter0_reg;
reg   [11:0] i_V_fu_58;
wire   [11:0] add_ln840_fu_98_p2;
wire    ap_loop_init;
reg   [11:0] ap_sig_allocacmp_i_V_2;
reg    ap_block_pp0_stage0_01001;
reg    ap_block_pp0_stage1_01001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
reg    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to1;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;
// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
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
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
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
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end
always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end
always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end
always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln1027_fu_92_p2 == 1'd0))) begin
            i_V_fu_58 <= add_ln840_fu_98_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_V_fu_58 <= 12'd0;
        end
    end
end
always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1027_reg_141 <= icmp_ln1027_fu_92_p2;
    end
end
always @ (posedge ap_clk) begin
    if (((icmp_ln1027_reg_141 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        p_0_reg_150 <= {{m_axi_gmem_B_RDATA[511:256]}};
        trunc_ln628_reg_145 <= trunc_ln628_fu_115_p1;
    end
end
always @ (*) begin
    if (((icmp_ln1027_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end
always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end
always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end
always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end
always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_i_V_2 = 12'd0;
    end else begin
        ap_sig_allocacmp_i_V_2 = i_V_fu_58;
    end
end
always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        fifo_B_B_IO_L2_in_016_blk_n = fifo_B_B_IO_L2_in_016_full_n;
    end else begin
        fifo_B_B_IO_L2_in_016_blk_n = 1'b1;
    end
end
always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_01001))) begin
            fifo_B_B_IO_L2_in_016_din = p_0_reg_150;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001))) begin
            fifo_B_B_IO_L2_in_016_din = trunc_ln628_reg_145;
        end else begin
            fifo_B_B_IO_L2_in_016_din = 'bx;
        end
    end else begin
        fifo_B_B_IO_L2_in_016_din = 'bx;
    end
end
always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        fifo_B_B_IO_L2_in_016_write = 1'b1;
    end else begin
        fifo_B_B_IO_L2_in_016_write = 1'b0;
    end
end
always @ (*) begin
    if (((icmp_ln1027_reg_141 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
        gmem_B_blk_n_R = m_axi_gmem_B_RVALID;
    end else begin
        gmem_B_blk_n_R = 1'b1;
    end
end
always @ (*) begin
    if (((icmp_ln1027_reg_141 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        m_axi_gmem_B_RREADY = 1'b1;
    end else begin
        m_axi_gmem_B_RREADY = 1'b0;
    end
end
always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end
assign add_ln840_fu_98_p2 = (ap_sig_allocacmp_i_V_2 + 12'd1);
assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];
assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);
always @ (*) begin
    ap_block_pp0_stage0_01001 = ((fifo_B_B_IO_L2_in_016_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end
always @ (*) begin
    ap_block_pp0_stage0_11001 = ((fifo_B_B_IO_L2_in_016_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end
always @ (*) begin
    ap_block_pp0_stage0_subdone = ((fifo_B_B_IO_L2_in_016_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end
assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);
always @ (*) begin
    ap_block_pp0_stage1_01001 = (((icmp_ln1027_reg_141 == 1'd0) & (m_axi_gmem_B_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((fifo_B_B_IO_L2_in_016_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end
always @ (*) begin
    ap_block_pp0_stage1_11001 = (((icmp_ln1027_reg_141 == 1'd0) & (m_axi_gmem_B_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((fifo_B_B_IO_L2_in_016_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end
always @ (*) begin
    ap_block_pp0_stage1_subdone = (((icmp_ln1027_reg_141 == 1'd0) & (m_axi_gmem_B_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((fifo_B_B_IO_L2_in_016_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end
assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);
always @ (*) begin
    ap_block_state2_pp0_stage1_iter0 = ((icmp_ln1027_reg_141 == 1'd0) & (m_axi_gmem_B_RVALID == 1'b0));
end
always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = (fifo_B_B_IO_L2_in_016_full_n == 1'b0);
end
always @ (*) begin
    ap_block_state4_pp0_stage1_iter1 = (fifo_B_B_IO_L2_in_016_full_n == 1'b0);
end
assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);
assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;
assign icmp_ln1027_fu_92_p2 = ((ap_sig_allocacmp_i_V_2 == 12'd2048) ? 1'b1 : 1'b0);
assign m_axi_gmem_B_ARADDR = 64'd0;
assign m_axi_gmem_B_ARBURST = 2'd0;
assign m_axi_gmem_B_ARCACHE = 4'd0;
assign m_axi_gmem_B_ARID = 1'd0;
assign m_axi_gmem_B_ARLEN = 32'd0;
assign m_axi_gmem_B_ARLOCK = 2'd0;
assign m_axi_gmem_B_ARPROT = 3'd0;
assign m_axi_gmem_B_ARQOS = 4'd0;
assign m_axi_gmem_B_ARREGION = 4'd0;
assign m_axi_gmem_B_ARSIZE = 3'd0;
assign m_axi_gmem_B_ARUSER = 1'd0;
assign m_axi_gmem_B_ARVALID = 1'b0;
assign m_axi_gmem_B_AWADDR = 64'd0;
assign m_axi_gmem_B_AWBURST = 2'd0;
assign m_axi_gmem_B_AWCACHE = 4'd0;
assign m_axi_gmem_B_AWID = 1'd0;
assign m_axi_gmem_B_AWLEN = 32'd0;
assign m_axi_gmem_B_AWLOCK = 2'd0;
assign m_axi_gmem_B_AWPROT = 3'd0;
assign m_axi_gmem_B_AWQOS = 4'd0;
assign m_axi_gmem_B_AWREGION = 4'd0;
assign m_axi_gmem_B_AWSIZE = 3'd0;
assign m_axi_gmem_B_AWUSER = 1'd0;
assign m_axi_gmem_B_AWVALID = 1'b0;
assign m_axi_gmem_B_BREADY = 1'b0;
assign m_axi_gmem_B_WDATA = 512'd0;
assign m_axi_gmem_B_WID = 1'd0;
assign m_axi_gmem_B_WLAST = 1'b0;
assign m_axi_gmem_B_WSTRB = 64'd0;
assign m_axi_gmem_B_WUSER = 1'd0;
assign m_axi_gmem_B_WVALID = 1'b0;
assign trunc_ln628_fu_115_p1 = m_axi_gmem_B_RDATA[255:0];
endmodule
