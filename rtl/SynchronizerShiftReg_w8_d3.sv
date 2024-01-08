// Standard header to adapt well known macros for prints and assertions.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

module SynchronizerShiftReg_w8_d3(
  input        clock,
  input  [7:0] io_d,
  output [7:0] io_q
);

  wire _output_chain_7_io_q;
  wire _output_chain_6_io_q;
  wire _output_chain_5_io_q;
  wire _output_chain_4_io_q;
  wire _output_chain_3_io_q;
  wire _output_chain_2_io_q;
  wire _output_chain_1_io_q;
  wire _output_chain_io_q;
  NonSyncResetSynchronizerPrimitiveShiftReg_d3_1 output_chain (
    .clock (clock),
    .io_d  (io_d[0]),
    .io_q  (_output_chain_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3_1 output_chain_1 (
    .clock (clock),
    .io_d  (io_d[1]),
    .io_q  (_output_chain_1_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3_1 output_chain_2 (
    .clock (clock),
    .io_d  (io_d[2]),
    .io_q  (_output_chain_2_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3_1 output_chain_3 (
    .clock (clock),
    .io_d  (io_d[3]),
    .io_q  (_output_chain_3_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3_1 output_chain_4 (
    .clock (clock),
    .io_d  (io_d[4]),
    .io_q  (_output_chain_4_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3_1 output_chain_5 (
    .clock (clock),
    .io_d  (io_d[5]),
    .io_q  (_output_chain_5_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3_1 output_chain_6 (
    .clock (clock),
    .io_d  (io_d[6]),
    .io_q  (_output_chain_6_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3_1 output_chain_7 (
    .clock (clock),
    .io_d  (io_d[7]),
    .io_q  (_output_chain_7_io_q)
  );
  assign io_q = {_output_chain_7_io_q, _output_chain_6_io_q, _output_chain_5_io_q, _output_chain_4_io_q, _output_chain_3_io_q, _output_chain_2_io_q, _output_chain_1_io_q, _output_chain_io_q};
endmodule

