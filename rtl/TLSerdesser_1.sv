// Standard header to adapt well known macros to our needs.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

module TLSerdesser_1(
  input         clock,
                reset,
                auto_manager_in_a_valid,
  input  [2:0]  auto_manager_in_a_bits_opcode,
                auto_manager_in_a_bits_param,
  input  [3:0]  auto_manager_in_a_bits_size,
  input         auto_manager_in_a_bits_source,
  input  [31:0] auto_manager_in_a_bits_address,
  input  [7:0]  auto_manager_in_a_bits_mask,
  input  [63:0] auto_manager_in_a_bits_data,
  input         auto_manager_in_a_bits_corrupt,
                auto_manager_in_d_ready,
                io_ser_in_valid,
  input  [31:0] io_ser_in_bits,
  input         io_ser_out_ready,
  output        auto_manager_in_a_ready,
                auto_manager_in_d_valid,
  output [2:0]  auto_manager_in_d_bits_opcode,
  output [1:0]  auto_manager_in_d_bits_param,
  output [3:0]  auto_manager_in_d_bits_size,
  output        auto_manager_in_d_bits_source,
  output [3:0]  auto_manager_in_d_bits_sink,
  output        auto_manager_in_d_bits_denied,
  output [63:0] auto_manager_in_d_bits_data,
  output        auto_manager_in_d_bits_corrupt,
                io_ser_in_ready,
                io_ser_out_valid,
  output [31:0] io_ser_out_bits
);

  wire        _inDes_io_out_valid;
  wire [2:0]  _inDes_io_out_bits_chanId;
  wire [2:0]  _inDes_io_out_bits_opcode;
  wire [2:0]  _inDes_io_out_bits_param;
  wire [7:0]  _inDes_io_out_bits_size;
  wire [7:0]  _inDes_io_out_bits_source;
  wire        _inDes_io_out_bits_corrupt;
  wire [8:0]  _inDes_io_out_bits_union;
  wire        _outSer_io_in_ready;
  wire        _outArb_io_in_4_ready;
  wire        _outArb_io_out_valid;
  wire [2:0]  _outArb_io_out_bits_chanId;
  wire [2:0]  _outArb_io_out_bits_opcode;
  wire [2:0]  _outArb_io_out_bits_param;
  wire [7:0]  _outArb_io_out_bits_size;
  wire [7:0]  _outArb_io_out_bits_source;
  wire [63:0] _outArb_io_out_bits_address;
  wire [63:0] _outArb_io_out_bits_data;
  wire        _outArb_io_out_bits_corrupt;
  wire [8:0]  _outArb_io_out_bits_union;
  wire        _outArb_io_out_bits_last;
  wire        managerNodeIn_d_valid = _inDes_io_out_valid & _inDes_io_out_bits_chanId == 3'h3;
  HellaPeekingArbiter outArb (
    .clock                (clock),
    .reset                (reset),
    .io_in_0_bits_last    (1'h0),
    .io_in_1_valid        (1'h0),
    .io_in_1_bits_opcode  (3'h0),
    .io_in_1_bits_param   (3'h0),
    .io_in_1_bits_size    (8'h0),
    .io_in_1_bits_source  (8'h0),
    .io_in_1_bits_data    (64'h0),
    .io_in_1_bits_corrupt (1'h0),
    .io_in_1_bits_union   (9'h0),
    .io_in_1_bits_last    (1'h0),
    .io_in_2_bits_last    (1'h0),
    .io_in_3_bits_last    (1'h0),
    .io_in_4_valid        (auto_manager_in_a_valid),
    .io_in_4_bits_opcode  (auto_manager_in_a_bits_opcode),
    .io_in_4_bits_param   (auto_manager_in_a_bits_param),
    .io_in_4_bits_size    ({4'h0, auto_manager_in_a_bits_size}),
    .io_in_4_bits_source  ({7'h0, auto_manager_in_a_bits_source}),
    .io_in_4_bits_address ({32'h0, auto_manager_in_a_bits_address}),
    .io_in_4_bits_data    (auto_manager_in_a_bits_data),
    .io_in_4_bits_corrupt (auto_manager_in_a_bits_corrupt),
    .io_in_4_bits_union   ({1'h0, auto_manager_in_a_bits_mask}),
    .io_in_4_bits_last    (1'h0),
    .io_out_ready         (_outSer_io_in_ready),
    .io_in_1_ready        (/* unused */),
    .io_in_4_ready        (_outArb_io_in_4_ready),
    .io_out_valid         (_outArb_io_out_valid),
    .io_out_bits_chanId   (_outArb_io_out_bits_chanId),
    .io_out_bits_opcode   (_outArb_io_out_bits_opcode),
    .io_out_bits_param    (_outArb_io_out_bits_param),
    .io_out_bits_size     (_outArb_io_out_bits_size),
    .io_out_bits_source   (_outArb_io_out_bits_source),
    .io_out_bits_address  (_outArb_io_out_bits_address),
    .io_out_bits_data     (_outArb_io_out_bits_data),
    .io_out_bits_corrupt  (_outArb_io_out_bits_corrupt),
    .io_out_bits_union    (_outArb_io_out_bits_union),
    .io_out_bits_last     (_outArb_io_out_bits_last)
  );
  GenericSerializer outSer (
    .clock              (clock),
    .reset              (reset),
    .io_in_valid        (_outArb_io_out_valid),
    .io_in_bits_chanId  (_outArb_io_out_bits_chanId),
    .io_in_bits_opcode  (_outArb_io_out_bits_opcode),
    .io_in_bits_param   (_outArb_io_out_bits_param),
    .io_in_bits_size    (_outArb_io_out_bits_size),
    .io_in_bits_source  (_outArb_io_out_bits_source),
    .io_in_bits_address (_outArb_io_out_bits_address),
    .io_in_bits_data    (_outArb_io_out_bits_data),
    .io_in_bits_corrupt (_outArb_io_out_bits_corrupt),
    .io_in_bits_union   (_outArb_io_out_bits_union),
    .io_in_bits_last    (_outArb_io_out_bits_last),
    .io_out_ready       (io_ser_out_ready),
    .io_in_ready        (_outSer_io_in_ready),
    .io_out_valid       (io_ser_out_valid),
    .io_out_bits        (io_ser_out_bits)
  );
  GenericDeserializer inDes (
    .clock               (clock),
    .reset               (reset),
    .io_in_valid         (io_ser_in_valid),
    .io_in_bits          (io_ser_in_bits),
    .io_out_ready        (_inDes_io_out_bits_chanId != 3'h4 & _inDes_io_out_bits_chanId == 3'h3 & auto_manager_in_d_ready),
    .io_in_ready         (io_ser_in_ready),
    .io_out_valid        (_inDes_io_out_valid),
    .io_out_bits_chanId  (_inDes_io_out_bits_chanId),
    .io_out_bits_opcode  (_inDes_io_out_bits_opcode),
    .io_out_bits_param   (_inDes_io_out_bits_param),
    .io_out_bits_size    (_inDes_io_out_bits_size),
    .io_out_bits_source  (_inDes_io_out_bits_source),
    .io_out_bits_address (/* unused */),
    .io_out_bits_data    (auto_manager_in_d_bits_data),
    .io_out_bits_corrupt (_inDes_io_out_bits_corrupt),
    .io_out_bits_union   (_inDes_io_out_bits_union)
  );
  assign auto_manager_in_a_ready = _outArb_io_in_4_ready;
  assign auto_manager_in_d_valid = managerNodeIn_d_valid;
  assign auto_manager_in_d_bits_opcode = _inDes_io_out_bits_opcode;
  assign auto_manager_in_d_bits_param = _inDes_io_out_bits_param[1:0];
  assign auto_manager_in_d_bits_size = _inDes_io_out_bits_size[3:0];
  assign auto_manager_in_d_bits_source = _inDes_io_out_bits_source[0];
  assign auto_manager_in_d_bits_sink = _inDes_io_out_bits_union[4:1];
  assign auto_manager_in_d_bits_denied = _inDes_io_out_bits_union[0];
  assign auto_manager_in_d_bits_corrupt = _inDes_io_out_bits_corrupt;
endmodule

