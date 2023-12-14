// Standard header to adapt well known macros to our needs.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// VCS coverage exclude_file
module mem_256x1(
  input  [7:0] R0_addr,
  input        R0_en,
               R0_clk,
  input  [7:0] W0_addr,
  input        W0_en,
               W0_clk,
               W0_data,
  output       R0_data
);

  reg       Memory[0:255];
  reg       _R0_en_d0;
  reg [7:0] _R0_addr_d0;
  always @(posedge R0_clk) begin
    _R0_en_d0 <= R0_en;
    _R0_addr_d0 <= R0_addr;
  end // always @(posedge)
  always @(posedge W0_clk) begin
    if (W0_en)
      Memory[W0_addr] <= W0_data;
  end // always @(posedge)
  assign R0_data = _R0_en_d0 ? Memory[_R0_addr_d0] : 1'bx;
endmodule

