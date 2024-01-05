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
module cc_dir_1024x16(
  input  [9:0]  RW0_addr,
  input         RW0_en,
                RW0_clk,
                RW0_wmode,
  input  [15:0] RW0_wdata,
  output [15:0] RW0_rdata
);

reg [15:0] Memory[0:15];  // Reduced to 16 rows
  reg [3:0]  _RW0_raddr_d0;  // Reduced to 4 bits
  reg        _RW0_ren_d0;
  reg        _RW0_rmode_d0;
  always @(posedge RW0_clk) begin
    _RW0_raddr_d0 <= RW0_addr[3:0] ^ RW0_addr[9:4] ^ RW0_addr[9];  // XOR upper and lower bits and MSB
    _RW0_ren_d0 <= RW0_en;
    _RW0_rmode_d0 <= RW0_wmode;
    if (RW0_en & RW0_wmode)
      Memory[_RW0_raddr_d0] <= RW0_wdata;  // Use XORed address
  end // always @(posedge)
  assign RW0_rdata = _RW0_ren_d0 & ~_RW0_rmode_d0 ? Memory[_RW0_raddr_d0] : 16'bx;
endmodule
