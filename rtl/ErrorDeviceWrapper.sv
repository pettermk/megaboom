// Standard header to adapt well known macros for prints and assertions.

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

module ErrorDeviceWrapper(
  input         clock,
                reset,
  output        auto_buffer_in_a_ready,
  input         auto_buffer_in_a_valid,
  input  [2:0]  auto_buffer_in_a_bits_opcode,
                auto_buffer_in_a_bits_param,
  input  [3:0]  auto_buffer_in_a_bits_size,
  input  [5:0]  auto_buffer_in_a_bits_source,
  input  [13:0] auto_buffer_in_a_bits_address,
  input  [7:0]  auto_buffer_in_a_bits_mask,
  input  [63:0] auto_buffer_in_a_bits_data,
  input         auto_buffer_in_a_bits_corrupt,
                auto_buffer_in_d_ready,
  output        auto_buffer_in_d_valid,
  output [2:0]  auto_buffer_in_d_bits_opcode,
  output [1:0]  auto_buffer_in_d_bits_param,
  output [3:0]  auto_buffer_in_d_bits_size,
  output [5:0]  auto_buffer_in_d_bits_source,
  output        auto_buffer_in_d_bits_sink,
                auto_buffer_in_d_bits_denied,
  output [63:0] auto_buffer_in_d_bits_data,
  output        auto_buffer_in_d_bits_corrupt
);

  wire        _buffer_auto_out_a_valid;
  wire [2:0]  _buffer_auto_out_a_bits_opcode;
  wire [2:0]  _buffer_auto_out_a_bits_param;
  wire [3:0]  _buffer_auto_out_a_bits_size;
  wire [5:0]  _buffer_auto_out_a_bits_source;
  wire [13:0] _buffer_auto_out_a_bits_address;
  wire [7:0]  _buffer_auto_out_a_bits_mask;
  wire [63:0] _buffer_auto_out_a_bits_data;
  wire        _buffer_auto_out_a_bits_corrupt;
  wire        _buffer_auto_out_d_ready;
  wire        _error_auto_in_a_ready;
  wire        _error_auto_in_d_valid;
  wire [2:0]  _error_auto_in_d_bits_opcode;
  wire [3:0]  _error_auto_in_d_bits_size;
  wire [5:0]  _error_auto_in_d_bits_source;
  wire        _error_auto_in_d_bits_corrupt;
  TLError error (
    .clock                  (clock),
    .reset                  (reset),
    .auto_in_a_ready        (_error_auto_in_a_ready),
    .auto_in_a_valid        (_buffer_auto_out_a_valid),
    .auto_in_a_bits_opcode  (_buffer_auto_out_a_bits_opcode),
    .auto_in_a_bits_param   (_buffer_auto_out_a_bits_param),
    .auto_in_a_bits_size    (_buffer_auto_out_a_bits_size),
    .auto_in_a_bits_source  (_buffer_auto_out_a_bits_source),
    .auto_in_a_bits_address (_buffer_auto_out_a_bits_address),
    .auto_in_a_bits_mask    (_buffer_auto_out_a_bits_mask),
    .auto_in_a_bits_data    (_buffer_auto_out_a_bits_data),
    .auto_in_a_bits_corrupt (_buffer_auto_out_a_bits_corrupt),
    .auto_in_d_ready        (_buffer_auto_out_d_ready),
    .auto_in_d_valid        (_error_auto_in_d_valid),
    .auto_in_d_bits_opcode  (_error_auto_in_d_bits_opcode),
    .auto_in_d_bits_size    (_error_auto_in_d_bits_size),
    .auto_in_d_bits_source  (_error_auto_in_d_bits_source),
    .auto_in_d_bits_corrupt (_error_auto_in_d_bits_corrupt)
  );
  TLBuffer_5 buffer (
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_ready         (auto_buffer_in_a_ready),
    .auto_in_a_valid         (auto_buffer_in_a_valid),
    .auto_in_a_bits_opcode   (auto_buffer_in_a_bits_opcode),
    .auto_in_a_bits_param    (auto_buffer_in_a_bits_param),
    .auto_in_a_bits_size     (auto_buffer_in_a_bits_size),
    .auto_in_a_bits_source   (auto_buffer_in_a_bits_source),
    .auto_in_a_bits_address  (auto_buffer_in_a_bits_address),
    .auto_in_a_bits_mask     (auto_buffer_in_a_bits_mask),
    .auto_in_a_bits_data     (auto_buffer_in_a_bits_data),
    .auto_in_a_bits_corrupt  (auto_buffer_in_a_bits_corrupt),
    .auto_in_d_ready         (auto_buffer_in_d_ready),
    .auto_in_d_valid         (auto_buffer_in_d_valid),
    .auto_in_d_bits_opcode   (auto_buffer_in_d_bits_opcode),
    .auto_in_d_bits_param    (auto_buffer_in_d_bits_param),
    .auto_in_d_bits_size     (auto_buffer_in_d_bits_size),
    .auto_in_d_bits_source   (auto_buffer_in_d_bits_source),
    .auto_in_d_bits_sink     (auto_buffer_in_d_bits_sink),
    .auto_in_d_bits_denied   (auto_buffer_in_d_bits_denied),
    .auto_in_d_bits_data     (auto_buffer_in_d_bits_data),
    .auto_in_d_bits_corrupt  (auto_buffer_in_d_bits_corrupt),
    .auto_out_a_ready        (_error_auto_in_a_ready),
    .auto_out_a_valid        (_buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address (_buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_buffer_auto_out_d_ready),
    .auto_out_d_valid        (_error_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_error_auto_in_d_bits_opcode),
    .auto_out_d_bits_size    (_error_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_error_auto_in_d_bits_source),
    .auto_out_d_bits_corrupt (_error_auto_in_d_bits_corrupt)
  );
endmodule

