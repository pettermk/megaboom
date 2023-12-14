// Standard header to adapt well known macros to our needs.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

module IntXbar_1(
  input  auto_int_in_3_0,
         auto_int_in_2_0,
         auto_int_in_1_0,
         auto_int_in_1_1,
         auto_int_in_0_0,
  output auto_int_out_0,
         auto_int_out_1,
         auto_int_out_2,
         auto_int_out_3,
         auto_int_out_4
);

  assign auto_int_out_0 = auto_int_in_0_0;
  assign auto_int_out_1 = auto_int_in_1_0;
  assign auto_int_out_2 = auto_int_in_1_1;
  assign auto_int_out_3 = auto_int_in_2_0;
  assign auto_int_out_4 = auto_int_in_3_0;
endmodule

