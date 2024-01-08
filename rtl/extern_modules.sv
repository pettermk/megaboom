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

// external module plusarg_reader

// external module plusarg_reader

// external module plusarg_reader

// external module ClockFlop

// external module ClockInverter

// external module ClockSignalNor2

// external module EICG_wrapper

// external module ClockOr2

// external module GenericDigitalInIOCell

// external module ClockSourceAtFreqFromPlusArgpll_freq_mhz

// external module GenericDigitalOutIOCell

// external module SimUART

// external module SimTSI

// external module plusarg_reader

// external module SimJTAG

// external module plusarg_reader

// external module ClockSourceAtFreqMHz

