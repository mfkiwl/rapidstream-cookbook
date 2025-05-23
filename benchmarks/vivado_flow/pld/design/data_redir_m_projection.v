// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module data_redir_m_projection (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        input_lo,
        input_mi,
        input_hi,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3,
        ap_return_4,
        ap_return_5,
        ap_return_6
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] input_lo;
input  [31:0] input_mi;
input  [7:0] input_hi;
output  [7:0] ap_return_0;
output  [7:0] ap_return_1;
output  [7:0] ap_return_2;
output  [7:0] ap_return_3;
output  [7:0] ap_return_4;
output  [7:0] ap_return_5;
output  [7:0] ap_return_6;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [7:0] triangle_3d_x0_V_fu_50_p1;
reg   [7:0] triangle_3d_x0_V_reg_235;
reg   [7:0] triangle_3d_y0_V_reg_240;
reg   [7:0] triangle_3d_x1_V_reg_245;
wire   [7:0] triangle_3d_y1_V_fu_84_p1;
reg   [7:0] triangle_3d_y1_V_reg_250;
reg   [7:0] triangle_3d_x2_V_reg_255;
reg   [7:0] triangle_3d_y2_V_reg_260;
reg   [6:0] tmp_reg_265;
reg   [6:0] tmp_1_reg_270;
reg   [6:0] tmp_2_reg_275;
wire   [7:0] triangle_3d_z0_V_fu_64_p4;
wire   [7:0] mul_ln1543_fu_122_p0;
wire   [9:0] mul_ln1543_fu_122_p1;
wire   [16:0] mul_ln1543_fu_122_p2;
wire   [7:0] triangle_3d_z1_V_fu_88_p4;
wire   [7:0] mul_ln1543_1_fu_142_p0;
wire   [9:0] mul_ln1543_1_fu_142_p1;
wire   [16:0] mul_ln1543_1_fu_142_p2;
wire   [7:0] mul_ln1543_2_fu_162_p0;
wire   [9:0] mul_ln1543_2_fu_162_p1;
wire   [16:0] mul_ln1543_2_fu_162_p2;
wire    ap_CS_fsm_state2;
wire   [7:0] zext_ln1543_1_fu_178_p1;
wire   [7:0] zext_ln1543_5_fu_184_p1;
wire   [7:0] add_ln223_fu_187_p2;
wire   [7:0] zext_ln1543_3_fu_181_p1;
wire   [7:0] add_ln223_1_fu_193_p2;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire   [16:0] mul_ln1543_1_fu_142_p00;
wire   [16:0] mul_ln1543_2_fu_162_p00;
wire   [16:0] mul_ln1543_fu_122_p00;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
end

data_redir_m_mul_8ns_10ns_17_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 17 ))
mul_8ns_10ns_17_1_1_U4(
    .din0(mul_ln1543_fu_122_p0),
    .din1(mul_ln1543_fu_122_p1),
    .dout(mul_ln1543_fu_122_p2)
);

data_redir_m_mul_8ns_10ns_17_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 17 ))
mul_8ns_10ns_17_1_1_U5(
    .din0(mul_ln1543_1_fu_142_p0),
    .din1(mul_ln1543_1_fu_142_p1),
    .dout(mul_ln1543_1_fu_142_p2)
);

data_redir_m_mul_8ns_10ns_17_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 17 ))
mul_8ns_10ns_17_1_1_U6(
    .din0(mul_ln1543_2_fu_162_p0),
    .din1(mul_ln1543_2_fu_162_p1),
    .dout(mul_ln1543_2_fu_162_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        tmp_1_reg_270 <= {{mul_ln1543_1_fu_142_p2[16:10]}};
        tmp_2_reg_275 <= {{mul_ln1543_2_fu_162_p2[16:10]}};
        tmp_reg_265 <= {{mul_ln1543_fu_122_p2[16:10]}};
        triangle_3d_x0_V_reg_235 <= triangle_3d_x0_V_fu_50_p1;
        triangle_3d_x1_V_reg_245 <= {{input_lo[31:24]}};
        triangle_3d_x2_V_reg_255 <= {{input_mi[23:16]}};
        triangle_3d_y0_V_reg_240 <= {{input_lo[15:8]}};
        triangle_3d_y1_V_reg_250 <= triangle_3d_y1_V_fu_84_p1;
        triangle_3d_y2_V_reg_260 <= {{input_mi[31:24]}};
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln223_1_fu_193_p2 = (add_ln223_fu_187_p2 + zext_ln1543_3_fu_181_p1);

assign add_ln223_fu_187_p2 = (zext_ln1543_1_fu_178_p1 + zext_ln1543_5_fu_184_p1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_return_0 = triangle_3d_x0_V_reg_235;

assign ap_return_1 = triangle_3d_y0_V_reg_240;

assign ap_return_2 = triangle_3d_x1_V_reg_245;

assign ap_return_3 = triangle_3d_y1_V_reg_250;

assign ap_return_4 = triangle_3d_x2_V_reg_255;

assign ap_return_5 = triangle_3d_y2_V_reg_260;

assign ap_return_6 = add_ln223_1_fu_193_p2;

assign mul_ln1543_1_fu_142_p0 = mul_ln1543_1_fu_142_p00;

assign mul_ln1543_1_fu_142_p00 = triangle_3d_z1_V_fu_88_p4;

assign mul_ln1543_1_fu_142_p1 = 17'd342;

assign mul_ln1543_2_fu_162_p0 = mul_ln1543_2_fu_162_p00;

assign mul_ln1543_2_fu_162_p00 = input_hi;

assign mul_ln1543_2_fu_162_p1 = 17'd342;

assign mul_ln1543_fu_122_p0 = mul_ln1543_fu_122_p00;

assign mul_ln1543_fu_122_p00 = triangle_3d_z0_V_fu_64_p4;

assign mul_ln1543_fu_122_p1 = 17'd342;

assign triangle_3d_x0_V_fu_50_p1 = input_lo[7:0];

assign triangle_3d_y1_V_fu_84_p1 = input_mi[7:0];

assign triangle_3d_z0_V_fu_64_p4 = {{input_lo[23:16]}};

assign triangle_3d_z1_V_fu_88_p4 = {{input_mi[15:8]}};

assign zext_ln1543_1_fu_178_p1 = tmp_reg_265;

assign zext_ln1543_3_fu_181_p1 = tmp_1_reg_270;

assign zext_ln1543_5_fu_184_p1 = tmp_2_reg_275;

endmodule //data_redir_m_projection
