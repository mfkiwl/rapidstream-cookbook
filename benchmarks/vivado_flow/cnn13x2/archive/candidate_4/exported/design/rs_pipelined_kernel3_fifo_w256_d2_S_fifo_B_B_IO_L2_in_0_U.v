// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module rs_pipelined_kernel3_fifo_w256_d2_S_fifo_B_B_IO_L2_in_0_U #(
    parameter [63:0] MEM_STYLE  = "shiftReg",
    parameter        DATA_WIDTH = 256,
    parameter        ADDR_WIDTH = 1,
    parameter        DEPTH      = 2
) (
    input wire                       clk,
    input wire  [(DATA_WIDTH - 1):0] if_din,
    output wire [(DATA_WIDTH - 1):0] if_dout,
    output wire                      if_empty_n,
    output wire [      ADDR_WIDTH:0] if_fifo_cap,
    output wire                      if_full_n,
    output wire [      ADDR_WIDTH:0] if_num_data_valid,
    input wire                       if_read,
    input wire                       if_read_ce,
    input wire                       if_write,
    input wire                       if_write_ce,
    input wire                       reset
);

wire [(DATA_WIDTH - 1):0] rs_pipelined_if_din;
wire                      rs_pipelined_if_full_n;
wire                      rs_pipelined_if_write;


kernel3_fifo_w256_d2_S _ /**   design_1_i/kernel3_0/inst/fifo_B_B_IO_L2_in_0_U   **/ (
    .clk               (clk),
    .if_din            (rs_pipelined_if_din),
    .if_dout           (if_dout),
    .if_empty_n        (if_empty_n),
    .if_fifo_cap       (if_fifo_cap),
    .if_full_n         (rs_pipelined_if_full_n),
    .if_num_data_valid (if_num_data_valid),
    .if_read           (if_read),
    .if_read_ce        (if_read_ce),
    .if_write          (rs_pipelined_if_write),
    .if_write_ce       (if_write_ce),
    .reset             (reset)
);

__rs_hs_pipeline #(
    .DATA_WIDTH                      (( ( ( ( DATA_WIDTH - 1 ) - ( 0 ) + 1 ) ) + 0 )),
    .DEPTH                           (24),
    .PIPELINE_BODY_LEVEL             (2),
    .PIPELINE_READY_IN_HEAD          (1),
    .PIPELINE_VALID_AND_DATA_IN_HEAD (1),
    .__BODY_0_REGION                 ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__BODY_1_REGION                 ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_2_REGION                 ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_3_REGION                 ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_4_REGION                 ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_5_REGION                 ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_6_REGION                 ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_7_REGION                 ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_8_REGION                 ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__HEAD_REGION                   ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__TAIL_REGION                   ("SLOT_X1Y1_TO_SLOT_X1Y1")
) hs_if_din /**   Generated by RapidStream   **/ (
    .clk        (clk),
    .if_din     ({ if_din }),
    .if_dout    ({ rs_pipelined_if_din }),
    .if_empty_n (rs_pipelined_if_write),
    .if_full_n  (if_full_n),
    .if_read    (rs_pipelined_if_full_n),
    .if_write   (if_write),
    .reset      (1'b0)
);

endmodule  // rs_pipelined_kernel3_fifo_w256_d2_S_fifo_B_B_IO_L2_in_0_U
