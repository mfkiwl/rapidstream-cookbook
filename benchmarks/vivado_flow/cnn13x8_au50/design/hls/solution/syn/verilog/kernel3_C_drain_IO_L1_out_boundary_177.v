// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module kernel3_C_drain_IO_L1_out_boundary_177 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        fifo_C_drain_C_drain_IO_L1_out_3_12408_din,
        fifo_C_drain_C_drain_IO_L1_out_3_12408_num_data_valid,
        fifo_C_drain_C_drain_IO_L1_out_3_12408_fifo_cap,
        fifo_C_drain_C_drain_IO_L1_out_3_12408_full_n,
        fifo_C_drain_C_drain_IO_L1_out_3_12408_write,
        fifo_C_drain_PE_12_3304_dout,
        fifo_C_drain_PE_12_3304_num_data_valid,
        fifo_C_drain_PE_12_3304_fifo_cap,
        fifo_C_drain_PE_12_3304_empty_n,
        fifo_C_drain_PE_12_3304_read
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [63:0] fifo_C_drain_C_drain_IO_L1_out_3_12408_din;
input  [1:0] fifo_C_drain_C_drain_IO_L1_out_3_12408_num_data_valid;
input  [1:0] fifo_C_drain_C_drain_IO_L1_out_3_12408_fifo_cap;
input   fifo_C_drain_C_drain_IO_L1_out_3_12408_full_n;
output   fifo_C_drain_C_drain_IO_L1_out_3_12408_write;
input  [31:0] fifo_C_drain_PE_12_3304_dout;
input  [1:0] fifo_C_drain_PE_12_3304_num_data_valid;
input  [1:0] fifo_C_drain_PE_12_3304_fifo_cap;
input   fifo_C_drain_PE_12_3304_empty_n;
output   fifo_C_drain_PE_12_3304_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg fifo_C_drain_C_drain_IO_L1_out_3_12408_write;
reg fifo_C_drain_PE_12_3304_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [8:0] local_C_V_address0;
reg    local_C_V_ce0;
wire   [63:0] local_C_V_q0;
reg    local_C_V_ce1;
reg    local_C_V_we1;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_start;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_done;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_idle;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_ready;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_fifo_C_drain_PE_12_3304_read;
wire   [8:0] grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_address0;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_ce0;
wire   [8:0] grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_address1;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_ce1;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_we1;
wire   [63:0] grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_d1;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_start;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_done;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_idle;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_ready;
wire   [63:0] grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_fifo_C_drain_C_drain_IO_L1_out_3_12408_din;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_fifo_C_drain_C_drain_IO_L1_out_3_12408_write;
wire   [8:0] grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_local_C_V_address0;
wire    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_local_C_V_ce0;
reg    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_start_reg;
reg    ap_block_state1_ignore_call5;
wire    ap_CS_fsm_state2;
reg    grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_start_reg;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
reg   [4:0] ap_NS_fsm;
reg    ap_block_state1;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_start_reg = 1'b0;
#0 grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_start_reg = 1'b0;
end

kernel3_C_drain_IO_L1_out_boundary_local_C_V_RAM_2P_BRAM_1R1W #(
    .DataWidth( 64 ),
    .AddressRange( 512 ),
    .AddressWidth( 9 ))
local_C_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(local_C_V_address0),
    .ce0(local_C_V_ce0),
    .q0(local_C_V_q0),
    .address1(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_address1),
    .ce1(local_C_V_ce1),
    .we1(local_C_V_we1),
    .d1(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_d1)
);

kernel3_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2 grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_start),
    .ap_done(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_done),
    .ap_idle(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_idle),
    .ap_ready(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_ready),
    .fifo_C_drain_PE_12_3304_dout(fifo_C_drain_PE_12_3304_dout),
    .fifo_C_drain_PE_12_3304_num_data_valid(2'd0),
    .fifo_C_drain_PE_12_3304_fifo_cap(2'd0),
    .fifo_C_drain_PE_12_3304_empty_n(fifo_C_drain_PE_12_3304_empty_n),
    .fifo_C_drain_PE_12_3304_read(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_fifo_C_drain_PE_12_3304_read),
    .local_C_V_address0(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_address0),
    .local_C_V_ce0(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_ce0),
    .local_C_V_q0(local_C_V_q0),
    .local_C_V_address1(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_address1),
    .local_C_V_ce1(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_ce1),
    .local_C_V_we1(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_we1),
    .local_C_V_d1(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_d1)
);

kernel3_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3 grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_start),
    .ap_done(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_done),
    .ap_idle(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_idle),
    .ap_ready(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_ready),
    .fifo_C_drain_C_drain_IO_L1_out_3_12408_din(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_fifo_C_drain_C_drain_IO_L1_out_3_12408_din),
    .fifo_C_drain_C_drain_IO_L1_out_3_12408_num_data_valid(2'd0),
    .fifo_C_drain_C_drain_IO_L1_out_3_12408_fifo_cap(2'd0),
    .fifo_C_drain_C_drain_IO_L1_out_3_12408_full_n(fifo_C_drain_C_drain_IO_L1_out_3_12408_full_n),
    .fifo_C_drain_C_drain_IO_L1_out_3_12408_write(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_fifo_C_drain_C_drain_IO_L1_out_3_12408_write),
    .local_C_V_address0(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_local_C_V_address0),
    .local_C_V_ce0(grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_local_C_V_ce0),
    .local_C_V_q0(local_C_V_q0)
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
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_start_reg <= 1'b0;
    end else begin
        if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_start_reg <= 1'b1;
        end else if ((grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_ready == 1'b1)) begin
            grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_start_reg <= 1'b1;
        end else if ((grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_ready == 1'b1)) begin
            grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_start_reg <= 1'b0;
        end
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b1) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if (((grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        fifo_C_drain_C_drain_IO_L1_out_3_12408_write = grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_fifo_C_drain_C_drain_IO_L1_out_3_12408_write;
    end else begin
        fifo_C_drain_C_drain_IO_L1_out_3_12408_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        fifo_C_drain_PE_12_3304_read = grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_fifo_C_drain_PE_12_3304_read;
    end else begin
        fifo_C_drain_PE_12_3304_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        local_C_V_address0 = grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_local_C_V_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        local_C_V_address0 = grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_address0;
    end else begin
        local_C_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        local_C_V_ce0 = grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_local_C_V_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        local_C_V_ce0 = grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_ce0;
    end else begin
        local_C_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        local_C_V_ce1 = grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_ce1;
    end else begin
        local_C_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        local_C_V_we1 = grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_local_C_V_we1;
    end else begin
        local_C_V_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state1_ignore_call5 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign fifo_C_drain_C_drain_IO_L1_out_3_12408_din = grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_fifo_C_drain_C_drain_IO_L1_out_3_12408_din;

assign grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_start = grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_662_1_VITIS_LOOP_664_2_fu_34_ap_start_reg;

assign grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_start = grp_C_drain_IO_L1_out_boundary_177_Pipeline_VITIS_LOOP_724_2_VITIS_LOOP_726_3_fu_42_ap_start_reg;

endmodule //kernel3_C_drain_IO_L1_out_boundary_177
