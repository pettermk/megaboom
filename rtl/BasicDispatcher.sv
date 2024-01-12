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

module BasicDispatcher(
  output        io_ren_uops_0_ready,
  input         io_ren_uops_0_valid,
  input  [6:0]  io_ren_uops_0_bits_uopc,
  input  [31:0] io_ren_uops_0_bits_inst,
                io_ren_uops_0_bits_debug_inst,
  input         io_ren_uops_0_bits_is_rvc,
  input  [39:0] io_ren_uops_0_bits_debug_pc,
  input  [2:0]  io_ren_uops_0_bits_iq_type,
  input  [9:0]  io_ren_uops_0_bits_fu_code,
  input         io_ren_uops_0_bits_is_br,
                io_ren_uops_0_bits_is_jalr,
                io_ren_uops_0_bits_is_jal,
                io_ren_uops_0_bits_is_sfb,
  input  [19:0] io_ren_uops_0_bits_br_mask,
  input  [4:0]  io_ren_uops_0_bits_br_tag,
  input  [5:0]  io_ren_uops_0_bits_ftq_idx,
  input         io_ren_uops_0_bits_edge_inst,
  input  [5:0]  io_ren_uops_0_bits_pc_lob,
  input         io_ren_uops_0_bits_taken,
  input  [19:0] io_ren_uops_0_bits_imm_packed,
  input  [11:0] io_ren_uops_0_bits_csr_addr,
  input  [6:0]  io_ren_uops_0_bits_rob_idx,
  input  [4:0]  io_ren_uops_0_bits_ldq_idx,
                io_ren_uops_0_bits_stq_idx,
  input  [1:0]  io_ren_uops_0_bits_rxq_idx,
  input  [6:0]  io_ren_uops_0_bits_pdst,
                io_ren_uops_0_bits_prs1,
                io_ren_uops_0_bits_prs2,
                io_ren_uops_0_bits_prs3,
  input         io_ren_uops_0_bits_prs1_busy,
                io_ren_uops_0_bits_prs2_busy,
                io_ren_uops_0_bits_prs3_busy,
  input  [6:0]  io_ren_uops_0_bits_stale_pdst,
  input         io_ren_uops_0_bits_exception,
  input  [63:0] io_ren_uops_0_bits_exc_cause,
  input         io_ren_uops_0_bits_bypassable,
  input  [4:0]  io_ren_uops_0_bits_mem_cmd,
  input  [1:0]  io_ren_uops_0_bits_mem_size,
  input         io_ren_uops_0_bits_mem_signed,
                io_ren_uops_0_bits_is_fence,
                io_ren_uops_0_bits_is_fencei,
                io_ren_uops_0_bits_is_amo,
                io_ren_uops_0_bits_uses_ldq,
                io_ren_uops_0_bits_uses_stq,
                io_ren_uops_0_bits_is_sys_pc2epc,
                io_ren_uops_0_bits_is_unique,
                io_ren_uops_0_bits_flush_on_commit,
                io_ren_uops_0_bits_ldst_is_rs1,
  input  [5:0]  io_ren_uops_0_bits_ldst,
                io_ren_uops_0_bits_lrs1,
                io_ren_uops_0_bits_lrs2,
                io_ren_uops_0_bits_lrs3,
  input         io_ren_uops_0_bits_ldst_val,
  input  [1:0]  io_ren_uops_0_bits_dst_rtype,
                io_ren_uops_0_bits_lrs1_rtype,
                io_ren_uops_0_bits_lrs2_rtype,
  input         io_ren_uops_0_bits_frs3_en,
                io_ren_uops_0_bits_fp_val,
                io_ren_uops_0_bits_fp_single,
                io_ren_uops_0_bits_xcpt_pf_if,
                io_ren_uops_0_bits_xcpt_ae_if,
                io_ren_uops_0_bits_xcpt_ma_if,
                io_ren_uops_0_bits_bp_debug_if,
                io_ren_uops_0_bits_bp_xcpt_if,
  input  [1:0]  io_ren_uops_0_bits_debug_fsrc,
                io_ren_uops_0_bits_debug_tsrc,
  output        io_ren_uops_1_ready,
  input         io_ren_uops_1_valid,
  input  [6:0]  io_ren_uops_1_bits_uopc,
  input  [31:0] io_ren_uops_1_bits_inst,
                io_ren_uops_1_bits_debug_inst,
  input         io_ren_uops_1_bits_is_rvc,
  input  [39:0] io_ren_uops_1_bits_debug_pc,
  input  [2:0]  io_ren_uops_1_bits_iq_type,
  input  [9:0]  io_ren_uops_1_bits_fu_code,
  input         io_ren_uops_1_bits_is_br,
                io_ren_uops_1_bits_is_jalr,
                io_ren_uops_1_bits_is_jal,
                io_ren_uops_1_bits_is_sfb,
  input  [19:0] io_ren_uops_1_bits_br_mask,
  input  [4:0]  io_ren_uops_1_bits_br_tag,
  input  [5:0]  io_ren_uops_1_bits_ftq_idx,
  input         io_ren_uops_1_bits_edge_inst,
  input  [5:0]  io_ren_uops_1_bits_pc_lob,
  input         io_ren_uops_1_bits_taken,
  input  [19:0] io_ren_uops_1_bits_imm_packed,
  input  [11:0] io_ren_uops_1_bits_csr_addr,
  input  [6:0]  io_ren_uops_1_bits_rob_idx,
  input  [4:0]  io_ren_uops_1_bits_ldq_idx,
                io_ren_uops_1_bits_stq_idx,
  input  [1:0]  io_ren_uops_1_bits_rxq_idx,
  input  [6:0]  io_ren_uops_1_bits_pdst,
                io_ren_uops_1_bits_prs1,
                io_ren_uops_1_bits_prs2,
                io_ren_uops_1_bits_prs3,
  input         io_ren_uops_1_bits_prs1_busy,
                io_ren_uops_1_bits_prs2_busy,
                io_ren_uops_1_bits_prs3_busy,
  input  [6:0]  io_ren_uops_1_bits_stale_pdst,
  input         io_ren_uops_1_bits_exception,
  input  [63:0] io_ren_uops_1_bits_exc_cause,
  input         io_ren_uops_1_bits_bypassable,
  input  [4:0]  io_ren_uops_1_bits_mem_cmd,
  input  [1:0]  io_ren_uops_1_bits_mem_size,
  input         io_ren_uops_1_bits_mem_signed,
                io_ren_uops_1_bits_is_fence,
                io_ren_uops_1_bits_is_fencei,
                io_ren_uops_1_bits_is_amo,
                io_ren_uops_1_bits_uses_ldq,
                io_ren_uops_1_bits_uses_stq,
                io_ren_uops_1_bits_is_sys_pc2epc,
                io_ren_uops_1_bits_is_unique,
                io_ren_uops_1_bits_flush_on_commit,
                io_ren_uops_1_bits_ldst_is_rs1,
  input  [5:0]  io_ren_uops_1_bits_ldst,
                io_ren_uops_1_bits_lrs1,
                io_ren_uops_1_bits_lrs2,
                io_ren_uops_1_bits_lrs3,
  input         io_ren_uops_1_bits_ldst_val,
  input  [1:0]  io_ren_uops_1_bits_dst_rtype,
                io_ren_uops_1_bits_lrs1_rtype,
                io_ren_uops_1_bits_lrs2_rtype,
  input         io_ren_uops_1_bits_frs3_en,
                io_ren_uops_1_bits_fp_val,
                io_ren_uops_1_bits_fp_single,
                io_ren_uops_1_bits_xcpt_pf_if,
                io_ren_uops_1_bits_xcpt_ae_if,
                io_ren_uops_1_bits_xcpt_ma_if,
                io_ren_uops_1_bits_bp_debug_if,
                io_ren_uops_1_bits_bp_xcpt_if,
  input  [1:0]  io_ren_uops_1_bits_debug_fsrc,
                io_ren_uops_1_bits_debug_tsrc,
  output        io_ren_uops_2_ready,
  input         io_ren_uops_2_valid,
  input  [6:0]  io_ren_uops_2_bits_uopc,
  input  [31:0] io_ren_uops_2_bits_inst,
                io_ren_uops_2_bits_debug_inst,
  input         io_ren_uops_2_bits_is_rvc,
  input  [39:0] io_ren_uops_2_bits_debug_pc,
  input  [2:0]  io_ren_uops_2_bits_iq_type,
  input  [9:0]  io_ren_uops_2_bits_fu_code,
  input         io_ren_uops_2_bits_is_br,
                io_ren_uops_2_bits_is_jalr,
                io_ren_uops_2_bits_is_jal,
                io_ren_uops_2_bits_is_sfb,
  input  [19:0] io_ren_uops_2_bits_br_mask,
  input  [4:0]  io_ren_uops_2_bits_br_tag,
  input  [5:0]  io_ren_uops_2_bits_ftq_idx,
  input         io_ren_uops_2_bits_edge_inst,
  input  [5:0]  io_ren_uops_2_bits_pc_lob,
  input         io_ren_uops_2_bits_taken,
  input  [19:0] io_ren_uops_2_bits_imm_packed,
  input  [11:0] io_ren_uops_2_bits_csr_addr,
  input  [6:0]  io_ren_uops_2_bits_rob_idx,
  input  [4:0]  io_ren_uops_2_bits_ldq_idx,
                io_ren_uops_2_bits_stq_idx,
  input  [1:0]  io_ren_uops_2_bits_rxq_idx,
  input  [6:0]  io_ren_uops_2_bits_pdst,
                io_ren_uops_2_bits_prs1,
                io_ren_uops_2_bits_prs2,
                io_ren_uops_2_bits_prs3,
  input         io_ren_uops_2_bits_prs1_busy,
                io_ren_uops_2_bits_prs2_busy,
                io_ren_uops_2_bits_prs3_busy,
  input  [6:0]  io_ren_uops_2_bits_stale_pdst,
  input         io_ren_uops_2_bits_exception,
  input  [63:0] io_ren_uops_2_bits_exc_cause,
  input         io_ren_uops_2_bits_bypassable,
  input  [4:0]  io_ren_uops_2_bits_mem_cmd,
  input  [1:0]  io_ren_uops_2_bits_mem_size,
  input         io_ren_uops_2_bits_mem_signed,
                io_ren_uops_2_bits_is_fence,
                io_ren_uops_2_bits_is_fencei,
                io_ren_uops_2_bits_is_amo,
                io_ren_uops_2_bits_uses_ldq,
                io_ren_uops_2_bits_uses_stq,
                io_ren_uops_2_bits_is_sys_pc2epc,
                io_ren_uops_2_bits_is_unique,
                io_ren_uops_2_bits_flush_on_commit,
                io_ren_uops_2_bits_ldst_is_rs1,
  input  [5:0]  io_ren_uops_2_bits_ldst,
                io_ren_uops_2_bits_lrs1,
                io_ren_uops_2_bits_lrs2,
                io_ren_uops_2_bits_lrs3,
  input         io_ren_uops_2_bits_ldst_val,
  input  [1:0]  io_ren_uops_2_bits_dst_rtype,
                io_ren_uops_2_bits_lrs1_rtype,
                io_ren_uops_2_bits_lrs2_rtype,
  input         io_ren_uops_2_bits_frs3_en,
                io_ren_uops_2_bits_fp_val,
                io_ren_uops_2_bits_fp_single,
                io_ren_uops_2_bits_xcpt_pf_if,
                io_ren_uops_2_bits_xcpt_ae_if,
                io_ren_uops_2_bits_xcpt_ma_if,
                io_ren_uops_2_bits_bp_debug_if,
                io_ren_uops_2_bits_bp_xcpt_if,
  input  [1:0]  io_ren_uops_2_bits_debug_fsrc,
                io_ren_uops_2_bits_debug_tsrc,
  output        io_ren_uops_3_ready,
  input         io_ren_uops_3_valid,
  input  [6:0]  io_ren_uops_3_bits_uopc,
  input  [31:0] io_ren_uops_3_bits_inst,
                io_ren_uops_3_bits_debug_inst,
  input         io_ren_uops_3_bits_is_rvc,
  input  [39:0] io_ren_uops_3_bits_debug_pc,
  input  [2:0]  io_ren_uops_3_bits_iq_type,
  input  [9:0]  io_ren_uops_3_bits_fu_code,
  input         io_ren_uops_3_bits_is_br,
                io_ren_uops_3_bits_is_jalr,
                io_ren_uops_3_bits_is_jal,
                io_ren_uops_3_bits_is_sfb,
  input  [19:0] io_ren_uops_3_bits_br_mask,
  input  [4:0]  io_ren_uops_3_bits_br_tag,
  input  [5:0]  io_ren_uops_3_bits_ftq_idx,
  input         io_ren_uops_3_bits_edge_inst,
  input  [5:0]  io_ren_uops_3_bits_pc_lob,
  input         io_ren_uops_3_bits_taken,
  input  [19:0] io_ren_uops_3_bits_imm_packed,
  input  [11:0] io_ren_uops_3_bits_csr_addr,
  input  [6:0]  io_ren_uops_3_bits_rob_idx,
  input  [4:0]  io_ren_uops_3_bits_ldq_idx,
                io_ren_uops_3_bits_stq_idx,
  input  [1:0]  io_ren_uops_3_bits_rxq_idx,
  input  [6:0]  io_ren_uops_3_bits_pdst,
                io_ren_uops_3_bits_prs1,
                io_ren_uops_3_bits_prs2,
                io_ren_uops_3_bits_prs3,
  input         io_ren_uops_3_bits_prs1_busy,
                io_ren_uops_3_bits_prs2_busy,
                io_ren_uops_3_bits_prs3_busy,
  input  [6:0]  io_ren_uops_3_bits_stale_pdst,
  input         io_ren_uops_3_bits_exception,
  input  [63:0] io_ren_uops_3_bits_exc_cause,
  input         io_ren_uops_3_bits_bypassable,
  input  [4:0]  io_ren_uops_3_bits_mem_cmd,
  input  [1:0]  io_ren_uops_3_bits_mem_size,
  input         io_ren_uops_3_bits_mem_signed,
                io_ren_uops_3_bits_is_fence,
                io_ren_uops_3_bits_is_fencei,
                io_ren_uops_3_bits_is_amo,
                io_ren_uops_3_bits_uses_ldq,
                io_ren_uops_3_bits_uses_stq,
                io_ren_uops_3_bits_is_sys_pc2epc,
                io_ren_uops_3_bits_is_unique,
                io_ren_uops_3_bits_flush_on_commit,
                io_ren_uops_3_bits_ldst_is_rs1,
  input  [5:0]  io_ren_uops_3_bits_ldst,
                io_ren_uops_3_bits_lrs1,
                io_ren_uops_3_bits_lrs2,
                io_ren_uops_3_bits_lrs3,
  input         io_ren_uops_3_bits_ldst_val,
  input  [1:0]  io_ren_uops_3_bits_dst_rtype,
                io_ren_uops_3_bits_lrs1_rtype,
                io_ren_uops_3_bits_lrs2_rtype,
  input         io_ren_uops_3_bits_frs3_en,
                io_ren_uops_3_bits_fp_val,
                io_ren_uops_3_bits_fp_single,
                io_ren_uops_3_bits_xcpt_pf_if,
                io_ren_uops_3_bits_xcpt_ae_if,
                io_ren_uops_3_bits_xcpt_ma_if,
                io_ren_uops_3_bits_bp_debug_if,
                io_ren_uops_3_bits_bp_xcpt_if,
  input  [1:0]  io_ren_uops_3_bits_debug_fsrc,
                io_ren_uops_3_bits_debug_tsrc,
  input         io_dis_uops_2_0_ready,
  output        io_dis_uops_2_0_valid,
  output [6:0]  io_dis_uops_2_0_bits_uopc,
  output [31:0] io_dis_uops_2_0_bits_inst,
                io_dis_uops_2_0_bits_debug_inst,
  output        io_dis_uops_2_0_bits_is_rvc,
  output [39:0] io_dis_uops_2_0_bits_debug_pc,
  output [2:0]  io_dis_uops_2_0_bits_iq_type,
  output [9:0]  io_dis_uops_2_0_bits_fu_code,
  output        io_dis_uops_2_0_bits_is_br,
                io_dis_uops_2_0_bits_is_jalr,
                io_dis_uops_2_0_bits_is_jal,
                io_dis_uops_2_0_bits_is_sfb,
  output [19:0] io_dis_uops_2_0_bits_br_mask,
  output [4:0]  io_dis_uops_2_0_bits_br_tag,
  output [5:0]  io_dis_uops_2_0_bits_ftq_idx,
  output        io_dis_uops_2_0_bits_edge_inst,
  output [5:0]  io_dis_uops_2_0_bits_pc_lob,
  output        io_dis_uops_2_0_bits_taken,
  output [19:0] io_dis_uops_2_0_bits_imm_packed,
  output [11:0] io_dis_uops_2_0_bits_csr_addr,
  output [6:0]  io_dis_uops_2_0_bits_rob_idx,
  output [4:0]  io_dis_uops_2_0_bits_ldq_idx,
                io_dis_uops_2_0_bits_stq_idx,
  output [1:0]  io_dis_uops_2_0_bits_rxq_idx,
  output [6:0]  io_dis_uops_2_0_bits_pdst,
                io_dis_uops_2_0_bits_prs1,
                io_dis_uops_2_0_bits_prs2,
                io_dis_uops_2_0_bits_prs3,
  output        io_dis_uops_2_0_bits_prs1_busy,
                io_dis_uops_2_0_bits_prs2_busy,
                io_dis_uops_2_0_bits_prs3_busy,
  output [6:0]  io_dis_uops_2_0_bits_stale_pdst,
  output        io_dis_uops_2_0_bits_exception,
  output [63:0] io_dis_uops_2_0_bits_exc_cause,
  output        io_dis_uops_2_0_bits_bypassable,
  output [4:0]  io_dis_uops_2_0_bits_mem_cmd,
  output [1:0]  io_dis_uops_2_0_bits_mem_size,
  output        io_dis_uops_2_0_bits_mem_signed,
                io_dis_uops_2_0_bits_is_fence,
                io_dis_uops_2_0_bits_is_fencei,
                io_dis_uops_2_0_bits_is_amo,
                io_dis_uops_2_0_bits_uses_ldq,
                io_dis_uops_2_0_bits_uses_stq,
                io_dis_uops_2_0_bits_is_sys_pc2epc,
                io_dis_uops_2_0_bits_is_unique,
                io_dis_uops_2_0_bits_flush_on_commit,
                io_dis_uops_2_0_bits_ldst_is_rs1,
  output [5:0]  io_dis_uops_2_0_bits_ldst,
                io_dis_uops_2_0_bits_lrs1,
                io_dis_uops_2_0_bits_lrs2,
                io_dis_uops_2_0_bits_lrs3,
  output        io_dis_uops_2_0_bits_ldst_val,
  output [1:0]  io_dis_uops_2_0_bits_dst_rtype,
                io_dis_uops_2_0_bits_lrs1_rtype,
                io_dis_uops_2_0_bits_lrs2_rtype,
  output        io_dis_uops_2_0_bits_frs3_en,
                io_dis_uops_2_0_bits_fp_val,
                io_dis_uops_2_0_bits_fp_single,
                io_dis_uops_2_0_bits_xcpt_pf_if,
                io_dis_uops_2_0_bits_xcpt_ae_if,
                io_dis_uops_2_0_bits_xcpt_ma_if,
                io_dis_uops_2_0_bits_bp_debug_if,
                io_dis_uops_2_0_bits_bp_xcpt_if,
  output [1:0]  io_dis_uops_2_0_bits_debug_fsrc,
                io_dis_uops_2_0_bits_debug_tsrc,
  input         io_dis_uops_2_1_ready,
  output        io_dis_uops_2_1_valid,
  output [6:0]  io_dis_uops_2_1_bits_uopc,
  output [31:0] io_dis_uops_2_1_bits_inst,
                io_dis_uops_2_1_bits_debug_inst,
  output        io_dis_uops_2_1_bits_is_rvc,
  output [39:0] io_dis_uops_2_1_bits_debug_pc,
  output [2:0]  io_dis_uops_2_1_bits_iq_type,
  output [9:0]  io_dis_uops_2_1_bits_fu_code,
  output        io_dis_uops_2_1_bits_is_br,
                io_dis_uops_2_1_bits_is_jalr,
                io_dis_uops_2_1_bits_is_jal,
                io_dis_uops_2_1_bits_is_sfb,
  output [19:0] io_dis_uops_2_1_bits_br_mask,
  output [4:0]  io_dis_uops_2_1_bits_br_tag,
  output [5:0]  io_dis_uops_2_1_bits_ftq_idx,
  output        io_dis_uops_2_1_bits_edge_inst,
  output [5:0]  io_dis_uops_2_1_bits_pc_lob,
  output        io_dis_uops_2_1_bits_taken,
  output [19:0] io_dis_uops_2_1_bits_imm_packed,
  output [11:0] io_dis_uops_2_1_bits_csr_addr,
  output [6:0]  io_dis_uops_2_1_bits_rob_idx,
  output [4:0]  io_dis_uops_2_1_bits_ldq_idx,
                io_dis_uops_2_1_bits_stq_idx,
  output [1:0]  io_dis_uops_2_1_bits_rxq_idx,
  output [6:0]  io_dis_uops_2_1_bits_pdst,
                io_dis_uops_2_1_bits_prs1,
                io_dis_uops_2_1_bits_prs2,
                io_dis_uops_2_1_bits_prs3,
  output        io_dis_uops_2_1_bits_prs1_busy,
                io_dis_uops_2_1_bits_prs2_busy,
                io_dis_uops_2_1_bits_prs3_busy,
  output [6:0]  io_dis_uops_2_1_bits_stale_pdst,
  output        io_dis_uops_2_1_bits_exception,
  output [63:0] io_dis_uops_2_1_bits_exc_cause,
  output        io_dis_uops_2_1_bits_bypassable,
  output [4:0]  io_dis_uops_2_1_bits_mem_cmd,
  output [1:0]  io_dis_uops_2_1_bits_mem_size,
  output        io_dis_uops_2_1_bits_mem_signed,
                io_dis_uops_2_1_bits_is_fence,
                io_dis_uops_2_1_bits_is_fencei,
                io_dis_uops_2_1_bits_is_amo,
                io_dis_uops_2_1_bits_uses_ldq,
                io_dis_uops_2_1_bits_uses_stq,
                io_dis_uops_2_1_bits_is_sys_pc2epc,
                io_dis_uops_2_1_bits_is_unique,
                io_dis_uops_2_1_bits_flush_on_commit,
                io_dis_uops_2_1_bits_ldst_is_rs1,
  output [5:0]  io_dis_uops_2_1_bits_ldst,
                io_dis_uops_2_1_bits_lrs1,
                io_dis_uops_2_1_bits_lrs2,
                io_dis_uops_2_1_bits_lrs3,
  output        io_dis_uops_2_1_bits_ldst_val,
  output [1:0]  io_dis_uops_2_1_bits_dst_rtype,
                io_dis_uops_2_1_bits_lrs1_rtype,
                io_dis_uops_2_1_bits_lrs2_rtype,
  output        io_dis_uops_2_1_bits_frs3_en,
                io_dis_uops_2_1_bits_fp_val,
                io_dis_uops_2_1_bits_fp_single,
                io_dis_uops_2_1_bits_xcpt_pf_if,
                io_dis_uops_2_1_bits_xcpt_ae_if,
                io_dis_uops_2_1_bits_xcpt_ma_if,
                io_dis_uops_2_1_bits_bp_debug_if,
                io_dis_uops_2_1_bits_bp_xcpt_if,
  output [1:0]  io_dis_uops_2_1_bits_debug_fsrc,
                io_dis_uops_2_1_bits_debug_tsrc,
  input         io_dis_uops_2_2_ready,
  output        io_dis_uops_2_2_valid,
  output [6:0]  io_dis_uops_2_2_bits_uopc,
  output [31:0] io_dis_uops_2_2_bits_inst,
                io_dis_uops_2_2_bits_debug_inst,
  output        io_dis_uops_2_2_bits_is_rvc,
  output [39:0] io_dis_uops_2_2_bits_debug_pc,
  output [2:0]  io_dis_uops_2_2_bits_iq_type,
  output [9:0]  io_dis_uops_2_2_bits_fu_code,
  output        io_dis_uops_2_2_bits_is_br,
                io_dis_uops_2_2_bits_is_jalr,
                io_dis_uops_2_2_bits_is_jal,
                io_dis_uops_2_2_bits_is_sfb,
  output [19:0] io_dis_uops_2_2_bits_br_mask,
  output [4:0]  io_dis_uops_2_2_bits_br_tag,
  output [5:0]  io_dis_uops_2_2_bits_ftq_idx,
  output        io_dis_uops_2_2_bits_edge_inst,
  output [5:0]  io_dis_uops_2_2_bits_pc_lob,
  output        io_dis_uops_2_2_bits_taken,
  output [19:0] io_dis_uops_2_2_bits_imm_packed,
  output [11:0] io_dis_uops_2_2_bits_csr_addr,
  output [6:0]  io_dis_uops_2_2_bits_rob_idx,
  output [4:0]  io_dis_uops_2_2_bits_ldq_idx,
                io_dis_uops_2_2_bits_stq_idx,
  output [1:0]  io_dis_uops_2_2_bits_rxq_idx,
  output [6:0]  io_dis_uops_2_2_bits_pdst,
                io_dis_uops_2_2_bits_prs1,
                io_dis_uops_2_2_bits_prs2,
                io_dis_uops_2_2_bits_prs3,
  output        io_dis_uops_2_2_bits_prs1_busy,
                io_dis_uops_2_2_bits_prs2_busy,
                io_dis_uops_2_2_bits_prs3_busy,
  output [6:0]  io_dis_uops_2_2_bits_stale_pdst,
  output        io_dis_uops_2_2_bits_exception,
  output [63:0] io_dis_uops_2_2_bits_exc_cause,
  output        io_dis_uops_2_2_bits_bypassable,
  output [4:0]  io_dis_uops_2_2_bits_mem_cmd,
  output [1:0]  io_dis_uops_2_2_bits_mem_size,
  output        io_dis_uops_2_2_bits_mem_signed,
                io_dis_uops_2_2_bits_is_fence,
                io_dis_uops_2_2_bits_is_fencei,
                io_dis_uops_2_2_bits_is_amo,
                io_dis_uops_2_2_bits_uses_ldq,
                io_dis_uops_2_2_bits_uses_stq,
                io_dis_uops_2_2_bits_is_sys_pc2epc,
                io_dis_uops_2_2_bits_is_unique,
                io_dis_uops_2_2_bits_flush_on_commit,
                io_dis_uops_2_2_bits_ldst_is_rs1,
  output [5:0]  io_dis_uops_2_2_bits_ldst,
                io_dis_uops_2_2_bits_lrs1,
                io_dis_uops_2_2_bits_lrs2,
                io_dis_uops_2_2_bits_lrs3,
  output        io_dis_uops_2_2_bits_ldst_val,
  output [1:0]  io_dis_uops_2_2_bits_dst_rtype,
                io_dis_uops_2_2_bits_lrs1_rtype,
                io_dis_uops_2_2_bits_lrs2_rtype,
  output        io_dis_uops_2_2_bits_frs3_en,
                io_dis_uops_2_2_bits_fp_val,
                io_dis_uops_2_2_bits_fp_single,
                io_dis_uops_2_2_bits_xcpt_pf_if,
                io_dis_uops_2_2_bits_xcpt_ae_if,
                io_dis_uops_2_2_bits_xcpt_ma_if,
                io_dis_uops_2_2_bits_bp_debug_if,
                io_dis_uops_2_2_bits_bp_xcpt_if,
  output [1:0]  io_dis_uops_2_2_bits_debug_fsrc,
                io_dis_uops_2_2_bits_debug_tsrc,
  input         io_dis_uops_2_3_ready,
  output        io_dis_uops_2_3_valid,
  output [6:0]  io_dis_uops_2_3_bits_uopc,
  output [31:0] io_dis_uops_2_3_bits_inst,
                io_dis_uops_2_3_bits_debug_inst,
  output        io_dis_uops_2_3_bits_is_rvc,
  output [39:0] io_dis_uops_2_3_bits_debug_pc,
  output [2:0]  io_dis_uops_2_3_bits_iq_type,
  output [9:0]  io_dis_uops_2_3_bits_fu_code,
  output        io_dis_uops_2_3_bits_is_br,
                io_dis_uops_2_3_bits_is_jalr,
                io_dis_uops_2_3_bits_is_jal,
                io_dis_uops_2_3_bits_is_sfb,
  output [19:0] io_dis_uops_2_3_bits_br_mask,
  output [4:0]  io_dis_uops_2_3_bits_br_tag,
  output [5:0]  io_dis_uops_2_3_bits_ftq_idx,
  output        io_dis_uops_2_3_bits_edge_inst,
  output [5:0]  io_dis_uops_2_3_bits_pc_lob,
  output        io_dis_uops_2_3_bits_taken,
  output [19:0] io_dis_uops_2_3_bits_imm_packed,
  output [11:0] io_dis_uops_2_3_bits_csr_addr,
  output [6:0]  io_dis_uops_2_3_bits_rob_idx,
  output [4:0]  io_dis_uops_2_3_bits_ldq_idx,
                io_dis_uops_2_3_bits_stq_idx,
  output [1:0]  io_dis_uops_2_3_bits_rxq_idx,
  output [6:0]  io_dis_uops_2_3_bits_pdst,
                io_dis_uops_2_3_bits_prs1,
                io_dis_uops_2_3_bits_prs2,
                io_dis_uops_2_3_bits_prs3,
  output        io_dis_uops_2_3_bits_prs1_busy,
                io_dis_uops_2_3_bits_prs2_busy,
                io_dis_uops_2_3_bits_prs3_busy,
  output [6:0]  io_dis_uops_2_3_bits_stale_pdst,
  output        io_dis_uops_2_3_bits_exception,
  output [63:0] io_dis_uops_2_3_bits_exc_cause,
  output        io_dis_uops_2_3_bits_bypassable,
  output [4:0]  io_dis_uops_2_3_bits_mem_cmd,
  output [1:0]  io_dis_uops_2_3_bits_mem_size,
  output        io_dis_uops_2_3_bits_mem_signed,
                io_dis_uops_2_3_bits_is_fence,
                io_dis_uops_2_3_bits_is_fencei,
                io_dis_uops_2_3_bits_is_amo,
                io_dis_uops_2_3_bits_uses_ldq,
                io_dis_uops_2_3_bits_uses_stq,
                io_dis_uops_2_3_bits_is_sys_pc2epc,
                io_dis_uops_2_3_bits_is_unique,
                io_dis_uops_2_3_bits_flush_on_commit,
                io_dis_uops_2_3_bits_ldst_is_rs1,
  output [5:0]  io_dis_uops_2_3_bits_ldst,
                io_dis_uops_2_3_bits_lrs1,
                io_dis_uops_2_3_bits_lrs2,
                io_dis_uops_2_3_bits_lrs3,
  output        io_dis_uops_2_3_bits_ldst_val,
  output [1:0]  io_dis_uops_2_3_bits_dst_rtype,
                io_dis_uops_2_3_bits_lrs1_rtype,
                io_dis_uops_2_3_bits_lrs2_rtype,
  output        io_dis_uops_2_3_bits_frs3_en,
                io_dis_uops_2_3_bits_fp_val,
                io_dis_uops_2_3_bits_fp_single,
                io_dis_uops_2_3_bits_xcpt_pf_if,
                io_dis_uops_2_3_bits_xcpt_ae_if,
                io_dis_uops_2_3_bits_xcpt_ma_if,
                io_dis_uops_2_3_bits_bp_debug_if,
                io_dis_uops_2_3_bits_bp_xcpt_if,
  output [1:0]  io_dis_uops_2_3_bits_debug_fsrc,
                io_dis_uops_2_3_bits_debug_tsrc,
  input         io_dis_uops_1_0_ready,
  output        io_dis_uops_1_0_valid,
  output [6:0]  io_dis_uops_1_0_bits_uopc,
  output [31:0] io_dis_uops_1_0_bits_inst,
                io_dis_uops_1_0_bits_debug_inst,
  output        io_dis_uops_1_0_bits_is_rvc,
  output [39:0] io_dis_uops_1_0_bits_debug_pc,
  output [2:0]  io_dis_uops_1_0_bits_iq_type,
  output [9:0]  io_dis_uops_1_0_bits_fu_code,
  output        io_dis_uops_1_0_bits_is_br,
                io_dis_uops_1_0_bits_is_jalr,
                io_dis_uops_1_0_bits_is_jal,
                io_dis_uops_1_0_bits_is_sfb,
  output [19:0] io_dis_uops_1_0_bits_br_mask,
  output [4:0]  io_dis_uops_1_0_bits_br_tag,
  output [5:0]  io_dis_uops_1_0_bits_ftq_idx,
  output        io_dis_uops_1_0_bits_edge_inst,
  output [5:0]  io_dis_uops_1_0_bits_pc_lob,
  output        io_dis_uops_1_0_bits_taken,
  output [19:0] io_dis_uops_1_0_bits_imm_packed,
  output [11:0] io_dis_uops_1_0_bits_csr_addr,
  output [6:0]  io_dis_uops_1_0_bits_rob_idx,
  output [4:0]  io_dis_uops_1_0_bits_ldq_idx,
                io_dis_uops_1_0_bits_stq_idx,
  output [1:0]  io_dis_uops_1_0_bits_rxq_idx,
  output [6:0]  io_dis_uops_1_0_bits_pdst,
                io_dis_uops_1_0_bits_prs1,
                io_dis_uops_1_0_bits_prs2,
                io_dis_uops_1_0_bits_prs3,
  output        io_dis_uops_1_0_bits_prs1_busy,
                io_dis_uops_1_0_bits_prs2_busy,
  output [6:0]  io_dis_uops_1_0_bits_stale_pdst,
  output        io_dis_uops_1_0_bits_exception,
  output [63:0] io_dis_uops_1_0_bits_exc_cause,
  output        io_dis_uops_1_0_bits_bypassable,
  output [4:0]  io_dis_uops_1_0_bits_mem_cmd,
  output [1:0]  io_dis_uops_1_0_bits_mem_size,
  output        io_dis_uops_1_0_bits_mem_signed,
                io_dis_uops_1_0_bits_is_fence,
                io_dis_uops_1_0_bits_is_fencei,
                io_dis_uops_1_0_bits_is_amo,
                io_dis_uops_1_0_bits_uses_ldq,
                io_dis_uops_1_0_bits_uses_stq,
                io_dis_uops_1_0_bits_is_sys_pc2epc,
                io_dis_uops_1_0_bits_is_unique,
                io_dis_uops_1_0_bits_flush_on_commit,
                io_dis_uops_1_0_bits_ldst_is_rs1,
  output [5:0]  io_dis_uops_1_0_bits_ldst,
                io_dis_uops_1_0_bits_lrs1,
                io_dis_uops_1_0_bits_lrs2,
                io_dis_uops_1_0_bits_lrs3,
  output        io_dis_uops_1_0_bits_ldst_val,
  output [1:0]  io_dis_uops_1_0_bits_dst_rtype,
                io_dis_uops_1_0_bits_lrs1_rtype,
                io_dis_uops_1_0_bits_lrs2_rtype,
  output        io_dis_uops_1_0_bits_frs3_en,
                io_dis_uops_1_0_bits_fp_val,
                io_dis_uops_1_0_bits_fp_single,
                io_dis_uops_1_0_bits_xcpt_pf_if,
                io_dis_uops_1_0_bits_xcpt_ae_if,
                io_dis_uops_1_0_bits_xcpt_ma_if,
                io_dis_uops_1_0_bits_bp_debug_if,
                io_dis_uops_1_0_bits_bp_xcpt_if,
  output [1:0]  io_dis_uops_1_0_bits_debug_fsrc,
                io_dis_uops_1_0_bits_debug_tsrc,
  input         io_dis_uops_1_1_ready,
  output        io_dis_uops_1_1_valid,
  output [6:0]  io_dis_uops_1_1_bits_uopc,
  output [31:0] io_dis_uops_1_1_bits_inst,
                io_dis_uops_1_1_bits_debug_inst,
  output        io_dis_uops_1_1_bits_is_rvc,
  output [39:0] io_dis_uops_1_1_bits_debug_pc,
  output [2:0]  io_dis_uops_1_1_bits_iq_type,
  output [9:0]  io_dis_uops_1_1_bits_fu_code,
  output        io_dis_uops_1_1_bits_is_br,
                io_dis_uops_1_1_bits_is_jalr,
                io_dis_uops_1_1_bits_is_jal,
                io_dis_uops_1_1_bits_is_sfb,
  output [19:0] io_dis_uops_1_1_bits_br_mask,
  output [4:0]  io_dis_uops_1_1_bits_br_tag,
  output [5:0]  io_dis_uops_1_1_bits_ftq_idx,
  output        io_dis_uops_1_1_bits_edge_inst,
  output [5:0]  io_dis_uops_1_1_bits_pc_lob,
  output        io_dis_uops_1_1_bits_taken,
  output [19:0] io_dis_uops_1_1_bits_imm_packed,
  output [11:0] io_dis_uops_1_1_bits_csr_addr,
  output [6:0]  io_dis_uops_1_1_bits_rob_idx,
  output [4:0]  io_dis_uops_1_1_bits_ldq_idx,
                io_dis_uops_1_1_bits_stq_idx,
  output [1:0]  io_dis_uops_1_1_bits_rxq_idx,
  output [6:0]  io_dis_uops_1_1_bits_pdst,
                io_dis_uops_1_1_bits_prs1,
                io_dis_uops_1_1_bits_prs2,
                io_dis_uops_1_1_bits_prs3,
  output        io_dis_uops_1_1_bits_prs1_busy,
                io_dis_uops_1_1_bits_prs2_busy,
  output [6:0]  io_dis_uops_1_1_bits_stale_pdst,
  output        io_dis_uops_1_1_bits_exception,
  output [63:0] io_dis_uops_1_1_bits_exc_cause,
  output        io_dis_uops_1_1_bits_bypassable,
  output [4:0]  io_dis_uops_1_1_bits_mem_cmd,
  output [1:0]  io_dis_uops_1_1_bits_mem_size,
  output        io_dis_uops_1_1_bits_mem_signed,
                io_dis_uops_1_1_bits_is_fence,
                io_dis_uops_1_1_bits_is_fencei,
                io_dis_uops_1_1_bits_is_amo,
                io_dis_uops_1_1_bits_uses_ldq,
                io_dis_uops_1_1_bits_uses_stq,
                io_dis_uops_1_1_bits_is_sys_pc2epc,
                io_dis_uops_1_1_bits_is_unique,
                io_dis_uops_1_1_bits_flush_on_commit,
                io_dis_uops_1_1_bits_ldst_is_rs1,
  output [5:0]  io_dis_uops_1_1_bits_ldst,
                io_dis_uops_1_1_bits_lrs1,
                io_dis_uops_1_1_bits_lrs2,
                io_dis_uops_1_1_bits_lrs3,
  output        io_dis_uops_1_1_bits_ldst_val,
  output [1:0]  io_dis_uops_1_1_bits_dst_rtype,
                io_dis_uops_1_1_bits_lrs1_rtype,
                io_dis_uops_1_1_bits_lrs2_rtype,
  output        io_dis_uops_1_1_bits_frs3_en,
                io_dis_uops_1_1_bits_fp_val,
                io_dis_uops_1_1_bits_fp_single,
                io_dis_uops_1_1_bits_xcpt_pf_if,
                io_dis_uops_1_1_bits_xcpt_ae_if,
                io_dis_uops_1_1_bits_xcpt_ma_if,
                io_dis_uops_1_1_bits_bp_debug_if,
                io_dis_uops_1_1_bits_bp_xcpt_if,
  output [1:0]  io_dis_uops_1_1_bits_debug_fsrc,
                io_dis_uops_1_1_bits_debug_tsrc,
  input         io_dis_uops_1_2_ready,
  output        io_dis_uops_1_2_valid,
  output [6:0]  io_dis_uops_1_2_bits_uopc,
  output [31:0] io_dis_uops_1_2_bits_inst,
                io_dis_uops_1_2_bits_debug_inst,
  output        io_dis_uops_1_2_bits_is_rvc,
  output [39:0] io_dis_uops_1_2_bits_debug_pc,
  output [2:0]  io_dis_uops_1_2_bits_iq_type,
  output [9:0]  io_dis_uops_1_2_bits_fu_code,
  output        io_dis_uops_1_2_bits_is_br,
                io_dis_uops_1_2_bits_is_jalr,
                io_dis_uops_1_2_bits_is_jal,
                io_dis_uops_1_2_bits_is_sfb,
  output [19:0] io_dis_uops_1_2_bits_br_mask,
  output [4:0]  io_dis_uops_1_2_bits_br_tag,
  output [5:0]  io_dis_uops_1_2_bits_ftq_idx,
  output        io_dis_uops_1_2_bits_edge_inst,
  output [5:0]  io_dis_uops_1_2_bits_pc_lob,
  output        io_dis_uops_1_2_bits_taken,
  output [19:0] io_dis_uops_1_2_bits_imm_packed,
  output [11:0] io_dis_uops_1_2_bits_csr_addr,
  output [6:0]  io_dis_uops_1_2_bits_rob_idx,
  output [4:0]  io_dis_uops_1_2_bits_ldq_idx,
                io_dis_uops_1_2_bits_stq_idx,
  output [1:0]  io_dis_uops_1_2_bits_rxq_idx,
  output [6:0]  io_dis_uops_1_2_bits_pdst,
                io_dis_uops_1_2_bits_prs1,
                io_dis_uops_1_2_bits_prs2,
                io_dis_uops_1_2_bits_prs3,
  output        io_dis_uops_1_2_bits_prs1_busy,
                io_dis_uops_1_2_bits_prs2_busy,
  output [6:0]  io_dis_uops_1_2_bits_stale_pdst,
  output        io_dis_uops_1_2_bits_exception,
  output [63:0] io_dis_uops_1_2_bits_exc_cause,
  output        io_dis_uops_1_2_bits_bypassable,
  output [4:0]  io_dis_uops_1_2_bits_mem_cmd,
  output [1:0]  io_dis_uops_1_2_bits_mem_size,
  output        io_dis_uops_1_2_bits_mem_signed,
                io_dis_uops_1_2_bits_is_fence,
                io_dis_uops_1_2_bits_is_fencei,
                io_dis_uops_1_2_bits_is_amo,
                io_dis_uops_1_2_bits_uses_ldq,
                io_dis_uops_1_2_bits_uses_stq,
                io_dis_uops_1_2_bits_is_sys_pc2epc,
                io_dis_uops_1_2_bits_is_unique,
                io_dis_uops_1_2_bits_flush_on_commit,
                io_dis_uops_1_2_bits_ldst_is_rs1,
  output [5:0]  io_dis_uops_1_2_bits_ldst,
                io_dis_uops_1_2_bits_lrs1,
                io_dis_uops_1_2_bits_lrs2,
                io_dis_uops_1_2_bits_lrs3,
  output        io_dis_uops_1_2_bits_ldst_val,
  output [1:0]  io_dis_uops_1_2_bits_dst_rtype,
                io_dis_uops_1_2_bits_lrs1_rtype,
                io_dis_uops_1_2_bits_lrs2_rtype,
  output        io_dis_uops_1_2_bits_frs3_en,
                io_dis_uops_1_2_bits_fp_val,
                io_dis_uops_1_2_bits_fp_single,
                io_dis_uops_1_2_bits_xcpt_pf_if,
                io_dis_uops_1_2_bits_xcpt_ae_if,
                io_dis_uops_1_2_bits_xcpt_ma_if,
                io_dis_uops_1_2_bits_bp_debug_if,
                io_dis_uops_1_2_bits_bp_xcpt_if,
  output [1:0]  io_dis_uops_1_2_bits_debug_fsrc,
                io_dis_uops_1_2_bits_debug_tsrc,
  input         io_dis_uops_1_3_ready,
  output        io_dis_uops_1_3_valid,
  output [6:0]  io_dis_uops_1_3_bits_uopc,
  output [31:0] io_dis_uops_1_3_bits_inst,
                io_dis_uops_1_3_bits_debug_inst,
  output        io_dis_uops_1_3_bits_is_rvc,
  output [39:0] io_dis_uops_1_3_bits_debug_pc,
  output [2:0]  io_dis_uops_1_3_bits_iq_type,
  output [9:0]  io_dis_uops_1_3_bits_fu_code,
  output        io_dis_uops_1_3_bits_is_br,
                io_dis_uops_1_3_bits_is_jalr,
                io_dis_uops_1_3_bits_is_jal,
                io_dis_uops_1_3_bits_is_sfb,
  output [19:0] io_dis_uops_1_3_bits_br_mask,
  output [4:0]  io_dis_uops_1_3_bits_br_tag,
  output [5:0]  io_dis_uops_1_3_bits_ftq_idx,
  output        io_dis_uops_1_3_bits_edge_inst,
  output [5:0]  io_dis_uops_1_3_bits_pc_lob,
  output        io_dis_uops_1_3_bits_taken,
  output [19:0] io_dis_uops_1_3_bits_imm_packed,
  output [11:0] io_dis_uops_1_3_bits_csr_addr,
  output [6:0]  io_dis_uops_1_3_bits_rob_idx,
  output [4:0]  io_dis_uops_1_3_bits_ldq_idx,
                io_dis_uops_1_3_bits_stq_idx,
  output [1:0]  io_dis_uops_1_3_bits_rxq_idx,
  output [6:0]  io_dis_uops_1_3_bits_pdst,
                io_dis_uops_1_3_bits_prs1,
                io_dis_uops_1_3_bits_prs2,
                io_dis_uops_1_3_bits_prs3,
  output        io_dis_uops_1_3_bits_prs1_busy,
                io_dis_uops_1_3_bits_prs2_busy,
  output [6:0]  io_dis_uops_1_3_bits_stale_pdst,
  output        io_dis_uops_1_3_bits_exception,
  output [63:0] io_dis_uops_1_3_bits_exc_cause,
  output        io_dis_uops_1_3_bits_bypassable,
  output [4:0]  io_dis_uops_1_3_bits_mem_cmd,
  output [1:0]  io_dis_uops_1_3_bits_mem_size,
  output        io_dis_uops_1_3_bits_mem_signed,
                io_dis_uops_1_3_bits_is_fence,
                io_dis_uops_1_3_bits_is_fencei,
                io_dis_uops_1_3_bits_is_amo,
                io_dis_uops_1_3_bits_uses_ldq,
                io_dis_uops_1_3_bits_uses_stq,
                io_dis_uops_1_3_bits_is_sys_pc2epc,
                io_dis_uops_1_3_bits_is_unique,
                io_dis_uops_1_3_bits_flush_on_commit,
                io_dis_uops_1_3_bits_ldst_is_rs1,
  output [5:0]  io_dis_uops_1_3_bits_ldst,
                io_dis_uops_1_3_bits_lrs1,
                io_dis_uops_1_3_bits_lrs2,
                io_dis_uops_1_3_bits_lrs3,
  output        io_dis_uops_1_3_bits_ldst_val,
  output [1:0]  io_dis_uops_1_3_bits_dst_rtype,
                io_dis_uops_1_3_bits_lrs1_rtype,
                io_dis_uops_1_3_bits_lrs2_rtype,
  output        io_dis_uops_1_3_bits_frs3_en,
                io_dis_uops_1_3_bits_fp_val,
                io_dis_uops_1_3_bits_fp_single,
                io_dis_uops_1_3_bits_xcpt_pf_if,
                io_dis_uops_1_3_bits_xcpt_ae_if,
                io_dis_uops_1_3_bits_xcpt_ma_if,
                io_dis_uops_1_3_bits_bp_debug_if,
                io_dis_uops_1_3_bits_bp_xcpt_if,
  output [1:0]  io_dis_uops_1_3_bits_debug_fsrc,
                io_dis_uops_1_3_bits_debug_tsrc,
  input         io_dis_uops_0_0_ready,
  output        io_dis_uops_0_0_valid,
  output [6:0]  io_dis_uops_0_0_bits_uopc,
  output [31:0] io_dis_uops_0_0_bits_inst,
                io_dis_uops_0_0_bits_debug_inst,
  output        io_dis_uops_0_0_bits_is_rvc,
  output [39:0] io_dis_uops_0_0_bits_debug_pc,
  output [2:0]  io_dis_uops_0_0_bits_iq_type,
  output [9:0]  io_dis_uops_0_0_bits_fu_code,
  output        io_dis_uops_0_0_bits_is_br,
                io_dis_uops_0_0_bits_is_jalr,
                io_dis_uops_0_0_bits_is_jal,
                io_dis_uops_0_0_bits_is_sfb,
  output [19:0] io_dis_uops_0_0_bits_br_mask,
  output [4:0]  io_dis_uops_0_0_bits_br_tag,
  output [5:0]  io_dis_uops_0_0_bits_ftq_idx,
  output        io_dis_uops_0_0_bits_edge_inst,
  output [5:0]  io_dis_uops_0_0_bits_pc_lob,
  output        io_dis_uops_0_0_bits_taken,
  output [19:0] io_dis_uops_0_0_bits_imm_packed,
  output [11:0] io_dis_uops_0_0_bits_csr_addr,
  output [6:0]  io_dis_uops_0_0_bits_rob_idx,
  output [4:0]  io_dis_uops_0_0_bits_ldq_idx,
                io_dis_uops_0_0_bits_stq_idx,
  output [1:0]  io_dis_uops_0_0_bits_rxq_idx,
  output [6:0]  io_dis_uops_0_0_bits_pdst,
                io_dis_uops_0_0_bits_prs1,
                io_dis_uops_0_0_bits_prs2,
                io_dis_uops_0_0_bits_prs3,
  output        io_dis_uops_0_0_bits_prs1_busy,
                io_dis_uops_0_0_bits_prs2_busy,
  output [6:0]  io_dis_uops_0_0_bits_stale_pdst,
  output        io_dis_uops_0_0_bits_exception,
  output [63:0] io_dis_uops_0_0_bits_exc_cause,
  output        io_dis_uops_0_0_bits_bypassable,
  output [4:0]  io_dis_uops_0_0_bits_mem_cmd,
  output [1:0]  io_dis_uops_0_0_bits_mem_size,
  output        io_dis_uops_0_0_bits_mem_signed,
                io_dis_uops_0_0_bits_is_fence,
                io_dis_uops_0_0_bits_is_fencei,
                io_dis_uops_0_0_bits_is_amo,
                io_dis_uops_0_0_bits_uses_ldq,
                io_dis_uops_0_0_bits_uses_stq,
                io_dis_uops_0_0_bits_is_sys_pc2epc,
                io_dis_uops_0_0_bits_is_unique,
                io_dis_uops_0_0_bits_flush_on_commit,
                io_dis_uops_0_0_bits_ldst_is_rs1,
  output [5:0]  io_dis_uops_0_0_bits_ldst,
                io_dis_uops_0_0_bits_lrs1,
                io_dis_uops_0_0_bits_lrs2,
                io_dis_uops_0_0_bits_lrs3,
  output        io_dis_uops_0_0_bits_ldst_val,
  output [1:0]  io_dis_uops_0_0_bits_dst_rtype,
                io_dis_uops_0_0_bits_lrs1_rtype,
                io_dis_uops_0_0_bits_lrs2_rtype,
  output        io_dis_uops_0_0_bits_frs3_en,
                io_dis_uops_0_0_bits_fp_val,
                io_dis_uops_0_0_bits_fp_single,
                io_dis_uops_0_0_bits_xcpt_pf_if,
                io_dis_uops_0_0_bits_xcpt_ae_if,
                io_dis_uops_0_0_bits_xcpt_ma_if,
                io_dis_uops_0_0_bits_bp_debug_if,
                io_dis_uops_0_0_bits_bp_xcpt_if,
  output [1:0]  io_dis_uops_0_0_bits_debug_fsrc,
                io_dis_uops_0_0_bits_debug_tsrc,
  input         io_dis_uops_0_1_ready,
  output        io_dis_uops_0_1_valid,
  output [6:0]  io_dis_uops_0_1_bits_uopc,
  output [31:0] io_dis_uops_0_1_bits_inst,
                io_dis_uops_0_1_bits_debug_inst,
  output        io_dis_uops_0_1_bits_is_rvc,
  output [39:0] io_dis_uops_0_1_bits_debug_pc,
  output [2:0]  io_dis_uops_0_1_bits_iq_type,
  output [9:0]  io_dis_uops_0_1_bits_fu_code,
  output        io_dis_uops_0_1_bits_is_br,
                io_dis_uops_0_1_bits_is_jalr,
                io_dis_uops_0_1_bits_is_jal,
                io_dis_uops_0_1_bits_is_sfb,
  output [19:0] io_dis_uops_0_1_bits_br_mask,
  output [4:0]  io_dis_uops_0_1_bits_br_tag,
  output [5:0]  io_dis_uops_0_1_bits_ftq_idx,
  output        io_dis_uops_0_1_bits_edge_inst,
  output [5:0]  io_dis_uops_0_1_bits_pc_lob,
  output        io_dis_uops_0_1_bits_taken,
  output [19:0] io_dis_uops_0_1_bits_imm_packed,
  output [11:0] io_dis_uops_0_1_bits_csr_addr,
  output [6:0]  io_dis_uops_0_1_bits_rob_idx,
  output [4:0]  io_dis_uops_0_1_bits_ldq_idx,
                io_dis_uops_0_1_bits_stq_idx,
  output [1:0]  io_dis_uops_0_1_bits_rxq_idx,
  output [6:0]  io_dis_uops_0_1_bits_pdst,
                io_dis_uops_0_1_bits_prs1,
                io_dis_uops_0_1_bits_prs2,
                io_dis_uops_0_1_bits_prs3,
  output        io_dis_uops_0_1_bits_prs1_busy,
                io_dis_uops_0_1_bits_prs2_busy,
  output [6:0]  io_dis_uops_0_1_bits_stale_pdst,
  output        io_dis_uops_0_1_bits_exception,
  output [63:0] io_dis_uops_0_1_bits_exc_cause,
  output        io_dis_uops_0_1_bits_bypassable,
  output [4:0]  io_dis_uops_0_1_bits_mem_cmd,
  output [1:0]  io_dis_uops_0_1_bits_mem_size,
  output        io_dis_uops_0_1_bits_mem_signed,
                io_dis_uops_0_1_bits_is_fence,
                io_dis_uops_0_1_bits_is_fencei,
                io_dis_uops_0_1_bits_is_amo,
                io_dis_uops_0_1_bits_uses_ldq,
                io_dis_uops_0_1_bits_uses_stq,
                io_dis_uops_0_1_bits_is_sys_pc2epc,
                io_dis_uops_0_1_bits_is_unique,
                io_dis_uops_0_1_bits_flush_on_commit,
                io_dis_uops_0_1_bits_ldst_is_rs1,
  output [5:0]  io_dis_uops_0_1_bits_ldst,
                io_dis_uops_0_1_bits_lrs1,
                io_dis_uops_0_1_bits_lrs2,
                io_dis_uops_0_1_bits_lrs3,
  output        io_dis_uops_0_1_bits_ldst_val,
  output [1:0]  io_dis_uops_0_1_bits_dst_rtype,
                io_dis_uops_0_1_bits_lrs1_rtype,
                io_dis_uops_0_1_bits_lrs2_rtype,
  output        io_dis_uops_0_1_bits_frs3_en,
                io_dis_uops_0_1_bits_fp_val,
                io_dis_uops_0_1_bits_fp_single,
                io_dis_uops_0_1_bits_xcpt_pf_if,
                io_dis_uops_0_1_bits_xcpt_ae_if,
                io_dis_uops_0_1_bits_xcpt_ma_if,
                io_dis_uops_0_1_bits_bp_debug_if,
                io_dis_uops_0_1_bits_bp_xcpt_if,
  output [1:0]  io_dis_uops_0_1_bits_debug_fsrc,
                io_dis_uops_0_1_bits_debug_tsrc,
  input         io_dis_uops_0_2_ready,
  output        io_dis_uops_0_2_valid,
  output [6:0]  io_dis_uops_0_2_bits_uopc,
  output [31:0] io_dis_uops_0_2_bits_inst,
                io_dis_uops_0_2_bits_debug_inst,
  output        io_dis_uops_0_2_bits_is_rvc,
  output [39:0] io_dis_uops_0_2_bits_debug_pc,
  output [2:0]  io_dis_uops_0_2_bits_iq_type,
  output [9:0]  io_dis_uops_0_2_bits_fu_code,
  output        io_dis_uops_0_2_bits_is_br,
                io_dis_uops_0_2_bits_is_jalr,
                io_dis_uops_0_2_bits_is_jal,
                io_dis_uops_0_2_bits_is_sfb,
  output [19:0] io_dis_uops_0_2_bits_br_mask,
  output [4:0]  io_dis_uops_0_2_bits_br_tag,
  output [5:0]  io_dis_uops_0_2_bits_ftq_idx,
  output        io_dis_uops_0_2_bits_edge_inst,
  output [5:0]  io_dis_uops_0_2_bits_pc_lob,
  output        io_dis_uops_0_2_bits_taken,
  output [19:0] io_dis_uops_0_2_bits_imm_packed,
  output [11:0] io_dis_uops_0_2_bits_csr_addr,
  output [6:0]  io_dis_uops_0_2_bits_rob_idx,
  output [4:0]  io_dis_uops_0_2_bits_ldq_idx,
                io_dis_uops_0_2_bits_stq_idx,
  output [1:0]  io_dis_uops_0_2_bits_rxq_idx,
  output [6:0]  io_dis_uops_0_2_bits_pdst,
                io_dis_uops_0_2_bits_prs1,
                io_dis_uops_0_2_bits_prs2,
                io_dis_uops_0_2_bits_prs3,
  output        io_dis_uops_0_2_bits_prs1_busy,
                io_dis_uops_0_2_bits_prs2_busy,
  output [6:0]  io_dis_uops_0_2_bits_stale_pdst,
  output        io_dis_uops_0_2_bits_exception,
  output [63:0] io_dis_uops_0_2_bits_exc_cause,
  output        io_dis_uops_0_2_bits_bypassable,
  output [4:0]  io_dis_uops_0_2_bits_mem_cmd,
  output [1:0]  io_dis_uops_0_2_bits_mem_size,
  output        io_dis_uops_0_2_bits_mem_signed,
                io_dis_uops_0_2_bits_is_fence,
                io_dis_uops_0_2_bits_is_fencei,
                io_dis_uops_0_2_bits_is_amo,
                io_dis_uops_0_2_bits_uses_ldq,
                io_dis_uops_0_2_bits_uses_stq,
                io_dis_uops_0_2_bits_is_sys_pc2epc,
                io_dis_uops_0_2_bits_is_unique,
                io_dis_uops_0_2_bits_flush_on_commit,
                io_dis_uops_0_2_bits_ldst_is_rs1,
  output [5:0]  io_dis_uops_0_2_bits_ldst,
                io_dis_uops_0_2_bits_lrs1,
                io_dis_uops_0_2_bits_lrs2,
                io_dis_uops_0_2_bits_lrs3,
  output        io_dis_uops_0_2_bits_ldst_val,
  output [1:0]  io_dis_uops_0_2_bits_dst_rtype,
                io_dis_uops_0_2_bits_lrs1_rtype,
                io_dis_uops_0_2_bits_lrs2_rtype,
  output        io_dis_uops_0_2_bits_frs3_en,
                io_dis_uops_0_2_bits_fp_val,
                io_dis_uops_0_2_bits_fp_single,
                io_dis_uops_0_2_bits_xcpt_pf_if,
                io_dis_uops_0_2_bits_xcpt_ae_if,
                io_dis_uops_0_2_bits_xcpt_ma_if,
                io_dis_uops_0_2_bits_bp_debug_if,
                io_dis_uops_0_2_bits_bp_xcpt_if,
  output [1:0]  io_dis_uops_0_2_bits_debug_fsrc,
                io_dis_uops_0_2_bits_debug_tsrc,
  input         io_dis_uops_0_3_ready,
  output        io_dis_uops_0_3_valid,
  output [6:0]  io_dis_uops_0_3_bits_uopc,
  output [31:0] io_dis_uops_0_3_bits_inst,
                io_dis_uops_0_3_bits_debug_inst,
  output        io_dis_uops_0_3_bits_is_rvc,
  output [39:0] io_dis_uops_0_3_bits_debug_pc,
  output [2:0]  io_dis_uops_0_3_bits_iq_type,
  output [9:0]  io_dis_uops_0_3_bits_fu_code,
  output        io_dis_uops_0_3_bits_is_br,
                io_dis_uops_0_3_bits_is_jalr,
                io_dis_uops_0_3_bits_is_jal,
                io_dis_uops_0_3_bits_is_sfb,
  output [19:0] io_dis_uops_0_3_bits_br_mask,
  output [4:0]  io_dis_uops_0_3_bits_br_tag,
  output [5:0]  io_dis_uops_0_3_bits_ftq_idx,
  output        io_dis_uops_0_3_bits_edge_inst,
  output [5:0]  io_dis_uops_0_3_bits_pc_lob,
  output        io_dis_uops_0_3_bits_taken,
  output [19:0] io_dis_uops_0_3_bits_imm_packed,
  output [11:0] io_dis_uops_0_3_bits_csr_addr,
  output [6:0]  io_dis_uops_0_3_bits_rob_idx,
  output [4:0]  io_dis_uops_0_3_bits_ldq_idx,
                io_dis_uops_0_3_bits_stq_idx,
  output [1:0]  io_dis_uops_0_3_bits_rxq_idx,
  output [6:0]  io_dis_uops_0_3_bits_pdst,
                io_dis_uops_0_3_bits_prs1,
                io_dis_uops_0_3_bits_prs2,
                io_dis_uops_0_3_bits_prs3,
  output        io_dis_uops_0_3_bits_prs1_busy,
                io_dis_uops_0_3_bits_prs2_busy,
  output [6:0]  io_dis_uops_0_3_bits_stale_pdst,
  output        io_dis_uops_0_3_bits_exception,
  output [63:0] io_dis_uops_0_3_bits_exc_cause,
  output        io_dis_uops_0_3_bits_bypassable,
  output [4:0]  io_dis_uops_0_3_bits_mem_cmd,
  output [1:0]  io_dis_uops_0_3_bits_mem_size,
  output        io_dis_uops_0_3_bits_mem_signed,
                io_dis_uops_0_3_bits_is_fence,
                io_dis_uops_0_3_bits_is_fencei,
                io_dis_uops_0_3_bits_is_amo,
                io_dis_uops_0_3_bits_uses_ldq,
                io_dis_uops_0_3_bits_uses_stq,
                io_dis_uops_0_3_bits_is_sys_pc2epc,
                io_dis_uops_0_3_bits_is_unique,
                io_dis_uops_0_3_bits_flush_on_commit,
                io_dis_uops_0_3_bits_ldst_is_rs1,
  output [5:0]  io_dis_uops_0_3_bits_ldst,
                io_dis_uops_0_3_bits_lrs1,
                io_dis_uops_0_3_bits_lrs2,
                io_dis_uops_0_3_bits_lrs3,
  output        io_dis_uops_0_3_bits_ldst_val,
  output [1:0]  io_dis_uops_0_3_bits_dst_rtype,
                io_dis_uops_0_3_bits_lrs1_rtype,
                io_dis_uops_0_3_bits_lrs2_rtype,
  output        io_dis_uops_0_3_bits_frs3_en,
                io_dis_uops_0_3_bits_fp_val,
                io_dis_uops_0_3_bits_fp_single,
                io_dis_uops_0_3_bits_xcpt_pf_if,
                io_dis_uops_0_3_bits_xcpt_ae_if,
                io_dis_uops_0_3_bits_xcpt_ma_if,
                io_dis_uops_0_3_bits_bp_debug_if,
                io_dis_uops_0_3_bits_bp_xcpt_if,
  output [1:0]  io_dis_uops_0_3_bits_debug_fsrc,
                io_dis_uops_0_3_bits_debug_tsrc
);

  assign io_ren_uops_0_ready = io_dis_uops_0_0_ready & io_dis_uops_1_0_ready & io_dis_uops_2_0_ready;
  assign io_ren_uops_1_ready = io_dis_uops_0_1_ready & io_dis_uops_1_1_ready & io_dis_uops_2_1_ready;
  assign io_ren_uops_2_ready = io_dis_uops_0_2_ready & io_dis_uops_1_2_ready & io_dis_uops_2_2_ready;
  assign io_ren_uops_3_ready = io_dis_uops_0_3_ready & io_dis_uops_1_3_ready & io_dis_uops_2_3_ready;
  assign io_dis_uops_2_0_valid = io_ren_uops_0_valid & io_ren_uops_0_bits_iq_type[2];
  assign io_dis_uops_2_0_bits_uopc = io_ren_uops_0_bits_uopc;
  assign io_dis_uops_2_0_bits_inst = io_ren_uops_0_bits_inst;
  assign io_dis_uops_2_0_bits_debug_inst = io_ren_uops_0_bits_debug_inst;
  assign io_dis_uops_2_0_bits_is_rvc = io_ren_uops_0_bits_is_rvc;
  assign io_dis_uops_2_0_bits_debug_pc = io_ren_uops_0_bits_debug_pc;
  assign io_dis_uops_2_0_bits_iq_type = io_ren_uops_0_bits_iq_type;
  assign io_dis_uops_2_0_bits_fu_code = io_ren_uops_0_bits_fu_code;
  assign io_dis_uops_2_0_bits_is_br = io_ren_uops_0_bits_is_br;
  assign io_dis_uops_2_0_bits_is_jalr = io_ren_uops_0_bits_is_jalr;
  assign io_dis_uops_2_0_bits_is_jal = io_ren_uops_0_bits_is_jal;
  assign io_dis_uops_2_0_bits_is_sfb = io_ren_uops_0_bits_is_sfb;
  assign io_dis_uops_2_0_bits_br_mask = io_ren_uops_0_bits_br_mask;
  assign io_dis_uops_2_0_bits_br_tag = io_ren_uops_0_bits_br_tag;
  assign io_dis_uops_2_0_bits_ftq_idx = io_ren_uops_0_bits_ftq_idx;
  assign io_dis_uops_2_0_bits_edge_inst = io_ren_uops_0_bits_edge_inst;
  assign io_dis_uops_2_0_bits_pc_lob = io_ren_uops_0_bits_pc_lob;
  assign io_dis_uops_2_0_bits_taken = io_ren_uops_0_bits_taken;
  assign io_dis_uops_2_0_bits_imm_packed = io_ren_uops_0_bits_imm_packed;
  assign io_dis_uops_2_0_bits_csr_addr = io_ren_uops_0_bits_csr_addr;
  assign io_dis_uops_2_0_bits_rob_idx = io_ren_uops_0_bits_rob_idx;
  assign io_dis_uops_2_0_bits_ldq_idx = io_ren_uops_0_bits_ldq_idx;
  assign io_dis_uops_2_0_bits_stq_idx = io_ren_uops_0_bits_stq_idx;
  assign io_dis_uops_2_0_bits_rxq_idx = io_ren_uops_0_bits_rxq_idx;
  assign io_dis_uops_2_0_bits_pdst = io_ren_uops_0_bits_pdst;
  assign io_dis_uops_2_0_bits_prs1 = io_ren_uops_0_bits_prs1;
  assign io_dis_uops_2_0_bits_prs2 = io_ren_uops_0_bits_prs2;
  assign io_dis_uops_2_0_bits_prs3 = io_ren_uops_0_bits_prs3;
  assign io_dis_uops_2_0_bits_prs1_busy = io_ren_uops_0_bits_prs1_busy;
  assign io_dis_uops_2_0_bits_prs2_busy = io_ren_uops_0_bits_prs2_busy;
  assign io_dis_uops_2_0_bits_prs3_busy = io_ren_uops_0_bits_prs3_busy;
  assign io_dis_uops_2_0_bits_stale_pdst = io_ren_uops_0_bits_stale_pdst;
  assign io_dis_uops_2_0_bits_exception = io_ren_uops_0_bits_exception;
  assign io_dis_uops_2_0_bits_exc_cause = io_ren_uops_0_bits_exc_cause;
  assign io_dis_uops_2_0_bits_bypassable = io_ren_uops_0_bits_bypassable;
  assign io_dis_uops_2_0_bits_mem_cmd = io_ren_uops_0_bits_mem_cmd;
  assign io_dis_uops_2_0_bits_mem_size = io_ren_uops_0_bits_mem_size;
  assign io_dis_uops_2_0_bits_mem_signed = io_ren_uops_0_bits_mem_signed;
  assign io_dis_uops_2_0_bits_is_fence = io_ren_uops_0_bits_is_fence;
  assign io_dis_uops_2_0_bits_is_fencei = io_ren_uops_0_bits_is_fencei;
  assign io_dis_uops_2_0_bits_is_amo = io_ren_uops_0_bits_is_amo;
  assign io_dis_uops_2_0_bits_uses_ldq = io_ren_uops_0_bits_uses_ldq;
  assign io_dis_uops_2_0_bits_uses_stq = io_ren_uops_0_bits_uses_stq;
  assign io_dis_uops_2_0_bits_is_sys_pc2epc = io_ren_uops_0_bits_is_sys_pc2epc;
  assign io_dis_uops_2_0_bits_is_unique = io_ren_uops_0_bits_is_unique;
  assign io_dis_uops_2_0_bits_flush_on_commit = io_ren_uops_0_bits_flush_on_commit;
  assign io_dis_uops_2_0_bits_ldst_is_rs1 = io_ren_uops_0_bits_ldst_is_rs1;
  assign io_dis_uops_2_0_bits_ldst = io_ren_uops_0_bits_ldst;
  assign io_dis_uops_2_0_bits_lrs1 = io_ren_uops_0_bits_lrs1;
  assign io_dis_uops_2_0_bits_lrs2 = io_ren_uops_0_bits_lrs2;
  assign io_dis_uops_2_0_bits_lrs3 = io_ren_uops_0_bits_lrs3;
  assign io_dis_uops_2_0_bits_ldst_val = io_ren_uops_0_bits_ldst_val;
  assign io_dis_uops_2_0_bits_dst_rtype = io_ren_uops_0_bits_dst_rtype;
  assign io_dis_uops_2_0_bits_lrs1_rtype = io_ren_uops_0_bits_lrs1_rtype;
  assign io_dis_uops_2_0_bits_lrs2_rtype = io_ren_uops_0_bits_lrs2_rtype;
  assign io_dis_uops_2_0_bits_frs3_en = io_ren_uops_0_bits_frs3_en;
  assign io_dis_uops_2_0_bits_fp_val = io_ren_uops_0_bits_fp_val;
  assign io_dis_uops_2_0_bits_fp_single = io_ren_uops_0_bits_fp_single;
  assign io_dis_uops_2_0_bits_xcpt_pf_if = io_ren_uops_0_bits_xcpt_pf_if;
  assign io_dis_uops_2_0_bits_xcpt_ae_if = io_ren_uops_0_bits_xcpt_ae_if;
  assign io_dis_uops_2_0_bits_xcpt_ma_if = io_ren_uops_0_bits_xcpt_ma_if;
  assign io_dis_uops_2_0_bits_bp_debug_if = io_ren_uops_0_bits_bp_debug_if;
  assign io_dis_uops_2_0_bits_bp_xcpt_if = io_ren_uops_0_bits_bp_xcpt_if;
  assign io_dis_uops_2_0_bits_debug_fsrc = io_ren_uops_0_bits_debug_fsrc;
  assign io_dis_uops_2_0_bits_debug_tsrc = io_ren_uops_0_bits_debug_tsrc;
  assign io_dis_uops_2_1_valid = io_ren_uops_1_valid & io_ren_uops_1_bits_iq_type[2];
  assign io_dis_uops_2_1_bits_uopc = io_ren_uops_1_bits_uopc;
  assign io_dis_uops_2_1_bits_inst = io_ren_uops_1_bits_inst;
  assign io_dis_uops_2_1_bits_debug_inst = io_ren_uops_1_bits_debug_inst;
  assign io_dis_uops_2_1_bits_is_rvc = io_ren_uops_1_bits_is_rvc;
  assign io_dis_uops_2_1_bits_debug_pc = io_ren_uops_1_bits_debug_pc;
  assign io_dis_uops_2_1_bits_iq_type = io_ren_uops_1_bits_iq_type;
  assign io_dis_uops_2_1_bits_fu_code = io_ren_uops_1_bits_fu_code;
  assign io_dis_uops_2_1_bits_is_br = io_ren_uops_1_bits_is_br;
  assign io_dis_uops_2_1_bits_is_jalr = io_ren_uops_1_bits_is_jalr;
  assign io_dis_uops_2_1_bits_is_jal = io_ren_uops_1_bits_is_jal;
  assign io_dis_uops_2_1_bits_is_sfb = io_ren_uops_1_bits_is_sfb;
  assign io_dis_uops_2_1_bits_br_mask = io_ren_uops_1_bits_br_mask;
  assign io_dis_uops_2_1_bits_br_tag = io_ren_uops_1_bits_br_tag;
  assign io_dis_uops_2_1_bits_ftq_idx = io_ren_uops_1_bits_ftq_idx;
  assign io_dis_uops_2_1_bits_edge_inst = io_ren_uops_1_bits_edge_inst;
  assign io_dis_uops_2_1_bits_pc_lob = io_ren_uops_1_bits_pc_lob;
  assign io_dis_uops_2_1_bits_taken = io_ren_uops_1_bits_taken;
  assign io_dis_uops_2_1_bits_imm_packed = io_ren_uops_1_bits_imm_packed;
  assign io_dis_uops_2_1_bits_csr_addr = io_ren_uops_1_bits_csr_addr;
  assign io_dis_uops_2_1_bits_rob_idx = io_ren_uops_1_bits_rob_idx;
  assign io_dis_uops_2_1_bits_ldq_idx = io_ren_uops_1_bits_ldq_idx;
  assign io_dis_uops_2_1_bits_stq_idx = io_ren_uops_1_bits_stq_idx;
  assign io_dis_uops_2_1_bits_rxq_idx = io_ren_uops_1_bits_rxq_idx;
  assign io_dis_uops_2_1_bits_pdst = io_ren_uops_1_bits_pdst;
  assign io_dis_uops_2_1_bits_prs1 = io_ren_uops_1_bits_prs1;
  assign io_dis_uops_2_1_bits_prs2 = io_ren_uops_1_bits_prs2;
  assign io_dis_uops_2_1_bits_prs3 = io_ren_uops_1_bits_prs3;
  assign io_dis_uops_2_1_bits_prs1_busy = io_ren_uops_1_bits_prs1_busy;
  assign io_dis_uops_2_1_bits_prs2_busy = io_ren_uops_1_bits_prs2_busy;
  assign io_dis_uops_2_1_bits_prs3_busy = io_ren_uops_1_bits_prs3_busy;
  assign io_dis_uops_2_1_bits_stale_pdst = io_ren_uops_1_bits_stale_pdst;
  assign io_dis_uops_2_1_bits_exception = io_ren_uops_1_bits_exception;
  assign io_dis_uops_2_1_bits_exc_cause = io_ren_uops_1_bits_exc_cause;
  assign io_dis_uops_2_1_bits_bypassable = io_ren_uops_1_bits_bypassable;
  assign io_dis_uops_2_1_bits_mem_cmd = io_ren_uops_1_bits_mem_cmd;
  assign io_dis_uops_2_1_bits_mem_size = io_ren_uops_1_bits_mem_size;
  assign io_dis_uops_2_1_bits_mem_signed = io_ren_uops_1_bits_mem_signed;
  assign io_dis_uops_2_1_bits_is_fence = io_ren_uops_1_bits_is_fence;
  assign io_dis_uops_2_1_bits_is_fencei = io_ren_uops_1_bits_is_fencei;
  assign io_dis_uops_2_1_bits_is_amo = io_ren_uops_1_bits_is_amo;
  assign io_dis_uops_2_1_bits_uses_ldq = io_ren_uops_1_bits_uses_ldq;
  assign io_dis_uops_2_1_bits_uses_stq = io_ren_uops_1_bits_uses_stq;
  assign io_dis_uops_2_1_bits_is_sys_pc2epc = io_ren_uops_1_bits_is_sys_pc2epc;
  assign io_dis_uops_2_1_bits_is_unique = io_ren_uops_1_bits_is_unique;
  assign io_dis_uops_2_1_bits_flush_on_commit = io_ren_uops_1_bits_flush_on_commit;
  assign io_dis_uops_2_1_bits_ldst_is_rs1 = io_ren_uops_1_bits_ldst_is_rs1;
  assign io_dis_uops_2_1_bits_ldst = io_ren_uops_1_bits_ldst;
  assign io_dis_uops_2_1_bits_lrs1 = io_ren_uops_1_bits_lrs1;
  assign io_dis_uops_2_1_bits_lrs2 = io_ren_uops_1_bits_lrs2;
  assign io_dis_uops_2_1_bits_lrs3 = io_ren_uops_1_bits_lrs3;
  assign io_dis_uops_2_1_bits_ldst_val = io_ren_uops_1_bits_ldst_val;
  assign io_dis_uops_2_1_bits_dst_rtype = io_ren_uops_1_bits_dst_rtype;
  assign io_dis_uops_2_1_bits_lrs1_rtype = io_ren_uops_1_bits_lrs1_rtype;
  assign io_dis_uops_2_1_bits_lrs2_rtype = io_ren_uops_1_bits_lrs2_rtype;
  assign io_dis_uops_2_1_bits_frs3_en = io_ren_uops_1_bits_frs3_en;
  assign io_dis_uops_2_1_bits_fp_val = io_ren_uops_1_bits_fp_val;
  assign io_dis_uops_2_1_bits_fp_single = io_ren_uops_1_bits_fp_single;
  assign io_dis_uops_2_1_bits_xcpt_pf_if = io_ren_uops_1_bits_xcpt_pf_if;
  assign io_dis_uops_2_1_bits_xcpt_ae_if = io_ren_uops_1_bits_xcpt_ae_if;
  assign io_dis_uops_2_1_bits_xcpt_ma_if = io_ren_uops_1_bits_xcpt_ma_if;
  assign io_dis_uops_2_1_bits_bp_debug_if = io_ren_uops_1_bits_bp_debug_if;
  assign io_dis_uops_2_1_bits_bp_xcpt_if = io_ren_uops_1_bits_bp_xcpt_if;
  assign io_dis_uops_2_1_bits_debug_fsrc = io_ren_uops_1_bits_debug_fsrc;
  assign io_dis_uops_2_1_bits_debug_tsrc = io_ren_uops_1_bits_debug_tsrc;
  assign io_dis_uops_2_2_valid = io_ren_uops_2_valid & io_ren_uops_2_bits_iq_type[2];
  assign io_dis_uops_2_2_bits_uopc = io_ren_uops_2_bits_uopc;
  assign io_dis_uops_2_2_bits_inst = io_ren_uops_2_bits_inst;
  assign io_dis_uops_2_2_bits_debug_inst = io_ren_uops_2_bits_debug_inst;
  assign io_dis_uops_2_2_bits_is_rvc = io_ren_uops_2_bits_is_rvc;
  assign io_dis_uops_2_2_bits_debug_pc = io_ren_uops_2_bits_debug_pc;
  assign io_dis_uops_2_2_bits_iq_type = io_ren_uops_2_bits_iq_type;
  assign io_dis_uops_2_2_bits_fu_code = io_ren_uops_2_bits_fu_code;
  assign io_dis_uops_2_2_bits_is_br = io_ren_uops_2_bits_is_br;
  assign io_dis_uops_2_2_bits_is_jalr = io_ren_uops_2_bits_is_jalr;
  assign io_dis_uops_2_2_bits_is_jal = io_ren_uops_2_bits_is_jal;
  assign io_dis_uops_2_2_bits_is_sfb = io_ren_uops_2_bits_is_sfb;
  assign io_dis_uops_2_2_bits_br_mask = io_ren_uops_2_bits_br_mask;
  assign io_dis_uops_2_2_bits_br_tag = io_ren_uops_2_bits_br_tag;
  assign io_dis_uops_2_2_bits_ftq_idx = io_ren_uops_2_bits_ftq_idx;
  assign io_dis_uops_2_2_bits_edge_inst = io_ren_uops_2_bits_edge_inst;
  assign io_dis_uops_2_2_bits_pc_lob = io_ren_uops_2_bits_pc_lob;
  assign io_dis_uops_2_2_bits_taken = io_ren_uops_2_bits_taken;
  assign io_dis_uops_2_2_bits_imm_packed = io_ren_uops_2_bits_imm_packed;
  assign io_dis_uops_2_2_bits_csr_addr = io_ren_uops_2_bits_csr_addr;
  assign io_dis_uops_2_2_bits_rob_idx = io_ren_uops_2_bits_rob_idx;
  assign io_dis_uops_2_2_bits_ldq_idx = io_ren_uops_2_bits_ldq_idx;
  assign io_dis_uops_2_2_bits_stq_idx = io_ren_uops_2_bits_stq_idx;
  assign io_dis_uops_2_2_bits_rxq_idx = io_ren_uops_2_bits_rxq_idx;
  assign io_dis_uops_2_2_bits_pdst = io_ren_uops_2_bits_pdst;
  assign io_dis_uops_2_2_bits_prs1 = io_ren_uops_2_bits_prs1;
  assign io_dis_uops_2_2_bits_prs2 = io_ren_uops_2_bits_prs2;
  assign io_dis_uops_2_2_bits_prs3 = io_ren_uops_2_bits_prs3;
  assign io_dis_uops_2_2_bits_prs1_busy = io_ren_uops_2_bits_prs1_busy;
  assign io_dis_uops_2_2_bits_prs2_busy = io_ren_uops_2_bits_prs2_busy;
  assign io_dis_uops_2_2_bits_prs3_busy = io_ren_uops_2_bits_prs3_busy;
  assign io_dis_uops_2_2_bits_stale_pdst = io_ren_uops_2_bits_stale_pdst;
  assign io_dis_uops_2_2_bits_exception = io_ren_uops_2_bits_exception;
  assign io_dis_uops_2_2_bits_exc_cause = io_ren_uops_2_bits_exc_cause;
  assign io_dis_uops_2_2_bits_bypassable = io_ren_uops_2_bits_bypassable;
  assign io_dis_uops_2_2_bits_mem_cmd = io_ren_uops_2_bits_mem_cmd;
  assign io_dis_uops_2_2_bits_mem_size = io_ren_uops_2_bits_mem_size;
  assign io_dis_uops_2_2_bits_mem_signed = io_ren_uops_2_bits_mem_signed;
  assign io_dis_uops_2_2_bits_is_fence = io_ren_uops_2_bits_is_fence;
  assign io_dis_uops_2_2_bits_is_fencei = io_ren_uops_2_bits_is_fencei;
  assign io_dis_uops_2_2_bits_is_amo = io_ren_uops_2_bits_is_amo;
  assign io_dis_uops_2_2_bits_uses_ldq = io_ren_uops_2_bits_uses_ldq;
  assign io_dis_uops_2_2_bits_uses_stq = io_ren_uops_2_bits_uses_stq;
  assign io_dis_uops_2_2_bits_is_sys_pc2epc = io_ren_uops_2_bits_is_sys_pc2epc;
  assign io_dis_uops_2_2_bits_is_unique = io_ren_uops_2_bits_is_unique;
  assign io_dis_uops_2_2_bits_flush_on_commit = io_ren_uops_2_bits_flush_on_commit;
  assign io_dis_uops_2_2_bits_ldst_is_rs1 = io_ren_uops_2_bits_ldst_is_rs1;
  assign io_dis_uops_2_2_bits_ldst = io_ren_uops_2_bits_ldst;
  assign io_dis_uops_2_2_bits_lrs1 = io_ren_uops_2_bits_lrs1;
  assign io_dis_uops_2_2_bits_lrs2 = io_ren_uops_2_bits_lrs2;
  assign io_dis_uops_2_2_bits_lrs3 = io_ren_uops_2_bits_lrs3;
  assign io_dis_uops_2_2_bits_ldst_val = io_ren_uops_2_bits_ldst_val;
  assign io_dis_uops_2_2_bits_dst_rtype = io_ren_uops_2_bits_dst_rtype;
  assign io_dis_uops_2_2_bits_lrs1_rtype = io_ren_uops_2_bits_lrs1_rtype;
  assign io_dis_uops_2_2_bits_lrs2_rtype = io_ren_uops_2_bits_lrs2_rtype;
  assign io_dis_uops_2_2_bits_frs3_en = io_ren_uops_2_bits_frs3_en;
  assign io_dis_uops_2_2_bits_fp_val = io_ren_uops_2_bits_fp_val;
  assign io_dis_uops_2_2_bits_fp_single = io_ren_uops_2_bits_fp_single;
  assign io_dis_uops_2_2_bits_xcpt_pf_if = io_ren_uops_2_bits_xcpt_pf_if;
  assign io_dis_uops_2_2_bits_xcpt_ae_if = io_ren_uops_2_bits_xcpt_ae_if;
  assign io_dis_uops_2_2_bits_xcpt_ma_if = io_ren_uops_2_bits_xcpt_ma_if;
  assign io_dis_uops_2_2_bits_bp_debug_if = io_ren_uops_2_bits_bp_debug_if;
  assign io_dis_uops_2_2_bits_bp_xcpt_if = io_ren_uops_2_bits_bp_xcpt_if;
  assign io_dis_uops_2_2_bits_debug_fsrc = io_ren_uops_2_bits_debug_fsrc;
  assign io_dis_uops_2_2_bits_debug_tsrc = io_ren_uops_2_bits_debug_tsrc;
  assign io_dis_uops_2_3_valid = io_ren_uops_3_valid & io_ren_uops_3_bits_iq_type[2];
  assign io_dis_uops_2_3_bits_uopc = io_ren_uops_3_bits_uopc;
  assign io_dis_uops_2_3_bits_inst = io_ren_uops_3_bits_inst;
  assign io_dis_uops_2_3_bits_debug_inst = io_ren_uops_3_bits_debug_inst;
  assign io_dis_uops_2_3_bits_is_rvc = io_ren_uops_3_bits_is_rvc;
  assign io_dis_uops_2_3_bits_debug_pc = io_ren_uops_3_bits_debug_pc;
  assign io_dis_uops_2_3_bits_iq_type = io_ren_uops_3_bits_iq_type;
  assign io_dis_uops_2_3_bits_fu_code = io_ren_uops_3_bits_fu_code;
  assign io_dis_uops_2_3_bits_is_br = io_ren_uops_3_bits_is_br;
  assign io_dis_uops_2_3_bits_is_jalr = io_ren_uops_3_bits_is_jalr;
  assign io_dis_uops_2_3_bits_is_jal = io_ren_uops_3_bits_is_jal;
  assign io_dis_uops_2_3_bits_is_sfb = io_ren_uops_3_bits_is_sfb;
  assign io_dis_uops_2_3_bits_br_mask = io_ren_uops_3_bits_br_mask;
  assign io_dis_uops_2_3_bits_br_tag = io_ren_uops_3_bits_br_tag;
  assign io_dis_uops_2_3_bits_ftq_idx = io_ren_uops_3_bits_ftq_idx;
  assign io_dis_uops_2_3_bits_edge_inst = io_ren_uops_3_bits_edge_inst;
  assign io_dis_uops_2_3_bits_pc_lob = io_ren_uops_3_bits_pc_lob;
  assign io_dis_uops_2_3_bits_taken = io_ren_uops_3_bits_taken;
  assign io_dis_uops_2_3_bits_imm_packed = io_ren_uops_3_bits_imm_packed;
  assign io_dis_uops_2_3_bits_csr_addr = io_ren_uops_3_bits_csr_addr;
  assign io_dis_uops_2_3_bits_rob_idx = io_ren_uops_3_bits_rob_idx;
  assign io_dis_uops_2_3_bits_ldq_idx = io_ren_uops_3_bits_ldq_idx;
  assign io_dis_uops_2_3_bits_stq_idx = io_ren_uops_3_bits_stq_idx;
  assign io_dis_uops_2_3_bits_rxq_idx = io_ren_uops_3_bits_rxq_idx;
  assign io_dis_uops_2_3_bits_pdst = io_ren_uops_3_bits_pdst;
  assign io_dis_uops_2_3_bits_prs1 = io_ren_uops_3_bits_prs1;
  assign io_dis_uops_2_3_bits_prs2 = io_ren_uops_3_bits_prs2;
  assign io_dis_uops_2_3_bits_prs3 = io_ren_uops_3_bits_prs3;
  assign io_dis_uops_2_3_bits_prs1_busy = io_ren_uops_3_bits_prs1_busy;
  assign io_dis_uops_2_3_bits_prs2_busy = io_ren_uops_3_bits_prs2_busy;
  assign io_dis_uops_2_3_bits_prs3_busy = io_ren_uops_3_bits_prs3_busy;
  assign io_dis_uops_2_3_bits_stale_pdst = io_ren_uops_3_bits_stale_pdst;
  assign io_dis_uops_2_3_bits_exception = io_ren_uops_3_bits_exception;
  assign io_dis_uops_2_3_bits_exc_cause = io_ren_uops_3_bits_exc_cause;
  assign io_dis_uops_2_3_bits_bypassable = io_ren_uops_3_bits_bypassable;
  assign io_dis_uops_2_3_bits_mem_cmd = io_ren_uops_3_bits_mem_cmd;
  assign io_dis_uops_2_3_bits_mem_size = io_ren_uops_3_bits_mem_size;
  assign io_dis_uops_2_3_bits_mem_signed = io_ren_uops_3_bits_mem_signed;
  assign io_dis_uops_2_3_bits_is_fence = io_ren_uops_3_bits_is_fence;
  assign io_dis_uops_2_3_bits_is_fencei = io_ren_uops_3_bits_is_fencei;
  assign io_dis_uops_2_3_bits_is_amo = io_ren_uops_3_bits_is_amo;
  assign io_dis_uops_2_3_bits_uses_ldq = io_ren_uops_3_bits_uses_ldq;
  assign io_dis_uops_2_3_bits_uses_stq = io_ren_uops_3_bits_uses_stq;
  assign io_dis_uops_2_3_bits_is_sys_pc2epc = io_ren_uops_3_bits_is_sys_pc2epc;
  assign io_dis_uops_2_3_bits_is_unique = io_ren_uops_3_bits_is_unique;
  assign io_dis_uops_2_3_bits_flush_on_commit = io_ren_uops_3_bits_flush_on_commit;
  assign io_dis_uops_2_3_bits_ldst_is_rs1 = io_ren_uops_3_bits_ldst_is_rs1;
  assign io_dis_uops_2_3_bits_ldst = io_ren_uops_3_bits_ldst;
  assign io_dis_uops_2_3_bits_lrs1 = io_ren_uops_3_bits_lrs1;
  assign io_dis_uops_2_3_bits_lrs2 = io_ren_uops_3_bits_lrs2;
  assign io_dis_uops_2_3_bits_lrs3 = io_ren_uops_3_bits_lrs3;
  assign io_dis_uops_2_3_bits_ldst_val = io_ren_uops_3_bits_ldst_val;
  assign io_dis_uops_2_3_bits_dst_rtype = io_ren_uops_3_bits_dst_rtype;
  assign io_dis_uops_2_3_bits_lrs1_rtype = io_ren_uops_3_bits_lrs1_rtype;
  assign io_dis_uops_2_3_bits_lrs2_rtype = io_ren_uops_3_bits_lrs2_rtype;
  assign io_dis_uops_2_3_bits_frs3_en = io_ren_uops_3_bits_frs3_en;
  assign io_dis_uops_2_3_bits_fp_val = io_ren_uops_3_bits_fp_val;
  assign io_dis_uops_2_3_bits_fp_single = io_ren_uops_3_bits_fp_single;
  assign io_dis_uops_2_3_bits_xcpt_pf_if = io_ren_uops_3_bits_xcpt_pf_if;
  assign io_dis_uops_2_3_bits_xcpt_ae_if = io_ren_uops_3_bits_xcpt_ae_if;
  assign io_dis_uops_2_3_bits_xcpt_ma_if = io_ren_uops_3_bits_xcpt_ma_if;
  assign io_dis_uops_2_3_bits_bp_debug_if = io_ren_uops_3_bits_bp_debug_if;
  assign io_dis_uops_2_3_bits_bp_xcpt_if = io_ren_uops_3_bits_bp_xcpt_if;
  assign io_dis_uops_2_3_bits_debug_fsrc = io_ren_uops_3_bits_debug_fsrc;
  assign io_dis_uops_2_3_bits_debug_tsrc = io_ren_uops_3_bits_debug_tsrc;
  assign io_dis_uops_1_0_valid = io_ren_uops_0_valid & io_ren_uops_0_bits_iq_type[0];
  assign io_dis_uops_1_0_bits_uopc = io_ren_uops_0_bits_uopc;
  assign io_dis_uops_1_0_bits_inst = io_ren_uops_0_bits_inst;
  assign io_dis_uops_1_0_bits_debug_inst = io_ren_uops_0_bits_debug_inst;
  assign io_dis_uops_1_0_bits_is_rvc = io_ren_uops_0_bits_is_rvc;
  assign io_dis_uops_1_0_bits_debug_pc = io_ren_uops_0_bits_debug_pc;
  assign io_dis_uops_1_0_bits_iq_type = io_ren_uops_0_bits_iq_type;
  assign io_dis_uops_1_0_bits_fu_code = io_ren_uops_0_bits_fu_code;
  assign io_dis_uops_1_0_bits_is_br = io_ren_uops_0_bits_is_br;
  assign io_dis_uops_1_0_bits_is_jalr = io_ren_uops_0_bits_is_jalr;
  assign io_dis_uops_1_0_bits_is_jal = io_ren_uops_0_bits_is_jal;
  assign io_dis_uops_1_0_bits_is_sfb = io_ren_uops_0_bits_is_sfb;
  assign io_dis_uops_1_0_bits_br_mask = io_ren_uops_0_bits_br_mask;
  assign io_dis_uops_1_0_bits_br_tag = io_ren_uops_0_bits_br_tag;
  assign io_dis_uops_1_0_bits_ftq_idx = io_ren_uops_0_bits_ftq_idx;
  assign io_dis_uops_1_0_bits_edge_inst = io_ren_uops_0_bits_edge_inst;
  assign io_dis_uops_1_0_bits_pc_lob = io_ren_uops_0_bits_pc_lob;
  assign io_dis_uops_1_0_bits_taken = io_ren_uops_0_bits_taken;
  assign io_dis_uops_1_0_bits_imm_packed = io_ren_uops_0_bits_imm_packed;
  assign io_dis_uops_1_0_bits_csr_addr = io_ren_uops_0_bits_csr_addr;
  assign io_dis_uops_1_0_bits_rob_idx = io_ren_uops_0_bits_rob_idx;
  assign io_dis_uops_1_0_bits_ldq_idx = io_ren_uops_0_bits_ldq_idx;
  assign io_dis_uops_1_0_bits_stq_idx = io_ren_uops_0_bits_stq_idx;
  assign io_dis_uops_1_0_bits_rxq_idx = io_ren_uops_0_bits_rxq_idx;
  assign io_dis_uops_1_0_bits_pdst = io_ren_uops_0_bits_pdst;
  assign io_dis_uops_1_0_bits_prs1 = io_ren_uops_0_bits_prs1;
  assign io_dis_uops_1_0_bits_prs2 = io_ren_uops_0_bits_prs2;
  assign io_dis_uops_1_0_bits_prs3 = io_ren_uops_0_bits_prs3;
  assign io_dis_uops_1_0_bits_prs1_busy = io_ren_uops_0_bits_prs1_busy;
  assign io_dis_uops_1_0_bits_prs2_busy = io_ren_uops_0_bits_prs2_busy;
  assign io_dis_uops_1_0_bits_stale_pdst = io_ren_uops_0_bits_stale_pdst;
  assign io_dis_uops_1_0_bits_exception = io_ren_uops_0_bits_exception;
  assign io_dis_uops_1_0_bits_exc_cause = io_ren_uops_0_bits_exc_cause;
  assign io_dis_uops_1_0_bits_bypassable = io_ren_uops_0_bits_bypassable;
  assign io_dis_uops_1_0_bits_mem_cmd = io_ren_uops_0_bits_mem_cmd;
  assign io_dis_uops_1_0_bits_mem_size = io_ren_uops_0_bits_mem_size;
  assign io_dis_uops_1_0_bits_mem_signed = io_ren_uops_0_bits_mem_signed;
  assign io_dis_uops_1_0_bits_is_fence = io_ren_uops_0_bits_is_fence;
  assign io_dis_uops_1_0_bits_is_fencei = io_ren_uops_0_bits_is_fencei;
  assign io_dis_uops_1_0_bits_is_amo = io_ren_uops_0_bits_is_amo;
  assign io_dis_uops_1_0_bits_uses_ldq = io_ren_uops_0_bits_uses_ldq;
  assign io_dis_uops_1_0_bits_uses_stq = io_ren_uops_0_bits_uses_stq;
  assign io_dis_uops_1_0_bits_is_sys_pc2epc = io_ren_uops_0_bits_is_sys_pc2epc;
  assign io_dis_uops_1_0_bits_is_unique = io_ren_uops_0_bits_is_unique;
  assign io_dis_uops_1_0_bits_flush_on_commit = io_ren_uops_0_bits_flush_on_commit;
  assign io_dis_uops_1_0_bits_ldst_is_rs1 = io_ren_uops_0_bits_ldst_is_rs1;
  assign io_dis_uops_1_0_bits_ldst = io_ren_uops_0_bits_ldst;
  assign io_dis_uops_1_0_bits_lrs1 = io_ren_uops_0_bits_lrs1;
  assign io_dis_uops_1_0_bits_lrs2 = io_ren_uops_0_bits_lrs2;
  assign io_dis_uops_1_0_bits_lrs3 = io_ren_uops_0_bits_lrs3;
  assign io_dis_uops_1_0_bits_ldst_val = io_ren_uops_0_bits_ldst_val;
  assign io_dis_uops_1_0_bits_dst_rtype = io_ren_uops_0_bits_dst_rtype;
  assign io_dis_uops_1_0_bits_lrs1_rtype = io_ren_uops_0_bits_lrs1_rtype;
  assign io_dis_uops_1_0_bits_lrs2_rtype = io_ren_uops_0_bits_lrs2_rtype;
  assign io_dis_uops_1_0_bits_frs3_en = io_ren_uops_0_bits_frs3_en;
  assign io_dis_uops_1_0_bits_fp_val = io_ren_uops_0_bits_fp_val;
  assign io_dis_uops_1_0_bits_fp_single = io_ren_uops_0_bits_fp_single;
  assign io_dis_uops_1_0_bits_xcpt_pf_if = io_ren_uops_0_bits_xcpt_pf_if;
  assign io_dis_uops_1_0_bits_xcpt_ae_if = io_ren_uops_0_bits_xcpt_ae_if;
  assign io_dis_uops_1_0_bits_xcpt_ma_if = io_ren_uops_0_bits_xcpt_ma_if;
  assign io_dis_uops_1_0_bits_bp_debug_if = io_ren_uops_0_bits_bp_debug_if;
  assign io_dis_uops_1_0_bits_bp_xcpt_if = io_ren_uops_0_bits_bp_xcpt_if;
  assign io_dis_uops_1_0_bits_debug_fsrc = io_ren_uops_0_bits_debug_fsrc;
  assign io_dis_uops_1_0_bits_debug_tsrc = io_ren_uops_0_bits_debug_tsrc;
  assign io_dis_uops_1_1_valid = io_ren_uops_1_valid & io_ren_uops_1_bits_iq_type[0];
  assign io_dis_uops_1_1_bits_uopc = io_ren_uops_1_bits_uopc;
  assign io_dis_uops_1_1_bits_inst = io_ren_uops_1_bits_inst;
  assign io_dis_uops_1_1_bits_debug_inst = io_ren_uops_1_bits_debug_inst;
  assign io_dis_uops_1_1_bits_is_rvc = io_ren_uops_1_bits_is_rvc;
  assign io_dis_uops_1_1_bits_debug_pc = io_ren_uops_1_bits_debug_pc;
  assign io_dis_uops_1_1_bits_iq_type = io_ren_uops_1_bits_iq_type;
  assign io_dis_uops_1_1_bits_fu_code = io_ren_uops_1_bits_fu_code;
  assign io_dis_uops_1_1_bits_is_br = io_ren_uops_1_bits_is_br;
  assign io_dis_uops_1_1_bits_is_jalr = io_ren_uops_1_bits_is_jalr;
  assign io_dis_uops_1_1_bits_is_jal = io_ren_uops_1_bits_is_jal;
  assign io_dis_uops_1_1_bits_is_sfb = io_ren_uops_1_bits_is_sfb;
  assign io_dis_uops_1_1_bits_br_mask = io_ren_uops_1_bits_br_mask;
  assign io_dis_uops_1_1_bits_br_tag = io_ren_uops_1_bits_br_tag;
  assign io_dis_uops_1_1_bits_ftq_idx = io_ren_uops_1_bits_ftq_idx;
  assign io_dis_uops_1_1_bits_edge_inst = io_ren_uops_1_bits_edge_inst;
  assign io_dis_uops_1_1_bits_pc_lob = io_ren_uops_1_bits_pc_lob;
  assign io_dis_uops_1_1_bits_taken = io_ren_uops_1_bits_taken;
  assign io_dis_uops_1_1_bits_imm_packed = io_ren_uops_1_bits_imm_packed;
  assign io_dis_uops_1_1_bits_csr_addr = io_ren_uops_1_bits_csr_addr;
  assign io_dis_uops_1_1_bits_rob_idx = io_ren_uops_1_bits_rob_idx;
  assign io_dis_uops_1_1_bits_ldq_idx = io_ren_uops_1_bits_ldq_idx;
  assign io_dis_uops_1_1_bits_stq_idx = io_ren_uops_1_bits_stq_idx;
  assign io_dis_uops_1_1_bits_rxq_idx = io_ren_uops_1_bits_rxq_idx;
  assign io_dis_uops_1_1_bits_pdst = io_ren_uops_1_bits_pdst;
  assign io_dis_uops_1_1_bits_prs1 = io_ren_uops_1_bits_prs1;
  assign io_dis_uops_1_1_bits_prs2 = io_ren_uops_1_bits_prs2;
  assign io_dis_uops_1_1_bits_prs3 = io_ren_uops_1_bits_prs3;
  assign io_dis_uops_1_1_bits_prs1_busy = io_ren_uops_1_bits_prs1_busy;
  assign io_dis_uops_1_1_bits_prs2_busy = io_ren_uops_1_bits_prs2_busy;
  assign io_dis_uops_1_1_bits_stale_pdst = io_ren_uops_1_bits_stale_pdst;
  assign io_dis_uops_1_1_bits_exception = io_ren_uops_1_bits_exception;
  assign io_dis_uops_1_1_bits_exc_cause = io_ren_uops_1_bits_exc_cause;
  assign io_dis_uops_1_1_bits_bypassable = io_ren_uops_1_bits_bypassable;
  assign io_dis_uops_1_1_bits_mem_cmd = io_ren_uops_1_bits_mem_cmd;
  assign io_dis_uops_1_1_bits_mem_size = io_ren_uops_1_bits_mem_size;
  assign io_dis_uops_1_1_bits_mem_signed = io_ren_uops_1_bits_mem_signed;
  assign io_dis_uops_1_1_bits_is_fence = io_ren_uops_1_bits_is_fence;
  assign io_dis_uops_1_1_bits_is_fencei = io_ren_uops_1_bits_is_fencei;
  assign io_dis_uops_1_1_bits_is_amo = io_ren_uops_1_bits_is_amo;
  assign io_dis_uops_1_1_bits_uses_ldq = io_ren_uops_1_bits_uses_ldq;
  assign io_dis_uops_1_1_bits_uses_stq = io_ren_uops_1_bits_uses_stq;
  assign io_dis_uops_1_1_bits_is_sys_pc2epc = io_ren_uops_1_bits_is_sys_pc2epc;
  assign io_dis_uops_1_1_bits_is_unique = io_ren_uops_1_bits_is_unique;
  assign io_dis_uops_1_1_bits_flush_on_commit = io_ren_uops_1_bits_flush_on_commit;
  assign io_dis_uops_1_1_bits_ldst_is_rs1 = io_ren_uops_1_bits_ldst_is_rs1;
  assign io_dis_uops_1_1_bits_ldst = io_ren_uops_1_bits_ldst;
  assign io_dis_uops_1_1_bits_lrs1 = io_ren_uops_1_bits_lrs1;
  assign io_dis_uops_1_1_bits_lrs2 = io_ren_uops_1_bits_lrs2;
  assign io_dis_uops_1_1_bits_lrs3 = io_ren_uops_1_bits_lrs3;
  assign io_dis_uops_1_1_bits_ldst_val = io_ren_uops_1_bits_ldst_val;
  assign io_dis_uops_1_1_bits_dst_rtype = io_ren_uops_1_bits_dst_rtype;
  assign io_dis_uops_1_1_bits_lrs1_rtype = io_ren_uops_1_bits_lrs1_rtype;
  assign io_dis_uops_1_1_bits_lrs2_rtype = io_ren_uops_1_bits_lrs2_rtype;
  assign io_dis_uops_1_1_bits_frs3_en = io_ren_uops_1_bits_frs3_en;
  assign io_dis_uops_1_1_bits_fp_val = io_ren_uops_1_bits_fp_val;
  assign io_dis_uops_1_1_bits_fp_single = io_ren_uops_1_bits_fp_single;
  assign io_dis_uops_1_1_bits_xcpt_pf_if = io_ren_uops_1_bits_xcpt_pf_if;
  assign io_dis_uops_1_1_bits_xcpt_ae_if = io_ren_uops_1_bits_xcpt_ae_if;
  assign io_dis_uops_1_1_bits_xcpt_ma_if = io_ren_uops_1_bits_xcpt_ma_if;
  assign io_dis_uops_1_1_bits_bp_debug_if = io_ren_uops_1_bits_bp_debug_if;
  assign io_dis_uops_1_1_bits_bp_xcpt_if = io_ren_uops_1_bits_bp_xcpt_if;
  assign io_dis_uops_1_1_bits_debug_fsrc = io_ren_uops_1_bits_debug_fsrc;
  assign io_dis_uops_1_1_bits_debug_tsrc = io_ren_uops_1_bits_debug_tsrc;
  assign io_dis_uops_1_2_valid = io_ren_uops_2_valid & io_ren_uops_2_bits_iq_type[0];
  assign io_dis_uops_1_2_bits_uopc = io_ren_uops_2_bits_uopc;
  assign io_dis_uops_1_2_bits_inst = io_ren_uops_2_bits_inst;
  assign io_dis_uops_1_2_bits_debug_inst = io_ren_uops_2_bits_debug_inst;
  assign io_dis_uops_1_2_bits_is_rvc = io_ren_uops_2_bits_is_rvc;
  assign io_dis_uops_1_2_bits_debug_pc = io_ren_uops_2_bits_debug_pc;
  assign io_dis_uops_1_2_bits_iq_type = io_ren_uops_2_bits_iq_type;
  assign io_dis_uops_1_2_bits_fu_code = io_ren_uops_2_bits_fu_code;
  assign io_dis_uops_1_2_bits_is_br = io_ren_uops_2_bits_is_br;
  assign io_dis_uops_1_2_bits_is_jalr = io_ren_uops_2_bits_is_jalr;
  assign io_dis_uops_1_2_bits_is_jal = io_ren_uops_2_bits_is_jal;
  assign io_dis_uops_1_2_bits_is_sfb = io_ren_uops_2_bits_is_sfb;
  assign io_dis_uops_1_2_bits_br_mask = io_ren_uops_2_bits_br_mask;
  assign io_dis_uops_1_2_bits_br_tag = io_ren_uops_2_bits_br_tag;
  assign io_dis_uops_1_2_bits_ftq_idx = io_ren_uops_2_bits_ftq_idx;
  assign io_dis_uops_1_2_bits_edge_inst = io_ren_uops_2_bits_edge_inst;
  assign io_dis_uops_1_2_bits_pc_lob = io_ren_uops_2_bits_pc_lob;
  assign io_dis_uops_1_2_bits_taken = io_ren_uops_2_bits_taken;
  assign io_dis_uops_1_2_bits_imm_packed = io_ren_uops_2_bits_imm_packed;
  assign io_dis_uops_1_2_bits_csr_addr = io_ren_uops_2_bits_csr_addr;
  assign io_dis_uops_1_2_bits_rob_idx = io_ren_uops_2_bits_rob_idx;
  assign io_dis_uops_1_2_bits_ldq_idx = io_ren_uops_2_bits_ldq_idx;
  assign io_dis_uops_1_2_bits_stq_idx = io_ren_uops_2_bits_stq_idx;
  assign io_dis_uops_1_2_bits_rxq_idx = io_ren_uops_2_bits_rxq_idx;
  assign io_dis_uops_1_2_bits_pdst = io_ren_uops_2_bits_pdst;
  assign io_dis_uops_1_2_bits_prs1 = io_ren_uops_2_bits_prs1;
  assign io_dis_uops_1_2_bits_prs2 = io_ren_uops_2_bits_prs2;
  assign io_dis_uops_1_2_bits_prs3 = io_ren_uops_2_bits_prs3;
  assign io_dis_uops_1_2_bits_prs1_busy = io_ren_uops_2_bits_prs1_busy;
  assign io_dis_uops_1_2_bits_prs2_busy = io_ren_uops_2_bits_prs2_busy;
  assign io_dis_uops_1_2_bits_stale_pdst = io_ren_uops_2_bits_stale_pdst;
  assign io_dis_uops_1_2_bits_exception = io_ren_uops_2_bits_exception;
  assign io_dis_uops_1_2_bits_exc_cause = io_ren_uops_2_bits_exc_cause;
  assign io_dis_uops_1_2_bits_bypassable = io_ren_uops_2_bits_bypassable;
  assign io_dis_uops_1_2_bits_mem_cmd = io_ren_uops_2_bits_mem_cmd;
  assign io_dis_uops_1_2_bits_mem_size = io_ren_uops_2_bits_mem_size;
  assign io_dis_uops_1_2_bits_mem_signed = io_ren_uops_2_bits_mem_signed;
  assign io_dis_uops_1_2_bits_is_fence = io_ren_uops_2_bits_is_fence;
  assign io_dis_uops_1_2_bits_is_fencei = io_ren_uops_2_bits_is_fencei;
  assign io_dis_uops_1_2_bits_is_amo = io_ren_uops_2_bits_is_amo;
  assign io_dis_uops_1_2_bits_uses_ldq = io_ren_uops_2_bits_uses_ldq;
  assign io_dis_uops_1_2_bits_uses_stq = io_ren_uops_2_bits_uses_stq;
  assign io_dis_uops_1_2_bits_is_sys_pc2epc = io_ren_uops_2_bits_is_sys_pc2epc;
  assign io_dis_uops_1_2_bits_is_unique = io_ren_uops_2_bits_is_unique;
  assign io_dis_uops_1_2_bits_flush_on_commit = io_ren_uops_2_bits_flush_on_commit;
  assign io_dis_uops_1_2_bits_ldst_is_rs1 = io_ren_uops_2_bits_ldst_is_rs1;
  assign io_dis_uops_1_2_bits_ldst = io_ren_uops_2_bits_ldst;
  assign io_dis_uops_1_2_bits_lrs1 = io_ren_uops_2_bits_lrs1;
  assign io_dis_uops_1_2_bits_lrs2 = io_ren_uops_2_bits_lrs2;
  assign io_dis_uops_1_2_bits_lrs3 = io_ren_uops_2_bits_lrs3;
  assign io_dis_uops_1_2_bits_ldst_val = io_ren_uops_2_bits_ldst_val;
  assign io_dis_uops_1_2_bits_dst_rtype = io_ren_uops_2_bits_dst_rtype;
  assign io_dis_uops_1_2_bits_lrs1_rtype = io_ren_uops_2_bits_lrs1_rtype;
  assign io_dis_uops_1_2_bits_lrs2_rtype = io_ren_uops_2_bits_lrs2_rtype;
  assign io_dis_uops_1_2_bits_frs3_en = io_ren_uops_2_bits_frs3_en;
  assign io_dis_uops_1_2_bits_fp_val = io_ren_uops_2_bits_fp_val;
  assign io_dis_uops_1_2_bits_fp_single = io_ren_uops_2_bits_fp_single;
  assign io_dis_uops_1_2_bits_xcpt_pf_if = io_ren_uops_2_bits_xcpt_pf_if;
  assign io_dis_uops_1_2_bits_xcpt_ae_if = io_ren_uops_2_bits_xcpt_ae_if;
  assign io_dis_uops_1_2_bits_xcpt_ma_if = io_ren_uops_2_bits_xcpt_ma_if;
  assign io_dis_uops_1_2_bits_bp_debug_if = io_ren_uops_2_bits_bp_debug_if;
  assign io_dis_uops_1_2_bits_bp_xcpt_if = io_ren_uops_2_bits_bp_xcpt_if;
  assign io_dis_uops_1_2_bits_debug_fsrc = io_ren_uops_2_bits_debug_fsrc;
  assign io_dis_uops_1_2_bits_debug_tsrc = io_ren_uops_2_bits_debug_tsrc;
  assign io_dis_uops_1_3_valid = io_ren_uops_3_valid & io_ren_uops_3_bits_iq_type[0];
  assign io_dis_uops_1_3_bits_uopc = io_ren_uops_3_bits_uopc;
  assign io_dis_uops_1_3_bits_inst = io_ren_uops_3_bits_inst;
  assign io_dis_uops_1_3_bits_debug_inst = io_ren_uops_3_bits_debug_inst;
  assign io_dis_uops_1_3_bits_is_rvc = io_ren_uops_3_bits_is_rvc;
  assign io_dis_uops_1_3_bits_debug_pc = io_ren_uops_3_bits_debug_pc;
  assign io_dis_uops_1_3_bits_iq_type = io_ren_uops_3_bits_iq_type;
  assign io_dis_uops_1_3_bits_fu_code = io_ren_uops_3_bits_fu_code;
  assign io_dis_uops_1_3_bits_is_br = io_ren_uops_3_bits_is_br;
  assign io_dis_uops_1_3_bits_is_jalr = io_ren_uops_3_bits_is_jalr;
  assign io_dis_uops_1_3_bits_is_jal = io_ren_uops_3_bits_is_jal;
  assign io_dis_uops_1_3_bits_is_sfb = io_ren_uops_3_bits_is_sfb;
  assign io_dis_uops_1_3_bits_br_mask = io_ren_uops_3_bits_br_mask;
  assign io_dis_uops_1_3_bits_br_tag = io_ren_uops_3_bits_br_tag;
  assign io_dis_uops_1_3_bits_ftq_idx = io_ren_uops_3_bits_ftq_idx;
  assign io_dis_uops_1_3_bits_edge_inst = io_ren_uops_3_bits_edge_inst;
  assign io_dis_uops_1_3_bits_pc_lob = io_ren_uops_3_bits_pc_lob;
  assign io_dis_uops_1_3_bits_taken = io_ren_uops_3_bits_taken;
  assign io_dis_uops_1_3_bits_imm_packed = io_ren_uops_3_bits_imm_packed;
  assign io_dis_uops_1_3_bits_csr_addr = io_ren_uops_3_bits_csr_addr;
  assign io_dis_uops_1_3_bits_rob_idx = io_ren_uops_3_bits_rob_idx;
  assign io_dis_uops_1_3_bits_ldq_idx = io_ren_uops_3_bits_ldq_idx;
  assign io_dis_uops_1_3_bits_stq_idx = io_ren_uops_3_bits_stq_idx;
  assign io_dis_uops_1_3_bits_rxq_idx = io_ren_uops_3_bits_rxq_idx;
  assign io_dis_uops_1_3_bits_pdst = io_ren_uops_3_bits_pdst;
  assign io_dis_uops_1_3_bits_prs1 = io_ren_uops_3_bits_prs1;
  assign io_dis_uops_1_3_bits_prs2 = io_ren_uops_3_bits_prs2;
  assign io_dis_uops_1_3_bits_prs3 = io_ren_uops_3_bits_prs3;
  assign io_dis_uops_1_3_bits_prs1_busy = io_ren_uops_3_bits_prs1_busy;
  assign io_dis_uops_1_3_bits_prs2_busy = io_ren_uops_3_bits_prs2_busy;
  assign io_dis_uops_1_3_bits_stale_pdst = io_ren_uops_3_bits_stale_pdst;
  assign io_dis_uops_1_3_bits_exception = io_ren_uops_3_bits_exception;
  assign io_dis_uops_1_3_bits_exc_cause = io_ren_uops_3_bits_exc_cause;
  assign io_dis_uops_1_3_bits_bypassable = io_ren_uops_3_bits_bypassable;
  assign io_dis_uops_1_3_bits_mem_cmd = io_ren_uops_3_bits_mem_cmd;
  assign io_dis_uops_1_3_bits_mem_size = io_ren_uops_3_bits_mem_size;
  assign io_dis_uops_1_3_bits_mem_signed = io_ren_uops_3_bits_mem_signed;
  assign io_dis_uops_1_3_bits_is_fence = io_ren_uops_3_bits_is_fence;
  assign io_dis_uops_1_3_bits_is_fencei = io_ren_uops_3_bits_is_fencei;
  assign io_dis_uops_1_3_bits_is_amo = io_ren_uops_3_bits_is_amo;
  assign io_dis_uops_1_3_bits_uses_ldq = io_ren_uops_3_bits_uses_ldq;
  assign io_dis_uops_1_3_bits_uses_stq = io_ren_uops_3_bits_uses_stq;
  assign io_dis_uops_1_3_bits_is_sys_pc2epc = io_ren_uops_3_bits_is_sys_pc2epc;
  assign io_dis_uops_1_3_bits_is_unique = io_ren_uops_3_bits_is_unique;
  assign io_dis_uops_1_3_bits_flush_on_commit = io_ren_uops_3_bits_flush_on_commit;
  assign io_dis_uops_1_3_bits_ldst_is_rs1 = io_ren_uops_3_bits_ldst_is_rs1;
  assign io_dis_uops_1_3_bits_ldst = io_ren_uops_3_bits_ldst;
  assign io_dis_uops_1_3_bits_lrs1 = io_ren_uops_3_bits_lrs1;
  assign io_dis_uops_1_3_bits_lrs2 = io_ren_uops_3_bits_lrs2;
  assign io_dis_uops_1_3_bits_lrs3 = io_ren_uops_3_bits_lrs3;
  assign io_dis_uops_1_3_bits_ldst_val = io_ren_uops_3_bits_ldst_val;
  assign io_dis_uops_1_3_bits_dst_rtype = io_ren_uops_3_bits_dst_rtype;
  assign io_dis_uops_1_3_bits_lrs1_rtype = io_ren_uops_3_bits_lrs1_rtype;
  assign io_dis_uops_1_3_bits_lrs2_rtype = io_ren_uops_3_bits_lrs2_rtype;
  assign io_dis_uops_1_3_bits_frs3_en = io_ren_uops_3_bits_frs3_en;
  assign io_dis_uops_1_3_bits_fp_val = io_ren_uops_3_bits_fp_val;
  assign io_dis_uops_1_3_bits_fp_single = io_ren_uops_3_bits_fp_single;
  assign io_dis_uops_1_3_bits_xcpt_pf_if = io_ren_uops_3_bits_xcpt_pf_if;
  assign io_dis_uops_1_3_bits_xcpt_ae_if = io_ren_uops_3_bits_xcpt_ae_if;
  assign io_dis_uops_1_3_bits_xcpt_ma_if = io_ren_uops_3_bits_xcpt_ma_if;
  assign io_dis_uops_1_3_bits_bp_debug_if = io_ren_uops_3_bits_bp_debug_if;
  assign io_dis_uops_1_3_bits_bp_xcpt_if = io_ren_uops_3_bits_bp_xcpt_if;
  assign io_dis_uops_1_3_bits_debug_fsrc = io_ren_uops_3_bits_debug_fsrc;
  assign io_dis_uops_1_3_bits_debug_tsrc = io_ren_uops_3_bits_debug_tsrc;
  assign io_dis_uops_0_0_valid = io_ren_uops_0_valid & io_ren_uops_0_bits_iq_type[1];
  assign io_dis_uops_0_0_bits_uopc = io_ren_uops_0_bits_uopc;
  assign io_dis_uops_0_0_bits_inst = io_ren_uops_0_bits_inst;
  assign io_dis_uops_0_0_bits_debug_inst = io_ren_uops_0_bits_debug_inst;
  assign io_dis_uops_0_0_bits_is_rvc = io_ren_uops_0_bits_is_rvc;
  assign io_dis_uops_0_0_bits_debug_pc = io_ren_uops_0_bits_debug_pc;
  assign io_dis_uops_0_0_bits_iq_type = io_ren_uops_0_bits_iq_type;
  assign io_dis_uops_0_0_bits_fu_code = io_ren_uops_0_bits_fu_code;
  assign io_dis_uops_0_0_bits_is_br = io_ren_uops_0_bits_is_br;
  assign io_dis_uops_0_0_bits_is_jalr = io_ren_uops_0_bits_is_jalr;
  assign io_dis_uops_0_0_bits_is_jal = io_ren_uops_0_bits_is_jal;
  assign io_dis_uops_0_0_bits_is_sfb = io_ren_uops_0_bits_is_sfb;
  assign io_dis_uops_0_0_bits_br_mask = io_ren_uops_0_bits_br_mask;
  assign io_dis_uops_0_0_bits_br_tag = io_ren_uops_0_bits_br_tag;
  assign io_dis_uops_0_0_bits_ftq_idx = io_ren_uops_0_bits_ftq_idx;
  assign io_dis_uops_0_0_bits_edge_inst = io_ren_uops_0_bits_edge_inst;
  assign io_dis_uops_0_0_bits_pc_lob = io_ren_uops_0_bits_pc_lob;
  assign io_dis_uops_0_0_bits_taken = io_ren_uops_0_bits_taken;
  assign io_dis_uops_0_0_bits_imm_packed = io_ren_uops_0_bits_imm_packed;
  assign io_dis_uops_0_0_bits_csr_addr = io_ren_uops_0_bits_csr_addr;
  assign io_dis_uops_0_0_bits_rob_idx = io_ren_uops_0_bits_rob_idx;
  assign io_dis_uops_0_0_bits_ldq_idx = io_ren_uops_0_bits_ldq_idx;
  assign io_dis_uops_0_0_bits_stq_idx = io_ren_uops_0_bits_stq_idx;
  assign io_dis_uops_0_0_bits_rxq_idx = io_ren_uops_0_bits_rxq_idx;
  assign io_dis_uops_0_0_bits_pdst = io_ren_uops_0_bits_pdst;
  assign io_dis_uops_0_0_bits_prs1 = io_ren_uops_0_bits_prs1;
  assign io_dis_uops_0_0_bits_prs2 = io_ren_uops_0_bits_prs2;
  assign io_dis_uops_0_0_bits_prs3 = io_ren_uops_0_bits_prs3;
  assign io_dis_uops_0_0_bits_prs1_busy = io_ren_uops_0_bits_prs1_busy;
  assign io_dis_uops_0_0_bits_prs2_busy = io_ren_uops_0_bits_prs2_busy;
  assign io_dis_uops_0_0_bits_stale_pdst = io_ren_uops_0_bits_stale_pdst;
  assign io_dis_uops_0_0_bits_exception = io_ren_uops_0_bits_exception;
  assign io_dis_uops_0_0_bits_exc_cause = io_ren_uops_0_bits_exc_cause;
  assign io_dis_uops_0_0_bits_bypassable = io_ren_uops_0_bits_bypassable;
  assign io_dis_uops_0_0_bits_mem_cmd = io_ren_uops_0_bits_mem_cmd;
  assign io_dis_uops_0_0_bits_mem_size = io_ren_uops_0_bits_mem_size;
  assign io_dis_uops_0_0_bits_mem_signed = io_ren_uops_0_bits_mem_signed;
  assign io_dis_uops_0_0_bits_is_fence = io_ren_uops_0_bits_is_fence;
  assign io_dis_uops_0_0_bits_is_fencei = io_ren_uops_0_bits_is_fencei;
  assign io_dis_uops_0_0_bits_is_amo = io_ren_uops_0_bits_is_amo;
  assign io_dis_uops_0_0_bits_uses_ldq = io_ren_uops_0_bits_uses_ldq;
  assign io_dis_uops_0_0_bits_uses_stq = io_ren_uops_0_bits_uses_stq;
  assign io_dis_uops_0_0_bits_is_sys_pc2epc = io_ren_uops_0_bits_is_sys_pc2epc;
  assign io_dis_uops_0_0_bits_is_unique = io_ren_uops_0_bits_is_unique;
  assign io_dis_uops_0_0_bits_flush_on_commit = io_ren_uops_0_bits_flush_on_commit;
  assign io_dis_uops_0_0_bits_ldst_is_rs1 = io_ren_uops_0_bits_ldst_is_rs1;
  assign io_dis_uops_0_0_bits_ldst = io_ren_uops_0_bits_ldst;
  assign io_dis_uops_0_0_bits_lrs1 = io_ren_uops_0_bits_lrs1;
  assign io_dis_uops_0_0_bits_lrs2 = io_ren_uops_0_bits_lrs2;
  assign io_dis_uops_0_0_bits_lrs3 = io_ren_uops_0_bits_lrs3;
  assign io_dis_uops_0_0_bits_ldst_val = io_ren_uops_0_bits_ldst_val;
  assign io_dis_uops_0_0_bits_dst_rtype = io_ren_uops_0_bits_dst_rtype;
  assign io_dis_uops_0_0_bits_lrs1_rtype = io_ren_uops_0_bits_lrs1_rtype;
  assign io_dis_uops_0_0_bits_lrs2_rtype = io_ren_uops_0_bits_lrs2_rtype;
  assign io_dis_uops_0_0_bits_frs3_en = io_ren_uops_0_bits_frs3_en;
  assign io_dis_uops_0_0_bits_fp_val = io_ren_uops_0_bits_fp_val;
  assign io_dis_uops_0_0_bits_fp_single = io_ren_uops_0_bits_fp_single;
  assign io_dis_uops_0_0_bits_xcpt_pf_if = io_ren_uops_0_bits_xcpt_pf_if;
  assign io_dis_uops_0_0_bits_xcpt_ae_if = io_ren_uops_0_bits_xcpt_ae_if;
  assign io_dis_uops_0_0_bits_xcpt_ma_if = io_ren_uops_0_bits_xcpt_ma_if;
  assign io_dis_uops_0_0_bits_bp_debug_if = io_ren_uops_0_bits_bp_debug_if;
  assign io_dis_uops_0_0_bits_bp_xcpt_if = io_ren_uops_0_bits_bp_xcpt_if;
  assign io_dis_uops_0_0_bits_debug_fsrc = io_ren_uops_0_bits_debug_fsrc;
  assign io_dis_uops_0_0_bits_debug_tsrc = io_ren_uops_0_bits_debug_tsrc;
  assign io_dis_uops_0_1_valid = io_ren_uops_1_valid & io_ren_uops_1_bits_iq_type[1];
  assign io_dis_uops_0_1_bits_uopc = io_ren_uops_1_bits_uopc;
  assign io_dis_uops_0_1_bits_inst = io_ren_uops_1_bits_inst;
  assign io_dis_uops_0_1_bits_debug_inst = io_ren_uops_1_bits_debug_inst;
  assign io_dis_uops_0_1_bits_is_rvc = io_ren_uops_1_bits_is_rvc;
  assign io_dis_uops_0_1_bits_debug_pc = io_ren_uops_1_bits_debug_pc;
  assign io_dis_uops_0_1_bits_iq_type = io_ren_uops_1_bits_iq_type;
  assign io_dis_uops_0_1_bits_fu_code = io_ren_uops_1_bits_fu_code;
  assign io_dis_uops_0_1_bits_is_br = io_ren_uops_1_bits_is_br;
  assign io_dis_uops_0_1_bits_is_jalr = io_ren_uops_1_bits_is_jalr;
  assign io_dis_uops_0_1_bits_is_jal = io_ren_uops_1_bits_is_jal;
  assign io_dis_uops_0_1_bits_is_sfb = io_ren_uops_1_bits_is_sfb;
  assign io_dis_uops_0_1_bits_br_mask = io_ren_uops_1_bits_br_mask;
  assign io_dis_uops_0_1_bits_br_tag = io_ren_uops_1_bits_br_tag;
  assign io_dis_uops_0_1_bits_ftq_idx = io_ren_uops_1_bits_ftq_idx;
  assign io_dis_uops_0_1_bits_edge_inst = io_ren_uops_1_bits_edge_inst;
  assign io_dis_uops_0_1_bits_pc_lob = io_ren_uops_1_bits_pc_lob;
  assign io_dis_uops_0_1_bits_taken = io_ren_uops_1_bits_taken;
  assign io_dis_uops_0_1_bits_imm_packed = io_ren_uops_1_bits_imm_packed;
  assign io_dis_uops_0_1_bits_csr_addr = io_ren_uops_1_bits_csr_addr;
  assign io_dis_uops_0_1_bits_rob_idx = io_ren_uops_1_bits_rob_idx;
  assign io_dis_uops_0_1_bits_ldq_idx = io_ren_uops_1_bits_ldq_idx;
  assign io_dis_uops_0_1_bits_stq_idx = io_ren_uops_1_bits_stq_idx;
  assign io_dis_uops_0_1_bits_rxq_idx = io_ren_uops_1_bits_rxq_idx;
  assign io_dis_uops_0_1_bits_pdst = io_ren_uops_1_bits_pdst;
  assign io_dis_uops_0_1_bits_prs1 = io_ren_uops_1_bits_prs1;
  assign io_dis_uops_0_1_bits_prs2 = io_ren_uops_1_bits_prs2;
  assign io_dis_uops_0_1_bits_prs3 = io_ren_uops_1_bits_prs3;
  assign io_dis_uops_0_1_bits_prs1_busy = io_ren_uops_1_bits_prs1_busy;
  assign io_dis_uops_0_1_bits_prs2_busy = io_ren_uops_1_bits_prs2_busy;
  assign io_dis_uops_0_1_bits_stale_pdst = io_ren_uops_1_bits_stale_pdst;
  assign io_dis_uops_0_1_bits_exception = io_ren_uops_1_bits_exception;
  assign io_dis_uops_0_1_bits_exc_cause = io_ren_uops_1_bits_exc_cause;
  assign io_dis_uops_0_1_bits_bypassable = io_ren_uops_1_bits_bypassable;
  assign io_dis_uops_0_1_bits_mem_cmd = io_ren_uops_1_bits_mem_cmd;
  assign io_dis_uops_0_1_bits_mem_size = io_ren_uops_1_bits_mem_size;
  assign io_dis_uops_0_1_bits_mem_signed = io_ren_uops_1_bits_mem_signed;
  assign io_dis_uops_0_1_bits_is_fence = io_ren_uops_1_bits_is_fence;
  assign io_dis_uops_0_1_bits_is_fencei = io_ren_uops_1_bits_is_fencei;
  assign io_dis_uops_0_1_bits_is_amo = io_ren_uops_1_bits_is_amo;
  assign io_dis_uops_0_1_bits_uses_ldq = io_ren_uops_1_bits_uses_ldq;
  assign io_dis_uops_0_1_bits_uses_stq = io_ren_uops_1_bits_uses_stq;
  assign io_dis_uops_0_1_bits_is_sys_pc2epc = io_ren_uops_1_bits_is_sys_pc2epc;
  assign io_dis_uops_0_1_bits_is_unique = io_ren_uops_1_bits_is_unique;
  assign io_dis_uops_0_1_bits_flush_on_commit = io_ren_uops_1_bits_flush_on_commit;
  assign io_dis_uops_0_1_bits_ldst_is_rs1 = io_ren_uops_1_bits_ldst_is_rs1;
  assign io_dis_uops_0_1_bits_ldst = io_ren_uops_1_bits_ldst;
  assign io_dis_uops_0_1_bits_lrs1 = io_ren_uops_1_bits_lrs1;
  assign io_dis_uops_0_1_bits_lrs2 = io_ren_uops_1_bits_lrs2;
  assign io_dis_uops_0_1_bits_lrs3 = io_ren_uops_1_bits_lrs3;
  assign io_dis_uops_0_1_bits_ldst_val = io_ren_uops_1_bits_ldst_val;
  assign io_dis_uops_0_1_bits_dst_rtype = io_ren_uops_1_bits_dst_rtype;
  assign io_dis_uops_0_1_bits_lrs1_rtype = io_ren_uops_1_bits_lrs1_rtype;
  assign io_dis_uops_0_1_bits_lrs2_rtype = io_ren_uops_1_bits_lrs2_rtype;
  assign io_dis_uops_0_1_bits_frs3_en = io_ren_uops_1_bits_frs3_en;
  assign io_dis_uops_0_1_bits_fp_val = io_ren_uops_1_bits_fp_val;
  assign io_dis_uops_0_1_bits_fp_single = io_ren_uops_1_bits_fp_single;
  assign io_dis_uops_0_1_bits_xcpt_pf_if = io_ren_uops_1_bits_xcpt_pf_if;
  assign io_dis_uops_0_1_bits_xcpt_ae_if = io_ren_uops_1_bits_xcpt_ae_if;
  assign io_dis_uops_0_1_bits_xcpt_ma_if = io_ren_uops_1_bits_xcpt_ma_if;
  assign io_dis_uops_0_1_bits_bp_debug_if = io_ren_uops_1_bits_bp_debug_if;
  assign io_dis_uops_0_1_bits_bp_xcpt_if = io_ren_uops_1_bits_bp_xcpt_if;
  assign io_dis_uops_0_1_bits_debug_fsrc = io_ren_uops_1_bits_debug_fsrc;
  assign io_dis_uops_0_1_bits_debug_tsrc = io_ren_uops_1_bits_debug_tsrc;
  assign io_dis_uops_0_2_valid = io_ren_uops_2_valid & io_ren_uops_2_bits_iq_type[1];
  assign io_dis_uops_0_2_bits_uopc = io_ren_uops_2_bits_uopc;
  assign io_dis_uops_0_2_bits_inst = io_ren_uops_2_bits_inst;
  assign io_dis_uops_0_2_bits_debug_inst = io_ren_uops_2_bits_debug_inst;
  assign io_dis_uops_0_2_bits_is_rvc = io_ren_uops_2_bits_is_rvc;
  assign io_dis_uops_0_2_bits_debug_pc = io_ren_uops_2_bits_debug_pc;
  assign io_dis_uops_0_2_bits_iq_type = io_ren_uops_2_bits_iq_type;
  assign io_dis_uops_0_2_bits_fu_code = io_ren_uops_2_bits_fu_code;
  assign io_dis_uops_0_2_bits_is_br = io_ren_uops_2_bits_is_br;
  assign io_dis_uops_0_2_bits_is_jalr = io_ren_uops_2_bits_is_jalr;
  assign io_dis_uops_0_2_bits_is_jal = io_ren_uops_2_bits_is_jal;
  assign io_dis_uops_0_2_bits_is_sfb = io_ren_uops_2_bits_is_sfb;
  assign io_dis_uops_0_2_bits_br_mask = io_ren_uops_2_bits_br_mask;
  assign io_dis_uops_0_2_bits_br_tag = io_ren_uops_2_bits_br_tag;
  assign io_dis_uops_0_2_bits_ftq_idx = io_ren_uops_2_bits_ftq_idx;
  assign io_dis_uops_0_2_bits_edge_inst = io_ren_uops_2_bits_edge_inst;
  assign io_dis_uops_0_2_bits_pc_lob = io_ren_uops_2_bits_pc_lob;
  assign io_dis_uops_0_2_bits_taken = io_ren_uops_2_bits_taken;
  assign io_dis_uops_0_2_bits_imm_packed = io_ren_uops_2_bits_imm_packed;
  assign io_dis_uops_0_2_bits_csr_addr = io_ren_uops_2_bits_csr_addr;
  assign io_dis_uops_0_2_bits_rob_idx = io_ren_uops_2_bits_rob_idx;
  assign io_dis_uops_0_2_bits_ldq_idx = io_ren_uops_2_bits_ldq_idx;
  assign io_dis_uops_0_2_bits_stq_idx = io_ren_uops_2_bits_stq_idx;
  assign io_dis_uops_0_2_bits_rxq_idx = io_ren_uops_2_bits_rxq_idx;
  assign io_dis_uops_0_2_bits_pdst = io_ren_uops_2_bits_pdst;
  assign io_dis_uops_0_2_bits_prs1 = io_ren_uops_2_bits_prs1;
  assign io_dis_uops_0_2_bits_prs2 = io_ren_uops_2_bits_prs2;
  assign io_dis_uops_0_2_bits_prs3 = io_ren_uops_2_bits_prs3;
  assign io_dis_uops_0_2_bits_prs1_busy = io_ren_uops_2_bits_prs1_busy;
  assign io_dis_uops_0_2_bits_prs2_busy = io_ren_uops_2_bits_prs2_busy;
  assign io_dis_uops_0_2_bits_stale_pdst = io_ren_uops_2_bits_stale_pdst;
  assign io_dis_uops_0_2_bits_exception = io_ren_uops_2_bits_exception;
  assign io_dis_uops_0_2_bits_exc_cause = io_ren_uops_2_bits_exc_cause;
  assign io_dis_uops_0_2_bits_bypassable = io_ren_uops_2_bits_bypassable;
  assign io_dis_uops_0_2_bits_mem_cmd = io_ren_uops_2_bits_mem_cmd;
  assign io_dis_uops_0_2_bits_mem_size = io_ren_uops_2_bits_mem_size;
  assign io_dis_uops_0_2_bits_mem_signed = io_ren_uops_2_bits_mem_signed;
  assign io_dis_uops_0_2_bits_is_fence = io_ren_uops_2_bits_is_fence;
  assign io_dis_uops_0_2_bits_is_fencei = io_ren_uops_2_bits_is_fencei;
  assign io_dis_uops_0_2_bits_is_amo = io_ren_uops_2_bits_is_amo;
  assign io_dis_uops_0_2_bits_uses_ldq = io_ren_uops_2_bits_uses_ldq;
  assign io_dis_uops_0_2_bits_uses_stq = io_ren_uops_2_bits_uses_stq;
  assign io_dis_uops_0_2_bits_is_sys_pc2epc = io_ren_uops_2_bits_is_sys_pc2epc;
  assign io_dis_uops_0_2_bits_is_unique = io_ren_uops_2_bits_is_unique;
  assign io_dis_uops_0_2_bits_flush_on_commit = io_ren_uops_2_bits_flush_on_commit;
  assign io_dis_uops_0_2_bits_ldst_is_rs1 = io_ren_uops_2_bits_ldst_is_rs1;
  assign io_dis_uops_0_2_bits_ldst = io_ren_uops_2_bits_ldst;
  assign io_dis_uops_0_2_bits_lrs1 = io_ren_uops_2_bits_lrs1;
  assign io_dis_uops_0_2_bits_lrs2 = io_ren_uops_2_bits_lrs2;
  assign io_dis_uops_0_2_bits_lrs3 = io_ren_uops_2_bits_lrs3;
  assign io_dis_uops_0_2_bits_ldst_val = io_ren_uops_2_bits_ldst_val;
  assign io_dis_uops_0_2_bits_dst_rtype = io_ren_uops_2_bits_dst_rtype;
  assign io_dis_uops_0_2_bits_lrs1_rtype = io_ren_uops_2_bits_lrs1_rtype;
  assign io_dis_uops_0_2_bits_lrs2_rtype = io_ren_uops_2_bits_lrs2_rtype;
  assign io_dis_uops_0_2_bits_frs3_en = io_ren_uops_2_bits_frs3_en;
  assign io_dis_uops_0_2_bits_fp_val = io_ren_uops_2_bits_fp_val;
  assign io_dis_uops_0_2_bits_fp_single = io_ren_uops_2_bits_fp_single;
  assign io_dis_uops_0_2_bits_xcpt_pf_if = io_ren_uops_2_bits_xcpt_pf_if;
  assign io_dis_uops_0_2_bits_xcpt_ae_if = io_ren_uops_2_bits_xcpt_ae_if;
  assign io_dis_uops_0_2_bits_xcpt_ma_if = io_ren_uops_2_bits_xcpt_ma_if;
  assign io_dis_uops_0_2_bits_bp_debug_if = io_ren_uops_2_bits_bp_debug_if;
  assign io_dis_uops_0_2_bits_bp_xcpt_if = io_ren_uops_2_bits_bp_xcpt_if;
  assign io_dis_uops_0_2_bits_debug_fsrc = io_ren_uops_2_bits_debug_fsrc;
  assign io_dis_uops_0_2_bits_debug_tsrc = io_ren_uops_2_bits_debug_tsrc;
  assign io_dis_uops_0_3_valid = io_ren_uops_3_valid & io_ren_uops_3_bits_iq_type[1];
  assign io_dis_uops_0_3_bits_uopc = io_ren_uops_3_bits_uopc;
  assign io_dis_uops_0_3_bits_inst = io_ren_uops_3_bits_inst;
  assign io_dis_uops_0_3_bits_debug_inst = io_ren_uops_3_bits_debug_inst;
  assign io_dis_uops_0_3_bits_is_rvc = io_ren_uops_3_bits_is_rvc;
  assign io_dis_uops_0_3_bits_debug_pc = io_ren_uops_3_bits_debug_pc;
  assign io_dis_uops_0_3_bits_iq_type = io_ren_uops_3_bits_iq_type;
  assign io_dis_uops_0_3_bits_fu_code = io_ren_uops_3_bits_fu_code;
  assign io_dis_uops_0_3_bits_is_br = io_ren_uops_3_bits_is_br;
  assign io_dis_uops_0_3_bits_is_jalr = io_ren_uops_3_bits_is_jalr;
  assign io_dis_uops_0_3_bits_is_jal = io_ren_uops_3_bits_is_jal;
  assign io_dis_uops_0_3_bits_is_sfb = io_ren_uops_3_bits_is_sfb;
  assign io_dis_uops_0_3_bits_br_mask = io_ren_uops_3_bits_br_mask;
  assign io_dis_uops_0_3_bits_br_tag = io_ren_uops_3_bits_br_tag;
  assign io_dis_uops_0_3_bits_ftq_idx = io_ren_uops_3_bits_ftq_idx;
  assign io_dis_uops_0_3_bits_edge_inst = io_ren_uops_3_bits_edge_inst;
  assign io_dis_uops_0_3_bits_pc_lob = io_ren_uops_3_bits_pc_lob;
  assign io_dis_uops_0_3_bits_taken = io_ren_uops_3_bits_taken;
  assign io_dis_uops_0_3_bits_imm_packed = io_ren_uops_3_bits_imm_packed;
  assign io_dis_uops_0_3_bits_csr_addr = io_ren_uops_3_bits_csr_addr;
  assign io_dis_uops_0_3_bits_rob_idx = io_ren_uops_3_bits_rob_idx;
  assign io_dis_uops_0_3_bits_ldq_idx = io_ren_uops_3_bits_ldq_idx;
  assign io_dis_uops_0_3_bits_stq_idx = io_ren_uops_3_bits_stq_idx;
  assign io_dis_uops_0_3_bits_rxq_idx = io_ren_uops_3_bits_rxq_idx;
  assign io_dis_uops_0_3_bits_pdst = io_ren_uops_3_bits_pdst;
  assign io_dis_uops_0_3_bits_prs1 = io_ren_uops_3_bits_prs1;
  assign io_dis_uops_0_3_bits_prs2 = io_ren_uops_3_bits_prs2;
  assign io_dis_uops_0_3_bits_prs3 = io_ren_uops_3_bits_prs3;
  assign io_dis_uops_0_3_bits_prs1_busy = io_ren_uops_3_bits_prs1_busy;
  assign io_dis_uops_0_3_bits_prs2_busy = io_ren_uops_3_bits_prs2_busy;
  assign io_dis_uops_0_3_bits_stale_pdst = io_ren_uops_3_bits_stale_pdst;
  assign io_dis_uops_0_3_bits_exception = io_ren_uops_3_bits_exception;
  assign io_dis_uops_0_3_bits_exc_cause = io_ren_uops_3_bits_exc_cause;
  assign io_dis_uops_0_3_bits_bypassable = io_ren_uops_3_bits_bypassable;
  assign io_dis_uops_0_3_bits_mem_cmd = io_ren_uops_3_bits_mem_cmd;
  assign io_dis_uops_0_3_bits_mem_size = io_ren_uops_3_bits_mem_size;
  assign io_dis_uops_0_3_bits_mem_signed = io_ren_uops_3_bits_mem_signed;
  assign io_dis_uops_0_3_bits_is_fence = io_ren_uops_3_bits_is_fence;
  assign io_dis_uops_0_3_bits_is_fencei = io_ren_uops_3_bits_is_fencei;
  assign io_dis_uops_0_3_bits_is_amo = io_ren_uops_3_bits_is_amo;
  assign io_dis_uops_0_3_bits_uses_ldq = io_ren_uops_3_bits_uses_ldq;
  assign io_dis_uops_0_3_bits_uses_stq = io_ren_uops_3_bits_uses_stq;
  assign io_dis_uops_0_3_bits_is_sys_pc2epc = io_ren_uops_3_bits_is_sys_pc2epc;
  assign io_dis_uops_0_3_bits_is_unique = io_ren_uops_3_bits_is_unique;
  assign io_dis_uops_0_3_bits_flush_on_commit = io_ren_uops_3_bits_flush_on_commit;
  assign io_dis_uops_0_3_bits_ldst_is_rs1 = io_ren_uops_3_bits_ldst_is_rs1;
  assign io_dis_uops_0_3_bits_ldst = io_ren_uops_3_bits_ldst;
  assign io_dis_uops_0_3_bits_lrs1 = io_ren_uops_3_bits_lrs1;
  assign io_dis_uops_0_3_bits_lrs2 = io_ren_uops_3_bits_lrs2;
  assign io_dis_uops_0_3_bits_lrs3 = io_ren_uops_3_bits_lrs3;
  assign io_dis_uops_0_3_bits_ldst_val = io_ren_uops_3_bits_ldst_val;
  assign io_dis_uops_0_3_bits_dst_rtype = io_ren_uops_3_bits_dst_rtype;
  assign io_dis_uops_0_3_bits_lrs1_rtype = io_ren_uops_3_bits_lrs1_rtype;
  assign io_dis_uops_0_3_bits_lrs2_rtype = io_ren_uops_3_bits_lrs2_rtype;
  assign io_dis_uops_0_3_bits_frs3_en = io_ren_uops_3_bits_frs3_en;
  assign io_dis_uops_0_3_bits_fp_val = io_ren_uops_3_bits_fp_val;
  assign io_dis_uops_0_3_bits_fp_single = io_ren_uops_3_bits_fp_single;
  assign io_dis_uops_0_3_bits_xcpt_pf_if = io_ren_uops_3_bits_xcpt_pf_if;
  assign io_dis_uops_0_3_bits_xcpt_ae_if = io_ren_uops_3_bits_xcpt_ae_if;
  assign io_dis_uops_0_3_bits_xcpt_ma_if = io_ren_uops_3_bits_xcpt_ma_if;
  assign io_dis_uops_0_3_bits_bp_debug_if = io_ren_uops_3_bits_bp_debug_if;
  assign io_dis_uops_0_3_bits_bp_xcpt_if = io_ren_uops_3_bits_bp_xcpt_if;
  assign io_dis_uops_0_3_bits_debug_fsrc = io_ren_uops_3_bits_debug_fsrc;
  assign io_dis_uops_0_3_bits_debug_tsrc = io_ren_uops_3_bits_debug_tsrc;
endmodule

