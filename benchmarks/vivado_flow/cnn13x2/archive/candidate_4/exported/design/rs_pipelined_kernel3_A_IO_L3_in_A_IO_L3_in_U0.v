// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module rs_pipelined_kernel3_A_IO_L3_in_A_IO_L3_in_U0 #(
    parameter [71:0] ap_ST_fsm_state1  = 72'd1,
    parameter [71:0] ap_ST_fsm_state2  = 72'd2,
    parameter [71:0] ap_ST_fsm_state3  = 72'd4,
    parameter [71:0] ap_ST_fsm_state4  = 72'd8,
    parameter [71:0] ap_ST_fsm_state5  = 72'd16,
    parameter [71:0] ap_ST_fsm_state6  = 72'd32,
    parameter [71:0] ap_ST_fsm_state7  = 72'd64,
    parameter [71:0] ap_ST_fsm_state8  = 72'd128,
    parameter [71:0] ap_ST_fsm_state9  = 72'd256,
    parameter [71:0] ap_ST_fsm_state10 = 72'd512,
    parameter [71:0] ap_ST_fsm_state11 = 72'd1024,
    parameter [71:0] ap_ST_fsm_state12 = 72'd2048,
    parameter [71:0] ap_ST_fsm_state13 = 72'd4096,
    parameter [71:0] ap_ST_fsm_state14 = 72'd8192,
    parameter [71:0] ap_ST_fsm_state15 = 72'd16384,
    parameter [71:0] ap_ST_fsm_state16 = 72'd32768,
    parameter [71:0] ap_ST_fsm_state17 = 72'd65536,
    parameter [71:0] ap_ST_fsm_state18 = 72'd131072,
    parameter [71:0] ap_ST_fsm_state19 = 72'd262144,
    parameter [71:0] ap_ST_fsm_state20 = 72'd524288,
    parameter [71:0] ap_ST_fsm_state21 = 72'd1048576,
    parameter [71:0] ap_ST_fsm_state22 = 72'd2097152,
    parameter [71:0] ap_ST_fsm_state23 = 72'd4194304,
    parameter [71:0] ap_ST_fsm_state24 = 72'd8388608,
    parameter [71:0] ap_ST_fsm_state25 = 72'd16777216,
    parameter [71:0] ap_ST_fsm_state26 = 72'd33554432,
    parameter [71:0] ap_ST_fsm_state27 = 72'd67108864,
    parameter [71:0] ap_ST_fsm_state28 = 72'd134217728,
    parameter [71:0] ap_ST_fsm_state29 = 72'd268435456,
    parameter [71:0] ap_ST_fsm_state30 = 72'd536870912,
    parameter [71:0] ap_ST_fsm_state31 = 72'd1073741824,
    parameter [71:0] ap_ST_fsm_state32 = 72'd2147483648,
    parameter [71:0] ap_ST_fsm_state33 = 72'd4294967296,
    parameter [71:0] ap_ST_fsm_state34 = 72'd8589934592,
    parameter [71:0] ap_ST_fsm_state35 = 72'd17179869184,
    parameter [71:0] ap_ST_fsm_state36 = 72'd34359738368,
    parameter [71:0] ap_ST_fsm_state37 = 72'd68719476736,
    parameter [71:0] ap_ST_fsm_state38 = 72'd137438953472,
    parameter [71:0] ap_ST_fsm_state39 = 72'd274877906944,
    parameter [71:0] ap_ST_fsm_state40 = 72'd549755813888,
    parameter [71:0] ap_ST_fsm_state41 = 72'd1099511627776,
    parameter [71:0] ap_ST_fsm_state42 = 72'd2199023255552,
    parameter [71:0] ap_ST_fsm_state43 = 72'd4398046511104,
    parameter [71:0] ap_ST_fsm_state44 = 72'd8796093022208,
    parameter [71:0] ap_ST_fsm_state45 = 72'd17592186044416,
    parameter [71:0] ap_ST_fsm_state46 = 72'd35184372088832,
    parameter [71:0] ap_ST_fsm_state47 = 72'd70368744177664,
    parameter [71:0] ap_ST_fsm_state48 = 72'd140737488355328,
    parameter [71:0] ap_ST_fsm_state49 = 72'd281474976710656,
    parameter [71:0] ap_ST_fsm_state50 = 72'd562949953421312,
    parameter [71:0] ap_ST_fsm_state51 = 72'd1125899906842624,
    parameter [71:0] ap_ST_fsm_state52 = 72'd2251799813685248,
    parameter [71:0] ap_ST_fsm_state53 = 72'd4503599627370496,
    parameter [71:0] ap_ST_fsm_state54 = 72'd9007199254740992,
    parameter [71:0] ap_ST_fsm_state55 = 72'd18014398509481984,
    parameter [71:0] ap_ST_fsm_state56 = 72'd36028797018963968,
    parameter [71:0] ap_ST_fsm_state57 = 72'd72057594037927936,
    parameter [71:0] ap_ST_fsm_state58 = 72'd144115188075855872,
    parameter [71:0] ap_ST_fsm_state59 = 72'd288230376151711744,
    parameter [71:0] ap_ST_fsm_state60 = 72'd576460752303423488,
    parameter [71:0] ap_ST_fsm_state61 = 72'd1152921504606846976,
    parameter [71:0] ap_ST_fsm_state62 = 72'd2305843009213693952,
    parameter [71:0] ap_ST_fsm_state63 = 72'd4611686018427387904,
    parameter [71:0] ap_ST_fsm_state64 = 72'd9223372036854775808,
    parameter [71:0] ap_ST_fsm_state65 = 72'd18446744073709551616,
    parameter [71:0] ap_ST_fsm_state66 = 72'd36893488147419103232,
    parameter [71:0] ap_ST_fsm_state67 = 72'd73786976294838206464,
    parameter [71:0] ap_ST_fsm_state68 = 72'd147573952589676412928,
    parameter [71:0] ap_ST_fsm_state69 = 72'd295147905179352825856,
    parameter [71:0] ap_ST_fsm_state70 = 72'd590295810358705651712,
    parameter [71:0] ap_ST_fsm_state71 = 72'd1180591620717411303424,
    parameter [71:0] ap_ST_fsm_state72 = 72'd2361183241434822606848
) (
    input wire  [ 63:0] A,
    input wire          ap_clk,
    input wire          ap_continue,
    output wire         ap_done,
    output wire         ap_idle,
    output wire         ap_ready,
    input wire          ap_rst,
    input wire          ap_start,
    output wire [255:0] fifo_A_A_IO_L2_in_01_din,
    input wire  [  1:0] fifo_A_A_IO_L2_in_01_fifo_cap,
    input wire          fifo_A_A_IO_L2_in_01_full_n,
    input wire  [  1:0] fifo_A_A_IO_L2_in_01_num_data_valid,
    output wire         fifo_A_A_IO_L2_in_01_write,
    output wire [ 63:0] m_axi_gmem_A_ARADDR,
    output wire [  1:0] m_axi_gmem_A_ARBURST,
    output wire [  3:0] m_axi_gmem_A_ARCACHE,
    output wire [  0:0] m_axi_gmem_A_ARID,
    output wire [ 31:0] m_axi_gmem_A_ARLEN,
    output wire [  1:0] m_axi_gmem_A_ARLOCK,
    output wire [  2:0] m_axi_gmem_A_ARPROT,
    output wire [  3:0] m_axi_gmem_A_ARQOS,
    input wire          m_axi_gmem_A_ARREADY,
    output wire [  3:0] m_axi_gmem_A_ARREGION,
    output wire [  2:0] m_axi_gmem_A_ARSIZE,
    output wire [  0:0] m_axi_gmem_A_ARUSER,
    output wire         m_axi_gmem_A_ARVALID,
    output wire [ 63:0] m_axi_gmem_A_AWADDR,
    output wire [  1:0] m_axi_gmem_A_AWBURST,
    output wire [  3:0] m_axi_gmem_A_AWCACHE,
    output wire [  0:0] m_axi_gmem_A_AWID,
    output wire [ 31:0] m_axi_gmem_A_AWLEN,
    output wire [  1:0] m_axi_gmem_A_AWLOCK,
    output wire [  2:0] m_axi_gmem_A_AWPROT,
    output wire [  3:0] m_axi_gmem_A_AWQOS,
    input wire          m_axi_gmem_A_AWREADY,
    output wire [  3:0] m_axi_gmem_A_AWREGION,
    output wire [  2:0] m_axi_gmem_A_AWSIZE,
    output wire [  0:0] m_axi_gmem_A_AWUSER,
    output wire         m_axi_gmem_A_AWVALID,
    input wire  [  0:0] m_axi_gmem_A_BID,
    output wire         m_axi_gmem_A_BREADY,
    input wire  [  1:0] m_axi_gmem_A_BRESP,
    input wire  [  0:0] m_axi_gmem_A_BUSER,
    input wire          m_axi_gmem_A_BVALID,
    input wire  [511:0] m_axi_gmem_A_RDATA,
    input wire  [  8:0] m_axi_gmem_A_RFIFONUM,
    input wire  [  0:0] m_axi_gmem_A_RID,
    input wire          m_axi_gmem_A_RLAST,
    output wire         m_axi_gmem_A_RREADY,
    input wire  [  1:0] m_axi_gmem_A_RRESP,
    input wire  [  0:0] m_axi_gmem_A_RUSER,
    input wire          m_axi_gmem_A_RVALID,
    output wire [511:0] m_axi_gmem_A_WDATA,
    output wire [  0:0] m_axi_gmem_A_WID,
    output wire         m_axi_gmem_A_WLAST,
    input wire          m_axi_gmem_A_WREADY,
    output wire [ 63:0] m_axi_gmem_A_WSTRB,
    output wire [  0:0] m_axi_gmem_A_WUSER,
    output wire         m_axi_gmem_A_WVALID
);

wire        rs_pipelined_ap_ready;
wire        rs_pipelined_ap_rst;
wire        rs_pipelined_ap_start;


kernel3_A_IO_L3_in _ /**   design_1_i/kernel3_0/inst/A_IO_L3_in_U0   **/ (
    .A                                   (A),
    .ap_clk                              (ap_clk),
    .ap_continue                         (ap_continue),
    .ap_done                             (ap_done),
    .ap_idle                             (ap_idle),
    .ap_ready                            (rs_pipelined_ap_ready),
    .ap_rst                              (rs_pipelined_ap_rst),
    .ap_start                            (rs_pipelined_ap_start),
    .fifo_A_A_IO_L2_in_01_din            (fifo_A_A_IO_L2_in_01_din),
    .fifo_A_A_IO_L2_in_01_fifo_cap       (fifo_A_A_IO_L2_in_01_fifo_cap),
    .fifo_A_A_IO_L2_in_01_full_n         (fifo_A_A_IO_L2_in_01_full_n),
    .fifo_A_A_IO_L2_in_01_num_data_valid (fifo_A_A_IO_L2_in_01_num_data_valid),
    .fifo_A_A_IO_L2_in_01_write          (fifo_A_A_IO_L2_in_01_write),
    .m_axi_gmem_A_ARADDR                 (m_axi_gmem_A_ARADDR),
    .m_axi_gmem_A_ARBURST                (m_axi_gmem_A_ARBURST),
    .m_axi_gmem_A_ARCACHE                (m_axi_gmem_A_ARCACHE),
    .m_axi_gmem_A_ARID                   (m_axi_gmem_A_ARID),
    .m_axi_gmem_A_ARLEN                  (m_axi_gmem_A_ARLEN),
    .m_axi_gmem_A_ARLOCK                 (m_axi_gmem_A_ARLOCK),
    .m_axi_gmem_A_ARPROT                 (m_axi_gmem_A_ARPROT),
    .m_axi_gmem_A_ARQOS                  (m_axi_gmem_A_ARQOS),
    .m_axi_gmem_A_ARREADY                (m_axi_gmem_A_ARREADY),
    .m_axi_gmem_A_ARREGION               (m_axi_gmem_A_ARREGION),
    .m_axi_gmem_A_ARSIZE                 (m_axi_gmem_A_ARSIZE),
    .m_axi_gmem_A_ARUSER                 (m_axi_gmem_A_ARUSER),
    .m_axi_gmem_A_ARVALID                (m_axi_gmem_A_ARVALID),
    .m_axi_gmem_A_AWADDR                 (m_axi_gmem_A_AWADDR),
    .m_axi_gmem_A_AWBURST                (m_axi_gmem_A_AWBURST),
    .m_axi_gmem_A_AWCACHE                (m_axi_gmem_A_AWCACHE),
    .m_axi_gmem_A_AWID                   (m_axi_gmem_A_AWID),
    .m_axi_gmem_A_AWLEN                  (m_axi_gmem_A_AWLEN),
    .m_axi_gmem_A_AWLOCK                 (m_axi_gmem_A_AWLOCK),
    .m_axi_gmem_A_AWPROT                 (m_axi_gmem_A_AWPROT),
    .m_axi_gmem_A_AWQOS                  (m_axi_gmem_A_AWQOS),
    .m_axi_gmem_A_AWREADY                (m_axi_gmem_A_AWREADY),
    .m_axi_gmem_A_AWREGION               (m_axi_gmem_A_AWREGION),
    .m_axi_gmem_A_AWSIZE                 (m_axi_gmem_A_AWSIZE),
    .m_axi_gmem_A_AWUSER                 (m_axi_gmem_A_AWUSER),
    .m_axi_gmem_A_AWVALID                (m_axi_gmem_A_AWVALID),
    .m_axi_gmem_A_BID                    (m_axi_gmem_A_BID),
    .m_axi_gmem_A_BREADY                 (m_axi_gmem_A_BREADY),
    .m_axi_gmem_A_BRESP                  (m_axi_gmem_A_BRESP),
    .m_axi_gmem_A_BUSER                  (m_axi_gmem_A_BUSER),
    .m_axi_gmem_A_BVALID                 (m_axi_gmem_A_BVALID),
    .m_axi_gmem_A_RDATA                  (m_axi_gmem_A_RDATA),
    .m_axi_gmem_A_RFIFONUM               (m_axi_gmem_A_RFIFONUM),
    .m_axi_gmem_A_RID                    (m_axi_gmem_A_RID),
    .m_axi_gmem_A_RLAST                  (m_axi_gmem_A_RLAST),
    .m_axi_gmem_A_RREADY                 (m_axi_gmem_A_RREADY),
    .m_axi_gmem_A_RRESP                  (m_axi_gmem_A_RRESP),
    .m_axi_gmem_A_RUSER                  (m_axi_gmem_A_RUSER),
    .m_axi_gmem_A_RVALID                 (m_axi_gmem_A_RVALID),
    .m_axi_gmem_A_WDATA                  (m_axi_gmem_A_WDATA),
    .m_axi_gmem_A_WID                    (m_axi_gmem_A_WID),
    .m_axi_gmem_A_WLAST                  (m_axi_gmem_A_WLAST),
    .m_axi_gmem_A_WREADY                 (m_axi_gmem_A_WREADY),
    .m_axi_gmem_A_WSTRB                  (m_axi_gmem_A_WSTRB),
    .m_axi_gmem_A_WUSER                  (m_axi_gmem_A_WUSER),
    .m_axi_gmem_A_WVALID                 (m_axi_gmem_A_WVALID)
);

__rs_ap_ctrl_pipeline #(
    .BODY_LEVEL      (0),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_1_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_2_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_3_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_4_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_5_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_6_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_7_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_8_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__HEAD_REGION   ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__TAIL_REGION   ("SLOT_X1Y0_TO_SLOT_X1Y0")
) ap_ctrl_no_data_ap_start_ap_ready /**   Generated by RapidStream   **/ (
    .clk        (ap_clk),
    .if_empty_n (rs_pipelined_ap_start),
    .if_full_n  (ap_ready),
    .if_read    (rs_pipelined_ap_ready),
    .if_write   (ap_start),
    .reset      (1'b0)
);

__rs_ff_pipeline #(
    .BODY_LEVEL      (1),
    .DATA_WIDTH      (1),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_1_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_2_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_3_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_4_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_5_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_6_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_7_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_8_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__HEAD_REGION   ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__TAIL_REGION   ("SLOT_X1Y0_TO_SLOT_X1Y0")
) ff_ap_rst /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ ap_rst }),
    .if_dout ({ rs_pipelined_ap_rst })
);

endmodule  // rs_pipelined_kernel3_A_IO_L3_in_A_IO_L3_in_U0
