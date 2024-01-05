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
module data_2048x2(
  input  [10:0] R0_addr,
  input         R0_en,
                R0_clk,
  input  [10:0] W0_addr,
  input         W0_en,
                W0_clk,
  input  [1:0]  W0_data,
  output [1:0]  R0_data
);

reg [1:0]  Memory[0:15];  // Reduced to 16 rows
  reg        _R0_en_d0;
  reg [3:0]  _R0_addr_d0;  // Reduced to 4 bits
  reg [3:0]  _W0_addr_d0;  // Reduced to 4 bits
  always @(posedge R0_clk) begin
    _R0_en_d0 <= R0_en;
    _R0_addr_d0 <= R0_addr[3:0] ^ R0_addr[7:4] ^ R0_addr[8:10];  // XOR upper and lower bits and MSB
  end // always @(posedge)
  always @(posedge W0_clk) begin
    _W0_addr_d0 <= W0_addr[3:0] ^ W0_addr[7:4] ^ W0_addr[8:10];  // XOR upper and lower bits and MSB
    if (W0_en)
      Memory[_W0_addr_d0] <= W0_data;  // Use XORed address
  end // always @(posedge)
  assign R0_data = _R0_en_d0 ? Memory[_R0_addr_d0] : 2'bx;
endmodule

