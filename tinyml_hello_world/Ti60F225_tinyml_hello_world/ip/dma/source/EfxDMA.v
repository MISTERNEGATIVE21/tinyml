// Generator : SpinalHDL v1.6.1    git head : d3dbfc9f6792c87d5393b44d7f115c304254107b
// Component : EfxDMA



module EfxDMA (
  input      [13:0]   ctrl_PADDR,
  input      [0:0]    ctrl_PSEL,
  input               ctrl_PENABLE,
  output              ctrl_PREADY,
  input               ctrl_PWRITE,
  input      [31:0]   ctrl_PWDATA,
  output     [31:0]   ctrl_PRDATA,
  output              ctrl_PSLVERROR,
  output     [3:0]    ctrl_interrupts,
  output              read_arvalid,
  input               read_arready,
  output     [31:0]   read_araddr,
  output     [3:0]    read_arregion,
  output     [7:0]    read_arlen,
  output     [2:0]    read_arsize,
  output     [1:0]    read_arburst,
  output     [0:0]    read_arlock,
  output     [3:0]    read_arcache,
  output     [3:0]    read_arqos,
  output     [2:0]    read_arprot,
  input               read_rvalid,
  output              read_rready,
  input      [127:0]  read_rdata,
  input      [1:0]    read_rresp,
  input               read_rlast,
  output              write_awvalid,
  input               write_awready,
  output     [31:0]   write_awaddr,
  output     [3:0]    write_awregion,
  output     [7:0]    write_awlen,
  output     [2:0]    write_awsize,
  output     [1:0]    write_awburst,
  output     [0:0]    write_awlock,
  output     [3:0]    write_awcache,
  output     [3:0]    write_awqos,
  output     [2:0]    write_awprot,
  output              write_wvalid,
  input               write_wready,
  output     [127:0]  write_wdata,
  output     [15:0]   write_wstrb,
  output              write_wlast,
  input               write_bvalid,
  output              write_bready,
  input      [1:0]    write_bresp,
  input               dat0_i_tvalid,
  output              dat0_i_tready,
  input      [63:0]   dat0_i_tdata,
  input      [7:0]    dat0_i_tkeep,
  input      [3:0]    dat0_i_tdest,
  input               dat0_i_tlast,
  input               dat2_i_tvalid,
  output              dat2_i_tready,
  input      [31:0]   dat2_i_tdata,
  input      [3:0]    dat2_i_tkeep,
  input      [3:0]    dat2_i_tdest,
  input               dat2_i_tlast,
  output              dat1_o_tvalid,
  input               dat1_o_tready,
  output     [63:0]   dat1_o_tdata,
  output     [7:0]    dat1_o_tkeep,
  output     [3:0]    dat1_o_tdest,
  output              dat1_o_tlast,
  output              dat3_o_tvalid,
  input               dat3_o_tready,
  output     [31:0]   dat3_o_tdata,
  output     [3:0]    dat3_o_tkeep,
  output     [3:0]    dat3_o_tdest,
  output              dat3_o_tlast,
  input               clk,
  input               reset,
  input               ctrl_clk,
  input               ctrl_reset,
  input               dat0_i_clk,
  input               dat0_i_reset,
  input               dat2_i_clk,
  input               dat2_i_reset,
  input               dat1_o_clk,
  input               dat1_o_reset,
  input               dat3_o_clk,
  input               dat3_o_reset
);
  wire                core_io_write_cmd_ready;
  wire                core_io_outputs_0_ready;
  wire                core_io_outputs_1_ready;
  wire                read_r_s2mPipe_beforeQueue_fifo_io_pop_ready;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_ready;
  wire                inputsAdapter_1_crossclock_fifo_io_pop_ready;
  wire                core_io_read_cmd_valid;
  wire                core_io_read_cmd_payload_last;
  wire       [0:0]    core_io_read_cmd_payload_fragment_source;
  wire       [0:0]    core_io_read_cmd_payload_fragment_opcode;
  wire       [31:0]   core_io_read_cmd_payload_fragment_address;
  wire       [11:0]   core_io_read_cmd_payload_fragment_length;
  wire       [21:0]   core_io_read_cmd_payload_fragment_context;
  wire                core_io_read_rsp_ready;
  wire                core_io_write_cmd_valid;
  wire                core_io_write_cmd_payload_last;
  wire       [0:0]    core_io_write_cmd_payload_fragment_source;
  wire       [0:0]    core_io_write_cmd_payload_fragment_opcode;
  wire       [31:0]   core_io_write_cmd_payload_fragment_address;
  wire       [11:0]   core_io_write_cmd_payload_fragment_length;
  wire       [127:0]  core_io_write_cmd_payload_fragment_data;
  wire       [15:0]   core_io_write_cmd_payload_fragment_mask;
  wire       [13:0]   core_io_write_cmd_payload_fragment_context;
  wire                core_io_write_rsp_ready;
  wire                core_io_outputs_0_valid;
  wire       [63:0]   core_io_outputs_0_payload_data;
  wire       [7:0]    core_io_outputs_0_payload_mask;
  wire       [3:0]    core_io_outputs_0_payload_sink;
  wire                core_io_outputs_0_payload_last;
  wire                core_io_outputs_1_valid;
  wire       [63:0]   core_io_outputs_1_payload_data;
  wire       [7:0]    core_io_outputs_1_payload_mask;
  wire       [3:0]    core_io_outputs_1_payload_sink;
  wire                core_io_outputs_1_payload_last;
  wire                core_io_inputs_0_ready;
  wire                core_io_inputs_1_ready;
  wire       [3:0]    core_io_interrupts;
  wire                core_io_ctrl_PREADY;
  wire       [31:0]   core_io_ctrl_PRDATA;
  wire                core_io_ctrl_PSLVERROR;
  wire                withCtrlCc_apbCc_io_input_PREADY;
  wire       [31:0]   withCtrlCc_apbCc_io_input_PRDATA;
  wire                withCtrlCc_apbCc_io_input_PSLVERROR;
  wire       [13:0]   withCtrlCc_apbCc_io_output_PADDR;
  wire       [0:0]    withCtrlCc_apbCc_io_output_PSEL;
  wire                withCtrlCc_apbCc_io_output_PENABLE;
  wire                withCtrlCc_apbCc_io_output_PWRITE;
  wire       [31:0]   withCtrlCc_apbCc_io_output_PWDATA;
  wire       [3:0]    core_io_interrupts_buffercc_io_dataOut;
  wire                readLogic_sourceRemover_io_input_cmd_ready;
  wire                readLogic_sourceRemover_io_input_rsp_valid;
  wire                readLogic_sourceRemover_io_input_rsp_payload_last;
  wire       [0:0]    readLogic_sourceRemover_io_input_rsp_payload_fragment_source;
  wire       [0:0]    readLogic_sourceRemover_io_input_rsp_payload_fragment_opcode;
  wire       [127:0]  readLogic_sourceRemover_io_input_rsp_payload_fragment_data;
  wire       [21:0]   readLogic_sourceRemover_io_input_rsp_payload_fragment_context;
  wire                readLogic_sourceRemover_io_output_cmd_valid;
  wire                readLogic_sourceRemover_io_output_cmd_payload_last;
  wire       [0:0]    readLogic_sourceRemover_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   readLogic_sourceRemover_io_output_cmd_payload_fragment_address;
  wire       [11:0]   readLogic_sourceRemover_io_output_cmd_payload_fragment_length;
  wire       [22:0]   readLogic_sourceRemover_io_output_cmd_payload_fragment_context;
  wire                readLogic_sourceRemover_io_output_rsp_ready;
  wire                readLogic_bridge_io_input_cmd_ready;
  wire                readLogic_bridge_io_input_rsp_valid;
  wire                readLogic_bridge_io_input_rsp_payload_last;
  wire       [0:0]    readLogic_bridge_io_input_rsp_payload_fragment_opcode;
  wire       [127:0]  readLogic_bridge_io_input_rsp_payload_fragment_data;
  wire       [22:0]   readLogic_bridge_io_input_rsp_payload_fragment_context;
  wire                readLogic_bridge_io_output_ar_valid;
  wire       [31:0]   readLogic_bridge_io_output_ar_payload_addr;
  wire       [7:0]    readLogic_bridge_io_output_ar_payload_len;
  wire       [2:0]    readLogic_bridge_io_output_ar_payload_size;
  wire       [3:0]    readLogic_bridge_io_output_ar_payload_cache;
  wire       [2:0]    readLogic_bridge_io_output_ar_payload_prot;
  wire                readLogic_bridge_io_output_r_ready;
  wire                read_r_s2mPipe_beforeQueue_fifo_io_push_ready;
  wire                read_r_s2mPipe_beforeQueue_fifo_io_pop_valid;
  wire       [127:0]  read_r_s2mPipe_beforeQueue_fifo_io_pop_payload_data;
  wire       [1:0]    read_r_s2mPipe_beforeQueue_fifo_io_pop_payload_resp;
  wire                read_r_s2mPipe_beforeQueue_fifo_io_pop_payload_last;
  wire       [8:0]    read_r_s2mPipe_beforeQueue_fifo_io_occupancy;
  wire       [8:0]    read_r_s2mPipe_beforeQueue_fifo_io_availability;
  wire                writeLogic_sourceRemover_io_input_cmd_ready;
  wire                writeLogic_sourceRemover_io_input_rsp_valid;
  wire                writeLogic_sourceRemover_io_input_rsp_payload_last;
  wire       [0:0]    writeLogic_sourceRemover_io_input_rsp_payload_fragment_source;
  wire       [0:0]    writeLogic_sourceRemover_io_input_rsp_payload_fragment_opcode;
  wire       [13:0]   writeLogic_sourceRemover_io_input_rsp_payload_fragment_context;
  wire                writeLogic_sourceRemover_io_output_cmd_valid;
  wire                writeLogic_sourceRemover_io_output_cmd_payload_last;
  wire       [0:0]    writeLogic_sourceRemover_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   writeLogic_sourceRemover_io_output_cmd_payload_fragment_address;
  wire       [11:0]   writeLogic_sourceRemover_io_output_cmd_payload_fragment_length;
  wire       [127:0]  writeLogic_sourceRemover_io_output_cmd_payload_fragment_data;
  wire       [15:0]   writeLogic_sourceRemover_io_output_cmd_payload_fragment_mask;
  wire       [14:0]   writeLogic_sourceRemover_io_output_cmd_payload_fragment_context;
  wire                writeLogic_sourceRemover_io_output_rsp_ready;
  wire                writeLogic_retainer_io_input_cmd_ready;
  wire                writeLogic_retainer_io_input_rsp_valid;
  wire                writeLogic_retainer_io_input_rsp_payload_last;
  wire       [0:0]    writeLogic_retainer_io_input_rsp_payload_fragment_opcode;
  wire       [14:0]   writeLogic_retainer_io_input_rsp_payload_fragment_context;
  wire                writeLogic_retainer_io_output_cmd_valid;
  wire                writeLogic_retainer_io_output_cmd_payload_last;
  wire       [0:0]    writeLogic_retainer_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   writeLogic_retainer_io_output_cmd_payload_fragment_address;
  wire       [11:0]   writeLogic_retainer_io_output_cmd_payload_fragment_length;
  wire       [127:0]  writeLogic_retainer_io_output_cmd_payload_fragment_data;
  wire       [15:0]   writeLogic_retainer_io_output_cmd_payload_fragment_mask;
  wire       [14:0]   writeLogic_retainer_io_output_cmd_payload_fragment_context;
  wire                writeLogic_retainer_io_output_rsp_ready;
  wire                writeLogic_bridge_io_input_cmd_ready;
  wire                writeLogic_bridge_io_input_rsp_valid;
  wire                writeLogic_bridge_io_input_rsp_payload_last;
  wire       [0:0]    writeLogic_bridge_io_input_rsp_payload_fragment_opcode;
  wire       [14:0]   writeLogic_bridge_io_input_rsp_payload_fragment_context;
  wire                writeLogic_bridge_io_output_aw_valid;
  wire       [31:0]   writeLogic_bridge_io_output_aw_payload_addr;
  wire       [7:0]    writeLogic_bridge_io_output_aw_payload_len;
  wire       [2:0]    writeLogic_bridge_io_output_aw_payload_size;
  wire       [3:0]    writeLogic_bridge_io_output_aw_payload_cache;
  wire       [2:0]    writeLogic_bridge_io_output_aw_payload_prot;
  wire                writeLogic_bridge_io_output_w_valid;
  wire       [127:0]  writeLogic_bridge_io_output_w_payload_data;
  wire       [15:0]   writeLogic_bridge_io_output_w_payload_strb;
  wire                writeLogic_bridge_io_output_w_payload_last;
  wire                writeLogic_bridge_io_output_b_ready;
  wire                inputsAdapter_0_crossclock_fifo_io_push_ready;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_valid;
  wire       [63:0]   inputsAdapter_0_crossclock_fifo_io_pop_payload_data;
  wire       [7:0]    inputsAdapter_0_crossclock_fifo_io_pop_payload_mask;
  wire       [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_payload_sink;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_payload_last;
  wire       [4:0]    inputsAdapter_0_crossclock_fifo_io_pushOccupancy;
  wire       [4:0]    inputsAdapter_0_crossclock_fifo_io_popOccupancy;
  wire                inputsAdapter_1_upsizer_logic_io_input_ready;
  wire                inputsAdapter_1_upsizer_logic_io_output_valid;
  wire       [63:0]   inputsAdapter_1_upsizer_logic_io_output_payload_data;
  wire       [7:0]    inputsAdapter_1_upsizer_logic_io_output_payload_mask;
  wire       [3:0]    inputsAdapter_1_upsizer_logic_io_output_payload_sink;
  wire                inputsAdapter_1_upsizer_logic_io_output_payload_last;
  wire                inputsAdapter_1_crossclock_fifo_io_push_ready;
  wire                inputsAdapter_1_crossclock_fifo_io_pop_valid;
  wire       [63:0]   inputsAdapter_1_crossclock_fifo_io_pop_payload_data;
  wire       [7:0]    inputsAdapter_1_crossclock_fifo_io_pop_payload_mask;
  wire       [3:0]    inputsAdapter_1_crossclock_fifo_io_pop_payload_sink;
  wire                inputsAdapter_1_crossclock_fifo_io_pop_payload_last;
  wire       [4:0]    inputsAdapter_1_crossclock_fifo_io_pushOccupancy;
  wire       [4:0]    inputsAdapter_1_crossclock_fifo_io_popOccupancy;
  wire                outputsAdapter_0_crossclock_fifo_io_push_ready;
  wire                outputsAdapter_0_crossclock_fifo_io_pop_valid;
  wire       [63:0]   outputsAdapter_0_crossclock_fifo_io_pop_payload_data;
  wire       [7:0]    outputsAdapter_0_crossclock_fifo_io_pop_payload_mask;
  wire       [3:0]    outputsAdapter_0_crossclock_fifo_io_pop_payload_sink;
  wire                outputsAdapter_0_crossclock_fifo_io_pop_payload_last;
  wire       [4:0]    outputsAdapter_0_crossclock_fifo_io_pushOccupancy;
  wire       [4:0]    outputsAdapter_0_crossclock_fifo_io_popOccupancy;
  wire                outputsAdapter_1_crossclock_fifo_io_push_ready;
  wire                outputsAdapter_1_crossclock_fifo_io_pop_valid;
  wire       [63:0]   outputsAdapter_1_crossclock_fifo_io_pop_payload_data;
  wire       [7:0]    outputsAdapter_1_crossclock_fifo_io_pop_payload_mask;
  wire       [3:0]    outputsAdapter_1_crossclock_fifo_io_pop_payload_sink;
  wire                outputsAdapter_1_crossclock_fifo_io_pop_payload_last;
  wire       [4:0]    outputsAdapter_1_crossclock_fifo_io_pushOccupancy;
  wire       [4:0]    outputsAdapter_1_crossclock_fifo_io_popOccupancy;
  wire                outputsAdapter_1_sparseDownsizer_logic_io_input_ready;
  wire                outputsAdapter_1_sparseDownsizer_logic_io_output_valid;
  wire       [31:0]   outputsAdapter_1_sparseDownsizer_logic_io_output_payload_data;
  wire       [3:0]    outputsAdapter_1_sparseDownsizer_logic_io_output_payload_mask;
  wire       [3:0]    outputsAdapter_1_sparseDownsizer_logic_io_output_payload_sink;
  wire                outputsAdapter_1_sparseDownsizer_logic_io_output_payload_last;
  wire                core_io_write_cmd_s2mPipe_valid;
  reg                 core_io_write_cmd_s2mPipe_ready;
  wire                core_io_write_cmd_s2mPipe_payload_last;
  wire       [0:0]    core_io_write_cmd_s2mPipe_payload_fragment_source;
  wire       [0:0]    core_io_write_cmd_s2mPipe_payload_fragment_opcode;
  wire       [31:0]   core_io_write_cmd_s2mPipe_payload_fragment_address;
  wire       [11:0]   core_io_write_cmd_s2mPipe_payload_fragment_length;
  wire       [127:0]  core_io_write_cmd_s2mPipe_payload_fragment_data;
  wire       [15:0]   core_io_write_cmd_s2mPipe_payload_fragment_mask;
  wire       [13:0]   core_io_write_cmd_s2mPipe_payload_fragment_context;
  reg                 core_io_write_cmd_rValid;
  reg                 core_io_write_cmd_rData_last;
  reg        [0:0]    core_io_write_cmd_rData_fragment_source;
  reg        [0:0]    core_io_write_cmd_rData_fragment_opcode;
  reg        [31:0]   core_io_write_cmd_rData_fragment_address;
  reg        [11:0]   core_io_write_cmd_rData_fragment_length;
  reg        [127:0]  core_io_write_cmd_rData_fragment_data;
  reg        [15:0]   core_io_write_cmd_rData_fragment_mask;
  reg        [13:0]   core_io_write_cmd_rData_fragment_context;
  wire                core_io_write_cmd_s2mPipe_m2sPipe_valid;
  wire                core_io_write_cmd_s2mPipe_m2sPipe_ready;
  wire                core_io_write_cmd_s2mPipe_m2sPipe_payload_last;
  wire       [0:0]    core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_source;
  wire       [0:0]    core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  wire       [31:0]   core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  wire       [11:0]   core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  wire       [127:0]  core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_data;
  wire       [15:0]   core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_mask;
  wire       [13:0]   core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_context;
  reg                 core_io_write_cmd_s2mPipe_rValid;
  reg                 core_io_write_cmd_s2mPipe_rData_last;
  reg        [0:0]    core_io_write_cmd_s2mPipe_rData_fragment_source;
  reg        [0:0]    core_io_write_cmd_s2mPipe_rData_fragment_opcode;
  reg        [31:0]   core_io_write_cmd_s2mPipe_rData_fragment_address;
  reg        [11:0]   core_io_write_cmd_s2mPipe_rData_fragment_length;
  reg        [127:0]  core_io_write_cmd_s2mPipe_rData_fragment_data;
  reg        [15:0]   core_io_write_cmd_s2mPipe_rData_fragment_mask;
  reg        [13:0]   core_io_write_cmd_s2mPipe_rData_fragment_context;
  wire                when_Stream_l342;
  wire                interconnect_read_aggregated_cmd_valid;
  wire                interconnect_read_aggregated_cmd_ready;
  wire                interconnect_read_aggregated_cmd_payload_last;
  wire       [0:0]    interconnect_read_aggregated_cmd_payload_fragment_source;
  wire       [0:0]    interconnect_read_aggregated_cmd_payload_fragment_opcode;
  wire       [31:0]   interconnect_read_aggregated_cmd_payload_fragment_address;
  wire       [11:0]   interconnect_read_aggregated_cmd_payload_fragment_length;
  wire       [21:0]   interconnect_read_aggregated_cmd_payload_fragment_context;
  wire                interconnect_read_aggregated_rsp_valid;
  wire                interconnect_read_aggregated_rsp_ready;
  wire                interconnect_read_aggregated_rsp_payload_last;
  wire       [0:0]    interconnect_read_aggregated_rsp_payload_fragment_source;
  wire       [0:0]    interconnect_read_aggregated_rsp_payload_fragment_opcode;
  wire       [127:0]  interconnect_read_aggregated_rsp_payload_fragment_data;
  wire       [21:0]   interconnect_read_aggregated_rsp_payload_fragment_context;
  wire                interconnect_write_aggregated_cmd_valid;
  reg                 interconnect_write_aggregated_cmd_ready;
  wire                interconnect_write_aggregated_cmd_payload_last;
  wire       [0:0]    interconnect_write_aggregated_cmd_payload_fragment_source;
  wire       [0:0]    interconnect_write_aggregated_cmd_payload_fragment_opcode;
  wire       [31:0]   interconnect_write_aggregated_cmd_payload_fragment_address;
  wire       [11:0]   interconnect_write_aggregated_cmd_payload_fragment_length;
  wire       [127:0]  interconnect_write_aggregated_cmd_payload_fragment_data;
  wire       [15:0]   interconnect_write_aggregated_cmd_payload_fragment_mask;
  wire       [13:0]   interconnect_write_aggregated_cmd_payload_fragment_context;
  wire                interconnect_write_aggregated_rsp_valid;
  wire                interconnect_write_aggregated_rsp_ready;
  wire                interconnect_write_aggregated_rsp_payload_last;
  wire       [0:0]    interconnect_write_aggregated_rsp_payload_fragment_source;
  wire       [0:0]    interconnect_write_aggregated_rsp_payload_fragment_opcode;
  wire       [13:0]   interconnect_write_aggregated_rsp_payload_fragment_context;
  wire                readLogic_resized_cmd_valid;
  wire                readLogic_resized_cmd_ready;
  wire                readLogic_resized_cmd_payload_last;
  wire       [0:0]    readLogic_resized_cmd_payload_fragment_source;
  wire       [0:0]    readLogic_resized_cmd_payload_fragment_opcode;
  wire       [31:0]   readLogic_resized_cmd_payload_fragment_address;
  wire       [11:0]   readLogic_resized_cmd_payload_fragment_length;
  wire       [21:0]   readLogic_resized_cmd_payload_fragment_context;
  wire                readLogic_resized_rsp_valid;
  wire                readLogic_resized_rsp_ready;
  wire                readLogic_resized_rsp_payload_last;
  wire       [0:0]    readLogic_resized_rsp_payload_fragment_source;
  wire       [0:0]    readLogic_resized_rsp_payload_fragment_opcode;
  wire       [127:0]  readLogic_resized_rsp_payload_fragment_data;
  wire       [21:0]   readLogic_resized_rsp_payload_fragment_context;
  wire                interconnect_read_aggregated_cmd_halfPipe_valid;
  wire                interconnect_read_aggregated_cmd_halfPipe_ready;
  wire                interconnect_read_aggregated_cmd_halfPipe_payload_last;
  wire       [0:0]    interconnect_read_aggregated_cmd_halfPipe_payload_fragment_source;
  wire       [0:0]    interconnect_read_aggregated_cmd_halfPipe_payload_fragment_opcode;
  wire       [31:0]   interconnect_read_aggregated_cmd_halfPipe_payload_fragment_address;
  wire       [11:0]   interconnect_read_aggregated_cmd_halfPipe_payload_fragment_length;
  wire       [21:0]   interconnect_read_aggregated_cmd_halfPipe_payload_fragment_context;
  reg                 interconnect_read_aggregated_cmd_rValid;
  wire                interconnect_read_aggregated_cmd_halfPipe_fire;
  reg                 interconnect_read_aggregated_cmd_rData_last;
  reg        [0:0]    interconnect_read_aggregated_cmd_rData_fragment_source;
  reg        [0:0]    interconnect_read_aggregated_cmd_rData_fragment_opcode;
  reg        [31:0]   interconnect_read_aggregated_cmd_rData_fragment_address;
  reg        [11:0]   interconnect_read_aggregated_cmd_rData_fragment_length;
  reg        [21:0]   interconnect_read_aggregated_cmd_rData_fragment_context;
  wire                readLogic_resized_rsp_combStage_valid;
  wire                readLogic_resized_rsp_combStage_ready;
  wire                readLogic_resized_rsp_combStage_payload_last;
  wire       [0:0]    readLogic_resized_rsp_combStage_payload_fragment_source;
  wire       [0:0]    readLogic_resized_rsp_combStage_payload_fragment_opcode;
  wire       [127:0]  readLogic_resized_rsp_combStage_payload_fragment_data;
  wire       [21:0]   readLogic_resized_rsp_combStage_payload_fragment_context;
  wire                readLogic_adapter_ar_valid;
  wire                readLogic_adapter_ar_ready;
  wire       [31:0]   readLogic_adapter_ar_payload_addr;
  wire       [3:0]    readLogic_adapter_ar_payload_region;
  wire       [7:0]    readLogic_adapter_ar_payload_len;
  wire       [2:0]    readLogic_adapter_ar_payload_size;
  wire       [1:0]    readLogic_adapter_ar_payload_burst;
  wire       [0:0]    readLogic_adapter_ar_payload_lock;
  wire       [3:0]    readLogic_adapter_ar_payload_cache;
  wire       [3:0]    readLogic_adapter_ar_payload_qos;
  wire       [2:0]    readLogic_adapter_ar_payload_prot;
  wire                readLogic_adapter_r_valid;
  wire                readLogic_adapter_r_ready;
  wire       [127:0]  readLogic_adapter_r_payload_data;
  wire       [1:0]    readLogic_adapter_r_payload_resp;
  wire                readLogic_adapter_r_payload_last;
  wire       [3:0]    _zz_readLogic_adapter_ar_payload_region;
  wire                readLogic_adapter_ar_halfPipe_valid;
  wire                readLogic_adapter_ar_halfPipe_ready;
  wire       [31:0]   readLogic_adapter_ar_halfPipe_payload_addr;
  wire       [3:0]    readLogic_adapter_ar_halfPipe_payload_region;
  wire       [7:0]    readLogic_adapter_ar_halfPipe_payload_len;
  wire       [2:0]    readLogic_adapter_ar_halfPipe_payload_size;
  wire       [1:0]    readLogic_adapter_ar_halfPipe_payload_burst;
  wire       [0:0]    readLogic_adapter_ar_halfPipe_payload_lock;
  wire       [3:0]    readLogic_adapter_ar_halfPipe_payload_cache;
  wire       [3:0]    readLogic_adapter_ar_halfPipe_payload_qos;
  wire       [2:0]    readLogic_adapter_ar_halfPipe_payload_prot;
  reg                 readLogic_adapter_ar_rValid;
  wire                readLogic_adapter_ar_halfPipe_fire;
  reg        [31:0]   readLogic_adapter_ar_rData_addr;
  reg        [3:0]    readLogic_adapter_ar_rData_region;
  reg        [7:0]    readLogic_adapter_ar_rData_len;
  reg        [2:0]    readLogic_adapter_ar_rData_size;
  reg        [1:0]    readLogic_adapter_ar_rData_burst;
  reg        [0:0]    readLogic_adapter_ar_rData_lock;
  reg        [3:0]    readLogic_adapter_ar_rData_cache;
  reg        [3:0]    readLogic_adapter_ar_rData_qos;
  reg        [2:0]    readLogic_adapter_ar_rData_prot;
  wire                read_r_s2mPipe_valid;
  reg                 read_r_s2mPipe_ready;
  wire       [127:0]  read_r_s2mPipe_payload_data;
  wire       [1:0]    read_r_s2mPipe_payload_resp;
  wire                read_r_s2mPipe_payload_last;
  reg                 read_r_rValid;
  reg        [127:0]  read_r_rData_data;
  reg        [1:0]    read_r_rData_resp;
  reg                 read_r_rData_last;
  wire                read_r_s2mPipe_beforeQueue_valid;
  wire                read_r_s2mPipe_beforeQueue_ready;
  wire       [127:0]  read_r_s2mPipe_beforeQueue_payload_data;
  wire       [1:0]    read_r_s2mPipe_beforeQueue_payload_resp;
  wire                read_r_s2mPipe_beforeQueue_payload_last;
  reg                 read_r_s2mPipe_rValid;
  reg        [127:0]  read_r_s2mPipe_rData_data;
  reg        [1:0]    read_r_s2mPipe_rData_resp;
  reg                 read_r_s2mPipe_rData_last;
  wire                when_Stream_l342_1;
  wire                read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_valid;
  reg                 read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_ready;
  wire       [127:0]  read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_payload_data;
  wire       [1:0]    read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_payload_resp;
  wire                read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_payload_last;
  reg                 read_r_s2mPipe_beforeQueue_fifo_io_pop_rValid;
  reg        [127:0]  read_r_s2mPipe_beforeQueue_fifo_io_pop_rData_data;
  reg        [1:0]    read_r_s2mPipe_beforeQueue_fifo_io_pop_rData_resp;
  reg                 read_r_s2mPipe_beforeQueue_fifo_io_pop_rData_last;
  wire                read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_valid;
  wire                read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_ready;
  wire       [127:0]  read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_payload_data;
  wire       [1:0]    read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_payload_resp;
  wire                read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_payload_last;
  reg                 read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rValid;
  reg        [127:0]  read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rData_data;
  reg        [1:0]    read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rData_resp;
  reg                 read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rData_last;
  wire                when_Stream_l342_2;
  wire                writeLogic_resized_cmd_valid;
  wire                writeLogic_resized_cmd_ready;
  wire                writeLogic_resized_cmd_payload_last;
  wire       [0:0]    writeLogic_resized_cmd_payload_fragment_source;
  wire       [0:0]    writeLogic_resized_cmd_payload_fragment_opcode;
  wire       [31:0]   writeLogic_resized_cmd_payload_fragment_address;
  wire       [11:0]   writeLogic_resized_cmd_payload_fragment_length;
  wire       [127:0]  writeLogic_resized_cmd_payload_fragment_data;
  wire       [15:0]   writeLogic_resized_cmd_payload_fragment_mask;
  wire       [13:0]   writeLogic_resized_cmd_payload_fragment_context;
  wire                writeLogic_resized_rsp_valid;
  wire                writeLogic_resized_rsp_ready;
  wire                writeLogic_resized_rsp_payload_last;
  wire       [0:0]    writeLogic_resized_rsp_payload_fragment_source;
  wire       [0:0]    writeLogic_resized_rsp_payload_fragment_opcode;
  wire       [13:0]   writeLogic_resized_rsp_payload_fragment_context;
  wire                interconnect_write_aggregated_cmd_m2sPipe_valid;
  wire                interconnect_write_aggregated_cmd_m2sPipe_ready;
  wire                interconnect_write_aggregated_cmd_m2sPipe_payload_last;
  wire       [0:0]    interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_source;
  wire       [0:0]    interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_opcode;
  wire       [31:0]   interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_address;
  wire       [11:0]   interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_length;
  wire       [127:0]  interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_data;
  wire       [15:0]   interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_mask;
  wire       [13:0]   interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_context;
  reg                 interconnect_write_aggregated_cmd_rValid;
  reg                 interconnect_write_aggregated_cmd_rData_last;
  reg        [0:0]    interconnect_write_aggregated_cmd_rData_fragment_source;
  reg        [0:0]    interconnect_write_aggregated_cmd_rData_fragment_opcode;
  reg        [31:0]   interconnect_write_aggregated_cmd_rData_fragment_address;
  reg        [11:0]   interconnect_write_aggregated_cmd_rData_fragment_length;
  reg        [127:0]  interconnect_write_aggregated_cmd_rData_fragment_data;
  reg        [15:0]   interconnect_write_aggregated_cmd_rData_fragment_mask;
  reg        [13:0]   interconnect_write_aggregated_cmd_rData_fragment_context;
  wire                when_Stream_l342_3;
  wire                writeLogic_resized_rsp_combStage_valid;
  wire                writeLogic_resized_rsp_combStage_ready;
  wire                writeLogic_resized_rsp_combStage_payload_last;
  wire       [0:0]    writeLogic_resized_rsp_combStage_payload_fragment_source;
  wire       [0:0]    writeLogic_resized_rsp_combStage_payload_fragment_opcode;
  wire       [13:0]   writeLogic_resized_rsp_combStage_payload_fragment_context;
  wire                writeLogic_adapter_aw_valid;
  wire                writeLogic_adapter_aw_ready;
  wire       [31:0]   writeLogic_adapter_aw_payload_addr;
  wire       [3:0]    writeLogic_adapter_aw_payload_region;
  wire       [7:0]    writeLogic_adapter_aw_payload_len;
  wire       [2:0]    writeLogic_adapter_aw_payload_size;
  wire       [1:0]    writeLogic_adapter_aw_payload_burst;
  wire       [0:0]    writeLogic_adapter_aw_payload_lock;
  wire       [3:0]    writeLogic_adapter_aw_payload_cache;
  wire       [3:0]    writeLogic_adapter_aw_payload_qos;
  wire       [2:0]    writeLogic_adapter_aw_payload_prot;
  wire                writeLogic_adapter_w_valid;
  wire                writeLogic_adapter_w_ready;
  wire       [127:0]  writeLogic_adapter_w_payload_data;
  wire       [15:0]   writeLogic_adapter_w_payload_strb;
  wire                writeLogic_adapter_w_payload_last;
  wire                writeLogic_adapter_b_valid;
  wire                writeLogic_adapter_b_ready;
  wire       [1:0]    writeLogic_adapter_b_payload_resp;
  wire       [3:0]    _zz_writeLogic_adapter_aw_payload_region;
  wire                writeLogic_adapter_aw_halfPipe_valid;
  wire                writeLogic_adapter_aw_halfPipe_ready;
  wire       [31:0]   writeLogic_adapter_aw_halfPipe_payload_addr;
  wire       [3:0]    writeLogic_adapter_aw_halfPipe_payload_region;
  wire       [7:0]    writeLogic_adapter_aw_halfPipe_payload_len;
  wire       [2:0]    writeLogic_adapter_aw_halfPipe_payload_size;
  wire       [1:0]    writeLogic_adapter_aw_halfPipe_payload_burst;
  wire       [0:0]    writeLogic_adapter_aw_halfPipe_payload_lock;
  wire       [3:0]    writeLogic_adapter_aw_halfPipe_payload_cache;
  wire       [3:0]    writeLogic_adapter_aw_halfPipe_payload_qos;
  wire       [2:0]    writeLogic_adapter_aw_halfPipe_payload_prot;
  reg                 writeLogic_adapter_aw_rValid;
  wire                writeLogic_adapter_aw_halfPipe_fire;
  reg        [31:0]   writeLogic_adapter_aw_rData_addr;
  reg        [3:0]    writeLogic_adapter_aw_rData_region;
  reg        [7:0]    writeLogic_adapter_aw_rData_len;
  reg        [2:0]    writeLogic_adapter_aw_rData_size;
  reg        [1:0]    writeLogic_adapter_aw_rData_burst;
  reg        [0:0]    writeLogic_adapter_aw_rData_lock;
  reg        [3:0]    writeLogic_adapter_aw_rData_cache;
  reg        [3:0]    writeLogic_adapter_aw_rData_qos;
  reg        [2:0]    writeLogic_adapter_aw_rData_prot;
  wire                writeLogic_adapter_w_s2mPipe_valid;
  reg                 writeLogic_adapter_w_s2mPipe_ready;
  wire       [127:0]  writeLogic_adapter_w_s2mPipe_payload_data;
  wire       [15:0]   writeLogic_adapter_w_s2mPipe_payload_strb;
  wire                writeLogic_adapter_w_s2mPipe_payload_last;
  reg                 writeLogic_adapter_w_rValid;
  reg        [127:0]  writeLogic_adapter_w_rData_data;
  reg        [15:0]   writeLogic_adapter_w_rData_strb;
  reg                 writeLogic_adapter_w_rData_last;
  wire                writeLogic_adapter_w_s2mPipe_m2sPipe_valid;
  wire                writeLogic_adapter_w_s2mPipe_m2sPipe_ready;
  wire       [127:0]  writeLogic_adapter_w_s2mPipe_m2sPipe_payload_data;
  wire       [15:0]   writeLogic_adapter_w_s2mPipe_m2sPipe_payload_strb;
  wire                writeLogic_adapter_w_s2mPipe_m2sPipe_payload_last;
  reg                 writeLogic_adapter_w_s2mPipe_rValid;
  reg        [127:0]  writeLogic_adapter_w_s2mPipe_rData_data;
  reg        [15:0]   writeLogic_adapter_w_s2mPipe_rData_strb;
  reg                 writeLogic_adapter_w_s2mPipe_rData_last;
  wire                when_Stream_l342_4;
  wire                write_b_halfPipe_valid;
  wire                write_b_halfPipe_ready;
  wire       [1:0]    write_b_halfPipe_payload_resp;
  reg                 write_b_rValid;
  wire                write_b_halfPipe_fire;
  reg        [1:0]    write_b_rData_resp;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_valid;
  reg                 inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_ready;
  wire       [63:0]   inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_data;
  wire       [7:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_mask;
  wire       [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_sink;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_last;
  reg                 inputsAdapter_0_crossclock_fifo_io_pop_rValid;
  reg        [63:0]   inputsAdapter_0_crossclock_fifo_io_pop_rData_data;
  reg        [7:0]    inputsAdapter_0_crossclock_fifo_io_pop_rData_mask;
  reg        [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_rData_sink;
  reg                 inputsAdapter_0_crossclock_fifo_io_pop_rData_last;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_valid;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_ready;
  wire       [63:0]   inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_data;
  wire       [7:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_mask;
  wire       [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_sink;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_last;
  reg                 inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid;
  reg        [63:0]   inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_data;
  reg        [7:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_mask;
  reg        [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_sink;
  reg                 inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_last;
  wire                when_Stream_l342_5;
  wire                inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_valid;
  reg                 inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_ready;
  wire       [63:0]   inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_payload_data;
  wire       [7:0]    inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_payload_mask;
  wire       [3:0]    inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_payload_sink;
  wire                inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_payload_last;
  reg                 inputsAdapter_1_crossclock_fifo_io_pop_rValid;
  reg        [63:0]   inputsAdapter_1_crossclock_fifo_io_pop_rData_data;
  reg        [7:0]    inputsAdapter_1_crossclock_fifo_io_pop_rData_mask;
  reg        [3:0]    inputsAdapter_1_crossclock_fifo_io_pop_rData_sink;
  reg                 inputsAdapter_1_crossclock_fifo_io_pop_rData_last;
  wire                inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_valid;
  wire                inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_ready;
  wire       [63:0]   inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_data;
  wire       [7:0]    inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_mask;
  wire       [3:0]    inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_sink;
  wire                inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_last;
  reg                 inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rValid;
  reg        [63:0]   inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rData_data;
  reg        [7:0]    inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rData_mask;
  reg        [3:0]    inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rData_sink;
  reg                 inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rData_last;
  wire                when_Stream_l342_6;
  wire                core_io_outputs_0_s2mPipe_valid;
  reg                 core_io_outputs_0_s2mPipe_ready;
  wire       [63:0]   core_io_outputs_0_s2mPipe_payload_data;
  wire       [7:0]    core_io_outputs_0_s2mPipe_payload_mask;
  wire       [3:0]    core_io_outputs_0_s2mPipe_payload_sink;
  wire                core_io_outputs_0_s2mPipe_payload_last;
  reg                 core_io_outputs_0_rValid;
  reg        [63:0]   core_io_outputs_0_rData_data;
  reg        [7:0]    core_io_outputs_0_rData_mask;
  reg        [3:0]    core_io_outputs_0_rData_sink;
  reg                 core_io_outputs_0_rData_last;
  wire                core_io_outputs_0_s2mPipe_ptr_valid;
  wire                core_io_outputs_0_s2mPipe_ptr_ready;
  wire       [63:0]   core_io_outputs_0_s2mPipe_ptr_payload_data;
  wire       [7:0]    core_io_outputs_0_s2mPipe_ptr_payload_mask;
  wire       [3:0]    core_io_outputs_0_s2mPipe_ptr_payload_sink;
  wire                core_io_outputs_0_s2mPipe_ptr_payload_last;
  reg                 core_io_outputs_0_s2mPipe_rValid;
  reg        [63:0]   core_io_outputs_0_s2mPipe_rData_data;
  reg        [7:0]    core_io_outputs_0_s2mPipe_rData_mask;
  reg        [3:0]    core_io_outputs_0_s2mPipe_rData_sink;
  reg                 core_io_outputs_0_s2mPipe_rData_last;
  wire                when_Stream_l342_7;
  wire                core_io_outputs_1_s2mPipe_valid;
  reg                 core_io_outputs_1_s2mPipe_ready;
  wire       [63:0]   core_io_outputs_1_s2mPipe_payload_data;
  wire       [7:0]    core_io_outputs_1_s2mPipe_payload_mask;
  wire       [3:0]    core_io_outputs_1_s2mPipe_payload_sink;
  wire                core_io_outputs_1_s2mPipe_payload_last;
  reg                 core_io_outputs_1_rValid;
  reg        [63:0]   core_io_outputs_1_rData_data;
  reg        [7:0]    core_io_outputs_1_rData_mask;
  reg        [3:0]    core_io_outputs_1_rData_sink;
  reg                 core_io_outputs_1_rData_last;
  wire                core_io_outputs_1_s2mPipe_ptr_valid;
  wire                core_io_outputs_1_s2mPipe_ptr_ready;
  wire       [63:0]   core_io_outputs_1_s2mPipe_ptr_payload_data;
  wire       [7:0]    core_io_outputs_1_s2mPipe_ptr_payload_mask;
  wire       [3:0]    core_io_outputs_1_s2mPipe_ptr_payload_sink;
  wire                core_io_outputs_1_s2mPipe_ptr_payload_last;
  reg                 core_io_outputs_1_s2mPipe_rValid;
  reg        [63:0]   core_io_outputs_1_s2mPipe_rData_data;
  reg        [7:0]    core_io_outputs_1_s2mPipe_rData_mask;
  reg        [3:0]    core_io_outputs_1_s2mPipe_rData_sink;
  reg                 core_io_outputs_1_s2mPipe_rData_last;
  wire                when_Stream_l342_8;
  wire                interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
  wire       [0:0]    interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [31:0]   interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [11:0]   interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire       [21:0]   interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  wire                interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  wire       [0:0]    interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [127:0]  interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  wire       [21:0]   interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  wire                interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
  wire       [0:0]    interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [31:0]   interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [11:0]   interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire       [127:0]  interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  wire       [15:0]   interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  wire       [13:0]   interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  wire                interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source;
  wire       [0:0]    interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [13:0]   interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;

  EfxDMA_Core core (
    .io_read_cmd_valid                        (core_io_read_cmd_valid                                                                                   ), //o
    .io_read_cmd_ready                        (interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready                            ), //i
    .io_read_cmd_payload_last                 (core_io_read_cmd_payload_last                                                                            ), //o
    .io_read_cmd_payload_fragment_source      (core_io_read_cmd_payload_fragment_source                                                                 ), //o
    .io_read_cmd_payload_fragment_opcode      (core_io_read_cmd_payload_fragment_opcode                                                                 ), //o
    .io_read_cmd_payload_fragment_address     (core_io_read_cmd_payload_fragment_address[31:0]                                                          ), //o
    .io_read_cmd_payload_fragment_length      (core_io_read_cmd_payload_fragment_length[11:0]                                                           ), //o
    .io_read_cmd_payload_fragment_context     (core_io_read_cmd_payload_fragment_context[21:0]                                                          ), //o
    .io_read_rsp_valid                        (interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid                            ), //i
    .io_read_rsp_ready                        (core_io_read_rsp_ready                                                                                   ), //o
    .io_read_rsp_payload_last                 (interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last                     ), //i
    .io_read_rsp_payload_fragment_source      (interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source          ), //i
    .io_read_rsp_payload_fragment_opcode      (interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode          ), //i
    .io_read_rsp_payload_fragment_data        (interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data[127:0]     ), //i
    .io_read_rsp_payload_fragment_context     (interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context[21:0]   ), //i
    .io_write_cmd_valid                       (core_io_write_cmd_valid                                                                                  ), //o
    .io_write_cmd_ready                       (core_io_write_cmd_ready                                                                                  ), //i
    .io_write_cmd_payload_last                (core_io_write_cmd_payload_last                                                                           ), //o
    .io_write_cmd_payload_fragment_source     (core_io_write_cmd_payload_fragment_source                                                                ), //o
    .io_write_cmd_payload_fragment_opcode     (core_io_write_cmd_payload_fragment_opcode                                                                ), //o
    .io_write_cmd_payload_fragment_address    (core_io_write_cmd_payload_fragment_address[31:0]                                                         ), //o
    .io_write_cmd_payload_fragment_length     (core_io_write_cmd_payload_fragment_length[11:0]                                                          ), //o
    .io_write_cmd_payload_fragment_data       (core_io_write_cmd_payload_fragment_data[127:0]                                                           ), //o
    .io_write_cmd_payload_fragment_mask       (core_io_write_cmd_payload_fragment_mask[15:0]                                                            ), //o
    .io_write_cmd_payload_fragment_context    (core_io_write_cmd_payload_fragment_context[13:0]                                                         ), //o
    .io_write_rsp_valid                       (interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid                           ), //i
    .io_write_rsp_ready                       (core_io_write_rsp_ready                                                                                  ), //o
    .io_write_rsp_payload_last                (interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last                    ), //i
    .io_write_rsp_payload_fragment_source     (interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source         ), //i
    .io_write_rsp_payload_fragment_opcode     (interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode         ), //i
    .io_write_rsp_payload_fragment_context    (interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context[13:0]  ), //i
    .io_outputs_0_valid                       (core_io_outputs_0_valid                                                                                  ), //o
    .io_outputs_0_ready                       (core_io_outputs_0_ready                                                                                  ), //i
    .io_outputs_0_payload_data                (core_io_outputs_0_payload_data[63:0]                                                                     ), //o
    .io_outputs_0_payload_mask                (core_io_outputs_0_payload_mask[7:0]                                                                      ), //o
    .io_outputs_0_payload_sink                (core_io_outputs_0_payload_sink[3:0]                                                                      ), //o
    .io_outputs_0_payload_last                (core_io_outputs_0_payload_last                                                                           ), //o
    .io_outputs_1_valid                       (core_io_outputs_1_valid                                                                                  ), //o
    .io_outputs_1_ready                       (core_io_outputs_1_ready                                                                                  ), //i
    .io_outputs_1_payload_data                (core_io_outputs_1_payload_data[63:0]                                                                     ), //o
    .io_outputs_1_payload_mask                (core_io_outputs_1_payload_mask[7:0]                                                                      ), //o
    .io_outputs_1_payload_sink                (core_io_outputs_1_payload_sink[3:0]                                                                      ), //o
    .io_outputs_1_payload_last                (core_io_outputs_1_payload_last                                                                           ), //o
    .io_inputs_0_valid                        (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_valid                                             ), //i
    .io_inputs_0_ready                        (core_io_inputs_0_ready                                                                                   ), //o
    .io_inputs_0_payload_data                 (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_data[63:0]                                ), //i
    .io_inputs_0_payload_mask                 (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_mask[7:0]                                 ), //i
    .io_inputs_0_payload_sink                 (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_sink[3:0]                                 ), //i
    .io_inputs_0_payload_last                 (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_last                                      ), //i
    .io_inputs_1_valid                        (inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_valid                                             ), //i
    .io_inputs_1_ready                        (core_io_inputs_1_ready                                                                                   ), //o
    .io_inputs_1_payload_data                 (inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_data[63:0]                                ), //i
    .io_inputs_1_payload_mask                 (inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_mask[7:0]                                 ), //i
    .io_inputs_1_payload_sink                 (inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_sink[3:0]                                 ), //i
    .io_inputs_1_payload_last                 (inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_last                                      ), //i
    .io_interrupts                            (core_io_interrupts[3:0]                                                                                  ), //o
    .io_ctrl_PADDR                            (withCtrlCc_apbCc_io_output_PADDR[13:0]                                                                   ), //i
    .io_ctrl_PSEL                             (withCtrlCc_apbCc_io_output_PSEL                                                                          ), //i
    .io_ctrl_PENABLE                          (withCtrlCc_apbCc_io_output_PENABLE                                                                       ), //i
    .io_ctrl_PREADY                           (core_io_ctrl_PREADY                                                                                      ), //o
    .io_ctrl_PWRITE                           (withCtrlCc_apbCc_io_output_PWRITE                                                                        ), //i
    .io_ctrl_PWDATA                           (withCtrlCc_apbCc_io_output_PWDATA[31:0]                                                                  ), //i
    .io_ctrl_PRDATA                           (core_io_ctrl_PRDATA[31:0]                                                                                ), //o
    .io_ctrl_PSLVERROR                        (core_io_ctrl_PSLVERROR                                                                                   ), //o
    .clk                                      (clk                                                                                                      ), //i
    .reset                                    (reset                                                                                                    )  //i
  );
  EfxDMA_Apb3CC withCtrlCc_apbCc (
    .io_input_PADDR         (ctrl_PADDR[13:0]                         ), //i
    .io_input_PSEL          (ctrl_PSEL                                ), //i
    .io_input_PENABLE       (ctrl_PENABLE                             ), //i
    .io_input_PREADY        (withCtrlCc_apbCc_io_input_PREADY         ), //o
    .io_input_PWRITE        (ctrl_PWRITE                              ), //i
    .io_input_PWDATA        (ctrl_PWDATA[31:0]                        ), //i
    .io_input_PRDATA        (withCtrlCc_apbCc_io_input_PRDATA[31:0]   ), //o
    .io_input_PSLVERROR     (withCtrlCc_apbCc_io_input_PSLVERROR      ), //o
    .io_output_PADDR        (withCtrlCc_apbCc_io_output_PADDR[13:0]   ), //o
    .io_output_PSEL         (withCtrlCc_apbCc_io_output_PSEL          ), //o
    .io_output_PENABLE      (withCtrlCc_apbCc_io_output_PENABLE       ), //o
    .io_output_PREADY       (core_io_ctrl_PREADY                      ), //i
    .io_output_PWRITE       (withCtrlCc_apbCc_io_output_PWRITE        ), //o
    .io_output_PWDATA       (withCtrlCc_apbCc_io_output_PWDATA[31:0]  ), //o
    .io_output_PRDATA       (core_io_ctrl_PRDATA[31:0]                ), //i
    .io_output_PSLVERROR    (core_io_ctrl_PSLVERROR                   ), //i
    .ctrl_clk               (ctrl_clk                                 ), //i
    .ctrl_reset             (ctrl_reset                               ), //i
    .clk                    (clk                                      ), //i
    .reset                  (reset                                    )  //i
  );
  EfxDMA_BufferCC_11 core_io_interrupts_buffercc (
    .io_dataIn     (core_io_interrupts[3:0]                      ), //i
    .io_dataOut    (core_io_interrupts_buffercc_io_dataOut[3:0]  ), //o
    .ctrl_clk      (ctrl_clk                                     ), //i
    .ctrl_reset    (ctrl_reset                                   )  //i
  );
  EfxDMA_BmbSourceRemover readLogic_sourceRemover (
    .io_input_cmd_valid                        (readLogic_resized_cmd_valid                                           ), //i
    .io_input_cmd_ready                        (readLogic_sourceRemover_io_input_cmd_ready                            ), //o
    .io_input_cmd_payload_last                 (readLogic_resized_cmd_payload_last                                    ), //i
    .io_input_cmd_payload_fragment_source      (readLogic_resized_cmd_payload_fragment_source                         ), //i
    .io_input_cmd_payload_fragment_opcode      (readLogic_resized_cmd_payload_fragment_opcode                         ), //i
    .io_input_cmd_payload_fragment_address     (readLogic_resized_cmd_payload_fragment_address[31:0]                  ), //i
    .io_input_cmd_payload_fragment_length      (readLogic_resized_cmd_payload_fragment_length[11:0]                   ), //i
    .io_input_cmd_payload_fragment_context     (readLogic_resized_cmd_payload_fragment_context[21:0]                  ), //i
    .io_input_rsp_valid                        (readLogic_sourceRemover_io_input_rsp_valid                            ), //o
    .io_input_rsp_ready                        (readLogic_resized_rsp_ready                                           ), //i
    .io_input_rsp_payload_last                 (readLogic_sourceRemover_io_input_rsp_payload_last                     ), //o
    .io_input_rsp_payload_fragment_source      (readLogic_sourceRemover_io_input_rsp_payload_fragment_source          ), //o
    .io_input_rsp_payload_fragment_opcode      (readLogic_sourceRemover_io_input_rsp_payload_fragment_opcode          ), //o
    .io_input_rsp_payload_fragment_data        (readLogic_sourceRemover_io_input_rsp_payload_fragment_data[127:0]     ), //o
    .io_input_rsp_payload_fragment_context     (readLogic_sourceRemover_io_input_rsp_payload_fragment_context[21:0]   ), //o
    .io_output_cmd_valid                       (readLogic_sourceRemover_io_output_cmd_valid                           ), //o
    .io_output_cmd_ready                       (readLogic_bridge_io_input_cmd_ready                                   ), //i
    .io_output_cmd_payload_last                (readLogic_sourceRemover_io_output_cmd_payload_last                    ), //o
    .io_output_cmd_payload_fragment_opcode     (readLogic_sourceRemover_io_output_cmd_payload_fragment_opcode         ), //o
    .io_output_cmd_payload_fragment_address    (readLogic_sourceRemover_io_output_cmd_payload_fragment_address[31:0]  ), //o
    .io_output_cmd_payload_fragment_length     (readLogic_sourceRemover_io_output_cmd_payload_fragment_length[11:0]   ), //o
    .io_output_cmd_payload_fragment_context    (readLogic_sourceRemover_io_output_cmd_payload_fragment_context[22:0]  ), //o
    .io_output_rsp_valid                       (readLogic_bridge_io_input_rsp_valid                                   ), //i
    .io_output_rsp_ready                       (readLogic_sourceRemover_io_output_rsp_ready                           ), //o
    .io_output_rsp_payload_last                (readLogic_bridge_io_input_rsp_payload_last                            ), //i
    .io_output_rsp_payload_fragment_opcode     (readLogic_bridge_io_input_rsp_payload_fragment_opcode                 ), //i
    .io_output_rsp_payload_fragment_data       (readLogic_bridge_io_input_rsp_payload_fragment_data[127:0]            ), //i
    .io_output_rsp_payload_fragment_context    (readLogic_bridge_io_input_rsp_payload_fragment_context[22:0]          )  //i
  );
  EfxDMA_BmbToAxi4ReadOnlyBridge readLogic_bridge (
    .io_input_cmd_valid                       (readLogic_sourceRemover_io_output_cmd_valid                           ), //i
    .io_input_cmd_ready                       (readLogic_bridge_io_input_cmd_ready                                   ), //o
    .io_input_cmd_payload_last                (readLogic_sourceRemover_io_output_cmd_payload_last                    ), //i
    .io_input_cmd_payload_fragment_opcode     (readLogic_sourceRemover_io_output_cmd_payload_fragment_opcode         ), //i
    .io_input_cmd_payload_fragment_address    (readLogic_sourceRemover_io_output_cmd_payload_fragment_address[31:0]  ), //i
    .io_input_cmd_payload_fragment_length     (readLogic_sourceRemover_io_output_cmd_payload_fragment_length[11:0]   ), //i
    .io_input_cmd_payload_fragment_context    (readLogic_sourceRemover_io_output_cmd_payload_fragment_context[22:0]  ), //i
    .io_input_rsp_valid                       (readLogic_bridge_io_input_rsp_valid                                   ), //o
    .io_input_rsp_ready                       (readLogic_sourceRemover_io_output_rsp_ready                           ), //i
    .io_input_rsp_payload_last                (readLogic_bridge_io_input_rsp_payload_last                            ), //o
    .io_input_rsp_payload_fragment_opcode     (readLogic_bridge_io_input_rsp_payload_fragment_opcode                 ), //o
    .io_input_rsp_payload_fragment_data       (readLogic_bridge_io_input_rsp_payload_fragment_data[127:0]            ), //o
    .io_input_rsp_payload_fragment_context    (readLogic_bridge_io_input_rsp_payload_fragment_context[22:0]          ), //o
    .io_output_ar_valid                       (readLogic_bridge_io_output_ar_valid                                   ), //o
    .io_output_ar_ready                       (readLogic_adapter_ar_ready                                            ), //i
    .io_output_ar_payload_addr                (readLogic_bridge_io_output_ar_payload_addr[31:0]                      ), //o
    .io_output_ar_payload_len                 (readLogic_bridge_io_output_ar_payload_len[7:0]                        ), //o
    .io_output_ar_payload_size                (readLogic_bridge_io_output_ar_payload_size[2:0]                       ), //o
    .io_output_ar_payload_cache               (readLogic_bridge_io_output_ar_payload_cache[3:0]                      ), //o
    .io_output_ar_payload_prot                (readLogic_bridge_io_output_ar_payload_prot[2:0]                       ), //o
    .io_output_r_valid                        (readLogic_adapter_r_valid                                             ), //i
    .io_output_r_ready                        (readLogic_bridge_io_output_r_ready                                    ), //o
    .io_output_r_payload_data                 (readLogic_adapter_r_payload_data[127:0]                               ), //i
    .io_output_r_payload_resp                 (readLogic_adapter_r_payload_resp[1:0]                                 ), //i
    .io_output_r_payload_last                 (readLogic_adapter_r_payload_last                                      ), //i
    .clk                                      (clk                                                                   ), //i
    .reset                                    (reset                                                                 )  //i
  );
  EfxDMA_StreamFifo_3 read_r_s2mPipe_beforeQueue_fifo (
    .io_push_valid           (read_r_s2mPipe_beforeQueue_valid                            ), //i
    .io_push_ready           (read_r_s2mPipe_beforeQueue_fifo_io_push_ready               ), //o
    .io_push_payload_data    (read_r_s2mPipe_beforeQueue_payload_data[127:0]              ), //i
    .io_push_payload_resp    (read_r_s2mPipe_beforeQueue_payload_resp[1:0]                ), //i
    .io_push_payload_last    (read_r_s2mPipe_beforeQueue_payload_last                     ), //i
    .io_pop_valid            (read_r_s2mPipe_beforeQueue_fifo_io_pop_valid                ), //o
    .io_pop_ready            (read_r_s2mPipe_beforeQueue_fifo_io_pop_ready                ), //i
    .io_pop_payload_data     (read_r_s2mPipe_beforeQueue_fifo_io_pop_payload_data[127:0]  ), //o
    .io_pop_payload_resp     (read_r_s2mPipe_beforeQueue_fifo_io_pop_payload_resp[1:0]    ), //o
    .io_pop_payload_last     (read_r_s2mPipe_beforeQueue_fifo_io_pop_payload_last         ), //o
    .io_flush                (1'b0                                                        ), //i
    .io_occupancy            (read_r_s2mPipe_beforeQueue_fifo_io_occupancy[8:0]           ), //o
    .io_availability         (read_r_s2mPipe_beforeQueue_fifo_io_availability[8:0]        ), //o
    .clk                     (clk                                                         ), //i
    .reset                   (reset                                                       )  //i
  );
  EfxDMA_BmbSourceRemover_1 writeLogic_sourceRemover (
    .io_input_cmd_valid                        (writeLogic_resized_cmd_valid                                           ), //i
    .io_input_cmd_ready                        (writeLogic_sourceRemover_io_input_cmd_ready                            ), //o
    .io_input_cmd_payload_last                 (writeLogic_resized_cmd_payload_last                                    ), //i
    .io_input_cmd_payload_fragment_source      (writeLogic_resized_cmd_payload_fragment_source                         ), //i
    .io_input_cmd_payload_fragment_opcode      (writeLogic_resized_cmd_payload_fragment_opcode                         ), //i
    .io_input_cmd_payload_fragment_address     (writeLogic_resized_cmd_payload_fragment_address[31:0]                  ), //i
    .io_input_cmd_payload_fragment_length      (writeLogic_resized_cmd_payload_fragment_length[11:0]                   ), //i
    .io_input_cmd_payload_fragment_data        (writeLogic_resized_cmd_payload_fragment_data[127:0]                    ), //i
    .io_input_cmd_payload_fragment_mask        (writeLogic_resized_cmd_payload_fragment_mask[15:0]                     ), //i
    .io_input_cmd_payload_fragment_context     (writeLogic_resized_cmd_payload_fragment_context[13:0]                  ), //i
    .io_input_rsp_valid                        (writeLogic_sourceRemover_io_input_rsp_valid                            ), //o
    .io_input_rsp_ready                        (writeLogic_resized_rsp_ready                                           ), //i
    .io_input_rsp_payload_last                 (writeLogic_sourceRemover_io_input_rsp_payload_last                     ), //o
    .io_input_rsp_payload_fragment_source      (writeLogic_sourceRemover_io_input_rsp_payload_fragment_source          ), //o
    .io_input_rsp_payload_fragment_opcode      (writeLogic_sourceRemover_io_input_rsp_payload_fragment_opcode          ), //o
    .io_input_rsp_payload_fragment_context     (writeLogic_sourceRemover_io_input_rsp_payload_fragment_context[13:0]   ), //o
    .io_output_cmd_valid                       (writeLogic_sourceRemover_io_output_cmd_valid                           ), //o
    .io_output_cmd_ready                       (writeLogic_retainer_io_input_cmd_ready                                 ), //i
    .io_output_cmd_payload_last                (writeLogic_sourceRemover_io_output_cmd_payload_last                    ), //o
    .io_output_cmd_payload_fragment_opcode     (writeLogic_sourceRemover_io_output_cmd_payload_fragment_opcode         ), //o
    .io_output_cmd_payload_fragment_address    (writeLogic_sourceRemover_io_output_cmd_payload_fragment_address[31:0]  ), //o
    .io_output_cmd_payload_fragment_length     (writeLogic_sourceRemover_io_output_cmd_payload_fragment_length[11:0]   ), //o
    .io_output_cmd_payload_fragment_data       (writeLogic_sourceRemover_io_output_cmd_payload_fragment_data[127:0]    ), //o
    .io_output_cmd_payload_fragment_mask       (writeLogic_sourceRemover_io_output_cmd_payload_fragment_mask[15:0]     ), //o
    .io_output_cmd_payload_fragment_context    (writeLogic_sourceRemover_io_output_cmd_payload_fragment_context[14:0]  ), //o
    .io_output_rsp_valid                       (writeLogic_retainer_io_input_rsp_valid                                 ), //i
    .io_output_rsp_ready                       (writeLogic_sourceRemover_io_output_rsp_ready                           ), //o
    .io_output_rsp_payload_last                (writeLogic_retainer_io_input_rsp_payload_last                          ), //i
    .io_output_rsp_payload_fragment_opcode     (writeLogic_retainer_io_input_rsp_payload_fragment_opcode               ), //i
    .io_output_rsp_payload_fragment_context    (writeLogic_retainer_io_input_rsp_payload_fragment_context[14:0]        )  //i
  );
  EfxDMA_BmbWriteRetainer writeLogic_retainer (
    .io_input_cmd_valid                        (writeLogic_sourceRemover_io_output_cmd_valid                           ), //i
    .io_input_cmd_ready                        (writeLogic_retainer_io_input_cmd_ready                                 ), //o
    .io_input_cmd_payload_last                 (writeLogic_sourceRemover_io_output_cmd_payload_last                    ), //i
    .io_input_cmd_payload_fragment_opcode      (writeLogic_sourceRemover_io_output_cmd_payload_fragment_opcode         ), //i
    .io_input_cmd_payload_fragment_address     (writeLogic_sourceRemover_io_output_cmd_payload_fragment_address[31:0]  ), //i
    .io_input_cmd_payload_fragment_length      (writeLogic_sourceRemover_io_output_cmd_payload_fragment_length[11:0]   ), //i
    .io_input_cmd_payload_fragment_data        (writeLogic_sourceRemover_io_output_cmd_payload_fragment_data[127:0]    ), //i
    .io_input_cmd_payload_fragment_mask        (writeLogic_sourceRemover_io_output_cmd_payload_fragment_mask[15:0]     ), //i
    .io_input_cmd_payload_fragment_context     (writeLogic_sourceRemover_io_output_cmd_payload_fragment_context[14:0]  ), //i
    .io_input_rsp_valid                        (writeLogic_retainer_io_input_rsp_valid                                 ), //o
    .io_input_rsp_ready                        (writeLogic_sourceRemover_io_output_rsp_ready                           ), //i
    .io_input_rsp_payload_last                 (writeLogic_retainer_io_input_rsp_payload_last                          ), //o
    .io_input_rsp_payload_fragment_opcode      (writeLogic_retainer_io_input_rsp_payload_fragment_opcode               ), //o
    .io_input_rsp_payload_fragment_context     (writeLogic_retainer_io_input_rsp_payload_fragment_context[14:0]        ), //o
    .io_output_cmd_valid                       (writeLogic_retainer_io_output_cmd_valid                                ), //o
    .io_output_cmd_ready                       (writeLogic_bridge_io_input_cmd_ready                                   ), //i
    .io_output_cmd_payload_last                (writeLogic_retainer_io_output_cmd_payload_last                         ), //o
    .io_output_cmd_payload_fragment_opcode     (writeLogic_retainer_io_output_cmd_payload_fragment_opcode              ), //o
    .io_output_cmd_payload_fragment_address    (writeLogic_retainer_io_output_cmd_payload_fragment_address[31:0]       ), //o
    .io_output_cmd_payload_fragment_length     (writeLogic_retainer_io_output_cmd_payload_fragment_length[11:0]        ), //o
    .io_output_cmd_payload_fragment_data       (writeLogic_retainer_io_output_cmd_payload_fragment_data[127:0]         ), //o
    .io_output_cmd_payload_fragment_mask       (writeLogic_retainer_io_output_cmd_payload_fragment_mask[15:0]          ), //o
    .io_output_cmd_payload_fragment_context    (writeLogic_retainer_io_output_cmd_payload_fragment_context[14:0]       ), //o
    .io_output_rsp_valid                       (writeLogic_bridge_io_input_rsp_valid                                   ), //i
    .io_output_rsp_ready                       (writeLogic_retainer_io_output_rsp_ready                                ), //o
    .io_output_rsp_payload_last                (writeLogic_bridge_io_input_rsp_payload_last                            ), //i
    .io_output_rsp_payload_fragment_opcode     (writeLogic_bridge_io_input_rsp_payload_fragment_opcode                 ), //i
    .io_output_rsp_payload_fragment_context    (writeLogic_bridge_io_input_rsp_payload_fragment_context[14:0]          ), //i
    .clk                                       (clk                                                                    ), //i
    .reset                                     (reset                                                                  )  //i
  );
  EfxDMA_BmbToAxi4WriteOnlyBridge writeLogic_bridge (
    .io_input_cmd_valid                       (writeLogic_retainer_io_output_cmd_valid                           ), //i
    .io_input_cmd_ready                       (writeLogic_bridge_io_input_cmd_ready                              ), //o
    .io_input_cmd_payload_last                (writeLogic_retainer_io_output_cmd_payload_last                    ), //i
    .io_input_cmd_payload_fragment_opcode     (writeLogic_retainer_io_output_cmd_payload_fragment_opcode         ), //i
    .io_input_cmd_payload_fragment_address    (writeLogic_retainer_io_output_cmd_payload_fragment_address[31:0]  ), //i
    .io_input_cmd_payload_fragment_length     (writeLogic_retainer_io_output_cmd_payload_fragment_length[11:0]   ), //i
    .io_input_cmd_payload_fragment_data       (writeLogic_retainer_io_output_cmd_payload_fragment_data[127:0]    ), //i
    .io_input_cmd_payload_fragment_mask       (writeLogic_retainer_io_output_cmd_payload_fragment_mask[15:0]     ), //i
    .io_input_cmd_payload_fragment_context    (writeLogic_retainer_io_output_cmd_payload_fragment_context[14:0]  ), //i
    .io_input_rsp_valid                       (writeLogic_bridge_io_input_rsp_valid                              ), //o
    .io_input_rsp_ready                       (writeLogic_retainer_io_output_rsp_ready                           ), //i
    .io_input_rsp_payload_last                (writeLogic_bridge_io_input_rsp_payload_last                       ), //o
    .io_input_rsp_payload_fragment_opcode     (writeLogic_bridge_io_input_rsp_payload_fragment_opcode            ), //o
    .io_input_rsp_payload_fragment_context    (writeLogic_bridge_io_input_rsp_payload_fragment_context[14:0]     ), //o
    .io_output_aw_valid                       (writeLogic_bridge_io_output_aw_valid                              ), //o
    .io_output_aw_ready                       (writeLogic_adapter_aw_ready                                       ), //i
    .io_output_aw_payload_addr                (writeLogic_bridge_io_output_aw_payload_addr[31:0]                 ), //o
    .io_output_aw_payload_len                 (writeLogic_bridge_io_output_aw_payload_len[7:0]                   ), //o
    .io_output_aw_payload_size                (writeLogic_bridge_io_output_aw_payload_size[2:0]                  ), //o
    .io_output_aw_payload_cache               (writeLogic_bridge_io_output_aw_payload_cache[3:0]                 ), //o
    .io_output_aw_payload_prot                (writeLogic_bridge_io_output_aw_payload_prot[2:0]                  ), //o
    .io_output_w_valid                        (writeLogic_bridge_io_output_w_valid                               ), //o
    .io_output_w_ready                        (writeLogic_adapter_w_ready                                        ), //i
    .io_output_w_payload_data                 (writeLogic_bridge_io_output_w_payload_data[127:0]                 ), //o
    .io_output_w_payload_strb                 (writeLogic_bridge_io_output_w_payload_strb[15:0]                  ), //o
    .io_output_w_payload_last                 (writeLogic_bridge_io_output_w_payload_last                        ), //o
    .io_output_b_valid                        (writeLogic_adapter_b_valid                                        ), //i
    .io_output_b_ready                        (writeLogic_bridge_io_output_b_ready                               ), //o
    .io_output_b_payload_resp                 (writeLogic_adapter_b_payload_resp[1:0]                            ), //i
    .clk                                      (clk                                                               ), //i
    .reset                                    (reset                                                             )  //i
  );
  EfxDMA_StreamFifoCC inputsAdapter_0_crossclock_fifo (
    .io_push_valid           (dat0_i_tvalid                                              ), //i
    .io_push_ready           (inputsAdapter_0_crossclock_fifo_io_push_ready              ), //o
    .io_push_payload_data    (dat0_i_tdata[63:0]                                         ), //i
    .io_push_payload_mask    (dat0_i_tkeep[7:0]                                          ), //i
    .io_push_payload_sink    (dat0_i_tdest[3:0]                                          ), //i
    .io_push_payload_last    (dat0_i_tlast                                               ), //i
    .io_pop_valid            (inputsAdapter_0_crossclock_fifo_io_pop_valid               ), //o
    .io_pop_ready            (inputsAdapter_0_crossclock_fifo_io_pop_ready               ), //i
    .io_pop_payload_data     (inputsAdapter_0_crossclock_fifo_io_pop_payload_data[63:0]  ), //o
    .io_pop_payload_mask     (inputsAdapter_0_crossclock_fifo_io_pop_payload_mask[7:0]   ), //o
    .io_pop_payload_sink     (inputsAdapter_0_crossclock_fifo_io_pop_payload_sink[3:0]   ), //o
    .io_pop_payload_last     (inputsAdapter_0_crossclock_fifo_io_pop_payload_last        ), //o
    .io_pushOccupancy        (inputsAdapter_0_crossclock_fifo_io_pushOccupancy[4:0]      ), //o
    .io_popOccupancy         (inputsAdapter_0_crossclock_fifo_io_popOccupancy[4:0]       ), //o
    .dat0_i_clk              (dat0_i_clk                                                 ), //i
    .dat0_i_reset            (dat0_i_reset                                               ), //i
    .clk                     (clk                                                        ), //i
    .reset                   (reset                                                      )  //i
  );
  EfxDMA_BsbUpSizerDense inputsAdapter_1_upsizer_logic (
    .io_input_valid            (dat2_i_tvalid                                               ), //i
    .io_input_ready            (inputsAdapter_1_upsizer_logic_io_input_ready                ), //o
    .io_input_payload_data     (dat2_i_tdata[31:0]                                          ), //i
    .io_input_payload_mask     (dat2_i_tkeep[3:0]                                           ), //i
    .io_input_payload_sink     (dat2_i_tdest[3:0]                                           ), //i
    .io_input_payload_last     (dat2_i_tlast                                                ), //i
    .io_output_valid           (inputsAdapter_1_upsizer_logic_io_output_valid               ), //o
    .io_output_ready           (inputsAdapter_1_crossclock_fifo_io_push_ready               ), //i
    .io_output_payload_data    (inputsAdapter_1_upsizer_logic_io_output_payload_data[63:0]  ), //o
    .io_output_payload_mask    (inputsAdapter_1_upsizer_logic_io_output_payload_mask[7:0]   ), //o
    .io_output_payload_sink    (inputsAdapter_1_upsizer_logic_io_output_payload_sink[3:0]   ), //o
    .io_output_payload_last    (inputsAdapter_1_upsizer_logic_io_output_payload_last        ), //o
    .dat2_i_clk                (dat2_i_clk                                                  ), //i
    .dat2_i_reset              (dat2_i_reset                                                )  //i
  );
  EfxDMA_StreamFifoCC_1 inputsAdapter_1_crossclock_fifo (
    .io_push_valid           (inputsAdapter_1_upsizer_logic_io_output_valid               ), //i
    .io_push_ready           (inputsAdapter_1_crossclock_fifo_io_push_ready               ), //o
    .io_push_payload_data    (inputsAdapter_1_upsizer_logic_io_output_payload_data[63:0]  ), //i
    .io_push_payload_mask    (inputsAdapter_1_upsizer_logic_io_output_payload_mask[7:0]   ), //i
    .io_push_payload_sink    (inputsAdapter_1_upsizer_logic_io_output_payload_sink[3:0]   ), //i
    .io_push_payload_last    (inputsAdapter_1_upsizer_logic_io_output_payload_last        ), //i
    .io_pop_valid            (inputsAdapter_1_crossclock_fifo_io_pop_valid                ), //o
    .io_pop_ready            (inputsAdapter_1_crossclock_fifo_io_pop_ready                ), //i
    .io_pop_payload_data     (inputsAdapter_1_crossclock_fifo_io_pop_payload_data[63:0]   ), //o
    .io_pop_payload_mask     (inputsAdapter_1_crossclock_fifo_io_pop_payload_mask[7:0]    ), //o
    .io_pop_payload_sink     (inputsAdapter_1_crossclock_fifo_io_pop_payload_sink[3:0]    ), //o
    .io_pop_payload_last     (inputsAdapter_1_crossclock_fifo_io_pop_payload_last         ), //o
    .io_pushOccupancy        (inputsAdapter_1_crossclock_fifo_io_pushOccupancy[4:0]       ), //o
    .io_popOccupancy         (inputsAdapter_1_crossclock_fifo_io_popOccupancy[4:0]        ), //o
    .dat2_i_clk              (dat2_i_clk                                                  ), //i
    .dat2_i_reset            (dat2_i_reset                                                ), //i
    .clk                     (clk                                                         ), //i
    .reset                   (reset                                                       )  //i
  );
  EfxDMA_StreamFifoCC_2 outputsAdapter_0_crossclock_fifo (
    .io_push_valid           (core_io_outputs_0_s2mPipe_ptr_valid                         ), //i
    .io_push_ready           (outputsAdapter_0_crossclock_fifo_io_push_ready              ), //o
    .io_push_payload_data    (core_io_outputs_0_s2mPipe_ptr_payload_data[63:0]            ), //i
    .io_push_payload_mask    (core_io_outputs_0_s2mPipe_ptr_payload_mask[7:0]             ), //i
    .io_push_payload_sink    (core_io_outputs_0_s2mPipe_ptr_payload_sink[3:0]             ), //i
    .io_push_payload_last    (core_io_outputs_0_s2mPipe_ptr_payload_last                  ), //i
    .io_pop_valid            (outputsAdapter_0_crossclock_fifo_io_pop_valid               ), //o
    .io_pop_ready            (dat1_o_tready                                               ), //i
    .io_pop_payload_data     (outputsAdapter_0_crossclock_fifo_io_pop_payload_data[63:0]  ), //o
    .io_pop_payload_mask     (outputsAdapter_0_crossclock_fifo_io_pop_payload_mask[7:0]   ), //o
    .io_pop_payload_sink     (outputsAdapter_0_crossclock_fifo_io_pop_payload_sink[3:0]   ), //o
    .io_pop_payload_last     (outputsAdapter_0_crossclock_fifo_io_pop_payload_last        ), //o
    .io_pushOccupancy        (outputsAdapter_0_crossclock_fifo_io_pushOccupancy[4:0]      ), //o
    .io_popOccupancy         (outputsAdapter_0_crossclock_fifo_io_popOccupancy[4:0]       ), //o
    .clk                     (clk                                                         ), //i
    .reset                   (reset                                                       ), //i
    .dat1_o_clk              (dat1_o_clk                                                  ), //i
    .dat1_o_reset            (dat1_o_reset                                                )  //i
  );
  EfxDMA_StreamFifoCC_3 outputsAdapter_1_crossclock_fifo (
    .io_push_valid           (core_io_outputs_1_s2mPipe_ptr_valid                         ), //i
    .io_push_ready           (outputsAdapter_1_crossclock_fifo_io_push_ready              ), //o
    .io_push_payload_data    (core_io_outputs_1_s2mPipe_ptr_payload_data[63:0]            ), //i
    .io_push_payload_mask    (core_io_outputs_1_s2mPipe_ptr_payload_mask[7:0]             ), //i
    .io_push_payload_sink    (core_io_outputs_1_s2mPipe_ptr_payload_sink[3:0]             ), //i
    .io_push_payload_last    (core_io_outputs_1_s2mPipe_ptr_payload_last                  ), //i
    .io_pop_valid            (outputsAdapter_1_crossclock_fifo_io_pop_valid               ), //o
    .io_pop_ready            (outputsAdapter_1_sparseDownsizer_logic_io_input_ready       ), //i
    .io_pop_payload_data     (outputsAdapter_1_crossclock_fifo_io_pop_payload_data[63:0]  ), //o
    .io_pop_payload_mask     (outputsAdapter_1_crossclock_fifo_io_pop_payload_mask[7:0]   ), //o
    .io_pop_payload_sink     (outputsAdapter_1_crossclock_fifo_io_pop_payload_sink[3:0]   ), //o
    .io_pop_payload_last     (outputsAdapter_1_crossclock_fifo_io_pop_payload_last        ), //o
    .io_pushOccupancy        (outputsAdapter_1_crossclock_fifo_io_pushOccupancy[4:0]      ), //o
    .io_popOccupancy         (outputsAdapter_1_crossclock_fifo_io_popOccupancy[4:0]       ), //o
    .clk                     (clk                                                         ), //i
    .reset                   (reset                                                       ), //i
    .dat3_o_clk              (dat3_o_clk                                                  ), //i
    .dat3_o_reset            (dat3_o_reset                                                )  //i
  );
  EfxDMA_BsbDownSizerSparse outputsAdapter_1_sparseDownsizer_logic (
    .io_input_valid            (outputsAdapter_1_crossclock_fifo_io_pop_valid                        ), //i
    .io_input_ready            (outputsAdapter_1_sparseDownsizer_logic_io_input_ready                ), //o
    .io_input_payload_data     (outputsAdapter_1_crossclock_fifo_io_pop_payload_data[63:0]           ), //i
    .io_input_payload_mask     (outputsAdapter_1_crossclock_fifo_io_pop_payload_mask[7:0]            ), //i
    .io_input_payload_sink     (outputsAdapter_1_crossclock_fifo_io_pop_payload_sink[3:0]            ), //i
    .io_input_payload_last     (outputsAdapter_1_crossclock_fifo_io_pop_payload_last                 ), //i
    .io_output_valid           (outputsAdapter_1_sparseDownsizer_logic_io_output_valid               ), //o
    .io_output_ready           (dat3_o_tready                                                        ), //i
    .io_output_payload_data    (outputsAdapter_1_sparseDownsizer_logic_io_output_payload_data[31:0]  ), //o
    .io_output_payload_mask    (outputsAdapter_1_sparseDownsizer_logic_io_output_payload_mask[3:0]   ), //o
    .io_output_payload_sink    (outputsAdapter_1_sparseDownsizer_logic_io_output_payload_sink[3:0]   ), //o
    .io_output_payload_last    (outputsAdapter_1_sparseDownsizer_logic_io_output_payload_last        ), //o
    .dat3_o_clk                (dat3_o_clk                                                           ), //i
    .dat3_o_reset              (dat3_o_reset                                                         )  //i
  );
  assign ctrl_PREADY = withCtrlCc_apbCc_io_input_PREADY;
  assign ctrl_PRDATA = withCtrlCc_apbCc_io_input_PRDATA;
  assign ctrl_PSLVERROR = withCtrlCc_apbCc_io_input_PSLVERROR;
  assign ctrl_interrupts = core_io_interrupts_buffercc_io_dataOut;
  assign core_io_write_cmd_ready = (! core_io_write_cmd_rValid);
  assign core_io_write_cmd_s2mPipe_valid = (core_io_write_cmd_valid || core_io_write_cmd_rValid);
  assign core_io_write_cmd_s2mPipe_payload_last = (core_io_write_cmd_rValid ? core_io_write_cmd_rData_last : core_io_write_cmd_payload_last);
  assign core_io_write_cmd_s2mPipe_payload_fragment_source = (core_io_write_cmd_rValid ? core_io_write_cmd_rData_fragment_source : core_io_write_cmd_payload_fragment_source);
  assign core_io_write_cmd_s2mPipe_payload_fragment_opcode = (core_io_write_cmd_rValid ? core_io_write_cmd_rData_fragment_opcode : core_io_write_cmd_payload_fragment_opcode);
  assign core_io_write_cmd_s2mPipe_payload_fragment_address = (core_io_write_cmd_rValid ? core_io_write_cmd_rData_fragment_address : core_io_write_cmd_payload_fragment_address);
  assign core_io_write_cmd_s2mPipe_payload_fragment_length = (core_io_write_cmd_rValid ? core_io_write_cmd_rData_fragment_length : core_io_write_cmd_payload_fragment_length);
  assign core_io_write_cmd_s2mPipe_payload_fragment_data = (core_io_write_cmd_rValid ? core_io_write_cmd_rData_fragment_data : core_io_write_cmd_payload_fragment_data);
  assign core_io_write_cmd_s2mPipe_payload_fragment_mask = (core_io_write_cmd_rValid ? core_io_write_cmd_rData_fragment_mask : core_io_write_cmd_payload_fragment_mask);
  assign core_io_write_cmd_s2mPipe_payload_fragment_context = (core_io_write_cmd_rValid ? core_io_write_cmd_rData_fragment_context : core_io_write_cmd_payload_fragment_context);
  always @(*) begin
    core_io_write_cmd_s2mPipe_ready = core_io_write_cmd_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342) begin
      core_io_write_cmd_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! core_io_write_cmd_s2mPipe_m2sPipe_valid);
  assign core_io_write_cmd_s2mPipe_m2sPipe_valid = core_io_write_cmd_s2mPipe_rValid;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_last = core_io_write_cmd_s2mPipe_rData_last;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_source = core_io_write_cmd_s2mPipe_rData_fragment_source;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_opcode = core_io_write_cmd_s2mPipe_rData_fragment_opcode;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_address = core_io_write_cmd_s2mPipe_rData_fragment_address;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_length = core_io_write_cmd_s2mPipe_rData_fragment_length;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_data = core_io_write_cmd_s2mPipe_rData_fragment_data;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_mask = core_io_write_cmd_s2mPipe_rData_fragment_mask;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_context = core_io_write_cmd_s2mPipe_rData_fragment_context;
  assign core_io_write_cmd_s2mPipe_m2sPipe_ready = interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  assign interconnect_read_aggregated_cmd_halfPipe_fire = (interconnect_read_aggregated_cmd_halfPipe_valid && interconnect_read_aggregated_cmd_halfPipe_ready);
  assign interconnect_read_aggregated_cmd_ready = (! interconnect_read_aggregated_cmd_rValid);
  assign interconnect_read_aggregated_cmd_halfPipe_valid = interconnect_read_aggregated_cmd_rValid;
  assign interconnect_read_aggregated_cmd_halfPipe_payload_last = interconnect_read_aggregated_cmd_rData_last;
  assign interconnect_read_aggregated_cmd_halfPipe_payload_fragment_source = interconnect_read_aggregated_cmd_rData_fragment_source;
  assign interconnect_read_aggregated_cmd_halfPipe_payload_fragment_opcode = interconnect_read_aggregated_cmd_rData_fragment_opcode;
  assign interconnect_read_aggregated_cmd_halfPipe_payload_fragment_address = interconnect_read_aggregated_cmd_rData_fragment_address;
  assign interconnect_read_aggregated_cmd_halfPipe_payload_fragment_length = interconnect_read_aggregated_cmd_rData_fragment_length;
  assign interconnect_read_aggregated_cmd_halfPipe_payload_fragment_context = interconnect_read_aggregated_cmd_rData_fragment_context;
  assign readLogic_resized_cmd_valid = interconnect_read_aggregated_cmd_halfPipe_valid;
  assign interconnect_read_aggregated_cmd_halfPipe_ready = readLogic_resized_cmd_ready;
  assign readLogic_resized_cmd_payload_last = interconnect_read_aggregated_cmd_halfPipe_payload_last;
  assign readLogic_resized_cmd_payload_fragment_source = interconnect_read_aggregated_cmd_halfPipe_payload_fragment_source;
  assign readLogic_resized_cmd_payload_fragment_opcode = interconnect_read_aggregated_cmd_halfPipe_payload_fragment_opcode;
  assign readLogic_resized_cmd_payload_fragment_address = interconnect_read_aggregated_cmd_halfPipe_payload_fragment_address;
  assign readLogic_resized_cmd_payload_fragment_length = interconnect_read_aggregated_cmd_halfPipe_payload_fragment_length;
  assign readLogic_resized_cmd_payload_fragment_context = interconnect_read_aggregated_cmd_halfPipe_payload_fragment_context;
  assign readLogic_resized_rsp_combStage_valid = readLogic_resized_rsp_valid;
  assign readLogic_resized_rsp_ready = readLogic_resized_rsp_combStage_ready;
  assign readLogic_resized_rsp_combStage_payload_last = readLogic_resized_rsp_payload_last;
  assign readLogic_resized_rsp_combStage_payload_fragment_source = readLogic_resized_rsp_payload_fragment_source;
  assign readLogic_resized_rsp_combStage_payload_fragment_opcode = readLogic_resized_rsp_payload_fragment_opcode;
  assign readLogic_resized_rsp_combStage_payload_fragment_data = readLogic_resized_rsp_payload_fragment_data;
  assign readLogic_resized_rsp_combStage_payload_fragment_context = readLogic_resized_rsp_payload_fragment_context;
  assign interconnect_read_aggregated_rsp_valid = readLogic_resized_rsp_combStage_valid;
  assign readLogic_resized_rsp_combStage_ready = interconnect_read_aggregated_rsp_ready;
  assign interconnect_read_aggregated_rsp_payload_last = readLogic_resized_rsp_combStage_payload_last;
  assign interconnect_read_aggregated_rsp_payload_fragment_source = readLogic_resized_rsp_combStage_payload_fragment_source;
  assign interconnect_read_aggregated_rsp_payload_fragment_opcode = readLogic_resized_rsp_combStage_payload_fragment_opcode;
  assign interconnect_read_aggregated_rsp_payload_fragment_data = readLogic_resized_rsp_combStage_payload_fragment_data;
  assign interconnect_read_aggregated_rsp_payload_fragment_context = readLogic_resized_rsp_combStage_payload_fragment_context;
  assign readLogic_resized_cmd_ready = readLogic_sourceRemover_io_input_cmd_ready;
  assign readLogic_resized_rsp_valid = readLogic_sourceRemover_io_input_rsp_valid;
  assign readLogic_resized_rsp_payload_last = readLogic_sourceRemover_io_input_rsp_payload_last;
  assign readLogic_resized_rsp_payload_fragment_source = readLogic_sourceRemover_io_input_rsp_payload_fragment_source;
  assign readLogic_resized_rsp_payload_fragment_opcode = readLogic_sourceRemover_io_input_rsp_payload_fragment_opcode;
  assign readLogic_resized_rsp_payload_fragment_data = readLogic_sourceRemover_io_input_rsp_payload_fragment_data;
  assign readLogic_resized_rsp_payload_fragment_context = readLogic_sourceRemover_io_input_rsp_payload_fragment_context;
  assign readLogic_adapter_ar_valid = readLogic_bridge_io_output_ar_valid;
  assign readLogic_adapter_ar_payload_addr = readLogic_bridge_io_output_ar_payload_addr;
  assign _zz_readLogic_adapter_ar_payload_region[3 : 0] = 4'b0000;
  assign readLogic_adapter_ar_payload_region = _zz_readLogic_adapter_ar_payload_region;
  assign readLogic_adapter_ar_payload_len = readLogic_bridge_io_output_ar_payload_len;
  assign readLogic_adapter_ar_payload_size = readLogic_bridge_io_output_ar_payload_size;
  assign readLogic_adapter_ar_payload_burst = 2'b01;
  assign readLogic_adapter_ar_payload_lock = 1'b0;
  assign readLogic_adapter_ar_payload_cache = readLogic_bridge_io_output_ar_payload_cache;
  assign readLogic_adapter_ar_payload_qos = 4'b0000;
  assign readLogic_adapter_ar_payload_prot = readLogic_bridge_io_output_ar_payload_prot;
  assign readLogic_adapter_r_ready = readLogic_bridge_io_output_r_ready;
  assign readLogic_adapter_ar_halfPipe_fire = (readLogic_adapter_ar_halfPipe_valid && readLogic_adapter_ar_halfPipe_ready);
  assign readLogic_adapter_ar_ready = (! readLogic_adapter_ar_rValid);
  assign readLogic_adapter_ar_halfPipe_valid = readLogic_adapter_ar_rValid;
  assign readLogic_adapter_ar_halfPipe_payload_addr = readLogic_adapter_ar_rData_addr;
  assign readLogic_adapter_ar_halfPipe_payload_region = readLogic_adapter_ar_rData_region;
  assign readLogic_adapter_ar_halfPipe_payload_len = readLogic_adapter_ar_rData_len;
  assign readLogic_adapter_ar_halfPipe_payload_size = readLogic_adapter_ar_rData_size;
  assign readLogic_adapter_ar_halfPipe_payload_burst = readLogic_adapter_ar_rData_burst;
  assign readLogic_adapter_ar_halfPipe_payload_lock = readLogic_adapter_ar_rData_lock;
  assign readLogic_adapter_ar_halfPipe_payload_cache = readLogic_adapter_ar_rData_cache;
  assign readLogic_adapter_ar_halfPipe_payload_qos = readLogic_adapter_ar_rData_qos;
  assign readLogic_adapter_ar_halfPipe_payload_prot = readLogic_adapter_ar_rData_prot;
  assign read_arvalid = readLogic_adapter_ar_halfPipe_valid;
  assign readLogic_adapter_ar_halfPipe_ready = read_arready;
  assign read_araddr = readLogic_adapter_ar_halfPipe_payload_addr;
  assign read_arregion = readLogic_adapter_ar_halfPipe_payload_region;
  assign read_arlen = readLogic_adapter_ar_halfPipe_payload_len;
  assign read_arsize = readLogic_adapter_ar_halfPipe_payload_size;
  assign read_arburst = readLogic_adapter_ar_halfPipe_payload_burst;
  assign read_arlock = readLogic_adapter_ar_halfPipe_payload_lock;
  assign read_arcache = readLogic_adapter_ar_halfPipe_payload_cache;
  assign read_arqos = readLogic_adapter_ar_halfPipe_payload_qos;
  assign read_arprot = readLogic_adapter_ar_halfPipe_payload_prot;
  assign read_rready = (! read_r_rValid);
  assign read_r_s2mPipe_valid = (read_rvalid || read_r_rValid);
  assign read_r_s2mPipe_payload_data = (read_r_rValid ? read_r_rData_data : read_rdata);
  assign read_r_s2mPipe_payload_resp = (read_r_rValid ? read_r_rData_resp : read_rresp);
  assign read_r_s2mPipe_payload_last = (read_r_rValid ? read_r_rData_last : read_rlast);
  always @(*) begin
    read_r_s2mPipe_ready = read_r_s2mPipe_beforeQueue_ready;
    if(when_Stream_l342_1) begin
      read_r_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! read_r_s2mPipe_beforeQueue_valid);
  assign read_r_s2mPipe_beforeQueue_valid = read_r_s2mPipe_rValid;
  assign read_r_s2mPipe_beforeQueue_payload_data = read_r_s2mPipe_rData_data;
  assign read_r_s2mPipe_beforeQueue_payload_resp = read_r_s2mPipe_rData_resp;
  assign read_r_s2mPipe_beforeQueue_payload_last = read_r_s2mPipe_rData_last;
  assign read_r_s2mPipe_beforeQueue_ready = read_r_s2mPipe_beforeQueue_fifo_io_push_ready;
  assign read_r_s2mPipe_beforeQueue_fifo_io_pop_ready = (! read_r_s2mPipe_beforeQueue_fifo_io_pop_rValid);
  assign read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_valid = (read_r_s2mPipe_beforeQueue_fifo_io_pop_valid || read_r_s2mPipe_beforeQueue_fifo_io_pop_rValid);
  assign read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_payload_data = (read_r_s2mPipe_beforeQueue_fifo_io_pop_rValid ? read_r_s2mPipe_beforeQueue_fifo_io_pop_rData_data : read_r_s2mPipe_beforeQueue_fifo_io_pop_payload_data);
  assign read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_payload_resp = (read_r_s2mPipe_beforeQueue_fifo_io_pop_rValid ? read_r_s2mPipe_beforeQueue_fifo_io_pop_rData_resp : read_r_s2mPipe_beforeQueue_fifo_io_pop_payload_resp);
  assign read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_payload_last = (read_r_s2mPipe_beforeQueue_fifo_io_pop_rValid ? read_r_s2mPipe_beforeQueue_fifo_io_pop_rData_last : read_r_s2mPipe_beforeQueue_fifo_io_pop_payload_last);
  always @(*) begin
    read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_ready = read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342_2) begin
      read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_valid);
  assign read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_valid = read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rValid;
  assign read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_payload_data = read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rData_data;
  assign read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_payload_resp = read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rData_resp;
  assign read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_payload_last = read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rData_last;
  assign readLogic_adapter_r_valid = read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_valid;
  assign read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_ready = readLogic_adapter_r_ready;
  assign readLogic_adapter_r_payload_data = read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_payload_data;
  assign readLogic_adapter_r_payload_resp = read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_payload_resp;
  assign readLogic_adapter_r_payload_last = read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_m2sPipe_payload_last;
  always @(*) begin
    interconnect_write_aggregated_cmd_ready = interconnect_write_aggregated_cmd_m2sPipe_ready;
    if(when_Stream_l342_3) begin
      interconnect_write_aggregated_cmd_ready = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! interconnect_write_aggregated_cmd_m2sPipe_valid);
  assign interconnect_write_aggregated_cmd_m2sPipe_valid = interconnect_write_aggregated_cmd_rValid;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_last = interconnect_write_aggregated_cmd_rData_last;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_source = interconnect_write_aggregated_cmd_rData_fragment_source;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_opcode = interconnect_write_aggregated_cmd_rData_fragment_opcode;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_address = interconnect_write_aggregated_cmd_rData_fragment_address;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_length = interconnect_write_aggregated_cmd_rData_fragment_length;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_data = interconnect_write_aggregated_cmd_rData_fragment_data;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_mask = interconnect_write_aggregated_cmd_rData_fragment_mask;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_context = interconnect_write_aggregated_cmd_rData_fragment_context;
  assign writeLogic_resized_cmd_valid = interconnect_write_aggregated_cmd_m2sPipe_valid;
  assign interconnect_write_aggregated_cmd_m2sPipe_ready = writeLogic_resized_cmd_ready;
  assign writeLogic_resized_cmd_payload_last = interconnect_write_aggregated_cmd_m2sPipe_payload_last;
  assign writeLogic_resized_cmd_payload_fragment_source = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_source;
  assign writeLogic_resized_cmd_payload_fragment_opcode = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_opcode;
  assign writeLogic_resized_cmd_payload_fragment_address = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_address;
  assign writeLogic_resized_cmd_payload_fragment_length = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_length;
  assign writeLogic_resized_cmd_payload_fragment_data = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_data;
  assign writeLogic_resized_cmd_payload_fragment_mask = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_mask;
  assign writeLogic_resized_cmd_payload_fragment_context = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_context;
  assign writeLogic_resized_rsp_combStage_valid = writeLogic_resized_rsp_valid;
  assign writeLogic_resized_rsp_ready = writeLogic_resized_rsp_combStage_ready;
  assign writeLogic_resized_rsp_combStage_payload_last = writeLogic_resized_rsp_payload_last;
  assign writeLogic_resized_rsp_combStage_payload_fragment_source = writeLogic_resized_rsp_payload_fragment_source;
  assign writeLogic_resized_rsp_combStage_payload_fragment_opcode = writeLogic_resized_rsp_payload_fragment_opcode;
  assign writeLogic_resized_rsp_combStage_payload_fragment_context = writeLogic_resized_rsp_payload_fragment_context;
  assign interconnect_write_aggregated_rsp_valid = writeLogic_resized_rsp_combStage_valid;
  assign writeLogic_resized_rsp_combStage_ready = interconnect_write_aggregated_rsp_ready;
  assign interconnect_write_aggregated_rsp_payload_last = writeLogic_resized_rsp_combStage_payload_last;
  assign interconnect_write_aggregated_rsp_payload_fragment_source = writeLogic_resized_rsp_combStage_payload_fragment_source;
  assign interconnect_write_aggregated_rsp_payload_fragment_opcode = writeLogic_resized_rsp_combStage_payload_fragment_opcode;
  assign interconnect_write_aggregated_rsp_payload_fragment_context = writeLogic_resized_rsp_combStage_payload_fragment_context;
  assign writeLogic_resized_cmd_ready = writeLogic_sourceRemover_io_input_cmd_ready;
  assign writeLogic_resized_rsp_valid = writeLogic_sourceRemover_io_input_rsp_valid;
  assign writeLogic_resized_rsp_payload_last = writeLogic_sourceRemover_io_input_rsp_payload_last;
  assign writeLogic_resized_rsp_payload_fragment_source = writeLogic_sourceRemover_io_input_rsp_payload_fragment_source;
  assign writeLogic_resized_rsp_payload_fragment_opcode = writeLogic_sourceRemover_io_input_rsp_payload_fragment_opcode;
  assign writeLogic_resized_rsp_payload_fragment_context = writeLogic_sourceRemover_io_input_rsp_payload_fragment_context;
  assign writeLogic_adapter_aw_valid = writeLogic_bridge_io_output_aw_valid;
  assign writeLogic_adapter_aw_payload_addr = writeLogic_bridge_io_output_aw_payload_addr;
  assign _zz_writeLogic_adapter_aw_payload_region[3 : 0] = 4'b0000;
  assign writeLogic_adapter_aw_payload_region = _zz_writeLogic_adapter_aw_payload_region;
  assign writeLogic_adapter_aw_payload_len = writeLogic_bridge_io_output_aw_payload_len;
  assign writeLogic_adapter_aw_payload_size = writeLogic_bridge_io_output_aw_payload_size;
  assign writeLogic_adapter_aw_payload_burst = 2'b01;
  assign writeLogic_adapter_aw_payload_lock = 1'b0;
  assign writeLogic_adapter_aw_payload_cache = writeLogic_bridge_io_output_aw_payload_cache;
  assign writeLogic_adapter_aw_payload_qos = 4'b0000;
  assign writeLogic_adapter_aw_payload_prot = writeLogic_bridge_io_output_aw_payload_prot;
  assign writeLogic_adapter_w_valid = writeLogic_bridge_io_output_w_valid;
  assign writeLogic_adapter_w_payload_data = writeLogic_bridge_io_output_w_payload_data;
  assign writeLogic_adapter_w_payload_strb = writeLogic_bridge_io_output_w_payload_strb;
  assign writeLogic_adapter_w_payload_last = writeLogic_bridge_io_output_w_payload_last;
  assign writeLogic_adapter_b_ready = writeLogic_bridge_io_output_b_ready;
  assign writeLogic_adapter_aw_halfPipe_fire = (writeLogic_adapter_aw_halfPipe_valid && writeLogic_adapter_aw_halfPipe_ready);
  assign writeLogic_adapter_aw_ready = (! writeLogic_adapter_aw_rValid);
  assign writeLogic_adapter_aw_halfPipe_valid = writeLogic_adapter_aw_rValid;
  assign writeLogic_adapter_aw_halfPipe_payload_addr = writeLogic_adapter_aw_rData_addr;
  assign writeLogic_adapter_aw_halfPipe_payload_region = writeLogic_adapter_aw_rData_region;
  assign writeLogic_adapter_aw_halfPipe_payload_len = writeLogic_adapter_aw_rData_len;
  assign writeLogic_adapter_aw_halfPipe_payload_size = writeLogic_adapter_aw_rData_size;
  assign writeLogic_adapter_aw_halfPipe_payload_burst = writeLogic_adapter_aw_rData_burst;
  assign writeLogic_adapter_aw_halfPipe_payload_lock = writeLogic_adapter_aw_rData_lock;
  assign writeLogic_adapter_aw_halfPipe_payload_cache = writeLogic_adapter_aw_rData_cache;
  assign writeLogic_adapter_aw_halfPipe_payload_qos = writeLogic_adapter_aw_rData_qos;
  assign writeLogic_adapter_aw_halfPipe_payload_prot = writeLogic_adapter_aw_rData_prot;
  assign write_awvalid = writeLogic_adapter_aw_halfPipe_valid;
  assign writeLogic_adapter_aw_halfPipe_ready = write_awready;
  assign write_awaddr = writeLogic_adapter_aw_halfPipe_payload_addr;
  assign write_awregion = writeLogic_adapter_aw_halfPipe_payload_region;
  assign write_awlen = writeLogic_adapter_aw_halfPipe_payload_len;
  assign write_awsize = writeLogic_adapter_aw_halfPipe_payload_size;
  assign write_awburst = writeLogic_adapter_aw_halfPipe_payload_burst;
  assign write_awlock = writeLogic_adapter_aw_halfPipe_payload_lock;
  assign write_awcache = writeLogic_adapter_aw_halfPipe_payload_cache;
  assign write_awqos = writeLogic_adapter_aw_halfPipe_payload_qos;
  assign write_awprot = writeLogic_adapter_aw_halfPipe_payload_prot;
  assign writeLogic_adapter_w_ready = (! writeLogic_adapter_w_rValid);
  assign writeLogic_adapter_w_s2mPipe_valid = (writeLogic_adapter_w_valid || writeLogic_adapter_w_rValid);
  assign writeLogic_adapter_w_s2mPipe_payload_data = (writeLogic_adapter_w_rValid ? writeLogic_adapter_w_rData_data : writeLogic_adapter_w_payload_data);
  assign writeLogic_adapter_w_s2mPipe_payload_strb = (writeLogic_adapter_w_rValid ? writeLogic_adapter_w_rData_strb : writeLogic_adapter_w_payload_strb);
  assign writeLogic_adapter_w_s2mPipe_payload_last = (writeLogic_adapter_w_rValid ? writeLogic_adapter_w_rData_last : writeLogic_adapter_w_payload_last);
  always @(*) begin
    writeLogic_adapter_w_s2mPipe_ready = writeLogic_adapter_w_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342_4) begin
      writeLogic_adapter_w_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_4 = (! writeLogic_adapter_w_s2mPipe_m2sPipe_valid);
  assign writeLogic_adapter_w_s2mPipe_m2sPipe_valid = writeLogic_adapter_w_s2mPipe_rValid;
  assign writeLogic_adapter_w_s2mPipe_m2sPipe_payload_data = writeLogic_adapter_w_s2mPipe_rData_data;
  assign writeLogic_adapter_w_s2mPipe_m2sPipe_payload_strb = writeLogic_adapter_w_s2mPipe_rData_strb;
  assign writeLogic_adapter_w_s2mPipe_m2sPipe_payload_last = writeLogic_adapter_w_s2mPipe_rData_last;
  assign write_wvalid = writeLogic_adapter_w_s2mPipe_m2sPipe_valid;
  assign writeLogic_adapter_w_s2mPipe_m2sPipe_ready = write_wready;
  assign write_wdata = writeLogic_adapter_w_s2mPipe_m2sPipe_payload_data;
  assign write_wstrb = writeLogic_adapter_w_s2mPipe_m2sPipe_payload_strb;
  assign write_wlast = writeLogic_adapter_w_s2mPipe_m2sPipe_payload_last;
  assign write_b_halfPipe_fire = (write_b_halfPipe_valid && write_b_halfPipe_ready);
  assign write_bready = (! write_b_rValid);
  assign write_b_halfPipe_valid = write_b_rValid;
  assign write_b_halfPipe_payload_resp = write_b_rData_resp;
  assign writeLogic_adapter_b_valid = write_b_halfPipe_valid;
  assign write_b_halfPipe_ready = writeLogic_adapter_b_ready;
  assign writeLogic_adapter_b_payload_resp = write_b_halfPipe_payload_resp;
  assign dat0_i_tready = inputsAdapter_0_crossclock_fifo_io_push_ready;
  assign inputsAdapter_0_crossclock_fifo_io_pop_ready = (! inputsAdapter_0_crossclock_fifo_io_pop_rValid);
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_valid = (inputsAdapter_0_crossclock_fifo_io_pop_valid || inputsAdapter_0_crossclock_fifo_io_pop_rValid);
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_data = (inputsAdapter_0_crossclock_fifo_io_pop_rValid ? inputsAdapter_0_crossclock_fifo_io_pop_rData_data : inputsAdapter_0_crossclock_fifo_io_pop_payload_data);
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_mask = (inputsAdapter_0_crossclock_fifo_io_pop_rValid ? inputsAdapter_0_crossclock_fifo_io_pop_rData_mask : inputsAdapter_0_crossclock_fifo_io_pop_payload_mask);
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_sink = (inputsAdapter_0_crossclock_fifo_io_pop_rValid ? inputsAdapter_0_crossclock_fifo_io_pop_rData_sink : inputsAdapter_0_crossclock_fifo_io_pop_payload_sink);
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_last = (inputsAdapter_0_crossclock_fifo_io_pop_rValid ? inputsAdapter_0_crossclock_fifo_io_pop_rData_last : inputsAdapter_0_crossclock_fifo_io_pop_payload_last);
  always @(*) begin
    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_ready = inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342_5) begin
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_5 = (! inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_valid);
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_valid = inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid;
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_data = inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_data;
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_mask = inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_mask;
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_sink = inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_sink;
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_last = inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_last;
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_ready = core_io_inputs_0_ready;
  assign dat2_i_tready = inputsAdapter_1_upsizer_logic_io_input_ready;
  assign inputsAdapter_1_crossclock_fifo_io_pop_ready = (! inputsAdapter_1_crossclock_fifo_io_pop_rValid);
  assign inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_valid = (inputsAdapter_1_crossclock_fifo_io_pop_valid || inputsAdapter_1_crossclock_fifo_io_pop_rValid);
  assign inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_payload_data = (inputsAdapter_1_crossclock_fifo_io_pop_rValid ? inputsAdapter_1_crossclock_fifo_io_pop_rData_data : inputsAdapter_1_crossclock_fifo_io_pop_payload_data);
  assign inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_payload_mask = (inputsAdapter_1_crossclock_fifo_io_pop_rValid ? inputsAdapter_1_crossclock_fifo_io_pop_rData_mask : inputsAdapter_1_crossclock_fifo_io_pop_payload_mask);
  assign inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_payload_sink = (inputsAdapter_1_crossclock_fifo_io_pop_rValid ? inputsAdapter_1_crossclock_fifo_io_pop_rData_sink : inputsAdapter_1_crossclock_fifo_io_pop_payload_sink);
  assign inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_payload_last = (inputsAdapter_1_crossclock_fifo_io_pop_rValid ? inputsAdapter_1_crossclock_fifo_io_pop_rData_last : inputsAdapter_1_crossclock_fifo_io_pop_payload_last);
  always @(*) begin
    inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_ready = inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342_6) begin
      inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_6 = (! inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_valid);
  assign inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_valid = inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rValid;
  assign inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_data = inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rData_data;
  assign inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_mask = inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rData_mask;
  assign inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_sink = inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rData_sink;
  assign inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_last = inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rData_last;
  assign inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_m2sPipe_ready = core_io_inputs_1_ready;
  assign core_io_outputs_0_ready = (! core_io_outputs_0_rValid);
  assign core_io_outputs_0_s2mPipe_valid = (core_io_outputs_0_valid || core_io_outputs_0_rValid);
  assign core_io_outputs_0_s2mPipe_payload_data = (core_io_outputs_0_rValid ? core_io_outputs_0_rData_data : core_io_outputs_0_payload_data);
  assign core_io_outputs_0_s2mPipe_payload_mask = (core_io_outputs_0_rValid ? core_io_outputs_0_rData_mask : core_io_outputs_0_payload_mask);
  assign core_io_outputs_0_s2mPipe_payload_sink = (core_io_outputs_0_rValid ? core_io_outputs_0_rData_sink : core_io_outputs_0_payload_sink);
  assign core_io_outputs_0_s2mPipe_payload_last = (core_io_outputs_0_rValid ? core_io_outputs_0_rData_last : core_io_outputs_0_payload_last);
  always @(*) begin
    core_io_outputs_0_s2mPipe_ready = core_io_outputs_0_s2mPipe_ptr_ready;
    if(when_Stream_l342_7) begin
      core_io_outputs_0_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_7 = (! core_io_outputs_0_s2mPipe_ptr_valid);
  assign core_io_outputs_0_s2mPipe_ptr_valid = core_io_outputs_0_s2mPipe_rValid;
  assign core_io_outputs_0_s2mPipe_ptr_payload_data = core_io_outputs_0_s2mPipe_rData_data;
  assign core_io_outputs_0_s2mPipe_ptr_payload_mask = core_io_outputs_0_s2mPipe_rData_mask;
  assign core_io_outputs_0_s2mPipe_ptr_payload_sink = core_io_outputs_0_s2mPipe_rData_sink;
  assign core_io_outputs_0_s2mPipe_ptr_payload_last = core_io_outputs_0_s2mPipe_rData_last;
  assign core_io_outputs_0_s2mPipe_ptr_ready = outputsAdapter_0_crossclock_fifo_io_push_ready;
  assign dat1_o_tvalid = outputsAdapter_0_crossclock_fifo_io_pop_valid;
  assign dat1_o_tdata = outputsAdapter_0_crossclock_fifo_io_pop_payload_data;
  assign dat1_o_tkeep = outputsAdapter_0_crossclock_fifo_io_pop_payload_mask;
  assign dat1_o_tdest = outputsAdapter_0_crossclock_fifo_io_pop_payload_sink;
  assign dat1_o_tlast = outputsAdapter_0_crossclock_fifo_io_pop_payload_last;
  assign core_io_outputs_1_ready = (! core_io_outputs_1_rValid);
  assign core_io_outputs_1_s2mPipe_valid = (core_io_outputs_1_valid || core_io_outputs_1_rValid);
  assign core_io_outputs_1_s2mPipe_payload_data = (core_io_outputs_1_rValid ? core_io_outputs_1_rData_data : core_io_outputs_1_payload_data);
  assign core_io_outputs_1_s2mPipe_payload_mask = (core_io_outputs_1_rValid ? core_io_outputs_1_rData_mask : core_io_outputs_1_payload_mask);
  assign core_io_outputs_1_s2mPipe_payload_sink = (core_io_outputs_1_rValid ? core_io_outputs_1_rData_sink : core_io_outputs_1_payload_sink);
  assign core_io_outputs_1_s2mPipe_payload_last = (core_io_outputs_1_rValid ? core_io_outputs_1_rData_last : core_io_outputs_1_payload_last);
  always @(*) begin
    core_io_outputs_1_s2mPipe_ready = core_io_outputs_1_s2mPipe_ptr_ready;
    if(when_Stream_l342_8) begin
      core_io_outputs_1_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_8 = (! core_io_outputs_1_s2mPipe_ptr_valid);
  assign core_io_outputs_1_s2mPipe_ptr_valid = core_io_outputs_1_s2mPipe_rValid;
  assign core_io_outputs_1_s2mPipe_ptr_payload_data = core_io_outputs_1_s2mPipe_rData_data;
  assign core_io_outputs_1_s2mPipe_ptr_payload_mask = core_io_outputs_1_s2mPipe_rData_mask;
  assign core_io_outputs_1_s2mPipe_ptr_payload_sink = core_io_outputs_1_s2mPipe_rData_sink;
  assign core_io_outputs_1_s2mPipe_ptr_payload_last = core_io_outputs_1_s2mPipe_rData_last;
  assign core_io_outputs_1_s2mPipe_ptr_ready = outputsAdapter_1_crossclock_fifo_io_push_ready;
  assign dat3_o_tvalid = outputsAdapter_1_sparseDownsizer_logic_io_output_valid;
  assign dat3_o_tdata = outputsAdapter_1_sparseDownsizer_logic_io_output_payload_data;
  assign dat3_o_tkeep = outputsAdapter_1_sparseDownsizer_logic_io_output_payload_mask;
  assign dat3_o_tdest = outputsAdapter_1_sparseDownsizer_logic_io_output_payload_sink;
  assign dat3_o_tlast = outputsAdapter_1_sparseDownsizer_logic_io_output_payload_last;
  assign interconnect_read_aggregated_cmd_valid = interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = interconnect_read_aggregated_cmd_ready;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = interconnect_read_aggregated_rsp_valid;
  assign interconnect_read_aggregated_rsp_ready = interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  assign interconnect_read_aggregated_cmd_payload_last = interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = interconnect_read_aggregated_rsp_payload_last;
  assign interconnect_read_aggregated_cmd_payload_fragment_source = interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
  assign interconnect_read_aggregated_cmd_payload_fragment_opcode = interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  assign interconnect_read_aggregated_cmd_payload_fragment_address = interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  assign interconnect_read_aggregated_cmd_payload_fragment_length = interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  assign interconnect_read_aggregated_cmd_payload_fragment_context = interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source = interconnect_read_aggregated_rsp_payload_fragment_source;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = interconnect_read_aggregated_rsp_payload_fragment_opcode;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data = interconnect_read_aggregated_rsp_payload_fragment_data;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context = interconnect_read_aggregated_rsp_payload_fragment_context;
  assign interconnect_write_aggregated_cmd_valid = interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = interconnect_write_aggregated_cmd_ready;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = interconnect_write_aggregated_rsp_valid;
  assign interconnect_write_aggregated_rsp_ready = interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  assign interconnect_write_aggregated_cmd_payload_last = interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = interconnect_write_aggregated_rsp_payload_last;
  assign interconnect_write_aggregated_cmd_payload_fragment_source = interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source;
  assign interconnect_write_aggregated_cmd_payload_fragment_opcode = interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  assign interconnect_write_aggregated_cmd_payload_fragment_address = interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  assign interconnect_write_aggregated_cmd_payload_fragment_length = interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  assign interconnect_write_aggregated_cmd_payload_fragment_data = interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  assign interconnect_write_aggregated_cmd_payload_fragment_mask = interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  assign interconnect_write_aggregated_cmd_payload_fragment_context = interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_source = interconnect_write_aggregated_rsp_payload_fragment_source;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = interconnect_write_aggregated_rsp_payload_fragment_opcode;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context = interconnect_write_aggregated_rsp_payload_fragment_context;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = core_io_read_cmd_valid;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = core_io_read_rsp_ready;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = core_io_read_cmd_payload_last;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source = core_io_read_cmd_payload_fragment_source;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = core_io_read_cmd_payload_fragment_opcode;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = core_io_read_cmd_payload_fragment_address;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = core_io_read_cmd_payload_fragment_length;
  assign interconnect_read_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context = core_io_read_cmd_payload_fragment_context;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = core_io_write_cmd_s2mPipe_m2sPipe_valid;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = core_io_write_rsp_ready;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = core_io_write_cmd_s2mPipe_m2sPipe_payload_last;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_source = core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_source;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data = core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_data;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask = core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_mask;
  assign interconnect_write_aggregated_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context = core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_context;
  always @(posedge clk) begin
    if(reset) begin
      core_io_write_cmd_rValid <= 1'b0;
      core_io_write_cmd_s2mPipe_rValid <= 1'b0;
      interconnect_read_aggregated_cmd_rValid <= 1'b0;
      readLogic_adapter_ar_rValid <= 1'b0;
      read_r_rValid <= 1'b0;
      read_r_s2mPipe_rValid <= 1'b0;
      read_r_s2mPipe_beforeQueue_fifo_io_pop_rValid <= 1'b0;
      read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rValid <= 1'b0;
      interconnect_write_aggregated_cmd_rValid <= 1'b0;
      writeLogic_adapter_aw_rValid <= 1'b0;
      writeLogic_adapter_w_rValid <= 1'b0;
      writeLogic_adapter_w_s2mPipe_rValid <= 1'b0;
      write_b_rValid <= 1'b0;
      inputsAdapter_0_crossclock_fifo_io_pop_rValid <= 1'b0;
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid <= 1'b0;
      inputsAdapter_1_crossclock_fifo_io_pop_rValid <= 1'b0;
      inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rValid <= 1'b0;
      core_io_outputs_0_rValid <= 1'b0;
      core_io_outputs_0_s2mPipe_rValid <= 1'b0;
      core_io_outputs_1_rValid <= 1'b0;
      core_io_outputs_1_s2mPipe_rValid <= 1'b0;
    end else begin
      if(core_io_write_cmd_valid) begin
        core_io_write_cmd_rValid <= 1'b1;
      end
      if(core_io_write_cmd_s2mPipe_ready) begin
        core_io_write_cmd_rValid <= 1'b0;
      end
      if(core_io_write_cmd_s2mPipe_ready) begin
        core_io_write_cmd_s2mPipe_rValid <= core_io_write_cmd_s2mPipe_valid;
      end
      if(interconnect_read_aggregated_cmd_valid) begin
        interconnect_read_aggregated_cmd_rValid <= 1'b1;
      end
      if(interconnect_read_aggregated_cmd_halfPipe_fire) begin
        interconnect_read_aggregated_cmd_rValid <= 1'b0;
      end
      if(readLogic_adapter_ar_valid) begin
        readLogic_adapter_ar_rValid <= 1'b1;
      end
      if(readLogic_adapter_ar_halfPipe_fire) begin
        readLogic_adapter_ar_rValid <= 1'b0;
      end
      if(read_rvalid) begin
        read_r_rValid <= 1'b1;
      end
      if(read_r_s2mPipe_ready) begin
        read_r_rValid <= 1'b0;
      end
      if(read_r_s2mPipe_ready) begin
        read_r_s2mPipe_rValid <= read_r_s2mPipe_valid;
      end
      if(read_r_s2mPipe_beforeQueue_fifo_io_pop_valid) begin
        read_r_s2mPipe_beforeQueue_fifo_io_pop_rValid <= 1'b1;
      end
      if(read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_ready) begin
        read_r_s2mPipe_beforeQueue_fifo_io_pop_rValid <= 1'b0;
      end
      if(read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_ready) begin
        read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rValid <= read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_valid;
      end
      if(interconnect_write_aggregated_cmd_ready) begin
        interconnect_write_aggregated_cmd_rValid <= interconnect_write_aggregated_cmd_valid;
      end
      if(writeLogic_adapter_aw_valid) begin
        writeLogic_adapter_aw_rValid <= 1'b1;
      end
      if(writeLogic_adapter_aw_halfPipe_fire) begin
        writeLogic_adapter_aw_rValid <= 1'b0;
      end
      if(writeLogic_adapter_w_valid) begin
        writeLogic_adapter_w_rValid <= 1'b1;
      end
      if(writeLogic_adapter_w_s2mPipe_ready) begin
        writeLogic_adapter_w_rValid <= 1'b0;
      end
      if(writeLogic_adapter_w_s2mPipe_ready) begin
        writeLogic_adapter_w_s2mPipe_rValid <= writeLogic_adapter_w_s2mPipe_valid;
      end
      if(write_bvalid) begin
        write_b_rValid <= 1'b1;
      end
      if(write_b_halfPipe_fire) begin
        write_b_rValid <= 1'b0;
      end
      if(inputsAdapter_0_crossclock_fifo_io_pop_valid) begin
        inputsAdapter_0_crossclock_fifo_io_pop_rValid <= 1'b1;
      end
      if(inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_ready) begin
        inputsAdapter_0_crossclock_fifo_io_pop_rValid <= 1'b0;
      end
      if(inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_ready) begin
        inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid <= inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_valid;
      end
      if(inputsAdapter_1_crossclock_fifo_io_pop_valid) begin
        inputsAdapter_1_crossclock_fifo_io_pop_rValid <= 1'b1;
      end
      if(inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_ready) begin
        inputsAdapter_1_crossclock_fifo_io_pop_rValid <= 1'b0;
      end
      if(inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_ready) begin
        inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rValid <= inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_valid;
      end
      if(core_io_outputs_0_valid) begin
        core_io_outputs_0_rValid <= 1'b1;
      end
      if(core_io_outputs_0_s2mPipe_ready) begin
        core_io_outputs_0_rValid <= 1'b0;
      end
      if(core_io_outputs_0_s2mPipe_ready) begin
        core_io_outputs_0_s2mPipe_rValid <= core_io_outputs_0_s2mPipe_valid;
      end
      if(core_io_outputs_1_valid) begin
        core_io_outputs_1_rValid <= 1'b1;
      end
      if(core_io_outputs_1_s2mPipe_ready) begin
        core_io_outputs_1_rValid <= 1'b0;
      end
      if(core_io_outputs_1_s2mPipe_ready) begin
        core_io_outputs_1_s2mPipe_rValid <= core_io_outputs_1_s2mPipe_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(core_io_write_cmd_ready) begin
      core_io_write_cmd_rData_last <= core_io_write_cmd_payload_last;
      core_io_write_cmd_rData_fragment_source <= core_io_write_cmd_payload_fragment_source;
      core_io_write_cmd_rData_fragment_opcode <= core_io_write_cmd_payload_fragment_opcode;
      core_io_write_cmd_rData_fragment_address <= core_io_write_cmd_payload_fragment_address;
      core_io_write_cmd_rData_fragment_length <= core_io_write_cmd_payload_fragment_length;
      core_io_write_cmd_rData_fragment_data <= core_io_write_cmd_payload_fragment_data;
      core_io_write_cmd_rData_fragment_mask <= core_io_write_cmd_payload_fragment_mask;
      core_io_write_cmd_rData_fragment_context <= core_io_write_cmd_payload_fragment_context;
    end
    if(core_io_write_cmd_s2mPipe_ready) begin
      core_io_write_cmd_s2mPipe_rData_last <= core_io_write_cmd_s2mPipe_payload_last;
      core_io_write_cmd_s2mPipe_rData_fragment_source <= core_io_write_cmd_s2mPipe_payload_fragment_source;
      core_io_write_cmd_s2mPipe_rData_fragment_opcode <= core_io_write_cmd_s2mPipe_payload_fragment_opcode;
      core_io_write_cmd_s2mPipe_rData_fragment_address <= core_io_write_cmd_s2mPipe_payload_fragment_address;
      core_io_write_cmd_s2mPipe_rData_fragment_length <= core_io_write_cmd_s2mPipe_payload_fragment_length;
      core_io_write_cmd_s2mPipe_rData_fragment_data <= core_io_write_cmd_s2mPipe_payload_fragment_data;
      core_io_write_cmd_s2mPipe_rData_fragment_mask <= core_io_write_cmd_s2mPipe_payload_fragment_mask;
      core_io_write_cmd_s2mPipe_rData_fragment_context <= core_io_write_cmd_s2mPipe_payload_fragment_context;
    end
    if(interconnect_read_aggregated_cmd_ready) begin
      interconnect_read_aggregated_cmd_rData_last <= interconnect_read_aggregated_cmd_payload_last;
      interconnect_read_aggregated_cmd_rData_fragment_source <= interconnect_read_aggregated_cmd_payload_fragment_source;
      interconnect_read_aggregated_cmd_rData_fragment_opcode <= interconnect_read_aggregated_cmd_payload_fragment_opcode;
      interconnect_read_aggregated_cmd_rData_fragment_address <= interconnect_read_aggregated_cmd_payload_fragment_address;
      interconnect_read_aggregated_cmd_rData_fragment_length <= interconnect_read_aggregated_cmd_payload_fragment_length;
      interconnect_read_aggregated_cmd_rData_fragment_context <= interconnect_read_aggregated_cmd_payload_fragment_context;
    end
    if(readLogic_adapter_ar_ready) begin
      readLogic_adapter_ar_rData_addr <= readLogic_adapter_ar_payload_addr;
      readLogic_adapter_ar_rData_region <= readLogic_adapter_ar_payload_region;
      readLogic_adapter_ar_rData_len <= readLogic_adapter_ar_payload_len;
      readLogic_adapter_ar_rData_size <= readLogic_adapter_ar_payload_size;
      readLogic_adapter_ar_rData_burst <= readLogic_adapter_ar_payload_burst;
      readLogic_adapter_ar_rData_lock <= readLogic_adapter_ar_payload_lock;
      readLogic_adapter_ar_rData_cache <= readLogic_adapter_ar_payload_cache;
      readLogic_adapter_ar_rData_qos <= readLogic_adapter_ar_payload_qos;
      readLogic_adapter_ar_rData_prot <= readLogic_adapter_ar_payload_prot;
    end
    if(read_rready) begin
      read_r_rData_data <= read_rdata;
      read_r_rData_resp <= read_rresp;
      read_r_rData_last <= read_rlast;
    end
    if(read_r_s2mPipe_ready) begin
      read_r_s2mPipe_rData_data <= read_r_s2mPipe_payload_data;
      read_r_s2mPipe_rData_resp <= read_r_s2mPipe_payload_resp;
      read_r_s2mPipe_rData_last <= read_r_s2mPipe_payload_last;
    end
    if(read_r_s2mPipe_beforeQueue_fifo_io_pop_ready) begin
      read_r_s2mPipe_beforeQueue_fifo_io_pop_rData_data <= read_r_s2mPipe_beforeQueue_fifo_io_pop_payload_data;
      read_r_s2mPipe_beforeQueue_fifo_io_pop_rData_resp <= read_r_s2mPipe_beforeQueue_fifo_io_pop_payload_resp;
      read_r_s2mPipe_beforeQueue_fifo_io_pop_rData_last <= read_r_s2mPipe_beforeQueue_fifo_io_pop_payload_last;
    end
    if(read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_ready) begin
      read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rData_data <= read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_payload_data;
      read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rData_resp <= read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_payload_resp;
      read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_rData_last <= read_r_s2mPipe_beforeQueue_fifo_io_pop_s2mPipe_payload_last;
    end
    if(interconnect_write_aggregated_cmd_ready) begin
      interconnect_write_aggregated_cmd_rData_last <= interconnect_write_aggregated_cmd_payload_last;
      interconnect_write_aggregated_cmd_rData_fragment_source <= interconnect_write_aggregated_cmd_payload_fragment_source;
      interconnect_write_aggregated_cmd_rData_fragment_opcode <= interconnect_write_aggregated_cmd_payload_fragment_opcode;
      interconnect_write_aggregated_cmd_rData_fragment_address <= interconnect_write_aggregated_cmd_payload_fragment_address;
      interconnect_write_aggregated_cmd_rData_fragment_length <= interconnect_write_aggregated_cmd_payload_fragment_length;
      interconnect_write_aggregated_cmd_rData_fragment_data <= interconnect_write_aggregated_cmd_payload_fragment_data;
      interconnect_write_aggregated_cmd_rData_fragment_mask <= interconnect_write_aggregated_cmd_payload_fragment_mask;
      interconnect_write_aggregated_cmd_rData_fragment_context <= interconnect_write_aggregated_cmd_payload_fragment_context;
    end
    if(writeLogic_adapter_aw_ready) begin
      writeLogic_adapter_aw_rData_addr <= writeLogic_adapter_aw_payload_addr;
      writeLogic_adapter_aw_rData_region <= writeLogic_adapter_aw_payload_region;
      writeLogic_adapter_aw_rData_len <= writeLogic_adapter_aw_payload_len;
      writeLogic_adapter_aw_rData_size <= writeLogic_adapter_aw_payload_size;
      writeLogic_adapter_aw_rData_burst <= writeLogic_adapter_aw_payload_burst;
      writeLogic_adapter_aw_rData_lock <= writeLogic_adapter_aw_payload_lock;
      writeLogic_adapter_aw_rData_cache <= writeLogic_adapter_aw_payload_cache;
      writeLogic_adapter_aw_rData_qos <= writeLogic_adapter_aw_payload_qos;
      writeLogic_adapter_aw_rData_prot <= writeLogic_adapter_aw_payload_prot;
    end
    if(writeLogic_adapter_w_ready) begin
      writeLogic_adapter_w_rData_data <= writeLogic_adapter_w_payload_data;
      writeLogic_adapter_w_rData_strb <= writeLogic_adapter_w_payload_strb;
      writeLogic_adapter_w_rData_last <= writeLogic_adapter_w_payload_last;
    end
    if(writeLogic_adapter_w_s2mPipe_ready) begin
      writeLogic_adapter_w_s2mPipe_rData_data <= writeLogic_adapter_w_s2mPipe_payload_data;
      writeLogic_adapter_w_s2mPipe_rData_strb <= writeLogic_adapter_w_s2mPipe_payload_strb;
      writeLogic_adapter_w_s2mPipe_rData_last <= writeLogic_adapter_w_s2mPipe_payload_last;
    end
    if(write_bready) begin
      write_b_rData_resp <= write_bresp;
    end
    if(inputsAdapter_0_crossclock_fifo_io_pop_ready) begin
      inputsAdapter_0_crossclock_fifo_io_pop_rData_data <= inputsAdapter_0_crossclock_fifo_io_pop_payload_data;
      inputsAdapter_0_crossclock_fifo_io_pop_rData_mask <= inputsAdapter_0_crossclock_fifo_io_pop_payload_mask;
      inputsAdapter_0_crossclock_fifo_io_pop_rData_sink <= inputsAdapter_0_crossclock_fifo_io_pop_payload_sink;
      inputsAdapter_0_crossclock_fifo_io_pop_rData_last <= inputsAdapter_0_crossclock_fifo_io_pop_payload_last;
    end
    if(inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_ready) begin
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_data <= inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_data;
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_mask <= inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_mask;
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_sink <= inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_sink;
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_last <= inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_last;
    end
    if(inputsAdapter_1_crossclock_fifo_io_pop_ready) begin
      inputsAdapter_1_crossclock_fifo_io_pop_rData_data <= inputsAdapter_1_crossclock_fifo_io_pop_payload_data;
      inputsAdapter_1_crossclock_fifo_io_pop_rData_mask <= inputsAdapter_1_crossclock_fifo_io_pop_payload_mask;
      inputsAdapter_1_crossclock_fifo_io_pop_rData_sink <= inputsAdapter_1_crossclock_fifo_io_pop_payload_sink;
      inputsAdapter_1_crossclock_fifo_io_pop_rData_last <= inputsAdapter_1_crossclock_fifo_io_pop_payload_last;
    end
    if(inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_ready) begin
      inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rData_data <= inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_payload_data;
      inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rData_mask <= inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_payload_mask;
      inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rData_sink <= inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_payload_sink;
      inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_rData_last <= inputsAdapter_1_crossclock_fifo_io_pop_s2mPipe_payload_last;
    end
    if(core_io_outputs_0_ready) begin
      core_io_outputs_0_rData_data <= core_io_outputs_0_payload_data;
      core_io_outputs_0_rData_mask <= core_io_outputs_0_payload_mask;
      core_io_outputs_0_rData_sink <= core_io_outputs_0_payload_sink;
      core_io_outputs_0_rData_last <= core_io_outputs_0_payload_last;
    end
    if(core_io_outputs_0_s2mPipe_ready) begin
      core_io_outputs_0_s2mPipe_rData_data <= core_io_outputs_0_s2mPipe_payload_data;
      core_io_outputs_0_s2mPipe_rData_mask <= core_io_outputs_0_s2mPipe_payload_mask;
      core_io_outputs_0_s2mPipe_rData_sink <= core_io_outputs_0_s2mPipe_payload_sink;
      core_io_outputs_0_s2mPipe_rData_last <= core_io_outputs_0_s2mPipe_payload_last;
    end
    if(core_io_outputs_1_ready) begin
      core_io_outputs_1_rData_data <= core_io_outputs_1_payload_data;
      core_io_outputs_1_rData_mask <= core_io_outputs_1_payload_mask;
      core_io_outputs_1_rData_sink <= core_io_outputs_1_payload_sink;
      core_io_outputs_1_rData_last <= core_io_outputs_1_payload_last;
    end
    if(core_io_outputs_1_s2mPipe_ready) begin
      core_io_outputs_1_s2mPipe_rData_data <= core_io_outputs_1_s2mPipe_payload_data;
      core_io_outputs_1_s2mPipe_rData_mask <= core_io_outputs_1_s2mPipe_payload_mask;
      core_io_outputs_1_s2mPipe_rData_sink <= core_io_outputs_1_s2mPipe_payload_sink;
      core_io_outputs_1_s2mPipe_rData_last <= core_io_outputs_1_s2mPipe_payload_last;
    end
  end


endmodule

module EfxDMA_BsbDownSizerSparse (
  input               io_input_valid,
  output              io_input_ready,
  input      [63:0]   io_input_payload_data,
  input      [7:0]    io_input_payload_mask,
  input      [3:0]    io_input_payload_sink,
  input               io_input_payload_last,
  output              io_output_valid,
  input               io_output_ready,
  output     [31:0]   io_output_payload_data,
  output     [3:0]    io_output_payload_mask,
  output     [3:0]    io_output_payload_sink,
  output              io_output_payload_last,
  input               dat3_o_clk,
  input               dat3_o_reset
);
  reg        [31:0]   _zz_io_output_payload_data;
  reg        [3:0]    _zz_io_output_payload_mask;
  reg        [0:0]    counter;
  wire                end_1;
  wire                io_output_fire;

  always @(*) begin
    case(counter)
      1'b0 : begin
        _zz_io_output_payload_data = io_input_payload_data[31 : 0];
        _zz_io_output_payload_mask = io_input_payload_mask[3 : 0];
      end
      default : begin
        _zz_io_output_payload_data = io_input_payload_data[63 : 32];
        _zz_io_output_payload_mask = io_input_payload_mask[7 : 4];
      end
    endcase
  end

  assign end_1 = (counter == 1'b1);
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_input_ready = (io_output_ready && end_1);
  assign io_output_valid = io_input_valid;
  assign io_output_payload_data = _zz_io_output_payload_data;
  assign io_output_payload_mask = _zz_io_output_payload_mask;
  assign io_output_payload_sink = io_input_payload_sink;
  assign io_output_payload_last = (io_input_payload_last && end_1);
  always @(posedge dat3_o_clk) begin
    if(dat3_o_reset) begin
      counter <= 1'b0;
    end else begin
      if(io_output_fire) begin
        counter <= (counter + 1'b1);
      end
    end
  end


endmodule

module EfxDMA_StreamFifoCC_3 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload_data,
  input      [7:0]    io_push_payload_mask,
  input      [3:0]    io_push_payload_sink,
  input               io_push_payload_last,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload_data,
  output     [7:0]    io_pop_payload_mask,
  output     [3:0]    io_pop_payload_sink,
  output              io_pop_payload_last,
  output     [4:0]    io_pushOccupancy,
  output     [4:0]    io_popOccupancy,
  input               clk,
  input               reset,
  input               dat3_o_clk,
  input               dat3_o_reset
);
  reg        [76:0]   _zz_ram_port1;
  wire       [4:0]    popToPushGray_buffercc_io_dataOut;
  wire       [4:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [4:0]    _zz_pushCC_pushPtrGray;
  wire       [3:0]    _zz_ram_port;
  wire       [76:0]   _zz_ram_port_1;
  wire       [4:0]    _zz_popCC_popPtrGray;
  wire       [3:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [3:0]    _zz__zz_io_pop_payload_data_1;
  wire                _zz__zz_io_pop_payload_data_1_1;
  reg                 _zz_1;
  wire       [4:0]    popToPushGray;
  wire       [4:0]    pushToPopGray;
  reg        [4:0]    pushCC_pushPtr;
  wire       [4:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [4:0]    pushCC_pushPtrGray;
  wire       [4:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  reg        [4:0]    popCC_popPtr;
  wire       [4:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [4:0]    popCC_popPtrGray;
  wire       [4:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [4:0]    _zz_io_pop_payload_data;
  wire       [76:0]   _zz_io_pop_payload_data_1;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  reg [76:0] ram [0:15];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[3:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz__zz_io_pop_payload_data_1 = _zz_io_pop_payload_data[3:0];
  assign _zz_ram_port_1 = {io_push_payload_last,{io_push_payload_sink,{io_push_payload_mask,io_push_payload_data}}};
  assign _zz__zz_io_pop_payload_data_1_1 = 1'b1;
  always @(posedge clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge dat3_o_clk) begin
    if(_zz__zz_io_pop_payload_data_1_1) begin
      _zz_ram_port1 <= ram[_zz__zz_io_pop_payload_data_1];
    end
  end

  EfxDMA_BufferCC_4 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[4:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[4:0]  ), //o
    .clk           (clk                                     ), //i
    .reset         (reset                                   )  //i
  );
  EfxDMA_BufferCC_10 pushToPopGray_buffercc (
    .io_dataIn       (pushToPopGray[4:0]                      ), //i
    .io_dataOut      (pushToPopGray_buffercc_io_dataOut[4:0]  ), //o
    .dat3_o_clk      (dat3_o_clk                              ), //i
    .dat3_o_reset    (dat3_o_reset                            )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 5'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[4 : 3] == (~ pushCC_popPtrGray[4 : 3])) && (pushCC_pushPtrGray[2 : 0] == pushCC_popPtrGray[2 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = pushCC_popPtrGray[4];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 5'h01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload_data = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign _zz_io_pop_payload_data_1 = _zz_ram_port1;
  assign io_pop_payload_data = _zz_io_pop_payload_data_1[63 : 0];
  assign io_pop_payload_mask = _zz_io_pop_payload_data_1[71 : 64];
  assign io_pop_payload_sink = _zz_io_pop_payload_data_1[75 : 72];
  assign io_pop_payload_last = _zz_io_pop_payload_data_1[76];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = popCC_pushPtrGray[4];
  assign io_popOccupancy = ({_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge clk) begin
    if(reset) begin
      pushCC_pushPtr <= 5'h0;
      pushCC_pushPtrGray <= 5'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge dat3_o_clk) begin
    if(dat3_o_reset) begin
      popCC_popPtr <= 5'h0;
      popCC_popPtrGray <= 5'h0;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module EfxDMA_StreamFifoCC_2 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload_data,
  input      [7:0]    io_push_payload_mask,
  input      [3:0]    io_push_payload_sink,
  input               io_push_payload_last,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload_data,
  output     [7:0]    io_pop_payload_mask,
  output     [3:0]    io_pop_payload_sink,
  output              io_pop_payload_last,
  output     [4:0]    io_pushOccupancy,
  output     [4:0]    io_popOccupancy,
  input               clk,
  input               reset,
  input               dat1_o_clk,
  input               dat1_o_reset
);
  reg        [76:0]   _zz_ram_port1;
  wire       [4:0]    popToPushGray_buffercc_io_dataOut;
  wire       [4:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [4:0]    _zz_pushCC_pushPtrGray;
  wire       [3:0]    _zz_ram_port;
  wire       [76:0]   _zz_ram_port_1;
  wire       [4:0]    _zz_popCC_popPtrGray;
  wire       [3:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [3:0]    _zz__zz_io_pop_payload_data_1;
  wire                _zz__zz_io_pop_payload_data_1_1;
  reg                 _zz_1;
  wire       [4:0]    popToPushGray;
  wire       [4:0]    pushToPopGray;
  reg        [4:0]    pushCC_pushPtr;
  wire       [4:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [4:0]    pushCC_pushPtrGray;
  wire       [4:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  reg        [4:0]    popCC_popPtr;
  wire       [4:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [4:0]    popCC_popPtrGray;
  wire       [4:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [4:0]    _zz_io_pop_payload_data;
  wire       [76:0]   _zz_io_pop_payload_data_1;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  reg [76:0] ram [0:15];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[3:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz__zz_io_pop_payload_data_1 = _zz_io_pop_payload_data[3:0];
  assign _zz_ram_port_1 = {io_push_payload_last,{io_push_payload_sink,{io_push_payload_mask,io_push_payload_data}}};
  assign _zz__zz_io_pop_payload_data_1_1 = 1'b1;
  always @(posedge clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge dat1_o_clk) begin
    if(_zz__zz_io_pop_payload_data_1_1) begin
      _zz_ram_port1 <= ram[_zz__zz_io_pop_payload_data_1];
    end
  end

  EfxDMA_BufferCC_4 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[4:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[4:0]  ), //o
    .clk           (clk                                     ), //i
    .reset         (reset                                   )  //i
  );
  EfxDMA_BufferCC_8 pushToPopGray_buffercc (
    .io_dataIn       (pushToPopGray[4:0]                      ), //i
    .io_dataOut      (pushToPopGray_buffercc_io_dataOut[4:0]  ), //o
    .dat1_o_clk      (dat1_o_clk                              ), //i
    .dat1_o_reset    (dat1_o_reset                            )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 5'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[4 : 3] == (~ pushCC_popPtrGray[4 : 3])) && (pushCC_pushPtrGray[2 : 0] == pushCC_popPtrGray[2 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = pushCC_popPtrGray[4];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 5'h01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload_data = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign _zz_io_pop_payload_data_1 = _zz_ram_port1;
  assign io_pop_payload_data = _zz_io_pop_payload_data_1[63 : 0];
  assign io_pop_payload_mask = _zz_io_pop_payload_data_1[71 : 64];
  assign io_pop_payload_sink = _zz_io_pop_payload_data_1[75 : 72];
  assign io_pop_payload_last = _zz_io_pop_payload_data_1[76];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = popCC_pushPtrGray[4];
  assign io_popOccupancy = ({_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge clk) begin
    if(reset) begin
      pushCC_pushPtr <= 5'h0;
      pushCC_pushPtrGray <= 5'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge dat1_o_clk) begin
    if(dat1_o_reset) begin
      popCC_popPtr <= 5'h0;
      popCC_popPtrGray <= 5'h0;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module EfxDMA_StreamFifoCC_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload_data,
  input      [7:0]    io_push_payload_mask,
  input      [3:0]    io_push_payload_sink,
  input               io_push_payload_last,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload_data,
  output     [7:0]    io_pop_payload_mask,
  output     [3:0]    io_pop_payload_sink,
  output              io_pop_payload_last,
  output     [4:0]    io_pushOccupancy,
  output     [4:0]    io_popOccupancy,
  input               dat2_i_clk,
  input               dat2_i_reset,
  input               clk,
  input               reset
);
  reg        [76:0]   _zz_ram_port1;
  wire       [4:0]    popToPushGray_buffercc_io_dataOut;
  wire       [4:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [4:0]    _zz_pushCC_pushPtrGray;
  wire       [3:0]    _zz_ram_port;
  wire       [76:0]   _zz_ram_port_1;
  wire       [4:0]    _zz_popCC_popPtrGray;
  wire       [3:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [3:0]    _zz__zz_io_pop_payload_data_1;
  wire                _zz__zz_io_pop_payload_data_1_1;
  reg                 _zz_1;
  wire       [4:0]    popToPushGray;
  wire       [4:0]    pushToPopGray;
  reg        [4:0]    pushCC_pushPtr;
  wire       [4:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [4:0]    pushCC_pushPtrGray;
  wire       [4:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  reg        [4:0]    popCC_popPtr;
  wire       [4:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [4:0]    popCC_popPtrGray;
  wire       [4:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [4:0]    _zz_io_pop_payload_data;
  wire       [76:0]   _zz_io_pop_payload_data_1;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  reg [76:0] ram [0:15];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[3:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz__zz_io_pop_payload_data_1 = _zz_io_pop_payload_data[3:0];
  assign _zz_ram_port_1 = {io_push_payload_last,{io_push_payload_sink,{io_push_payload_mask,io_push_payload_data}}};
  assign _zz__zz_io_pop_payload_data_1_1 = 1'b1;
  always @(posedge dat2_i_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_pop_payload_data_1_1) begin
      _zz_ram_port1 <= ram[_zz__zz_io_pop_payload_data_1];
    end
  end

  EfxDMA_BufferCC_5 popToPushGray_buffercc (
    .io_dataIn       (popToPushGray[4:0]                      ), //i
    .io_dataOut      (popToPushGray_buffercc_io_dataOut[4:0]  ), //o
    .dat2_i_clk      (dat2_i_clk                              ), //i
    .dat2_i_reset    (dat2_i_reset                            )  //i
  );
  EfxDMA_BufferCC_4 pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray[4:0]                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut[4:0]  ), //o
    .clk           (clk                                     ), //i
    .reset         (reset                                   )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 5'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[4 : 3] == (~ pushCC_popPtrGray[4 : 3])) && (pushCC_pushPtrGray[2 : 0] == pushCC_popPtrGray[2 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = pushCC_popPtrGray[4];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 5'h01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload_data = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign _zz_io_pop_payload_data_1 = _zz_ram_port1;
  assign io_pop_payload_data = _zz_io_pop_payload_data_1[63 : 0];
  assign io_pop_payload_mask = _zz_io_pop_payload_data_1[71 : 64];
  assign io_pop_payload_sink = _zz_io_pop_payload_data_1[75 : 72];
  assign io_pop_payload_last = _zz_io_pop_payload_data_1[76];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = popCC_pushPtrGray[4];
  assign io_popOccupancy = ({_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge dat2_i_clk) begin
    if(dat2_i_reset) begin
      pushCC_pushPtr <= 5'h0;
      pushCC_pushPtrGray <= 5'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      popCC_popPtr <= 5'h0;
      popCC_popPtrGray <= 5'h0;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module EfxDMA_BsbUpSizerDense (
  input               io_input_valid,
  output              io_input_ready,
  input      [31:0]   io_input_payload_data,
  input      [3:0]    io_input_payload_mask,
  input      [3:0]    io_input_payload_sink,
  input               io_input_payload_last,
  output              io_output_valid,
  input               io_output_ready,
  output     [63:0]   io_output_payload_data,
  output     [7:0]    io_output_payload_mask,
  output     [3:0]    io_output_payload_sink,
  output              io_output_payload_last,
  input               dat2_i_clk,
  input               dat2_i_reset
);
  reg                 valid;
  reg        [0:0]    counter;
  reg        [63:0]   buffer_data;
  reg        [7:0]    buffer_mask;
  reg        [3:0]    buffer_sink;
  reg                 buffer_last;
  wire                full;
  wire                canAggregate;
  wire                onOutput;
  wire       [0:0]    counterSample;
  wire                io_output_fire;
  wire                io_input_fire;
  wire       [1:0]    _zz_1;
  wire       [1:0]    _zz_2;

  assign full = ((counter == 1'b0) || buffer_last);
  assign canAggregate = ((((valid && (! buffer_last)) && (! full)) && 1'b1) && (buffer_sink == io_input_payload_sink));
  assign counterSample = (canAggregate ? counter : 1'b0);
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign _zz_1 = ({1'd0,1'b1} <<< counterSample);
  assign _zz_2 = ({1'd0,1'b1} <<< counterSample);
  assign io_output_valid = (valid && ((valid && full) || (io_input_valid && (! canAggregate))));
  assign io_output_payload_data = buffer_data;
  assign io_output_payload_mask = buffer_mask;
  assign io_output_payload_sink = buffer_sink;
  assign io_output_payload_last = buffer_last;
  assign io_input_ready = (((! valid) || canAggregate) || io_output_ready);
  always @(posedge dat2_i_clk) begin
    if(dat2_i_reset) begin
      valid <= 1'b0;
      counter <= 1'b0;
      buffer_last <= 1'b0;
      buffer_mask <= 8'h0;
    end else begin
      if(io_output_fire) begin
        valid <= 1'b0;
        buffer_mask <= 8'h0;
      end
      if(io_input_fire) begin
        valid <= 1'b1;
        if(_zz_2[0]) begin
          buffer_mask[3 : 0] <= io_input_payload_mask;
        end
        if(_zz_2[1]) begin
          buffer_mask[7 : 4] <= io_input_payload_mask;
        end
        buffer_last <= io_input_payload_last;
        counter <= (counterSample + 1'b1);
      end
    end
  end

  always @(posedge dat2_i_clk) begin
    if(io_input_fire) begin
      buffer_sink <= io_input_payload_sink;
      if(_zz_1[0]) begin
        buffer_data[31 : 0] <= io_input_payload_data;
      end
      if(_zz_1[1]) begin
        buffer_data[63 : 32] <= io_input_payload_data;
      end
    end
  end


endmodule

module EfxDMA_StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload_data,
  input      [7:0]    io_push_payload_mask,
  input      [3:0]    io_push_payload_sink,
  input               io_push_payload_last,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload_data,
  output     [7:0]    io_pop_payload_mask,
  output     [3:0]    io_pop_payload_sink,
  output              io_pop_payload_last,
  output     [4:0]    io_pushOccupancy,
  output     [4:0]    io_popOccupancy,
  input               dat0_i_clk,
  input               dat0_i_reset,
  input               clk,
  input               reset
);
  reg        [76:0]   _zz_ram_port1;
  wire       [4:0]    popToPushGray_buffercc_io_dataOut;
  wire       [4:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [4:0]    _zz_pushCC_pushPtrGray;
  wire       [3:0]    _zz_ram_port;
  wire       [76:0]   _zz_ram_port_1;
  wire       [4:0]    _zz_popCC_popPtrGray;
  wire       [3:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [3:0]    _zz__zz_io_pop_payload_data_1;
  wire                _zz__zz_io_pop_payload_data_1_1;
  reg                 _zz_1;
  wire       [4:0]    popToPushGray;
  wire       [4:0]    pushToPopGray;
  reg        [4:0]    pushCC_pushPtr;
  wire       [4:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [4:0]    pushCC_pushPtrGray;
  wire       [4:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  reg        [4:0]    popCC_popPtr;
  wire       [4:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [4:0]    popCC_popPtrGray;
  wire       [4:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [4:0]    _zz_io_pop_payload_data;
  wire       [76:0]   _zz_io_pop_payload_data_1;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  reg [76:0] ram [0:15];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[3:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz__zz_io_pop_payload_data_1 = _zz_io_pop_payload_data[3:0];
  assign _zz_ram_port_1 = {io_push_payload_last,{io_push_payload_sink,{io_push_payload_mask,io_push_payload_data}}};
  assign _zz__zz_io_pop_payload_data_1_1 = 1'b1;
  always @(posedge dat0_i_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_pop_payload_data_1_1) begin
      _zz_ram_port1 <= ram[_zz__zz_io_pop_payload_data_1];
    end
  end

  EfxDMA_BufferCC_3 popToPushGray_buffercc (
    .io_dataIn       (popToPushGray[4:0]                      ), //i
    .io_dataOut      (popToPushGray_buffercc_io_dataOut[4:0]  ), //o
    .dat0_i_clk      (dat0_i_clk                              ), //i
    .dat0_i_reset    (dat0_i_reset                            )  //i
  );
  EfxDMA_BufferCC_4 pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray[4:0]                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut[4:0]  ), //o
    .clk           (clk                                     ), //i
    .reset         (reset                                   )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 5'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[4 : 3] == (~ pushCC_popPtrGray[4 : 3])) && (pushCC_pushPtrGray[2 : 0] == pushCC_popPtrGray[2 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = pushCC_popPtrGray[4];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 5'h01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload_data = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign _zz_io_pop_payload_data_1 = _zz_ram_port1;
  assign io_pop_payload_data = _zz_io_pop_payload_data_1[63 : 0];
  assign io_pop_payload_mask = _zz_io_pop_payload_data_1[71 : 64];
  assign io_pop_payload_sink = _zz_io_pop_payload_data_1[75 : 72];
  assign io_pop_payload_last = _zz_io_pop_payload_data_1[76];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = popCC_pushPtrGray[4];
  assign io_popOccupancy = ({_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge dat0_i_clk) begin
    if(dat0_i_reset) begin
      pushCC_pushPtr <= 5'h0;
      pushCC_pushPtrGray <= 5'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      popCC_popPtr <= 5'h0;
      popCC_popPtrGray <= 5'h0;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module EfxDMA_BmbToAxi4WriteOnlyBridge (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [11:0]   io_input_cmd_payload_fragment_length,
  input      [127:0]  io_input_cmd_payload_fragment_data,
  input      [15:0]   io_input_cmd_payload_fragment_mask,
  input      [14:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [14:0]   io_input_rsp_payload_fragment_context,
  output              io_output_aw_valid,
  input               io_output_aw_ready,
  output     [31:0]   io_output_aw_payload_addr,
  output     [7:0]    io_output_aw_payload_len,
  output     [2:0]    io_output_aw_payload_size,
  output     [3:0]    io_output_aw_payload_cache,
  output     [2:0]    io_output_aw_payload_prot,
  output              io_output_w_valid,
  input               io_output_w_ready,
  output     [127:0]  io_output_w_payload_data,
  output     [15:0]   io_output_w_payload_strb,
  output              io_output_w_payload_last,
  input               io_output_b_valid,
  output              io_output_b_ready,
  input      [1:0]    io_output_b_payload_resp,
  input               clk,
  input               reset
);
  reg        [0:0]    contextRemover_io_output_rsp_payload_fragment_opcode;
  reg                 contextRemover_io_output_cmd_fork_io_outputs_0_ready;
  wire                contextRemover_io_input_cmd_ready;
  wire                contextRemover_io_input_rsp_valid;
  wire                contextRemover_io_input_rsp_payload_last;
  wire       [0:0]    contextRemover_io_input_rsp_payload_fragment_opcode;
  wire       [14:0]   contextRemover_io_input_rsp_payload_fragment_context;
  wire                contextRemover_io_output_cmd_valid;
  wire                contextRemover_io_output_cmd_payload_last;
  wire       [0:0]    contextRemover_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   contextRemover_io_output_cmd_payload_fragment_address;
  wire       [11:0]   contextRemover_io_output_cmd_payload_fragment_length;
  wire       [127:0]  contextRemover_io_output_cmd_payload_fragment_data;
  wire       [15:0]   contextRemover_io_output_cmd_payload_fragment_mask;
  wire                contextRemover_io_output_rsp_ready;
  wire                contextRemover_io_output_cmd_fork_io_input_ready;
  wire                contextRemover_io_output_cmd_fork_io_outputs_0_valid;
  wire                contextRemover_io_output_cmd_fork_io_outputs_0_payload_last;
  wire       [0:0]    contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_opcode;
  wire       [31:0]   contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_address;
  wire       [11:0]   contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_length;
  wire       [127:0]  contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_data;
  wire       [15:0]   contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_mask;
  wire                contextRemover_io_output_cmd_fork_io_outputs_1_valid;
  wire                contextRemover_io_output_cmd_fork_io_outputs_1_payload_last;
  wire       [0:0]    contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_opcode;
  wire       [31:0]   contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_address;
  wire       [11:0]   contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_length;
  wire       [127:0]  contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_data;
  wire       [15:0]   contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_mask;
  wire       [8:0]    _zz_io_output_aw_payload_len;
  wire       [12:0]   _zz_io_output_aw_payload_len_1;
  wire       [12:0]   _zz_io_output_aw_payload_len_2;
  wire       [3:0]    _zz_io_output_aw_payload_len_3;
  wire                contextRemover_io_output_cmd_fire;
  reg                 contextRemover_io_output_cmd_payload_first;
  wire                when_Stream_l408;
  reg                 cmdStage_valid;
  wire                cmdStage_ready;
  wire                cmdStage_payload_last;
  wire       [0:0]    cmdStage_payload_fragment_opcode;
  wire       [31:0]   cmdStage_payload_fragment_address;
  wire       [11:0]   cmdStage_payload_fragment_length;
  wire       [127:0]  cmdStage_payload_fragment_data;
  wire       [15:0]   cmdStage_payload_fragment_mask;
  wire                when_BmbToAxi4Bridge_l293;

  assign _zz_io_output_aw_payload_len = _zz_io_output_aw_payload_len_1[12 : 4];
  assign _zz_io_output_aw_payload_len_1 = ({1'b0,cmdStage_payload_fragment_length} + _zz_io_output_aw_payload_len_2);
  assign _zz_io_output_aw_payload_len_3 = cmdStage_payload_fragment_address[3 : 0];
  assign _zz_io_output_aw_payload_len_2 = {9'd0, _zz_io_output_aw_payload_len_3};
  EfxDMA_BmbContextRemover_1 contextRemover (
    .io_input_cmd_valid                        (io_input_cmd_valid                                           ), //i
    .io_input_cmd_ready                        (contextRemover_io_input_cmd_ready                            ), //o
    .io_input_cmd_payload_last                 (io_input_cmd_payload_last                                    ), //i
    .io_input_cmd_payload_fragment_opcode      (io_input_cmd_payload_fragment_opcode                         ), //i
    .io_input_cmd_payload_fragment_address     (io_input_cmd_payload_fragment_address[31:0]                  ), //i
    .io_input_cmd_payload_fragment_length      (io_input_cmd_payload_fragment_length[11:0]                   ), //i
    .io_input_cmd_payload_fragment_data        (io_input_cmd_payload_fragment_data[127:0]                    ), //i
    .io_input_cmd_payload_fragment_mask        (io_input_cmd_payload_fragment_mask[15:0]                     ), //i
    .io_input_cmd_payload_fragment_context     (io_input_cmd_payload_fragment_context[14:0]                  ), //i
    .io_input_rsp_valid                        (contextRemover_io_input_rsp_valid                            ), //o
    .io_input_rsp_ready                        (io_input_rsp_ready                                           ), //i
    .io_input_rsp_payload_last                 (contextRemover_io_input_rsp_payload_last                     ), //o
    .io_input_rsp_payload_fragment_opcode      (contextRemover_io_input_rsp_payload_fragment_opcode          ), //o
    .io_input_rsp_payload_fragment_context     (contextRemover_io_input_rsp_payload_fragment_context[14:0]   ), //o
    .io_output_cmd_valid                       (contextRemover_io_output_cmd_valid                           ), //o
    .io_output_cmd_ready                       (contextRemover_io_output_cmd_fork_io_input_ready             ), //i
    .io_output_cmd_payload_last                (contextRemover_io_output_cmd_payload_last                    ), //o
    .io_output_cmd_payload_fragment_opcode     (contextRemover_io_output_cmd_payload_fragment_opcode         ), //o
    .io_output_cmd_payload_fragment_address    (contextRemover_io_output_cmd_payload_fragment_address[31:0]  ), //o
    .io_output_cmd_payload_fragment_length     (contextRemover_io_output_cmd_payload_fragment_length[11:0]   ), //o
    .io_output_cmd_payload_fragment_data       (contextRemover_io_output_cmd_payload_fragment_data[127:0]    ), //o
    .io_output_cmd_payload_fragment_mask       (contextRemover_io_output_cmd_payload_fragment_mask[15:0]     ), //o
    .io_output_rsp_valid                       (io_output_b_valid                                            ), //i
    .io_output_rsp_ready                       (contextRemover_io_output_rsp_ready                           ), //o
    .io_output_rsp_payload_last                (1'b1                                                         ), //i
    .io_output_rsp_payload_fragment_opcode     (contextRemover_io_output_rsp_payload_fragment_opcode         ), //i
    .clk                                       (clk                                                          ), //i
    .reset                                     (reset                                                        )  //i
  );
  EfxDMA_StreamFork_2 contextRemover_io_output_cmd_fork (
    .io_input_valid                           (contextRemover_io_output_cmd_valid                                             ), //i
    .io_input_ready                           (contextRemover_io_output_cmd_fork_io_input_ready                               ), //o
    .io_input_payload_last                    (contextRemover_io_output_cmd_payload_last                                      ), //i
    .io_input_payload_fragment_opcode         (contextRemover_io_output_cmd_payload_fragment_opcode                           ), //i
    .io_input_payload_fragment_address        (contextRemover_io_output_cmd_payload_fragment_address[31:0]                    ), //i
    .io_input_payload_fragment_length         (contextRemover_io_output_cmd_payload_fragment_length[11:0]                     ), //i
    .io_input_payload_fragment_data           (contextRemover_io_output_cmd_payload_fragment_data[127:0]                      ), //i
    .io_input_payload_fragment_mask           (contextRemover_io_output_cmd_payload_fragment_mask[15:0]                       ), //i
    .io_outputs_0_valid                       (contextRemover_io_output_cmd_fork_io_outputs_0_valid                           ), //o
    .io_outputs_0_ready                       (contextRemover_io_output_cmd_fork_io_outputs_0_ready                           ), //i
    .io_outputs_0_payload_last                (contextRemover_io_output_cmd_fork_io_outputs_0_payload_last                    ), //o
    .io_outputs_0_payload_fragment_opcode     (contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_opcode         ), //o
    .io_outputs_0_payload_fragment_address    (contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_address[31:0]  ), //o
    .io_outputs_0_payload_fragment_length     (contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_length[11:0]   ), //o
    .io_outputs_0_payload_fragment_data       (contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_data[127:0]    ), //o
    .io_outputs_0_payload_fragment_mask       (contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_mask[15:0]     ), //o
    .io_outputs_1_valid                       (contextRemover_io_output_cmd_fork_io_outputs_1_valid                           ), //o
    .io_outputs_1_ready                       (io_output_w_ready                                                              ), //i
    .io_outputs_1_payload_last                (contextRemover_io_output_cmd_fork_io_outputs_1_payload_last                    ), //o
    .io_outputs_1_payload_fragment_opcode     (contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_opcode         ), //o
    .io_outputs_1_payload_fragment_address    (contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_address[31:0]  ), //o
    .io_outputs_1_payload_fragment_length     (contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_length[11:0]   ), //o
    .io_outputs_1_payload_fragment_data       (contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_data[127:0]    ), //o
    .io_outputs_1_payload_fragment_mask       (contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_mask[15:0]     ), //o
    .clk                                      (clk                                                                            ), //i
    .reset                                    (reset                                                                          )  //i
  );
  assign io_input_cmd_ready = contextRemover_io_input_cmd_ready;
  assign io_input_rsp_valid = contextRemover_io_input_rsp_valid;
  assign io_input_rsp_payload_last = contextRemover_io_input_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = contextRemover_io_input_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_context = contextRemover_io_input_rsp_payload_fragment_context;
  assign contextRemover_io_output_cmd_fire = (contextRemover_io_output_cmd_valid && contextRemover_io_output_cmd_fork_io_input_ready);
  assign when_Stream_l408 = (! contextRemover_io_output_cmd_payload_first);
  always @(*) begin
    cmdStage_valid = contextRemover_io_output_cmd_fork_io_outputs_0_valid;
    if(when_Stream_l408) begin
      cmdStage_valid = 1'b0;
    end
  end

  always @(*) begin
    contextRemover_io_output_cmd_fork_io_outputs_0_ready = cmdStage_ready;
    if(when_Stream_l408) begin
      contextRemover_io_output_cmd_fork_io_outputs_0_ready = 1'b1;
    end
  end

  assign cmdStage_payload_last = contextRemover_io_output_cmd_fork_io_outputs_0_payload_last;
  assign cmdStage_payload_fragment_opcode = contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_opcode;
  assign cmdStage_payload_fragment_address = contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_address;
  assign cmdStage_payload_fragment_length = contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_length;
  assign cmdStage_payload_fragment_data = contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_data;
  assign cmdStage_payload_fragment_mask = contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_mask;
  assign io_output_aw_valid = cmdStage_valid;
  assign cmdStage_ready = io_output_aw_ready;
  assign io_output_aw_payload_addr = cmdStage_payload_fragment_address;
  assign io_output_aw_payload_len = _zz_io_output_aw_payload_len[7:0];
  assign io_output_aw_payload_size = 3'b100;
  assign io_output_aw_payload_prot = 3'b010;
  assign io_output_aw_payload_cache = 4'b1111;
  assign io_output_w_valid = contextRemover_io_output_cmd_fork_io_outputs_1_valid;
  assign io_output_w_payload_data = contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_data;
  assign io_output_w_payload_strb = contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_mask;
  assign io_output_w_payload_last = contextRemover_io_output_cmd_fork_io_outputs_1_payload_last;
  assign io_output_b_ready = contextRemover_io_output_rsp_ready;
  assign when_BmbToAxi4Bridge_l293 = (io_output_b_payload_resp == 2'b00);
  always @(*) begin
    if(when_BmbToAxi4Bridge_l293) begin
      contextRemover_io_output_rsp_payload_fragment_opcode = 1'b0;
    end else begin
      contextRemover_io_output_rsp_payload_fragment_opcode = 1'b1;
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      contextRemover_io_output_cmd_payload_first <= 1'b1;
    end else begin
      if(contextRemover_io_output_cmd_fire) begin
        contextRemover_io_output_cmd_payload_first <= contextRemover_io_output_cmd_payload_last;
      end
    end
  end


endmodule

module EfxDMA_BmbWriteRetainer (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [11:0]   io_input_cmd_payload_fragment_length,
  input      [127:0]  io_input_cmd_payload_fragment_data,
  input      [15:0]   io_input_cmd_payload_fragment_mask,
  input      [14:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [14:0]   io_input_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [31:0]   io_output_cmd_payload_fragment_address,
  output     [11:0]   io_output_cmd_payload_fragment_length,
  output     [127:0]  io_output_cmd_payload_fragment_data,
  output     [15:0]   io_output_cmd_payload_fragment_mask,
  output     [14:0]   io_output_cmd_payload_fragment_context,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input      [14:0]   io_output_rsp_payload_fragment_context,
  input               clk,
  input               reset
);
  reg                 io_input_cmd_fifo_io_pop_ready;
  wire                io_input_cmd_fifo_io_push_ready;
  wire                io_input_cmd_fifo_io_pop_valid;
  wire                io_input_cmd_fifo_io_pop_payload_last;
  wire       [0:0]    io_input_cmd_fifo_io_pop_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fifo_io_pop_payload_fragment_address;
  wire       [11:0]   io_input_cmd_fifo_io_pop_payload_fragment_length;
  wire       [127:0]  io_input_cmd_fifo_io_pop_payload_fragment_data;
  wire       [15:0]   io_input_cmd_fifo_io_pop_payload_fragment_mask;
  wire       [14:0]   io_input_cmd_fifo_io_pop_payload_fragment_context;
  wire       [8:0]    io_input_cmd_fifo_io_occupancy;
  wire       [8:0]    io_input_cmd_fifo_io_availability;
  wire                cmdBuffer_valid;
  wire                cmdBuffer_ready;
  wire                cmdBuffer_payload_last;
  wire       [0:0]    cmdBuffer_payload_fragment_opcode;
  wire       [31:0]   cmdBuffer_payload_fragment_address;
  wire       [11:0]   cmdBuffer_payload_fragment_length;
  wire       [127:0]  cmdBuffer_payload_fragment_data;
  wire       [15:0]   cmdBuffer_payload_fragment_mask;
  wire       [14:0]   cmdBuffer_payload_fragment_context;
  reg                 io_input_cmd_fifo_io_pop_rValid;
  reg                 io_input_cmd_fifo_io_pop_rData_last;
  reg        [0:0]    io_input_cmd_fifo_io_pop_rData_fragment_opcode;
  reg        [31:0]   io_input_cmd_fifo_io_pop_rData_fragment_address;
  reg        [11:0]   io_input_cmd_fifo_io_pop_rData_fragment_length;
  reg        [127:0]  io_input_cmd_fifo_io_pop_rData_fragment_data;
  reg        [15:0]   io_input_cmd_fifo_io_pop_rData_fragment_mask;
  reg        [14:0]   io_input_cmd_fifo_io_pop_rData_fragment_context;
  wire                when_Stream_l342;
  wire                io_input_cmd_fire;
  wire                when_Utils_l466;
  wire                cmdBuffer_fire;
  wire                when_Utils_l469;
  reg                 tocken_incrementIt;
  reg                 tocken_decrementIt;
  wire       [7:0]    tocken_valueNext;
  reg        [7:0]    tocken_value;
  wire                tocken_willOverflowIfInc;
  wire                tocken_willOverflow;
  reg        [7:0]    tocken_finalIncrement;
  wire                when_Utils_l494;
  wire                when_Utils_l496;
  wire                cmdBuffer_fire_1;
  reg                 cmdBuffer_payload_first;
  wire                halt;
  wire                _zz_io_output_cmd_valid;

  EfxDMA_StreamFifo_2 io_input_cmd_fifo (
    .io_push_valid                       (io_input_cmd_valid                                       ), //i
    .io_push_ready                       (io_input_cmd_fifo_io_push_ready                          ), //o
    .io_push_payload_last                (io_input_cmd_payload_last                                ), //i
    .io_push_payload_fragment_opcode     (io_input_cmd_payload_fragment_opcode                     ), //i
    .io_push_payload_fragment_address    (io_input_cmd_payload_fragment_address[31:0]              ), //i
    .io_push_payload_fragment_length     (io_input_cmd_payload_fragment_length[11:0]               ), //i
    .io_push_payload_fragment_data       (io_input_cmd_payload_fragment_data[127:0]                ), //i
    .io_push_payload_fragment_mask       (io_input_cmd_payload_fragment_mask[15:0]                 ), //i
    .io_push_payload_fragment_context    (io_input_cmd_payload_fragment_context[14:0]              ), //i
    .io_pop_valid                        (io_input_cmd_fifo_io_pop_valid                           ), //o
    .io_pop_ready                        (io_input_cmd_fifo_io_pop_ready                           ), //i
    .io_pop_payload_last                 (io_input_cmd_fifo_io_pop_payload_last                    ), //o
    .io_pop_payload_fragment_opcode      (io_input_cmd_fifo_io_pop_payload_fragment_opcode         ), //o
    .io_pop_payload_fragment_address     (io_input_cmd_fifo_io_pop_payload_fragment_address[31:0]  ), //o
    .io_pop_payload_fragment_length      (io_input_cmd_fifo_io_pop_payload_fragment_length[11:0]   ), //o
    .io_pop_payload_fragment_data        (io_input_cmd_fifo_io_pop_payload_fragment_data[127:0]    ), //o
    .io_pop_payload_fragment_mask        (io_input_cmd_fifo_io_pop_payload_fragment_mask[15:0]     ), //o
    .io_pop_payload_fragment_context     (io_input_cmd_fifo_io_pop_payload_fragment_context[14:0]  ), //o
    .io_flush                            (1'b0                                                     ), //i
    .io_occupancy                        (io_input_cmd_fifo_io_occupancy[8:0]                      ), //o
    .io_availability                     (io_input_cmd_fifo_io_availability[8:0]                   ), //o
    .clk                                 (clk                                                      ), //i
    .reset                               (reset                                                    )  //i
  );
  assign io_input_cmd_ready = io_input_cmd_fifo_io_push_ready;
  always @(*) begin
    io_input_cmd_fifo_io_pop_ready = cmdBuffer_ready;
    if(when_Stream_l342) begin
      io_input_cmd_fifo_io_pop_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! cmdBuffer_valid);
  assign cmdBuffer_valid = io_input_cmd_fifo_io_pop_rValid;
  assign cmdBuffer_payload_last = io_input_cmd_fifo_io_pop_rData_last;
  assign cmdBuffer_payload_fragment_opcode = io_input_cmd_fifo_io_pop_rData_fragment_opcode;
  assign cmdBuffer_payload_fragment_address = io_input_cmd_fifo_io_pop_rData_fragment_address;
  assign cmdBuffer_payload_fragment_length = io_input_cmd_fifo_io_pop_rData_fragment_length;
  assign cmdBuffer_payload_fragment_data = io_input_cmd_fifo_io_pop_rData_fragment_data;
  assign cmdBuffer_payload_fragment_mask = io_input_cmd_fifo_io_pop_rData_fragment_mask;
  assign cmdBuffer_payload_fragment_context = io_input_cmd_fifo_io_pop_rData_fragment_context;
  assign io_input_cmd_fire = (io_input_cmd_valid && io_input_cmd_ready);
  assign when_Utils_l466 = (io_input_cmd_fire && io_input_cmd_payload_last);
  assign cmdBuffer_fire = (cmdBuffer_valid && cmdBuffer_ready);
  assign when_Utils_l469 = (cmdBuffer_fire && cmdBuffer_payload_last);
  always @(*) begin
    tocken_incrementIt = 1'b0;
    if(when_Utils_l466) begin
      tocken_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    tocken_decrementIt = 1'b0;
    if(when_Utils_l469) begin
      tocken_decrementIt = 1'b1;
    end
  end

  assign tocken_willOverflowIfInc = ((tocken_value == 8'hff) && (! tocken_decrementIt));
  assign tocken_willOverflow = (tocken_willOverflowIfInc && tocken_incrementIt);
  assign when_Utils_l494 = (tocken_incrementIt && (! tocken_decrementIt));
  always @(*) begin
    if(when_Utils_l494) begin
      tocken_finalIncrement = 8'h01;
    end else begin
      if(when_Utils_l496) begin
        tocken_finalIncrement = 8'hff;
      end else begin
        tocken_finalIncrement = 8'h0;
      end
    end
  end

  assign when_Utils_l496 = ((! tocken_incrementIt) && tocken_decrementIt);
  assign tocken_valueNext = (tocken_value + tocken_finalIncrement);
  assign cmdBuffer_fire_1 = (cmdBuffer_valid && cmdBuffer_ready);
  assign halt = (cmdBuffer_payload_first && (tocken_value == 8'h0));
  assign _zz_io_output_cmd_valid = (! halt);
  assign cmdBuffer_ready = (io_output_cmd_ready && _zz_io_output_cmd_valid);
  assign io_output_cmd_valid = (cmdBuffer_valid && _zz_io_output_cmd_valid);
  assign io_output_cmd_payload_last = cmdBuffer_payload_last;
  assign io_output_cmd_payload_fragment_opcode = cmdBuffer_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = cmdBuffer_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = cmdBuffer_payload_fragment_length;
  assign io_output_cmd_payload_fragment_data = cmdBuffer_payload_fragment_data;
  assign io_output_cmd_payload_fragment_mask = cmdBuffer_payload_fragment_mask;
  assign io_output_cmd_payload_fragment_context = cmdBuffer_payload_fragment_context;
  assign io_input_rsp_valid = io_output_rsp_valid;
  assign io_output_rsp_ready = io_input_rsp_ready;
  assign io_input_rsp_payload_last = io_output_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_context = io_output_rsp_payload_fragment_context;
  always @(posedge clk) begin
    if(reset) begin
      io_input_cmd_fifo_io_pop_rValid <= 1'b0;
      tocken_value <= 8'h0;
      cmdBuffer_payload_first <= 1'b1;
    end else begin
      if(io_input_cmd_fifo_io_pop_ready) begin
        io_input_cmd_fifo_io_pop_rValid <= io_input_cmd_fifo_io_pop_valid;
      end
      tocken_value <= tocken_valueNext;
      if(cmdBuffer_fire_1) begin
        cmdBuffer_payload_first <= cmdBuffer_payload_last;
      end
    end
  end

  always @(posedge clk) begin
    if(io_input_cmd_fifo_io_pop_ready) begin
      io_input_cmd_fifo_io_pop_rData_last <= io_input_cmd_fifo_io_pop_payload_last;
      io_input_cmd_fifo_io_pop_rData_fragment_opcode <= io_input_cmd_fifo_io_pop_payload_fragment_opcode;
      io_input_cmd_fifo_io_pop_rData_fragment_address <= io_input_cmd_fifo_io_pop_payload_fragment_address;
      io_input_cmd_fifo_io_pop_rData_fragment_length <= io_input_cmd_fifo_io_pop_payload_fragment_length;
      io_input_cmd_fifo_io_pop_rData_fragment_data <= io_input_cmd_fifo_io_pop_payload_fragment_data;
      io_input_cmd_fifo_io_pop_rData_fragment_mask <= io_input_cmd_fifo_io_pop_payload_fragment_mask;
      io_input_cmd_fifo_io_pop_rData_fragment_context <= io_input_cmd_fifo_io_pop_payload_fragment_context;
    end
  end


endmodule

module EfxDMA_BmbSourceRemover_1 (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_source,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [11:0]   io_input_cmd_payload_fragment_length,
  input      [127:0]  io_input_cmd_payload_fragment_data,
  input      [15:0]   io_input_cmd_payload_fragment_mask,
  input      [13:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_source,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [13:0]   io_input_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [31:0]   io_output_cmd_payload_fragment_address,
  output     [11:0]   io_output_cmd_payload_fragment_length,
  output     [127:0]  io_output_cmd_payload_fragment_data,
  output     [15:0]   io_output_cmd_payload_fragment_mask,
  output     [14:0]   io_output_cmd_payload_fragment_context,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input      [14:0]   io_output_rsp_payload_fragment_context
);
  wire       [0:0]    cmdContext_source;
  wire       [13:0]   cmdContext_context;
  wire       [0:0]    rspContext_source;
  wire       [13:0]   rspContext_context;
  wire       [14:0]   _zz_rspContext_source;

  assign cmdContext_source = io_input_cmd_payload_fragment_source;
  assign cmdContext_context = io_input_cmd_payload_fragment_context;
  assign io_output_cmd_valid = io_input_cmd_valid;
  assign io_input_cmd_ready = io_output_cmd_ready;
  assign io_output_cmd_payload_last = io_input_cmd_payload_last;
  assign io_output_cmd_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign io_output_cmd_payload_fragment_data = io_input_cmd_payload_fragment_data;
  assign io_output_cmd_payload_fragment_mask = io_input_cmd_payload_fragment_mask;
  assign io_output_cmd_payload_fragment_context = {cmdContext_context,cmdContext_source};
  assign _zz_rspContext_source = io_output_rsp_payload_fragment_context;
  assign rspContext_source = _zz_rspContext_source[0 : 0];
  assign rspContext_context = _zz_rspContext_source[14 : 1];
  assign io_input_rsp_valid = io_output_rsp_valid;
  assign io_output_rsp_ready = io_input_rsp_ready;
  assign io_input_rsp_payload_last = io_output_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_source = rspContext_source;
  assign io_input_rsp_payload_fragment_context = rspContext_context;

endmodule

module EfxDMA_StreamFifo_3 (
  input               io_push_valid,
  output              io_push_ready,
  input      [127:0]  io_push_payload_data,
  input      [1:0]    io_push_payload_resp,
  input               io_push_payload_last,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [127:0]  io_pop_payload_data,
  output     [1:0]    io_pop_payload_resp,
  output              io_pop_payload_last,
  input               io_flush,
  output     [8:0]    io_occupancy,
  output     [8:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [130:0]  _zz_logic_ram_port0;
  wire       [7:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [7:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz__zz_io_pop_payload_data;
  wire       [130:0]  _zz_logic_ram_port_1;
  wire       [7:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [7:0]    logic_pushPtr_valueNext;
  reg        [7:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [7:0]    logic_popPtr_valueNext;
  reg        [7:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire       [130:0]  _zz_io_pop_payload_data;
  wire                when_Stream_l933;
  wire       [7:0]    logic_ptrDif;
  reg [130:0] logic_ram [0:255];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {7'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {7'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz__zz_io_pop_payload_data = 1'b1;
  assign _zz_logic_ram_port_1 = {io_push_payload_last,{io_push_payload_resp,io_push_payload_data}};
  always @(posedge clk) begin
    if(_zz__zz_io_pop_payload_data) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 8'hff);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 8'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 8'hff);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 8'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign _zz_io_pop_payload_data = _zz_logic_ram_port0;
  assign io_pop_payload_data = _zz_io_pop_payload_data[127 : 0];
  assign io_pop_payload_resp = _zz_io_pop_payload_data[129 : 128];
  assign io_pop_payload_last = _zz_io_pop_payload_data[130];
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk) begin
    if(reset) begin
      logic_pushPtr_value <= 8'h0;
      logic_popPtr_value <= 8'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module EfxDMA_BmbToAxi4ReadOnlyBridge (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [11:0]   io_input_cmd_payload_fragment_length,
  input      [22:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [127:0]  io_input_rsp_payload_fragment_data,
  output     [22:0]   io_input_rsp_payload_fragment_context,
  output              io_output_ar_valid,
  input               io_output_ar_ready,
  output     [31:0]   io_output_ar_payload_addr,
  output     [7:0]    io_output_ar_payload_len,
  output     [2:0]    io_output_ar_payload_size,
  output     [3:0]    io_output_ar_payload_cache,
  output     [2:0]    io_output_ar_payload_prot,
  input               io_output_r_valid,
  output              io_output_r_ready,
  input      [127:0]  io_output_r_payload_data,
  input      [1:0]    io_output_r_payload_resp,
  input               io_output_r_payload_last,
  input               clk,
  input               reset
);
  reg        [0:0]    contextRemover_io_output_rsp_payload_fragment_opcode;
  wire                contextRemover_io_input_cmd_ready;
  wire                contextRemover_io_input_rsp_valid;
  wire                contextRemover_io_input_rsp_payload_last;
  wire       [0:0]    contextRemover_io_input_rsp_payload_fragment_opcode;
  wire       [127:0]  contextRemover_io_input_rsp_payload_fragment_data;
  wire       [22:0]   contextRemover_io_input_rsp_payload_fragment_context;
  wire                contextRemover_io_output_cmd_valid;
  wire                contextRemover_io_output_cmd_payload_last;
  wire       [0:0]    contextRemover_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   contextRemover_io_output_cmd_payload_fragment_address;
  wire       [11:0]   contextRemover_io_output_cmd_payload_fragment_length;
  wire                contextRemover_io_output_rsp_ready;
  wire       [8:0]    _zz_io_output_ar_payload_len;
  wire       [12:0]   _zz_io_output_ar_payload_len_1;
  wire       [12:0]   _zz_io_output_ar_payload_len_2;
  wire       [3:0]    _zz_io_output_ar_payload_len_3;
  wire                when_BmbToAxi4Bridge_l239;

  assign _zz_io_output_ar_payload_len = _zz_io_output_ar_payload_len_1[12 : 4];
  assign _zz_io_output_ar_payload_len_1 = ({1'b0,contextRemover_io_output_cmd_payload_fragment_length} + _zz_io_output_ar_payload_len_2);
  assign _zz_io_output_ar_payload_len_3 = contextRemover_io_output_cmd_payload_fragment_address[3 : 0];
  assign _zz_io_output_ar_payload_len_2 = {9'd0, _zz_io_output_ar_payload_len_3};
  EfxDMA_BmbContextRemover contextRemover (
    .io_input_cmd_valid                        (io_input_cmd_valid                                           ), //i
    .io_input_cmd_ready                        (contextRemover_io_input_cmd_ready                            ), //o
    .io_input_cmd_payload_last                 (io_input_cmd_payload_last                                    ), //i
    .io_input_cmd_payload_fragment_opcode      (io_input_cmd_payload_fragment_opcode                         ), //i
    .io_input_cmd_payload_fragment_address     (io_input_cmd_payload_fragment_address[31:0]                  ), //i
    .io_input_cmd_payload_fragment_length      (io_input_cmd_payload_fragment_length[11:0]                   ), //i
    .io_input_cmd_payload_fragment_context     (io_input_cmd_payload_fragment_context[22:0]                  ), //i
    .io_input_rsp_valid                        (contextRemover_io_input_rsp_valid                            ), //o
    .io_input_rsp_ready                        (io_input_rsp_ready                                           ), //i
    .io_input_rsp_payload_last                 (contextRemover_io_input_rsp_payload_last                     ), //o
    .io_input_rsp_payload_fragment_opcode      (contextRemover_io_input_rsp_payload_fragment_opcode          ), //o
    .io_input_rsp_payload_fragment_data        (contextRemover_io_input_rsp_payload_fragment_data[127:0]     ), //o
    .io_input_rsp_payload_fragment_context     (contextRemover_io_input_rsp_payload_fragment_context[22:0]   ), //o
    .io_output_cmd_valid                       (contextRemover_io_output_cmd_valid                           ), //o
    .io_output_cmd_ready                       (io_output_ar_ready                                           ), //i
    .io_output_cmd_payload_last                (contextRemover_io_output_cmd_payload_last                    ), //o
    .io_output_cmd_payload_fragment_opcode     (contextRemover_io_output_cmd_payload_fragment_opcode         ), //o
    .io_output_cmd_payload_fragment_address    (contextRemover_io_output_cmd_payload_fragment_address[31:0]  ), //o
    .io_output_cmd_payload_fragment_length     (contextRemover_io_output_cmd_payload_fragment_length[11:0]   ), //o
    .io_output_rsp_valid                       (io_output_r_valid                                            ), //i
    .io_output_rsp_ready                       (contextRemover_io_output_rsp_ready                           ), //o
    .io_output_rsp_payload_last                (io_output_r_payload_last                                     ), //i
    .io_output_rsp_payload_fragment_opcode     (contextRemover_io_output_rsp_payload_fragment_opcode         ), //i
    .io_output_rsp_payload_fragment_data       (io_output_r_payload_data[127:0]                              ), //i
    .clk                                       (clk                                                          ), //i
    .reset                                     (reset                                                        )  //i
  );
  assign io_input_cmd_ready = contextRemover_io_input_cmd_ready;
  assign io_input_rsp_valid = contextRemover_io_input_rsp_valid;
  assign io_input_rsp_payload_last = contextRemover_io_input_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = contextRemover_io_input_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_data = contextRemover_io_input_rsp_payload_fragment_data;
  assign io_input_rsp_payload_fragment_context = contextRemover_io_input_rsp_payload_fragment_context;
  assign io_output_ar_valid = contextRemover_io_output_cmd_valid;
  assign io_output_ar_payload_addr = contextRemover_io_output_cmd_payload_fragment_address;
  assign io_output_ar_payload_len = _zz_io_output_ar_payload_len[7:0];
  assign io_output_ar_payload_size = 3'b100;
  assign io_output_ar_payload_prot = 3'b010;
  assign io_output_ar_payload_cache = 4'b1111;
  assign io_output_r_ready = contextRemover_io_output_rsp_ready;
  assign when_BmbToAxi4Bridge_l239 = (io_output_r_payload_resp == 2'b00);
  always @(*) begin
    if(when_BmbToAxi4Bridge_l239) begin
      contextRemover_io_output_rsp_payload_fragment_opcode = 1'b0;
    end else begin
      contextRemover_io_output_rsp_payload_fragment_opcode = 1'b1;
    end
  end


endmodule

module EfxDMA_BmbSourceRemover (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_source,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [11:0]   io_input_cmd_payload_fragment_length,
  input      [21:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_source,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [127:0]  io_input_rsp_payload_fragment_data,
  output     [21:0]   io_input_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [31:0]   io_output_cmd_payload_fragment_address,
  output     [11:0]   io_output_cmd_payload_fragment_length,
  output     [22:0]   io_output_cmd_payload_fragment_context,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input      [127:0]  io_output_rsp_payload_fragment_data,
  input      [22:0]   io_output_rsp_payload_fragment_context
);
  wire       [0:0]    cmdContext_source;
  wire       [21:0]   cmdContext_context;
  wire       [0:0]    rspContext_source;
  wire       [21:0]   rspContext_context;
  wire       [22:0]   _zz_rspContext_source;

  assign cmdContext_source = io_input_cmd_payload_fragment_source;
  assign cmdContext_context = io_input_cmd_payload_fragment_context;
  assign io_output_cmd_valid = io_input_cmd_valid;
  assign io_input_cmd_ready = io_output_cmd_ready;
  assign io_output_cmd_payload_last = io_input_cmd_payload_last;
  assign io_output_cmd_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign io_output_cmd_payload_fragment_context = {cmdContext_context,cmdContext_source};
  assign _zz_rspContext_source = io_output_rsp_payload_fragment_context;
  assign rspContext_source = _zz_rspContext_source[0 : 0];
  assign rspContext_context = _zz_rspContext_source[22 : 1];
  assign io_input_rsp_valid = io_output_rsp_valid;
  assign io_output_rsp_ready = io_input_rsp_ready;
  assign io_input_rsp_payload_last = io_output_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_input_rsp_payload_fragment_source = rspContext_source;
  assign io_input_rsp_payload_fragment_context = rspContext_context;

endmodule

module EfxDMA_BufferCC_11 (
  input      [3:0]    io_dataIn,
  output     [3:0]    io_dataOut,
  input               ctrl_clk,
  input               ctrl_reset
);
  (* async_reg = "true" *) reg        [3:0]    buffers_0;
  (* async_reg = "true" *) reg        [3:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge ctrl_clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module EfxDMA_Apb3CC (
  input      [13:0]   io_input_PADDR,
  input      [0:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output              io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output              io_input_PSLVERROR,
  output     [13:0]   io_output_PADDR,
  output reg [0:0]    io_output_PSEL,
  output reg          io_output_PENABLE,
  input               io_output_PREADY,
  output              io_output_PWRITE,
  output     [31:0]   io_output_PWDATA,
  input      [31:0]   io_output_PRDATA,
  input               io_output_PSLVERROR,
  input               ctrl_clk,
  input               ctrl_reset,
  input               clk,
  input               reset
);
  reg                 streamCCByToggle_io_output_ready;
  wire                streamCCByToggle_io_input_ready;
  wire                streamCCByToggle_io_output_valid;
  wire       [13:0]   streamCCByToggle_io_output_payload_PADDR;
  wire                streamCCByToggle_io_output_payload_PWRITE;
  wire       [31:0]   streamCCByToggle_io_output_payload_PWDATA;
  wire                flowCCByToggle_io_output_valid;
  wire       [31:0]   flowCCByToggle_io_output_payload_PRDATA;
  wire                flowCCByToggle_io_output_payload_PSLVERROR;
  wire                inputLogic_inputCmd_valid;
  wire                inputLogic_inputCmd_ready;
  wire       [13:0]   inputLogic_inputCmd_payload_PADDR;
  wire                inputLogic_inputCmd_payload_PWRITE;
  wire       [31:0]   inputLogic_inputCmd_payload_PWDATA;
  wire                inputLogic_inputRsp_valid;
  wire       [31:0]   inputLogic_inputRsp_payload_PRDATA;
  wire                inputLogic_inputRsp_payload_PSLVERROR;
  reg                 inputLogic_state;
  wire                inputLogic_inputCmd_fire;
  reg                 outputLogic_state;
  wire                when_Apb3CCToggle_l180;
  wire                outputLogic_outputRsp_valid;
  wire       [31:0]   outputLogic_outputRsp_payload_PRDATA;
  wire                outputLogic_outputRsp_payload_PSLVERROR;
  wire                streamCCByToggle_io_output_fire;

  EfxDMA_StreamCCByToggle streamCCByToggle (
    .io_input_valid              (inputLogic_inputCmd_valid                        ), //i
    .io_input_ready              (streamCCByToggle_io_input_ready                  ), //o
    .io_input_payload_PADDR      (inputLogic_inputCmd_payload_PADDR[13:0]          ), //i
    .io_input_payload_PWRITE     (inputLogic_inputCmd_payload_PWRITE               ), //i
    .io_input_payload_PWDATA     (inputLogic_inputCmd_payload_PWDATA[31:0]         ), //i
    .io_output_valid             (streamCCByToggle_io_output_valid                 ), //o
    .io_output_ready             (streamCCByToggle_io_output_ready                 ), //i
    .io_output_payload_PADDR     (streamCCByToggle_io_output_payload_PADDR[13:0]   ), //o
    .io_output_payload_PWRITE    (streamCCByToggle_io_output_payload_PWRITE        ), //o
    .io_output_payload_PWDATA    (streamCCByToggle_io_output_payload_PWDATA[31:0]  ), //o
    .ctrl_clk                    (ctrl_clk                                         ), //i
    .ctrl_reset                  (ctrl_reset                                       ), //i
    .clk                         (clk                                              ), //i
    .reset                       (reset                                            )  //i
  );
  EfxDMA_FlowCCByToggle flowCCByToggle (
    .io_input_valid                 (outputLogic_outputRsp_valid                    ), //i
    .io_input_payload_PRDATA        (outputLogic_outputRsp_payload_PRDATA[31:0]     ), //i
    .io_input_payload_PSLVERROR     (outputLogic_outputRsp_payload_PSLVERROR        ), //i
    .io_output_valid                (flowCCByToggle_io_output_valid                 ), //o
    .io_output_payload_PRDATA       (flowCCByToggle_io_output_payload_PRDATA[31:0]  ), //o
    .io_output_payload_PSLVERROR    (flowCCByToggle_io_output_payload_PSLVERROR     ), //o
    .clk                            (clk                                            ), //i
    .reset                          (reset                                          ), //i
    .ctrl_clk                       (ctrl_clk                                       ), //i
    .ctrl_reset                     (ctrl_reset                                     )  //i
  );
  assign inputLogic_inputCmd_fire = (inputLogic_inputCmd_valid && inputLogic_inputCmd_ready);
  assign inputLogic_inputCmd_valid = ((io_input_PSEL[0] && io_input_PENABLE) && (! inputLogic_state));
  assign inputLogic_inputCmd_payload_PADDR = io_input_PADDR;
  assign inputLogic_inputCmd_payload_PWRITE = io_input_PWRITE;
  assign inputLogic_inputCmd_payload_PWDATA = io_input_PWDATA;
  assign io_input_PREADY = inputLogic_inputRsp_valid;
  assign io_input_PRDATA = inputLogic_inputRsp_payload_PRDATA;
  assign io_input_PSLVERROR = inputLogic_inputRsp_payload_PSLVERROR;
  assign inputLogic_inputCmd_ready = streamCCByToggle_io_input_ready;
  always @(*) begin
    io_output_PENABLE = 1'b0;
    if(streamCCByToggle_io_output_valid) begin
      if(when_Apb3CCToggle_l180) begin
        io_output_PENABLE = 1'b0;
      end else begin
        io_output_PENABLE = 1'b1;
      end
    end
  end

  always @(*) begin
    io_output_PSEL = 1'b0;
    if(streamCCByToggle_io_output_valid) begin
      io_output_PSEL = 1'b1;
    end
  end

  assign io_output_PADDR = streamCCByToggle_io_output_payload_PADDR;
  assign io_output_PWDATA = streamCCByToggle_io_output_payload_PWDATA;
  assign io_output_PWRITE = streamCCByToggle_io_output_payload_PWRITE;
  always @(*) begin
    streamCCByToggle_io_output_ready = 1'b0;
    if(streamCCByToggle_io_output_valid) begin
      if(!when_Apb3CCToggle_l180) begin
        if(io_output_PREADY) begin
          streamCCByToggle_io_output_ready = 1'b1;
        end
      end
    end
  end

  assign when_Apb3CCToggle_l180 = (! outputLogic_state);
  assign streamCCByToggle_io_output_fire = (streamCCByToggle_io_output_valid && streamCCByToggle_io_output_ready);
  assign outputLogic_outputRsp_valid = streamCCByToggle_io_output_fire;
  assign outputLogic_outputRsp_payload_PRDATA = io_output_PRDATA;
  assign outputLogic_outputRsp_payload_PSLVERROR = io_output_PSLVERROR;
  assign inputLogic_inputRsp_valid = flowCCByToggle_io_output_valid;
  assign inputLogic_inputRsp_payload_PRDATA = flowCCByToggle_io_output_payload_PRDATA;
  assign inputLogic_inputRsp_payload_PSLVERROR = flowCCByToggle_io_output_payload_PSLVERROR;
  always @(posedge ctrl_clk) begin
    if(ctrl_reset) begin
      inputLogic_state <= 1'b0;
    end else begin
      if(inputLogic_inputCmd_fire) begin
        inputLogic_state <= 1'b1;
      end
      if(inputLogic_inputRsp_valid) begin
        inputLogic_state <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      outputLogic_state <= 1'b0;
    end else begin
      if(streamCCByToggle_io_output_valid) begin
        if(when_Apb3CCToggle_l180) begin
          outputLogic_state <= 1'b1;
        end else begin
          if(io_output_PREADY) begin
            outputLogic_state <= 1'b0;
          end
        end
      end
    end
  end


endmodule

module EfxDMA_Core (
  output reg          io_read_cmd_valid,
  input               io_read_cmd_ready,
  output              io_read_cmd_payload_last,
  output     [0:0]    io_read_cmd_payload_fragment_source,
  output     [0:0]    io_read_cmd_payload_fragment_opcode,
  output     [31:0]   io_read_cmd_payload_fragment_address,
  output     [11:0]   io_read_cmd_payload_fragment_length,
  output     [21:0]   io_read_cmd_payload_fragment_context,
  input               io_read_rsp_valid,
  output              io_read_rsp_ready,
  input               io_read_rsp_payload_last,
  input      [0:0]    io_read_rsp_payload_fragment_source,
  input      [0:0]    io_read_rsp_payload_fragment_opcode,
  input      [127:0]  io_read_rsp_payload_fragment_data,
  input      [21:0]   io_read_rsp_payload_fragment_context,
  output              io_write_cmd_valid,
  input               io_write_cmd_ready,
  output              io_write_cmd_payload_last,
  output     [0:0]    io_write_cmd_payload_fragment_source,
  output     [0:0]    io_write_cmd_payload_fragment_opcode,
  output     [31:0]   io_write_cmd_payload_fragment_address,
  output     [11:0]   io_write_cmd_payload_fragment_length,
  output     [127:0]  io_write_cmd_payload_fragment_data,
  output     [15:0]   io_write_cmd_payload_fragment_mask,
  output     [13:0]   io_write_cmd_payload_fragment_context,
  input               io_write_rsp_valid,
  output              io_write_rsp_ready,
  input               io_write_rsp_payload_last,
  input      [0:0]    io_write_rsp_payload_fragment_source,
  input      [0:0]    io_write_rsp_payload_fragment_opcode,
  input      [13:0]   io_write_rsp_payload_fragment_context,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [63:0]   io_outputs_0_payload_data,
  output     [7:0]    io_outputs_0_payload_mask,
  output     [3:0]    io_outputs_0_payload_sink,
  output              io_outputs_0_payload_last,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [63:0]   io_outputs_1_payload_data,
  output     [7:0]    io_outputs_1_payload_mask,
  output     [3:0]    io_outputs_1_payload_sink,
  output              io_outputs_1_payload_last,
  input               io_inputs_0_valid,
  output reg          io_inputs_0_ready,
  input      [63:0]   io_inputs_0_payload_data,
  input      [7:0]    io_inputs_0_payload_mask,
  input      [3:0]    io_inputs_0_payload_sink,
  input               io_inputs_0_payload_last,
  input               io_inputs_1_valid,
  output reg          io_inputs_1_ready,
  input      [63:0]   io_inputs_1_payload_data,
  input      [7:0]    io_inputs_1_payload_mask,
  input      [3:0]    io_inputs_1_payload_sink,
  input               io_inputs_1_payload_last,
  output reg [3:0]    io_interrupts,
  input      [13:0]   io_ctrl_PADDR,
  input      [0:0]    io_ctrl_PSEL,
  input               io_ctrl_PENABLE,
  output              io_ctrl_PREADY,
  input               io_ctrl_PWRITE,
  input      [31:0]   io_ctrl_PWDATA,
  output reg [31:0]   io_ctrl_PRDATA,
  output              io_ctrl_PSLVERROR,
  input               clk,
  input               reset
);
  wire       [10:0]   memory_core_io_writes_0_cmd_payload_address;
  wire       [6:0]    memory_core_io_writes_0_cmd_payload_context;
  wire       [10:0]   memory_core_io_writes_1_cmd_payload_address;
  wire       [6:0]    memory_core_io_writes_1_cmd_payload_context;
  wire       [10:0]   memory_core_io_writes_2_cmd_payload_address;
  reg        [15:0]   memory_core_io_writes_2_cmd_payload_mask;
  wire       [7:0]    memory_core_io_writes_2_cmd_payload_context;
  wire                memory_core_io_reads_0_cmd_valid;
  wire       [10:0]   memory_core_io_reads_0_cmd_payload_address;
  wire       [2:0]    memory_core_io_reads_0_cmd_payload_context;
  wire                memory_core_io_reads_1_cmd_valid;
  wire       [10:0]   memory_core_io_reads_1_cmd_payload_address;
  wire       [2:0]    memory_core_io_reads_1_cmd_payload_context;
  wire       [10:0]   memory_core_io_reads_2_cmd_payload_address;
  wire       [12:0]   memory_core_io_reads_2_cmd_payload_context;
  wire                memory_core_io_reads_2_rsp_ready;
  wire       [15:0]   b2m_fsm_aggregate_engine_io_input_payload_mask;
  wire                b2m_fsm_aggregate_engine_io_flush;
  wire       [3:0]    b2m_fsm_aggregate_engine_io_offset;
  wire                memory_core_io_writes_0_cmd_ready;
  wire                memory_core_io_writes_0_rsp_valid;
  wire       [6:0]    memory_core_io_writes_0_rsp_payload_context;
  wire                memory_core_io_writes_1_cmd_ready;
  wire                memory_core_io_writes_1_rsp_valid;
  wire       [6:0]    memory_core_io_writes_1_rsp_payload_context;
  wire                memory_core_io_writes_2_cmd_ready;
  wire                memory_core_io_writes_2_rsp_valid;
  wire       [7:0]    memory_core_io_writes_2_rsp_payload_context;
  wire                memory_core_io_reads_0_cmd_ready;
  wire                memory_core_io_reads_0_rsp_valid;
  wire       [63:0]   memory_core_io_reads_0_rsp_payload_data;
  wire       [7:0]    memory_core_io_reads_0_rsp_payload_mask;
  wire       [2:0]    memory_core_io_reads_0_rsp_payload_context;
  wire                memory_core_io_reads_1_cmd_ready;
  wire                memory_core_io_reads_1_rsp_valid;
  wire       [63:0]   memory_core_io_reads_1_rsp_payload_data;
  wire       [7:0]    memory_core_io_reads_1_rsp_payload_mask;
  wire       [2:0]    memory_core_io_reads_1_rsp_payload_context;
  wire                memory_core_io_reads_2_cmd_ready;
  wire                memory_core_io_reads_2_rsp_valid;
  wire       [127:0]  memory_core_io_reads_2_rsp_payload_data;
  wire       [15:0]   memory_core_io_reads_2_rsp_payload_mask;
  wire       [12:0]   memory_core_io_reads_2_rsp_payload_context;
  wire                b2m_fsm_aggregate_engine_io_input_ready;
  wire       [127:0]  b2m_fsm_aggregate_engine_io_output_data;
  wire       [15:0]   b2m_fsm_aggregate_engine_io_output_mask;
  wire                b2m_fsm_aggregate_engine_io_output_consumed;
  wire       [3:0]    b2m_fsm_aggregate_engine_io_output_usedUntil;
  wire       [14:0]   _zz_channels_0_fifo_pop_withOverride_backupNext;
  wire       [14:0]   _zz_channels_0_fifo_pop_withOverride_exposed;
  wire       [14:0]   _zz_channels_0_pop_b2m_request;
  wire       [11:0]   _zz_channels_0_pop_b2m_request_1;
  wire       [10:0]   _zz_channels_0_pop_b2m_request_2;
  wire       [3:0]    _zz_channels_0_pop_b2m_memPending;
  wire       [3:0]    _zz_channels_0_pop_b2m_memPending_1;
  wire       [0:0]    _zz_channels_0_pop_b2m_memPending_2;
  wire       [3:0]    _zz_channels_0_pop_b2m_memPending_3;
  wire       [0:0]    _zz_channels_0_pop_b2m_memPending_4;
  wire       [26:0]   _zz_when_DmaSg_l481;
  wire       [31:0]   _zz_channels_0_pop_b2m_address;
  wire       [31:0]   _zz_channels_0_pop_b2m_address_1;
  wire       [11:0]   _zz_channels_0_fifo_push_available;
  wire       [14:0]   _zz_channels_1_fifo_pop_withoutOverride_exposed;
  wire       [3:0]    _zz_channels_1_push_m2b_memPending;
  wire       [3:0]    _zz_channels_1_push_m2b_memPending_1;
  wire       [0:0]    _zz_channels_1_push_m2b_memPending_2;
  wire       [3:0]    _zz_channels_1_push_m2b_memPending_3;
  wire       [0:0]    _zz_channels_1_push_m2b_memPending_4;
  wire       [11:0]   _zz_channels_1_push_m2b_loadRequest;
  wire       [8:0]    _zz_channels_1_push_m2b_loadRequest_1;
  wire       [25:0]   _zz_when_DmaSg_l444;
  wire       [31:0]   _zz_channels_1_push_m2b_address;
  wire       [31:0]   _zz_channels_1_push_m2b_address_1;
  wire       [11:0]   _zz_channels_1_fifo_push_available;
  wire       [14:0]   _zz_channels_2_fifo_pop_withOverride_backupNext;
  wire       [14:0]   _zz_channels_2_fifo_pop_withOverride_exposed;
  wire       [14:0]   _zz_channels_2_pop_b2m_request;
  wire       [11:0]   _zz_channels_2_pop_b2m_request_1;
  wire       [10:0]   _zz_channels_2_pop_b2m_request_2;
  wire       [3:0]    _zz_channels_2_pop_b2m_memPending;
  wire       [3:0]    _zz_channels_2_pop_b2m_memPending_1;
  wire       [0:0]    _zz_channels_2_pop_b2m_memPending_2;
  wire       [3:0]    _zz_channels_2_pop_b2m_memPending_3;
  wire       [0:0]    _zz_channels_2_pop_b2m_memPending_4;
  wire       [26:0]   _zz_when_DmaSg_l481_1;
  wire       [31:0]   _zz_channels_2_pop_b2m_address;
  wire       [31:0]   _zz_channels_2_pop_b2m_address_1;
  wire       [11:0]   _zz_channels_2_fifo_push_available;
  wire       [14:0]   _zz_channels_3_fifo_pop_withoutOverride_exposed;
  wire       [3:0]    _zz_channels_3_push_m2b_memPending;
  wire       [3:0]    _zz_channels_3_push_m2b_memPending_1;
  wire       [0:0]    _zz_channels_3_push_m2b_memPending_2;
  wire       [3:0]    _zz_channels_3_push_m2b_memPending_3;
  wire       [0:0]    _zz_channels_3_push_m2b_memPending_4;
  wire       [11:0]   _zz_channels_3_push_m2b_loadRequest;
  wire       [8:0]    _zz_channels_3_push_m2b_loadRequest_1;
  wire       [25:0]   _zz_when_DmaSg_l444_1;
  wire       [31:0]   _zz_channels_3_push_m2b_address;
  wire       [31:0]   _zz_channels_3_push_m2b_address_1;
  wire       [11:0]   _zz_channels_3_fifo_push_available;
  wire       [0:0]    _zz_s2b_0_cmd_firsts;
  wire       [4:0]    _zz_s2b_0_cmd_firsts_1;
  wire       [3:0]    _zz_s2b_0_cmd_byteCount_8;
  reg        [3:0]    _zz_s2b_0_cmd_byteCount_9;
  wire       [2:0]    _zz_s2b_0_cmd_byteCount_10;
  reg        [3:0]    _zz_s2b_0_cmd_byteCount_11;
  wire       [2:0]    _zz_s2b_0_cmd_byteCount_12;
  reg        [3:0]    _zz_s2b_0_cmd_byteCount_13;
  wire       [2:0]    _zz_s2b_0_cmd_byteCount_14;
  wire       [1:0]    _zz_s2b_0_cmd_byteCount_15;
  wire       [0:0]    _zz_s2b_1_cmd_firsts;
  wire       [4:0]    _zz_s2b_1_cmd_firsts_1;
  wire       [3:0]    _zz_s2b_1_cmd_byteCount_8;
  reg        [3:0]    _zz_s2b_1_cmd_byteCount_9;
  wire       [2:0]    _zz_s2b_1_cmd_byteCount_10;
  reg        [3:0]    _zz_s2b_1_cmd_byteCount_11;
  wire       [2:0]    _zz_s2b_1_cmd_byteCount_12;
  reg        [3:0]    _zz_s2b_1_cmd_byteCount_13;
  wire       [2:0]    _zz_s2b_1_cmd_byteCount_14;
  wire       [1:0]    _zz_s2b_1_cmd_byteCount_15;
  wire       [3:0]    _zz__zz_m2b_cmd_s0_priority_chosenOh_2;
  wire       [3:0]    _zz__zz_m2b_cmd_s0_priority_chosenOh_2_1;
  wire       [1:0]    _zz__zz_m2b_cmd_s0_priority_chosenOh_2_2;
  reg        [1:0]    _zz__zz_m2b_cmd_s0_priority_chosenOh_2_3;
  reg                 _zz_m2b_cmd_s0_priority_weightLast;
  reg        [31:0]   _zz_m2b_cmd_s0_address;
  reg        [25:0]   _zz_m2b_cmd_s0_bytesLeft;
  reg        [11:0]   _zz_m2b_cmd_s0_lengthHead;
  wire       [25:0]   _zz_m2b_cmd_s0_length;
  wire       [25:0]   _zz_m2b_cmd_s0_length_1;
  wire       [25:0]   _zz_m2b_cmd_s0_length_2;
  wire       [25:0]   _zz_m2b_cmd_s0_lastBurst;
  wire       [31:0]   _zz_m2b_cmd_s1_context_stop;
  wire       [31:0]   _zz_m2b_cmd_s1_context_stop_1;
  wire       [31:0]   _zz_m2b_cmd_s1_addressNext;
  wire       [31:0]   _zz_m2b_cmd_s1_addressNext_1;
  wire       [25:0]   _zz_m2b_cmd_s1_byteLeftNext;
  wire       [25:0]   _zz_m2b_cmd_s1_byteLeftNext_1;
  wire       [12:0]   _zz_m2b_cmd_s1_fifoPushDecr;
  wire       [11:0]   _zz_m2b_cmd_s1_fifoPushDecr_1;
  wire       [11:0]   _zz_m2b_cmd_s1_fifoPushDecr_2;
  wire       [3:0]    _zz_m2b_cmd_s1_fifoPushDecr_3;
  wire       [12:0]   _zz_m2b_cmd_s1_fifoPushDecr_4;
  wire       [1:0]    _zz_m2b_cmd_s1_fifoPushDecr_5;
  reg        [11:0]   _zz_io_writes_2_cmd_payload_address;
  wire       [3:0]    _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2;
  wire       [3:0]    _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2_1;
  wire       [1:0]    _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2_2;
  reg        [1:0]    _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2_3;
  reg                 _zz_b2m_fsm_arbiter_logic_priority_weightLast;
  reg        [31:0]   _zz_b2m_fsm_sel_address;
  reg        [11:0]   _zz_b2m_fsm_sel_ptr;
  reg        [11:0]   _zz_b2m_fsm_sel_ptrMask;
  reg        [11:0]   _zz_b2m_fsm_sel_bytePerBurst;
  reg        [14:0]   _zz_b2m_fsm_sel_bytesInFifo;
  reg                 _zz_b2m_fsm_sel_flush;
  reg                 _zz_b2m_fsm_sel_packet;
  reg        [26:0]   _zz_b2m_fsm_sel_bytesLeft;
  wire       [12:0]   _zz_b2m_fsm_bytesInBurstP1;
  wire       [1:0]    _zz_b2m_fsm_bytesInBurstP1_1;
  wire       [31:0]   _zz_b2m_fsm_addressNext;
  wire       [26:0]   _zz_b2m_fsm_bytesLeftNext;
  wire       [13:0]   _zz_b2m_fsm_bytesLeftNext_1;
  wire       [25:0]   _zz__zz_b2m_fsm_sel_bytesInBurst_1;
  wire       [25:0]   _zz__zz_b2m_fsm_sel_bytesInBurst_1_1;
  wire       [11:0]   _zz__zz_b2m_fsm_sel_bytesInBurst_2;
  wire       [25:0]   _zz_b2m_fsm_sel_bytesInBurst_3;
  wire       [25:0]   _zz_b2m_fsm_sel_bytesInBurst_4;
  wire       [25:0]   _zz_b2m_fsm_sel_bytesInBurst_5;
  wire       [14:0]   _zz_b2m_fsm_fifoCompletion;
  wire       [14:0]   _zz_b2m_fsm_fifoCompletion_1;
  wire       [11:0]   _zz_b2m_fsm_beatCounter;
  wire       [11:0]   _zz_b2m_fsm_beatCounter_1;
  wire       [3:0]    _zz_b2m_fsm_beatCounter_2;
  reg        [11:0]   _zz_b2m_fsm_fetch_context_ptr;
  wire       [11:0]   _zz_b2m_fsm_sel_ptr_1;
  reg        [3:0]    _zz_b2m_fsm_aggregate_bytesToSkip;
  wire       [3:0]    _zz_b2m_fsm_aggregate_bytesToSkipMask;
  wire                _zz_b2m_fsm_aggregate_bytesToSkipMask_1;
  wire                _zz_b2m_fsm_aggregate_bytesToSkipMask_2;
  wire                _zz_b2m_fsm_aggregate_bytesToSkipMask_3;
  wire       [0:0]    _zz_b2m_fsm_aggregate_bytesToSkipMask_4;
  wire       [9:0]    _zz_b2m_fsm_aggregate_bytesToSkipMask_5;
  wire       [3:0]    _zz_b2m_fsm_aggregate_bytesToSkipMask_6;
  wire                _zz_b2m_fsm_aggregate_bytesToSkipMask_7;
  wire                _zz_b2m_fsm_aggregate_bytesToSkipMask_8;
  wire                _zz_b2m_fsm_aggregate_bytesToSkipMask_9;
  wire       [0:0]    _zz_b2m_fsm_aggregate_bytesToSkipMask_10;
  wire       [3:0]    _zz_b2m_fsm_aggregate_bytesToSkipMask_11;
  wire       [3:0]    _zz_b2m_fsm_cmd_maskLastTriggerComb;
  wire       [3:0]    _zz_b2m_fsm_cmd_maskLast;
  wire                _zz_b2m_fsm_cmd_maskLast_1;
  wire       [0:0]    _zz_b2m_fsm_cmd_maskLast_2;
  wire       [7:0]    _zz_b2m_fsm_cmd_maskLast_3;
  wire       [3:0]    _zz_b2m_fsm_cmd_maskLast_4;
  wire       [3:0]    _zz_b2m_fsm_cmd_maskLast_5;
  wire       [3:0]    _zz_b2m_fsm_cmd_maskFirst;
  wire                _zz_b2m_fsm_cmd_maskFirst_1;
  wire       [0:0]    _zz_b2m_fsm_cmd_maskFirst_2;
  wire       [7:0]    _zz_b2m_fsm_cmd_maskFirst_3;
  wire       [3:0]    _zz_b2m_fsm_cmd_maskFirst_4;
  wire       [3:0]    _zz_b2m_fsm_cmd_maskFirst_5;
  wire       [0:0]    _zz_channels_0_channelStart;
  wire       [0:0]    _zz_channels_0_ctrl_kick;
  wire       [0:0]    _zz_channels_0_interrupts_completion_valid;
  wire       [0:0]    _zz_channels_0_interrupts_onChannelCompletion_valid;
  wire       [0:0]    _zz_channels_0_interrupts_s2mPacket_valid;
  wire       [0:0]    _zz_channels_1_channelStart;
  wire       [0:0]    _zz_channels_1_ctrl_kick;
  wire       [0:0]    _zz_channels_1_interrupts_completion_valid;
  wire       [0:0]    _zz_channels_1_interrupts_onChannelCompletion_valid;
  wire       [0:0]    _zz_channels_2_channelStart;
  wire       [0:0]    _zz_channels_2_ctrl_kick;
  wire       [0:0]    _zz_channels_2_interrupts_completion_valid;
  wire       [0:0]    _zz_channels_2_interrupts_onChannelCompletion_valid;
  wire       [0:0]    _zz_channels_2_interrupts_s2mPacket_valid;
  wire       [0:0]    _zz_channels_3_channelStart;
  wire       [0:0]    _zz_channels_3_ctrl_kick;
  wire       [0:0]    _zz_channels_3_interrupts_completion_valid;
  wire       [0:0]    _zz_channels_3_interrupts_onChannelCompletion_valid;
  wire       [31:0]   _zz_channels_0_pop_b2m_address_2;
  wire       [31:0]   _zz_channels_0_pop_b2m_address_3;
  wire       [31:0]   _zz_channels_1_push_m2b_address_2;
  wire       [31:0]   _zz_channels_1_push_m2b_address_3;
  wire       [31:0]   _zz_channels_2_pop_b2m_address_2;
  wire       [31:0]   _zz_channels_2_pop_b2m_address_3;
  wire       [31:0]   _zz_channels_3_push_m2b_address_2;
  wire       [31:0]   _zz_channels_3_push_m2b_address_3;
  wire       [11:0]   _zz_channels_0_fifo_push_ptrIncr_value;
  wire       [0:0]    _zz_channels_0_fifo_push_ptrIncr_value_1;
  wire       [14:0]   _zz_channels_0_fifo_pop_bytesIncr_value_1;
  wire       [3:0]    _zz_channels_0_fifo_pop_bytesIncr_value_2;
  wire       [11:0]   _zz_channels_0_fifo_pop_ptrIncr_value;
  wire       [1:0]    _zz_channels_0_fifo_pop_ptrIncr_value_1;
  wire       [11:0]   _zz_channels_1_fifo_push_ptrIncr_value;
  wire       [1:0]    _zz_channels_1_fifo_push_ptrIncr_value_1;
  wire       [14:0]   _zz_channels_1_fifo_pop_bytesIncr_value_1;
  wire       [4:0]    _zz_channels_1_fifo_pop_bytesIncr_value_2;
  wire       [4:0]    _zz_channels_1_fifo_pop_bytesIncr_value_3;
  wire       [11:0]   _zz_channels_1_fifo_pop_ptrIncr_value;
  wire       [0:0]    _zz_channels_1_fifo_pop_ptrIncr_value_1;
  wire       [11:0]   _zz_channels_2_fifo_push_ptrIncr_value;
  wire       [0:0]    _zz_channels_2_fifo_push_ptrIncr_value_1;
  wire       [14:0]   _zz_channels_2_fifo_pop_bytesIncr_value_1;
  wire       [3:0]    _zz_channels_2_fifo_pop_bytesIncr_value_2;
  wire       [11:0]   _zz_channels_2_fifo_pop_ptrIncr_value;
  wire       [1:0]    _zz_channels_2_fifo_pop_ptrIncr_value_1;
  wire       [11:0]   _zz_channels_3_fifo_push_ptrIncr_value;
  wire       [1:0]    _zz_channels_3_fifo_push_ptrIncr_value_1;
  wire       [14:0]   _zz_channels_3_fifo_pop_bytesIncr_value_1;
  wire       [4:0]    _zz_channels_3_fifo_pop_bytesIncr_value_2;
  wire       [4:0]    _zz_channels_3_fifo_pop_bytesIncr_value_3;
  wire       [11:0]   _zz_channels_3_fifo_pop_ptrIncr_value;
  wire       [0:0]    _zz_channels_3_fifo_pop_ptrIncr_value_1;
  wire                ctrl_askWrite;
  wire                ctrl_askRead;
  wire                ctrl_doWrite;
  wire                ctrl_doRead;
  reg                 channels_0_channelStart;
  reg                 channels_0_channelStop;
  reg                 channels_0_channelCompletion;
  reg                 channels_0_channelValid;
  reg                 channels_0_descriptorStart;
  reg                 channels_0_descriptorCompletion;
  reg                 channels_0_descriptorValid;
  reg        [25:0]   channels_0_bytes;
  reg        [1:0]    channels_0_priority;
  reg        [1:0]    channels_0_weight;
  reg                 channels_0_selfRestart;
  reg                 channels_0_readyToStop;
  reg                 channels_0_ctrl_kick;
  wire       [11:0]   channels_0_fifo_base;
  wire       [11:0]   channels_0_fifo_words;
  reg        [11:0]   channels_0_fifo_push_available;
  wire       [11:0]   channels_0_fifo_push_availableDecr;
  reg        [11:0]   channels_0_fifo_push_ptr;
  wire       [11:0]   channels_0_fifo_push_ptrWithBase;
  wire       [11:0]   channels_0_fifo_push_ptrIncr_value;
  reg        [11:0]   channels_0_fifo_pop_ptr;
  wire       [14:0]   channels_0_fifo_pop_bytes;
  wire       [11:0]   channels_0_fifo_pop_ptrWithBase;
  wire       [14:0]   channels_0_fifo_pop_bytesIncr_value;
  wire       [14:0]   channels_0_fifo_pop_bytesDecr_value;
  wire                channels_0_fifo_pop_empty;
  wire       [11:0]   channels_0_fifo_pop_ptrIncr_value;
  reg        [14:0]   channels_0_fifo_pop_withOverride_backup;
  wire       [14:0]   channels_0_fifo_pop_withOverride_backupNext;
  reg                 channels_0_fifo_pop_withOverride_load;
  reg                 channels_0_fifo_pop_withOverride_unload;
  reg        [14:0]   channels_0_fifo_pop_withOverride_exposed;
  reg                 channels_0_fifo_pop_withOverride_valid;
  wire                when_DmaSg_l367;
  wire                channels_0_fifo_empty;
  reg                 channels_0_push_memory;
  reg                 channels_0_push_s2b_completionOnLast;
  reg                 channels_0_push_s2b_packetEvent;
  reg                 channels_0_push_s2b_packetLock;
  reg                 channels_0_push_s2b_waitFirst;
  wire                when_DmaSg_l415;
  reg                 channels_0_pop_memory;
  wire       [11:0]   channels_0_pop_b2m_bytePerBurst;
  reg                 channels_0_pop_b2m_fire;
  reg                 channels_0_pop_b2m_waitFinalRsp;
  reg                 channels_0_pop_b2m_flush;
  reg                 channels_0_pop_b2m_packetSync;
  reg                 channels_0_pop_b2m_packet;
  wire                when_DmaSg_l463;
  reg                 channels_0_pop_b2m_memRsp;
  reg        [3:0]    channels_0_pop_b2m_memPending;
  reg        [31:0]   channels_0_pop_b2m_address;
  reg        [26:0]   channels_0_pop_b2m_bytesLeft;
  wire                channels_0_pop_b2m_request;
  reg        [3:0]    channels_0_pop_b2m_bytesToSkip;
  reg        [14:0]   channels_0_pop_b2m_decrBytes;
  reg                 channels_0_pop_b2m_memPendingInc;
  wire                when_DmaSg_l481;
  wire                when_DmaSg_l485;
  wire                when_DmaSg_l494;
  wire                when_DmaSg_l509;
  wire                when_DmaSg_l525;
  wire                channels_0_readyForChannelCompletion;
  wire                when_DmaSg_l537;
  reg                 _zz_when_DmaSg_l555;
  wire                when_DmaSg_l540;
  wire                when_DmaSg_l555;
  wire                channels_0_s2b_full;
  reg        [11:0]   channels_0_fifo_pop_ptrIncr_value_regNext;
  wire                when_DmaSg_l219;
  reg                 channels_0_interrupts_completion_enable;
  reg                 channels_0_interrupts_completion_valid;
  wire                when_DmaSg_l219_1;
  wire                when_DmaSg_l219_2;
  reg                 channels_0_interrupts_onChannelCompletion_enable;
  reg                 channels_0_interrupts_onChannelCompletion_valid;
  wire                when_DmaSg_l219_3;
  reg                 channels_0_interrupts_s2mPacket_enable;
  reg                 channels_0_interrupts_s2mPacket_valid;
  wire                when_DmaSg_l219_4;
  reg                 channels_1_channelStart;
  reg                 channels_1_channelStop;
  reg                 channels_1_channelCompletion;
  reg                 channels_1_channelValid;
  reg                 channels_1_descriptorStart;
  reg                 channels_1_descriptorCompletion;
  reg                 channels_1_descriptorValid;
  reg        [25:0]   channels_1_bytes;
  reg        [1:0]    channels_1_priority;
  reg        [1:0]    channels_1_weight;
  reg                 channels_1_selfRestart;
  reg                 channels_1_readyToStop;
  reg                 channels_1_ctrl_kick;
  wire       [11:0]   channels_1_fifo_base;
  wire       [11:0]   channels_1_fifo_words;
  reg        [11:0]   channels_1_fifo_push_available;
  reg        [11:0]   channels_1_fifo_push_availableDecr;
  reg        [11:0]   channels_1_fifo_push_ptr;
  wire       [11:0]   channels_1_fifo_push_ptrWithBase;
  wire       [11:0]   channels_1_fifo_push_ptrIncr_value;
  reg        [11:0]   channels_1_fifo_pop_ptr;
  wire       [14:0]   channels_1_fifo_pop_bytes;
  wire       [11:0]   channels_1_fifo_pop_ptrWithBase;
  wire       [14:0]   channels_1_fifo_pop_bytesIncr_value;
  wire       [14:0]   channels_1_fifo_pop_bytesDecr_value;
  wire                channels_1_fifo_pop_empty;
  wire       [11:0]   channels_1_fifo_pop_ptrIncr_value;
  reg        [14:0]   channels_1_fifo_pop_withoutOverride_exposed;
  wire                channels_1_fifo_empty;
  reg                 channels_1_push_memory;
  reg        [31:0]   channels_1_push_m2b_address;
  wire       [11:0]   channels_1_push_m2b_bytePerBurst;
  reg                 channels_1_push_m2b_loadDone;
  reg        [25:0]   channels_1_push_m2b_bytesLeft;
  reg        [3:0]    channels_1_push_m2b_memPending;
  reg                 channels_1_push_m2b_memPendingIncr;
  reg                 channels_1_push_m2b_memPendingDecr;
  reg                 channels_1_push_m2b_loadRequest;
  reg                 channels_1_pop_memory;
  reg                 channels_1_pop_b2s_last;
  reg        [0:0]    channels_1_pop_b2s_portId;
  reg        [3:0]    channels_1_pop_b2s_sinkId;
  reg                 channels_1_pop_b2s_veryLastTrigger;
  reg                 channels_1_pop_b2s_veryLastValid;
  reg        [11:0]   channels_1_pop_b2s_veryLastPtr;
  reg                 channels_1_pop_b2s_veryLastEndPacket;
  wire                when_DmaSg_l441;
  wire                when_DmaSg_l444;
  wire                when_DmaSg_l524;
  reg                 channels_1_readyForChannelCompletion;
  wire                when_DmaSg_l528;
  wire                when_DmaSg_l537_1;
  reg                 _zz_when_DmaSg_l555_1;
  wire                when_DmaSg_l540_1;
  wire                when_DmaSg_l555_1;
  wire                channels_1_s2b_full;
  reg        [11:0]   channels_1_fifo_pop_ptrIncr_value_regNext;
  wire                when_DmaSg_l219_5;
  reg                 channels_1_interrupts_completion_enable;
  reg                 channels_1_interrupts_completion_valid;
  wire                when_DmaSg_l219_6;
  wire                when_DmaSg_l219_7;
  reg                 channels_1_interrupts_onChannelCompletion_enable;
  reg                 channels_1_interrupts_onChannelCompletion_valid;
  wire                when_DmaSg_l219_8;
  reg                 channels_2_channelStart;
  reg                 channels_2_channelStop;
  reg                 channels_2_channelCompletion;
  reg                 channels_2_channelValid;
  reg                 channels_2_descriptorStart;
  reg                 channels_2_descriptorCompletion;
  reg                 channels_2_descriptorValid;
  reg        [25:0]   channels_2_bytes;
  reg        [1:0]    channels_2_priority;
  reg        [1:0]    channels_2_weight;
  reg                 channels_2_selfRestart;
  reg                 channels_2_readyToStop;
  reg                 channels_2_ctrl_kick;
  wire       [11:0]   channels_2_fifo_base;
  wire       [11:0]   channels_2_fifo_words;
  reg        [11:0]   channels_2_fifo_push_available;
  wire       [11:0]   channels_2_fifo_push_availableDecr;
  reg        [11:0]   channels_2_fifo_push_ptr;
  wire       [11:0]   channels_2_fifo_push_ptrWithBase;
  wire       [11:0]   channels_2_fifo_push_ptrIncr_value;
  reg        [11:0]   channels_2_fifo_pop_ptr;
  wire       [14:0]   channels_2_fifo_pop_bytes;
  wire       [11:0]   channels_2_fifo_pop_ptrWithBase;
  wire       [14:0]   channels_2_fifo_pop_bytesIncr_value;
  wire       [14:0]   channels_2_fifo_pop_bytesDecr_value;
  wire                channels_2_fifo_pop_empty;
  wire       [11:0]   channels_2_fifo_pop_ptrIncr_value;
  reg        [14:0]   channels_2_fifo_pop_withOverride_backup;
  wire       [14:0]   channels_2_fifo_pop_withOverride_backupNext;
  reg                 channels_2_fifo_pop_withOverride_load;
  reg                 channels_2_fifo_pop_withOverride_unload;
  reg        [14:0]   channels_2_fifo_pop_withOverride_exposed;
  reg                 channels_2_fifo_pop_withOverride_valid;
  wire                when_DmaSg_l367_1;
  wire                channels_2_fifo_empty;
  reg                 channels_2_push_memory;
  reg                 channels_2_push_s2b_completionOnLast;
  reg                 channels_2_push_s2b_packetEvent;
  reg                 channels_2_push_s2b_packetLock;
  reg                 channels_2_push_s2b_waitFirst;
  wire                when_DmaSg_l415_1;
  reg                 channels_2_pop_memory;
  wire       [11:0]   channels_2_pop_b2m_bytePerBurst;
  reg                 channels_2_pop_b2m_fire;
  reg                 channels_2_pop_b2m_waitFinalRsp;
  reg                 channels_2_pop_b2m_flush;
  reg                 channels_2_pop_b2m_packetSync;
  reg                 channels_2_pop_b2m_packet;
  wire                when_DmaSg_l463_1;
  reg                 channels_2_pop_b2m_memRsp;
  reg        [3:0]    channels_2_pop_b2m_memPending;
  reg        [31:0]   channels_2_pop_b2m_address;
  reg        [26:0]   channels_2_pop_b2m_bytesLeft;
  wire                channels_2_pop_b2m_request;
  reg        [3:0]    channels_2_pop_b2m_bytesToSkip;
  reg        [14:0]   channels_2_pop_b2m_decrBytes;
  reg                 channels_2_pop_b2m_memPendingInc;
  wire                when_DmaSg_l481_1;
  wire                when_DmaSg_l485_1;
  wire                when_DmaSg_l494_1;
  wire                when_DmaSg_l509_1;
  wire                when_DmaSg_l525_1;
  wire                channels_2_readyForChannelCompletion;
  wire                when_DmaSg_l537_2;
  reg                 _zz_when_DmaSg_l555_2;
  wire                when_DmaSg_l540_2;
  wire                when_DmaSg_l555_2;
  wire                channels_2_s2b_full;
  reg        [11:0]   channels_2_fifo_pop_ptrIncr_value_regNext;
  wire                when_DmaSg_l219_9;
  reg                 channels_2_interrupts_completion_enable;
  reg                 channels_2_interrupts_completion_valid;
  wire                when_DmaSg_l219_10;
  wire                when_DmaSg_l219_11;
  reg                 channels_2_interrupts_onChannelCompletion_enable;
  reg                 channels_2_interrupts_onChannelCompletion_valid;
  wire                when_DmaSg_l219_12;
  reg                 channels_2_interrupts_s2mPacket_enable;
  reg                 channels_2_interrupts_s2mPacket_valid;
  wire                when_DmaSg_l219_13;
  reg                 channels_3_channelStart;
  reg                 channels_3_channelStop;
  reg                 channels_3_channelCompletion;
  reg                 channels_3_channelValid;
  reg                 channels_3_descriptorStart;
  reg                 channels_3_descriptorCompletion;
  reg                 channels_3_descriptorValid;
  reg        [25:0]   channels_3_bytes;
  reg        [1:0]    channels_3_priority;
  reg        [1:0]    channels_3_weight;
  reg                 channels_3_selfRestart;
  reg                 channels_3_readyToStop;
  reg                 channels_3_ctrl_kick;
  wire       [11:0]   channels_3_fifo_base;
  wire       [11:0]   channels_3_fifo_words;
  reg        [11:0]   channels_3_fifo_push_available;
  reg        [11:0]   channels_3_fifo_push_availableDecr;
  reg        [11:0]   channels_3_fifo_push_ptr;
  wire       [11:0]   channels_3_fifo_push_ptrWithBase;
  wire       [11:0]   channels_3_fifo_push_ptrIncr_value;
  reg        [11:0]   channels_3_fifo_pop_ptr;
  wire       [14:0]   channels_3_fifo_pop_bytes;
  wire       [11:0]   channels_3_fifo_pop_ptrWithBase;
  wire       [14:0]   channels_3_fifo_pop_bytesIncr_value;
  wire       [14:0]   channels_3_fifo_pop_bytesDecr_value;
  wire                channels_3_fifo_pop_empty;
  wire       [11:0]   channels_3_fifo_pop_ptrIncr_value;
  reg        [14:0]   channels_3_fifo_pop_withoutOverride_exposed;
  wire                channels_3_fifo_empty;
  reg                 channels_3_push_memory;
  reg        [31:0]   channels_3_push_m2b_address;
  wire       [11:0]   channels_3_push_m2b_bytePerBurst;
  reg                 channels_3_push_m2b_loadDone;
  reg        [25:0]   channels_3_push_m2b_bytesLeft;
  reg        [3:0]    channels_3_push_m2b_memPending;
  reg                 channels_3_push_m2b_memPendingIncr;
  reg                 channels_3_push_m2b_memPendingDecr;
  reg                 channels_3_push_m2b_loadRequest;
  reg                 channels_3_pop_memory;
  reg                 channels_3_pop_b2s_last;
  reg        [0:0]    channels_3_pop_b2s_portId;
  reg        [3:0]    channels_3_pop_b2s_sinkId;
  reg                 channels_3_pop_b2s_veryLastTrigger;
  reg                 channels_3_pop_b2s_veryLastValid;
  reg        [11:0]   channels_3_pop_b2s_veryLastPtr;
  reg                 channels_3_pop_b2s_veryLastEndPacket;
  wire                when_DmaSg_l441_1;
  wire                when_DmaSg_l444_1;
  wire                when_DmaSg_l524_1;
  reg                 channels_3_readyForChannelCompletion;
  wire                when_DmaSg_l528_1;
  wire                when_DmaSg_l537_3;
  reg                 _zz_when_DmaSg_l555_3;
  wire                when_DmaSg_l540_3;
  wire                when_DmaSg_l555_3;
  wire                channels_3_s2b_full;
  reg        [11:0]   channels_3_fifo_pop_ptrIncr_value_regNext;
  wire                when_DmaSg_l219_14;
  reg                 channels_3_interrupts_completion_enable;
  reg                 channels_3_interrupts_completion_valid;
  wire                when_DmaSg_l219_15;
  wire                when_DmaSg_l219_16;
  reg                 channels_3_interrupts_onChannelCompletion_enable;
  reg                 channels_3_interrupts_onChannelCompletion_valid;
  wire                when_DmaSg_l219_17;
  wire                io_inputs_0_fire;
  wire                when_package_l12;
  reg                 io_inputs_0_payload_last_regNextWhen;
  wire                io_inputs_0_fire_1;
  wire                when_package_l12_1;
  reg                 io_inputs_0_payload_last_regNextWhen_1;
  wire                io_inputs_0_fire_2;
  wire                when_package_l12_2;
  reg                 io_inputs_0_payload_last_regNextWhen_2;
  wire                io_inputs_0_fire_3;
  wire                when_package_l12_3;
  reg                 io_inputs_0_payload_last_regNextWhen_3;
  wire                io_inputs_0_fire_4;
  wire                when_package_l12_4;
  reg                 io_inputs_0_payload_last_regNextWhen_4;
  wire                io_inputs_0_fire_5;
  wire                when_package_l12_5;
  reg                 io_inputs_0_payload_last_regNextWhen_5;
  wire                io_inputs_0_fire_6;
  wire                when_package_l12_6;
  reg                 io_inputs_0_payload_last_regNextWhen_6;
  wire                io_inputs_0_fire_7;
  wire                when_package_l12_7;
  reg                 io_inputs_0_payload_last_regNextWhen_7;
  wire                io_inputs_0_fire_8;
  wire                when_package_l12_8;
  reg                 io_inputs_0_payload_last_regNextWhen_8;
  wire                io_inputs_0_fire_9;
  wire                when_package_l12_9;
  reg                 io_inputs_0_payload_last_regNextWhen_9;
  wire                io_inputs_0_fire_10;
  wire                when_package_l12_10;
  reg                 io_inputs_0_payload_last_regNextWhen_10;
  wire                io_inputs_0_fire_11;
  wire                when_package_l12_11;
  reg                 io_inputs_0_payload_last_regNextWhen_11;
  wire                io_inputs_0_fire_12;
  wire                when_package_l12_12;
  reg                 io_inputs_0_payload_last_regNextWhen_12;
  wire                io_inputs_0_fire_13;
  wire                when_package_l12_13;
  reg                 io_inputs_0_payload_last_regNextWhen_13;
  wire                io_inputs_0_fire_14;
  wire                when_package_l12_14;
  reg                 io_inputs_0_payload_last_regNextWhen_14;
  wire                io_inputs_0_fire_15;
  wire                when_package_l12_15;
  reg                 io_inputs_0_payload_last_regNextWhen_15;
  wire       [15:0]   s2b_0_cmd_firsts;
  wire                s2b_0_cmd_first;
  wire       [0:0]    s2b_0_cmd_channelsOh;
  wire                s2b_0_cmd_noHit;
  wire       [0:0]    s2b_0_cmd_channelsFull;
  reg                 io_inputs_0_thrown_valid;
  wire                io_inputs_0_thrown_ready;
  wire       [63:0]   io_inputs_0_thrown_payload_data;
  wire       [7:0]    io_inputs_0_thrown_payload_mask;
  wire       [3:0]    io_inputs_0_thrown_payload_sink;
  wire                io_inputs_0_thrown_payload_last;
  wire                _zz_io_inputs_0_thrown_ready;
  wire                s2b_0_cmd_sinkHalted_valid;
  wire                s2b_0_cmd_sinkHalted_ready;
  wire       [63:0]   s2b_0_cmd_sinkHalted_payload_data;
  wire       [7:0]    s2b_0_cmd_sinkHalted_payload_mask;
  wire       [3:0]    s2b_0_cmd_sinkHalted_payload_sink;
  wire                s2b_0_cmd_sinkHalted_payload_last;
  wire       [3:0]    _zz_s2b_0_cmd_byteCount;
  wire       [3:0]    _zz_s2b_0_cmd_byteCount_1;
  wire       [3:0]    _zz_s2b_0_cmd_byteCount_2;
  wire       [3:0]    _zz_s2b_0_cmd_byteCount_3;
  wire       [3:0]    _zz_s2b_0_cmd_byteCount_4;
  wire       [3:0]    _zz_s2b_0_cmd_byteCount_5;
  wire       [3:0]    _zz_s2b_0_cmd_byteCount_6;
  wire       [3:0]    _zz_s2b_0_cmd_byteCount_7;
  wire       [3:0]    s2b_0_cmd_byteCount;
  wire       [0:0]    s2b_0_cmd_context_channel;
  wire       [3:0]    s2b_0_cmd_context_bytes;
  wire                s2b_0_cmd_context_flush;
  wire                s2b_0_cmd_context_packet;
  wire                memory_core_io_writes_0_cmd_fire;
  wire                when_DmaSg_l627;
  wire       [0:0]    s2b_0_rsp_context_channel;
  wire       [3:0]    s2b_0_rsp_context_bytes;
  wire                s2b_0_rsp_context_flush;
  wire                s2b_0_rsp_context_packet;
  wire       [6:0]    _zz_s2b_0_rsp_context_channel;
  wire                _zz_channels_0_fifo_pop_bytesIncr_value;
  wire                when_DmaSg_l641;
  wire                when_DmaSg_l643;
  wire                when_DmaSg_l644;
  wire                io_inputs_1_fire;
  wire                when_package_l12_16;
  reg                 io_inputs_1_payload_last_regNextWhen;
  wire                io_inputs_1_fire_1;
  wire                when_package_l12_17;
  reg                 io_inputs_1_payload_last_regNextWhen_1;
  wire                io_inputs_1_fire_2;
  wire                when_package_l12_18;
  reg                 io_inputs_1_payload_last_regNextWhen_2;
  wire                io_inputs_1_fire_3;
  wire                when_package_l12_19;
  reg                 io_inputs_1_payload_last_regNextWhen_3;
  wire                io_inputs_1_fire_4;
  wire                when_package_l12_20;
  reg                 io_inputs_1_payload_last_regNextWhen_4;
  wire                io_inputs_1_fire_5;
  wire                when_package_l12_21;
  reg                 io_inputs_1_payload_last_regNextWhen_5;
  wire                io_inputs_1_fire_6;
  wire                when_package_l12_22;
  reg                 io_inputs_1_payload_last_regNextWhen_6;
  wire                io_inputs_1_fire_7;
  wire                when_package_l12_23;
  reg                 io_inputs_1_payload_last_regNextWhen_7;
  wire                io_inputs_1_fire_8;
  wire                when_package_l12_24;
  reg                 io_inputs_1_payload_last_regNextWhen_8;
  wire                io_inputs_1_fire_9;
  wire                when_package_l12_25;
  reg                 io_inputs_1_payload_last_regNextWhen_9;
  wire                io_inputs_1_fire_10;
  wire                when_package_l12_26;
  reg                 io_inputs_1_payload_last_regNextWhen_10;
  wire                io_inputs_1_fire_11;
  wire                when_package_l12_27;
  reg                 io_inputs_1_payload_last_regNextWhen_11;
  wire                io_inputs_1_fire_12;
  wire                when_package_l12_28;
  reg                 io_inputs_1_payload_last_regNextWhen_12;
  wire                io_inputs_1_fire_13;
  wire                when_package_l12_29;
  reg                 io_inputs_1_payload_last_regNextWhen_13;
  wire                io_inputs_1_fire_14;
  wire                when_package_l12_30;
  reg                 io_inputs_1_payload_last_regNextWhen_14;
  wire                io_inputs_1_fire_15;
  wire                when_package_l12_31;
  reg                 io_inputs_1_payload_last_regNextWhen_15;
  wire       [15:0]   s2b_1_cmd_firsts;
  wire                s2b_1_cmd_first;
  wire       [0:0]    s2b_1_cmd_channelsOh;
  wire                s2b_1_cmd_noHit;
  wire       [0:0]    s2b_1_cmd_channelsFull;
  reg                 io_inputs_1_thrown_valid;
  wire                io_inputs_1_thrown_ready;
  wire       [63:0]   io_inputs_1_thrown_payload_data;
  wire       [7:0]    io_inputs_1_thrown_payload_mask;
  wire       [3:0]    io_inputs_1_thrown_payload_sink;
  wire                io_inputs_1_thrown_payload_last;
  wire                _zz_io_inputs_1_thrown_ready;
  wire                s2b_1_cmd_sinkHalted_valid;
  wire                s2b_1_cmd_sinkHalted_ready;
  wire       [63:0]   s2b_1_cmd_sinkHalted_payload_data;
  wire       [7:0]    s2b_1_cmd_sinkHalted_payload_mask;
  wire       [3:0]    s2b_1_cmd_sinkHalted_payload_sink;
  wire                s2b_1_cmd_sinkHalted_payload_last;
  wire       [3:0]    _zz_s2b_1_cmd_byteCount;
  wire       [3:0]    _zz_s2b_1_cmd_byteCount_1;
  wire       [3:0]    _zz_s2b_1_cmd_byteCount_2;
  wire       [3:0]    _zz_s2b_1_cmd_byteCount_3;
  wire       [3:0]    _zz_s2b_1_cmd_byteCount_4;
  wire       [3:0]    _zz_s2b_1_cmd_byteCount_5;
  wire       [3:0]    _zz_s2b_1_cmd_byteCount_6;
  wire       [3:0]    _zz_s2b_1_cmd_byteCount_7;
  wire       [3:0]    s2b_1_cmd_byteCount;
  wire       [0:0]    s2b_1_cmd_context_channel;
  wire       [3:0]    s2b_1_cmd_context_bytes;
  wire                s2b_1_cmd_context_flush;
  wire                s2b_1_cmd_context_packet;
  wire                memory_core_io_writes_1_cmd_fire;
  wire                when_DmaSg_l627_1;
  wire       [0:0]    s2b_1_rsp_context_channel;
  wire       [3:0]    s2b_1_rsp_context_bytes;
  wire                s2b_1_rsp_context_flush;
  wire                s2b_1_rsp_context_packet;
  wire       [6:0]    _zz_s2b_1_rsp_context_channel;
  wire                _zz_channels_2_fifo_pop_bytesIncr_value;
  wire                when_DmaSg_l641_1;
  wire                when_DmaSg_l643_1;
  wire                when_DmaSg_l644_1;
  wire       [0:0]    b2s_0_cmd_channelsOh;
  wire       [0:0]    b2s_0_cmd_context_channel;
  wire                b2s_0_cmd_context_veryLast;
  wire                b2s_0_cmd_context_endPacket;
  wire       [11:0]   b2s_0_cmd_veryLastPtr;
  wire       [11:0]   b2s_0_cmd_address;
  wire       [0:0]    b2s_0_rsp_context_channel;
  wire                b2s_0_rsp_context_veryLast;
  wire                b2s_0_rsp_context_endPacket;
  wire       [2:0]    _zz_b2s_0_rsp_context_channel;
  wire                io_outputs_0_fire;
  wire                when_DmaSg_l687;
  wire                when_DmaSg_l688;
  wire       [0:0]    b2s_1_cmd_channelsOh;
  wire       [0:0]    b2s_1_cmd_context_channel;
  wire                b2s_1_cmd_context_veryLast;
  wire                b2s_1_cmd_context_endPacket;
  wire       [11:0]   b2s_1_cmd_veryLastPtr;
  wire       [11:0]   b2s_1_cmd_address;
  wire       [0:0]    b2s_1_rsp_context_channel;
  wire                b2s_1_rsp_context_veryLast;
  wire                b2s_1_rsp_context_endPacket;
  wire       [2:0]    _zz_b2s_1_rsp_context_channel;
  wire                io_outputs_1_fire;
  wire                when_DmaSg_l687_1;
  wire                when_DmaSg_l688_1;
  reg                 m2b_cmd_s0_valid;
  reg        [0:0]    m2b_cmd_s0_chosen;
  wire       [1:0]    _zz_m2b_cmd_s0_priority_masked;
  wire       [1:0]    _zz_m2b_cmd_s0_priority_masked_1;
  wire       [1:0]    _zz_m2b_cmd_s0_priority_masked_2;
  wire       [1:0]    m2b_cmd_s0_priority_masked;
  reg        [1:0]    m2b_cmd_s0_priority_roundRobins_0;
  reg        [1:0]    m2b_cmd_s0_priority_roundRobins_1;
  reg        [1:0]    m2b_cmd_s0_priority_roundRobins_2;
  reg        [1:0]    m2b_cmd_s0_priority_roundRobins_3;
  reg        [1:0]    m2b_cmd_s0_priority_counter;
  wire       [1:0]    _zz_m2b_cmd_s0_priority_chosenOh;
  wire       [3:0]    _zz_m2b_cmd_s0_priority_chosenOh_1;
  wire       [3:0]    _zz_m2b_cmd_s0_priority_chosenOh_2;
  wire       [1:0]    m2b_cmd_s0_priority_chosenOh;
  wire                _zz_m2b_cmd_s0_priority_chosen;
  wire       [0:0]    m2b_cmd_s0_priority_chosen;
  wire                m2b_cmd_s0_priority_weightLast;
  wire       [1:0]    m2b_cmd_s0_priority_contextNext;
  wire                when_DmaSg_l720;
  wire                when_DmaSg_l722;
  wire                when_DmaSg_l725;
  wire                when_DmaSg_l725_1;
  wire                when_DmaSg_l725_2;
  wire                when_DmaSg_l725_3;
  wire                when_DmaSg_l735;
  wire                when_DmaSg_l735_1;
  wire       [31:0]   m2b_cmd_s0_address;
  wire       [25:0]   m2b_cmd_s0_bytesLeft;
  wire       [11:0]   m2b_cmd_s0_readAddressBurstRange;
  wire       [11:0]   m2b_cmd_s0_lengthHead;
  wire       [11:0]   m2b_cmd_s0_length;
  wire                m2b_cmd_s0_lastBurst;
  reg                 m2b_cmd_s1_valid;
  reg        [31:0]   m2b_cmd_s1_address;
  reg        [11:0]   m2b_cmd_s1_length;
  reg                 m2b_cmd_s1_lastBurst;
  reg        [25:0]   m2b_cmd_s1_bytesLeft;
  wire       [0:0]    m2b_cmd_s1_context_channel;
  wire       [3:0]    m2b_cmd_s1_context_start;
  wire       [3:0]    m2b_cmd_s1_context_stop;
  wire       [11:0]   m2b_cmd_s1_context_length;
  wire                m2b_cmd_s1_context_last;
  wire       [31:0]   m2b_cmd_s1_addressNext;
  wire       [25:0]   m2b_cmd_s1_byteLeftNext;
  wire       [9:0]    m2b_cmd_s1_fifoPushDecr;
  wire                when_DmaSg_l790;
  wire                when_DmaSg_l790_1;
  wire       [0:0]    m2b_rsp_context_channel;
  wire       [3:0]    m2b_rsp_context_start;
  wire       [3:0]    m2b_rsp_context_stop;
  wire       [11:0]   m2b_rsp_context_length;
  wire                m2b_rsp_context_last;
  wire       [21:0]   _zz_m2b_rsp_context_channel;
  wire                m2b_rsp_veryLast;
  wire                io_read_rsp_fire;
  wire                when_DmaSg_l809;
  wire                when_DmaSg_l810;
  wire                when_DmaSg_l810_1;
  wire                io_read_rsp_fire_1;
  reg                 m2b_rsp_first;
  wire                m2b_rsp_writeContext_last;
  wire                m2b_rsp_writeContext_lastOfBurst;
  wire       [0:0]    m2b_rsp_writeContext_channel;
  wire       [4:0]    m2b_rsp_writeContext_loadByteInNextBeat;
  wire                memory_core_io_writes_2_cmd_fire;
  wire                memory_core_io_writes_2_cmd_fire_1;
  wire                m2b_writeRsp_context_last;
  wire                m2b_writeRsp_context_lastOfBurst;
  wire       [0:0]    m2b_writeRsp_context_channel;
  wire       [4:0]    m2b_writeRsp_context_loadByteInNextBeat;
  wire       [7:0]    _zz_m2b_writeRsp_context_last;
  wire                _zz_channels_1_fifo_pop_bytesIncr_value;
  wire                when_DmaSg_l855;
  wire                _zz_channels_3_fifo_pop_bytesIncr_value;
  wire                when_DmaSg_l855_1;
  reg                 b2m_fsm_sel_valid;
  reg                 b2m_fsm_sel_ready;
  reg        [0:0]    b2m_fsm_sel_channel;
  reg        [11:0]   b2m_fsm_sel_bytePerBurst;
  reg        [11:0]   b2m_fsm_sel_bytesInBurst;
  reg        [14:0]   b2m_fsm_sel_bytesInFifo;
  reg        [31:0]   b2m_fsm_sel_address;
  reg        [11:0]   b2m_fsm_sel_ptr;
  reg        [11:0]   b2m_fsm_sel_ptrMask;
  reg                 b2m_fsm_sel_flush;
  reg                 b2m_fsm_sel_packet;
  reg        [25:0]   b2m_fsm_sel_bytesLeft;
  reg                 b2m_fsm_arbiter_logic_valid;
  reg        [0:0]    b2m_fsm_arbiter_logic_chosen;
  wire       [1:0]    _zz_b2m_fsm_arbiter_logic_priority_masked;
  wire       [1:0]    _zz_b2m_fsm_arbiter_logic_priority_masked_1;
  wire       [1:0]    _zz_b2m_fsm_arbiter_logic_priority_masked_2;
  wire       [1:0]    b2m_fsm_arbiter_logic_priority_masked;
  reg        [1:0]    b2m_fsm_arbiter_logic_priority_roundRobins_0;
  reg        [1:0]    b2m_fsm_arbiter_logic_priority_roundRobins_1;
  reg        [1:0]    b2m_fsm_arbiter_logic_priority_roundRobins_2;
  reg        [1:0]    b2m_fsm_arbiter_logic_priority_roundRobins_3;
  reg        [1:0]    b2m_fsm_arbiter_logic_priority_counter;
  wire       [1:0]    _zz_b2m_fsm_arbiter_logic_priority_chosenOh;
  wire       [3:0]    _zz_b2m_fsm_arbiter_logic_priority_chosenOh_1;
  wire       [3:0]    _zz_b2m_fsm_arbiter_logic_priority_chosenOh_2;
  wire       [1:0]    b2m_fsm_arbiter_logic_priority_chosenOh;
  wire                _zz_b2m_fsm_arbiter_logic_priority_chosen;
  wire       [0:0]    b2m_fsm_arbiter_logic_priority_chosen;
  wire                b2m_fsm_arbiter_logic_priority_weightLast;
  wire       [1:0]    b2m_fsm_arbiter_logic_priority_contextNext;
  wire                when_DmaSg_l720_1;
  wire                when_DmaSg_l722_1;
  wire                when_DmaSg_l725_4;
  wire                when_DmaSg_l725_5;
  wire                when_DmaSg_l725_6;
  wire                when_DmaSg_l725_7;
  wire                when_DmaSg_l735_2;
  wire                when_DmaSg_l735_3;
  wire                when_DmaSg_l897;
  wire       [1:0]    _zz_1;
  wire       [12:0]   b2m_fsm_bytesInBurstP1;
  wire       [31:0]   b2m_fsm_addressNext;
  wire       [26:0]   b2m_fsm_bytesLeftNext;
  wire                b2m_fsm_isFinalCmd;
  reg        [7:0]    b2m_fsm_beatCounter;
  reg                 b2m_fsm_sel_valid_regNext;
  wire                b2m_fsm_s0;
  reg                 b2m_fsm_s1;
  reg                 b2m_fsm_s2;
  wire                when_DmaSg_l948;
  wire       [14:0]   _zz_b2m_fsm_sel_bytesInBurst;
  wire       [25:0]   _zz_b2m_fsm_sel_bytesInBurst_1;
  wire       [11:0]   _zz_b2m_fsm_sel_bytesInBurst_2;
  wire                b2m_fsm_fifoCompletion;
  wire                when_DmaSg_l958;
  wire                when_DmaSg_l963;
  wire                when_DmaSg_l958_1;
  wire                when_DmaSg_l963_1;
  reg                 b2m_fsm_toggle;
  wire                when_DmaSg_l975;
  wire       [11:0]   b2m_fsm_fetch_context_ptr;
  wire                b2m_fsm_fetch_context_toggle;
  wire                when_DmaSg_l995;
  wire       [11:0]   b2m_fsm_aggregate_context_ptr;
  wire                b2m_fsm_aggregate_context_toggle;
  wire       [12:0]   _zz_b2m_fsm_aggregate_context_ptr;
  wire                memory_core_io_reads_2_rsp_s2mPipe_valid;
  reg                 memory_core_io_reads_2_rsp_s2mPipe_ready;
  wire       [127:0]  memory_core_io_reads_2_rsp_s2mPipe_payload_data;
  wire       [15:0]   memory_core_io_reads_2_rsp_s2mPipe_payload_mask;
  wire       [12:0]   memory_core_io_reads_2_rsp_s2mPipe_payload_context;
  reg                 memory_core_io_reads_2_rsp_rValid;
  reg        [127:0]  memory_core_io_reads_2_rsp_rData_data;
  reg        [15:0]   memory_core_io_reads_2_rsp_rData_mask;
  reg        [12:0]   memory_core_io_reads_2_rsp_rData_context;
  wire                when_Stream_l408;
  reg                 b2m_fsm_aggregate_memoryPort_valid;
  wire                b2m_fsm_aggregate_memoryPort_ready;
  wire       [127:0]  b2m_fsm_aggregate_memoryPort_payload_data;
  wire       [15:0]   b2m_fsm_aggregate_memoryPort_payload_mask;
  wire       [12:0]   b2m_fsm_aggregate_memoryPort_payload_context;
  reg                 b2m_fsm_aggregate_first;
  wire                b2m_fsm_aggregate_memoryPort_fire;
  wire                when_DmaSg_l1012;
  wire       [3:0]    b2m_fsm_aggregate_bytesToSkip;
  wire       [15:0]   b2m_fsm_aggregate_bytesToSkipMask;
  reg                 _zz_io_flush;
  wire       [3:0]    b2m_fsm_cmd_maskFirstTrigger;
  wire       [3:0]    b2m_fsm_cmd_maskLastTriggerComb;
  reg        [3:0]    b2m_fsm_cmd_maskLastTriggerReg;
  reg        [15:0]   b2m_fsm_cmd_maskLast;
  wire       [15:0]   b2m_fsm_cmd_maskFirst;
  wire                b2m_fsm_cmd_enoughAggregation;
  wire                io_write_cmd_fire;
  wire                io_write_cmd_fire_1;
  reg                 io_write_cmd_payload_first;
  wire                io_write_cmd_fire_2;
  wire                b2m_fsm_cmd_doPtrIncr;
  wire       [0:0]    b2m_fsm_cmd_context_channel;
  wire       [11:0]   b2m_fsm_cmd_context_length;
  wire                b2m_fsm_cmd_context_doPacketSync;
  wire                io_write_cmd_fire_3;
  wire                io_write_cmd_fire_4;
  wire                when_DmaSg_l1064;
  wire       [1:0]    _zz_2;
  wire       [3:0]    _zz_channels_0_pop_b2m_bytesToSkip;
  wire       [0:0]    b2m_rsp_context_channel;
  wire       [11:0]   b2m_rsp_context_length;
  wire                b2m_rsp_context_doPacketSync;
  wire       [13:0]   _zz_b2m_rsp_context_channel;
  wire                io_write_rsp_fire;
  wire       [1:0]    _zz_3;
  wire                when_DmaSg_l1078;
  wire                when_DmaSg_l1078_1;
  reg                 when_BusSlaveFactory_l366;
  wire                when_BusSlaveFactory_l368;
  reg                 when_BusSlaveFactory_l366_1;
  wire                when_BusSlaveFactory_l368_1;
  reg                 when_BusSlaveFactory_l335;
  wire                when_BusSlaveFactory_l337;
  reg                 when_BusSlaveFactory_l335_1;
  wire                when_BusSlaveFactory_l337_1;
  reg                 when_BusSlaveFactory_l335_2;
  wire                when_BusSlaveFactory_l337_2;
  reg                 when_BusSlaveFactory_l366_2;
  wire                when_BusSlaveFactory_l368_2;
  reg                 when_BusSlaveFactory_l366_3;
  wire                when_BusSlaveFactory_l368_3;
  reg                 when_BusSlaveFactory_l335_3;
  wire                when_BusSlaveFactory_l337_3;
  reg                 when_BusSlaveFactory_l335_4;
  wire                when_BusSlaveFactory_l337_4;
  reg                 when_BusSlaveFactory_l366_4;
  wire                when_BusSlaveFactory_l368_4;
  reg                 when_BusSlaveFactory_l366_5;
  wire                when_BusSlaveFactory_l368_5;
  reg                 when_BusSlaveFactory_l335_5;
  wire                when_BusSlaveFactory_l337_5;
  reg                 when_BusSlaveFactory_l335_6;
  wire                when_BusSlaveFactory_l337_6;
  reg                 when_BusSlaveFactory_l335_7;
  wire                when_BusSlaveFactory_l337_7;
  reg                 when_BusSlaveFactory_l366_6;
  wire                when_BusSlaveFactory_l368_6;
  reg                 when_BusSlaveFactory_l366_7;
  wire                when_BusSlaveFactory_l368_7;
  reg                 when_BusSlaveFactory_l335_8;
  wire                when_BusSlaveFactory_l337_8;
  reg                 when_BusSlaveFactory_l335_9;
  wire                when_BusSlaveFactory_l337_9;
  wire                when_Apb3SlaveFactory_l82;
  wire                when_Apb3SlaveFactory_l82_1;
  wire                when_Apb3SlaveFactory_l82_2;
  wire                when_Apb3SlaveFactory_l82_3;

  assign _zz_channels_0_fifo_pop_withOverride_backupNext = (channels_0_fifo_pop_withOverride_backup + channels_0_fifo_pop_bytesIncr_value);
  assign _zz_channels_0_fifo_pop_withOverride_exposed = (channels_0_fifo_pop_withOverride_exposed - channels_0_fifo_pop_bytesDecr_value);
  assign _zz_channels_0_pop_b2m_request = {3'd0, channels_0_pop_b2m_bytePerBurst};
  assign _zz_channels_0_pop_b2m_request_2 = (channels_0_fifo_words >>> 1);
  assign _zz_channels_0_pop_b2m_request_1 = {1'd0, _zz_channels_0_pop_b2m_request_2};
  assign _zz_channels_0_pop_b2m_memPending = (channels_0_pop_b2m_memPending + _zz_channels_0_pop_b2m_memPending_1);
  assign _zz_channels_0_pop_b2m_memPending_2 = channels_0_pop_b2m_memPendingInc;
  assign _zz_channels_0_pop_b2m_memPending_1 = {3'd0, _zz_channels_0_pop_b2m_memPending_2};
  assign _zz_channels_0_pop_b2m_memPending_4 = channels_0_pop_b2m_memRsp;
  assign _zz_channels_0_pop_b2m_memPending_3 = {3'd0, _zz_channels_0_pop_b2m_memPending_4};
  assign _zz_when_DmaSg_l481 = {12'd0, channels_0_fifo_pop_bytes};
  assign _zz_channels_0_pop_b2m_address = (channels_0_pop_b2m_address - _zz_channels_0_pop_b2m_address_1);
  assign _zz_channels_0_pop_b2m_address_1 = {6'd0, channels_0_bytes};
  assign _zz_channels_0_fifo_push_available = (channels_0_fifo_push_available + channels_0_fifo_pop_ptrIncr_value_regNext);
  assign _zz_channels_1_fifo_pop_withoutOverride_exposed = (channels_1_fifo_pop_withoutOverride_exposed + channels_1_fifo_pop_bytesIncr_value);
  assign _zz_channels_1_push_m2b_memPending = (channels_1_push_m2b_memPending + _zz_channels_1_push_m2b_memPending_1);
  assign _zz_channels_1_push_m2b_memPending_2 = channels_1_push_m2b_memPendingIncr;
  assign _zz_channels_1_push_m2b_memPending_1 = {3'd0, _zz_channels_1_push_m2b_memPending_2};
  assign _zz_channels_1_push_m2b_memPending_4 = channels_1_push_m2b_memPendingDecr;
  assign _zz_channels_1_push_m2b_memPending_3 = {3'd0, _zz_channels_1_push_m2b_memPending_4};
  assign _zz_channels_1_push_m2b_loadRequest_1 = (channels_1_push_m2b_bytePerBurst >>> 3);
  assign _zz_channels_1_push_m2b_loadRequest = {3'd0, _zz_channels_1_push_m2b_loadRequest_1};
  assign _zz_when_DmaSg_l444 = {14'd0, channels_1_push_m2b_bytePerBurst};
  assign _zz_channels_1_push_m2b_address = (channels_1_push_m2b_address - _zz_channels_1_push_m2b_address_1);
  assign _zz_channels_1_push_m2b_address_1 = {6'd0, channels_1_bytes};
  assign _zz_channels_1_fifo_push_available = (channels_1_fifo_push_available + channels_1_fifo_pop_ptrIncr_value_regNext);
  assign _zz_channels_2_fifo_pop_withOverride_backupNext = (channels_2_fifo_pop_withOverride_backup + channels_2_fifo_pop_bytesIncr_value);
  assign _zz_channels_2_fifo_pop_withOverride_exposed = (channels_2_fifo_pop_withOverride_exposed - channels_2_fifo_pop_bytesDecr_value);
  assign _zz_channels_2_pop_b2m_request = {3'd0, channels_2_pop_b2m_bytePerBurst};
  assign _zz_channels_2_pop_b2m_request_2 = (channels_2_fifo_words >>> 1);
  assign _zz_channels_2_pop_b2m_request_1 = {1'd0, _zz_channels_2_pop_b2m_request_2};
  assign _zz_channels_2_pop_b2m_memPending = (channels_2_pop_b2m_memPending + _zz_channels_2_pop_b2m_memPending_1);
  assign _zz_channels_2_pop_b2m_memPending_2 = channels_2_pop_b2m_memPendingInc;
  assign _zz_channels_2_pop_b2m_memPending_1 = {3'd0, _zz_channels_2_pop_b2m_memPending_2};
  assign _zz_channels_2_pop_b2m_memPending_4 = channels_2_pop_b2m_memRsp;
  assign _zz_channels_2_pop_b2m_memPending_3 = {3'd0, _zz_channels_2_pop_b2m_memPending_4};
  assign _zz_when_DmaSg_l481_1 = {12'd0, channels_2_fifo_pop_bytes};
  assign _zz_channels_2_pop_b2m_address = (channels_2_pop_b2m_address - _zz_channels_2_pop_b2m_address_1);
  assign _zz_channels_2_pop_b2m_address_1 = {6'd0, channels_2_bytes};
  assign _zz_channels_2_fifo_push_available = (channels_2_fifo_push_available + channels_2_fifo_pop_ptrIncr_value_regNext);
  assign _zz_channels_3_fifo_pop_withoutOverride_exposed = (channels_3_fifo_pop_withoutOverride_exposed + channels_3_fifo_pop_bytesIncr_value);
  assign _zz_channels_3_push_m2b_memPending = (channels_3_push_m2b_memPending + _zz_channels_3_push_m2b_memPending_1);
  assign _zz_channels_3_push_m2b_memPending_2 = channels_3_push_m2b_memPendingIncr;
  assign _zz_channels_3_push_m2b_memPending_1 = {3'd0, _zz_channels_3_push_m2b_memPending_2};
  assign _zz_channels_3_push_m2b_memPending_4 = channels_3_push_m2b_memPendingDecr;
  assign _zz_channels_3_push_m2b_memPending_3 = {3'd0, _zz_channels_3_push_m2b_memPending_4};
  assign _zz_channels_3_push_m2b_loadRequest_1 = (channels_3_push_m2b_bytePerBurst >>> 3);
  assign _zz_channels_3_push_m2b_loadRequest = {3'd0, _zz_channels_3_push_m2b_loadRequest_1};
  assign _zz_when_DmaSg_l444_1 = {14'd0, channels_3_push_m2b_bytePerBurst};
  assign _zz_channels_3_push_m2b_address = (channels_3_push_m2b_address - _zz_channels_3_push_m2b_address_1);
  assign _zz_channels_3_push_m2b_address_1 = {6'd0, channels_3_bytes};
  assign _zz_channels_3_fifo_push_available = (channels_3_fifo_push_available + channels_3_fifo_pop_ptrIncr_value_regNext);
  assign _zz_s2b_0_cmd_byteCount_8 = (_zz_s2b_0_cmd_byteCount_9 + _zz_s2b_0_cmd_byteCount_11);
  assign _zz_s2b_0_cmd_byteCount_15 = {s2b_0_cmd_sinkHalted_payload_mask[7],s2b_0_cmd_sinkHalted_payload_mask[6]};
  assign _zz_s2b_0_cmd_byteCount_14 = {1'd0, _zz_s2b_0_cmd_byteCount_15};
  assign _zz_s2b_1_cmd_byteCount_8 = (_zz_s2b_1_cmd_byteCount_9 + _zz_s2b_1_cmd_byteCount_11);
  assign _zz_s2b_1_cmd_byteCount_15 = {s2b_1_cmd_sinkHalted_payload_mask[7],s2b_1_cmd_sinkHalted_payload_mask[6]};
  assign _zz_s2b_1_cmd_byteCount_14 = {1'd0, _zz_s2b_1_cmd_byteCount_15};
  assign _zz__zz_m2b_cmd_s0_priority_chosenOh_2 = (_zz_m2b_cmd_s0_priority_chosenOh_1 - _zz__zz_m2b_cmd_s0_priority_chosenOh_2_1);
  assign _zz__zz_m2b_cmd_s0_priority_chosenOh_2_2 = _zz__zz_m2b_cmd_s0_priority_chosenOh_2_3;
  assign _zz__zz_m2b_cmd_s0_priority_chosenOh_2_1 = {2'd0, _zz__zz_m2b_cmd_s0_priority_chosenOh_2_2};
  assign _zz_m2b_cmd_s0_length = ((_zz_m2b_cmd_s0_length_1 < m2b_cmd_s0_bytesLeft) ? _zz_m2b_cmd_s0_length_2 : m2b_cmd_s0_bytesLeft);
  assign _zz_m2b_cmd_s0_length_1 = {14'd0, m2b_cmd_s0_lengthHead};
  assign _zz_m2b_cmd_s0_length_2 = {14'd0, m2b_cmd_s0_lengthHead};
  assign _zz_m2b_cmd_s0_lastBurst = {14'd0, m2b_cmd_s0_length};
  assign _zz_m2b_cmd_s1_context_stop = (m2b_cmd_s1_address + _zz_m2b_cmd_s1_context_stop_1);
  assign _zz_m2b_cmd_s1_context_stop_1 = {20'd0, m2b_cmd_s1_length};
  assign _zz_m2b_cmd_s1_addressNext = (m2b_cmd_s1_address + _zz_m2b_cmd_s1_addressNext_1);
  assign _zz_m2b_cmd_s1_addressNext_1 = {20'd0, m2b_cmd_s1_length};
  assign _zz_m2b_cmd_s1_byteLeftNext = (m2b_cmd_s1_bytesLeft - _zz_m2b_cmd_s1_byteLeftNext_1);
  assign _zz_m2b_cmd_s1_byteLeftNext_1 = {14'd0, m2b_cmd_s1_length};
  assign _zz_m2b_cmd_s1_fifoPushDecr = ({1'b0,(_zz_m2b_cmd_s1_fifoPushDecr_1 | 12'h00f)} + _zz_m2b_cmd_s1_fifoPushDecr_4);
  assign _zz_m2b_cmd_s1_fifoPushDecr_1 = (_zz_m2b_cmd_s1_fifoPushDecr_2 + io_read_cmd_payload_fragment_length);
  assign _zz_m2b_cmd_s1_fifoPushDecr_3 = m2b_cmd_s1_address[3 : 0];
  assign _zz_m2b_cmd_s1_fifoPushDecr_2 = {8'd0, _zz_m2b_cmd_s1_fifoPushDecr_3};
  assign _zz_m2b_cmd_s1_fifoPushDecr_5 = {1'b0,1'b1};
  assign _zz_m2b_cmd_s1_fifoPushDecr_4 = {11'd0, _zz_m2b_cmd_s1_fifoPushDecr_5};
  assign _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2 = (_zz_b2m_fsm_arbiter_logic_priority_chosenOh_1 - _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2_1);
  assign _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2_2 = _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2_3;
  assign _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2_1 = {2'd0, _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2_2};
  assign _zz_b2m_fsm_bytesInBurstP1_1 = {1'b0,1'b1};
  assign _zz_b2m_fsm_bytesInBurstP1 = {11'd0, _zz_b2m_fsm_bytesInBurstP1_1};
  assign _zz_b2m_fsm_addressNext = {19'd0, b2m_fsm_bytesInBurstP1};
  assign _zz_b2m_fsm_bytesLeftNext_1 = {1'b0,b2m_fsm_bytesInBurstP1};
  assign _zz_b2m_fsm_bytesLeftNext = {13'd0, _zz_b2m_fsm_bytesLeftNext_1};
  assign _zz__zz_b2m_fsm_sel_bytesInBurst_1 = {11'd0, _zz_b2m_fsm_sel_bytesInBurst};
  assign _zz__zz_b2m_fsm_sel_bytesInBurst_1_1 = {11'd0, _zz_b2m_fsm_sel_bytesInBurst};
  assign _zz__zz_b2m_fsm_sel_bytesInBurst_2 = b2m_fsm_sel_address[11:0];
  assign _zz_b2m_fsm_sel_bytesInBurst_3 = ((_zz_b2m_fsm_sel_bytesInBurst_1 < _zz_b2m_fsm_sel_bytesInBurst_4) ? _zz_b2m_fsm_sel_bytesInBurst_1 : _zz_b2m_fsm_sel_bytesInBurst_5);
  assign _zz_b2m_fsm_sel_bytesInBurst_4 = {14'd0, _zz_b2m_fsm_sel_bytesInBurst_2};
  assign _zz_b2m_fsm_sel_bytesInBurst_5 = {14'd0, _zz_b2m_fsm_sel_bytesInBurst_2};
  assign _zz_b2m_fsm_fifoCompletion = {3'd0, b2m_fsm_sel_bytesInBurst};
  assign _zz_b2m_fsm_fifoCompletion_1 = (b2m_fsm_sel_bytesInFifo - 15'h0001);
  assign _zz_b2m_fsm_beatCounter = (_zz_b2m_fsm_beatCounter_1 + b2m_fsm_sel_bytesInBurst);
  assign _zz_b2m_fsm_beatCounter_2 = b2m_fsm_sel_address[3 : 0];
  assign _zz_b2m_fsm_beatCounter_1 = {8'd0, _zz_b2m_fsm_beatCounter_2};
  assign _zz_b2m_fsm_sel_ptr_1 = (b2m_fsm_sel_ptr + 12'h002);
  assign _zz_b2m_fsm_cmd_maskLastTriggerComb = b2m_fsm_sel_bytesInBurst[3:0];
  assign _zz_channels_0_channelStart = 1'b1;
  assign _zz_channels_0_ctrl_kick = 1'b1;
  assign _zz_channels_0_interrupts_completion_valid = 1'b0;
  assign _zz_channels_0_interrupts_onChannelCompletion_valid = 1'b0;
  assign _zz_channels_0_interrupts_s2mPacket_valid = 1'b0;
  assign _zz_channels_1_channelStart = 1'b1;
  assign _zz_channels_1_ctrl_kick = 1'b1;
  assign _zz_channels_1_interrupts_completion_valid = 1'b0;
  assign _zz_channels_1_interrupts_onChannelCompletion_valid = 1'b0;
  assign _zz_channels_2_channelStart = 1'b1;
  assign _zz_channels_2_ctrl_kick = 1'b1;
  assign _zz_channels_2_interrupts_completion_valid = 1'b0;
  assign _zz_channels_2_interrupts_onChannelCompletion_valid = 1'b0;
  assign _zz_channels_2_interrupts_s2mPacket_valid = 1'b0;
  assign _zz_channels_3_channelStart = 1'b1;
  assign _zz_channels_3_ctrl_kick = 1'b1;
  assign _zz_channels_3_interrupts_completion_valid = 1'b0;
  assign _zz_channels_3_interrupts_onChannelCompletion_valid = 1'b0;
  assign _zz_channels_0_pop_b2m_address_3 = io_ctrl_PWDATA[31 : 0];
  assign _zz_channels_0_pop_b2m_address_2 = _zz_channels_0_pop_b2m_address_3;
  assign _zz_channels_1_push_m2b_address_3 = io_ctrl_PWDATA[31 : 0];
  assign _zz_channels_1_push_m2b_address_2 = _zz_channels_1_push_m2b_address_3;
  assign _zz_channels_2_pop_b2m_address_3 = io_ctrl_PWDATA[31 : 0];
  assign _zz_channels_2_pop_b2m_address_2 = _zz_channels_2_pop_b2m_address_3;
  assign _zz_channels_3_push_m2b_address_3 = io_ctrl_PWDATA[31 : 0];
  assign _zz_channels_3_push_m2b_address_2 = _zz_channels_3_push_m2b_address_3;
  assign _zz_channels_0_fifo_push_ptrIncr_value_1 = ((when_DmaSg_l627 && (s2b_0_cmd_sinkHalted_payload_mask != 8'h0)) ? 1'b1 : 1'b0);
  assign _zz_channels_0_fifo_push_ptrIncr_value = {11'd0, _zz_channels_0_fifo_push_ptrIncr_value_1};
  assign _zz_channels_0_fifo_pop_bytesIncr_value_2 = (_zz_channels_0_fifo_pop_bytesIncr_value ? s2b_0_rsp_context_bytes : 4'b0000);
  assign _zz_channels_0_fifo_pop_bytesIncr_value_1 = {11'd0, _zz_channels_0_fifo_pop_bytesIncr_value_2};
  assign _zz_channels_0_fifo_pop_ptrIncr_value_1 = ((b2m_fsm_cmd_doPtrIncr && (b2m_fsm_sel_channel == 1'b0)) ? 2'b10 : 2'b00);
  assign _zz_channels_0_fifo_pop_ptrIncr_value = {10'd0, _zz_channels_0_fifo_pop_ptrIncr_value_1};
  assign _zz_channels_1_fifo_push_ptrIncr_value_1 = ((memory_core_io_writes_2_cmd_fire && (m2b_rsp_context_channel == 1'b0)) ? 2'b10 : 2'b00);
  assign _zz_channels_1_fifo_push_ptrIncr_value = {10'd0, _zz_channels_1_fifo_push_ptrIncr_value_1};
  assign _zz_channels_1_fifo_pop_bytesIncr_value_2 = (_zz_channels_1_fifo_pop_bytesIncr_value ? _zz_channels_1_fifo_pop_bytesIncr_value_3 : 5'h0);
  assign _zz_channels_1_fifo_pop_bytesIncr_value_1 = {10'd0, _zz_channels_1_fifo_pop_bytesIncr_value_2};
  assign _zz_channels_1_fifo_pop_bytesIncr_value_3 = (m2b_writeRsp_context_loadByteInNextBeat + 5'h01);
  assign _zz_channels_1_fifo_pop_ptrIncr_value_1 = ((b2s_0_cmd_channelsOh[0] && memory_core_io_reads_0_cmd_ready) ? 1'b1 : 1'b0);
  assign _zz_channels_1_fifo_pop_ptrIncr_value = {11'd0, _zz_channels_1_fifo_pop_ptrIncr_value_1};
  assign _zz_channels_2_fifo_push_ptrIncr_value_1 = ((when_DmaSg_l627_1 && (s2b_1_cmd_sinkHalted_payload_mask != 8'h0)) ? 1'b1 : 1'b0);
  assign _zz_channels_2_fifo_push_ptrIncr_value = {11'd0, _zz_channels_2_fifo_push_ptrIncr_value_1};
  assign _zz_channels_2_fifo_pop_bytesIncr_value_2 = (_zz_channels_2_fifo_pop_bytesIncr_value ? s2b_1_rsp_context_bytes : 4'b0000);
  assign _zz_channels_2_fifo_pop_bytesIncr_value_1 = {11'd0, _zz_channels_2_fifo_pop_bytesIncr_value_2};
  assign _zz_channels_2_fifo_pop_ptrIncr_value_1 = ((b2m_fsm_cmd_doPtrIncr && (b2m_fsm_sel_channel == 1'b1)) ? 2'b10 : 2'b00);
  assign _zz_channels_2_fifo_pop_ptrIncr_value = {10'd0, _zz_channels_2_fifo_pop_ptrIncr_value_1};
  assign _zz_channels_3_fifo_push_ptrIncr_value_1 = ((memory_core_io_writes_2_cmd_fire_1 && (m2b_rsp_context_channel == 1'b1)) ? 2'b10 : 2'b00);
  assign _zz_channels_3_fifo_push_ptrIncr_value = {10'd0, _zz_channels_3_fifo_push_ptrIncr_value_1};
  assign _zz_channels_3_fifo_pop_bytesIncr_value_2 = (_zz_channels_3_fifo_pop_bytesIncr_value ? _zz_channels_3_fifo_pop_bytesIncr_value_3 : 5'h0);
  assign _zz_channels_3_fifo_pop_bytesIncr_value_1 = {10'd0, _zz_channels_3_fifo_pop_bytesIncr_value_2};
  assign _zz_channels_3_fifo_pop_bytesIncr_value_3 = (m2b_writeRsp_context_loadByteInNextBeat + 5'h01);
  assign _zz_channels_3_fifo_pop_ptrIncr_value_1 = ((b2s_1_cmd_channelsOh[0] && memory_core_io_reads_1_cmd_ready) ? 1'b1 : 1'b0);
  assign _zz_channels_3_fifo_pop_ptrIncr_value = {11'd0, _zz_channels_3_fifo_pop_ptrIncr_value_1};
  assign _zz_s2b_0_cmd_byteCount_10 = {s2b_0_cmd_sinkHalted_payload_mask[2],{s2b_0_cmd_sinkHalted_payload_mask[1],s2b_0_cmd_sinkHalted_payload_mask[0]}};
  assign _zz_s2b_0_cmd_byteCount_12 = {s2b_0_cmd_sinkHalted_payload_mask[5],{s2b_0_cmd_sinkHalted_payload_mask[4],s2b_0_cmd_sinkHalted_payload_mask[3]}};
  assign _zz_s2b_1_cmd_byteCount_10 = {s2b_1_cmd_sinkHalted_payload_mask[2],{s2b_1_cmd_sinkHalted_payload_mask[1],s2b_1_cmd_sinkHalted_payload_mask[0]}};
  assign _zz_s2b_1_cmd_byteCount_12 = {s2b_1_cmd_sinkHalted_payload_mask[5],{s2b_1_cmd_sinkHalted_payload_mask[4],s2b_1_cmd_sinkHalted_payload_mask[3]}};
  assign _zz_s2b_0_cmd_firsts = io_inputs_0_payload_last_regNextWhen_5;
  assign _zz_s2b_0_cmd_firsts_1 = {io_inputs_0_payload_last_regNextWhen_4,{io_inputs_0_payload_last_regNextWhen_3,{io_inputs_0_payload_last_regNextWhen_2,{io_inputs_0_payload_last_regNextWhen_1,io_inputs_0_payload_last_regNextWhen}}}};
  assign _zz_s2b_1_cmd_firsts = io_inputs_1_payload_last_regNextWhen_5;
  assign _zz_s2b_1_cmd_firsts_1 = {io_inputs_1_payload_last_regNextWhen_4,{io_inputs_1_payload_last_regNextWhen_3,{io_inputs_1_payload_last_regNextWhen_2,{io_inputs_1_payload_last_regNextWhen_1,io_inputs_1_payload_last_regNextWhen}}}};
  assign _zz_b2m_fsm_aggregate_bytesToSkipMask = 4'b1101;
  assign _zz_b2m_fsm_aggregate_bytesToSkipMask_1 = (! b2m_fsm_aggregate_first);
  assign _zz_b2m_fsm_aggregate_bytesToSkipMask_2 = (b2m_fsm_aggregate_bytesToSkip <= 4'b1100);
  assign _zz_b2m_fsm_aggregate_bytesToSkipMask_3 = ((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 4'b1011));
  assign _zz_b2m_fsm_aggregate_bytesToSkipMask_4 = ((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 4'b1010));
  assign _zz_b2m_fsm_aggregate_bytesToSkipMask_5 = {((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 4'b1001)),{((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 4'b1000)),{((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= _zz_b2m_fsm_aggregate_bytesToSkipMask_6)),{(_zz_b2m_fsm_aggregate_bytesToSkipMask_7 || _zz_b2m_fsm_aggregate_bytesToSkipMask_8),{_zz_b2m_fsm_aggregate_bytesToSkipMask_9,{_zz_b2m_fsm_aggregate_bytesToSkipMask_10,_zz_b2m_fsm_aggregate_bytesToSkipMask_11}}}}}};
  assign _zz_b2m_fsm_aggregate_bytesToSkipMask_6 = 4'b0111;
  assign _zz_b2m_fsm_aggregate_bytesToSkipMask_7 = (! b2m_fsm_aggregate_first);
  assign _zz_b2m_fsm_aggregate_bytesToSkipMask_8 = (b2m_fsm_aggregate_bytesToSkip <= 4'b0110);
  assign _zz_b2m_fsm_aggregate_bytesToSkipMask_9 = ((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 4'b0101));
  assign _zz_b2m_fsm_aggregate_bytesToSkipMask_10 = ((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 4'b0100));
  assign _zz_b2m_fsm_aggregate_bytesToSkipMask_11 = {((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 4'b0011)),{((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 4'b0010)),{((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 4'b0001)),((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 4'b0000))}}};
  assign _zz_b2m_fsm_cmd_maskLast = 4'b1010;
  assign _zz_b2m_fsm_cmd_maskLast_1 = (4'b1001 <= b2m_fsm_cmd_maskLastTriggerComb);
  assign _zz_b2m_fsm_cmd_maskLast_2 = (4'b1000 <= b2m_fsm_cmd_maskLastTriggerComb);
  assign _zz_b2m_fsm_cmd_maskLast_3 = {(4'b0111 <= b2m_fsm_cmd_maskLastTriggerComb),{(4'b0110 <= b2m_fsm_cmd_maskLastTriggerComb),{(4'b0101 <= b2m_fsm_cmd_maskLastTriggerComb),{(4'b0100 <= b2m_fsm_cmd_maskLastTriggerComb),{(4'b0011 <= b2m_fsm_cmd_maskLastTriggerComb),{(4'b0010 <= b2m_fsm_cmd_maskLastTriggerComb),{(_zz_b2m_fsm_cmd_maskLast_4 <= b2m_fsm_cmd_maskLastTriggerComb),(_zz_b2m_fsm_cmd_maskLast_5 <= b2m_fsm_cmd_maskLastTriggerComb)}}}}}}};
  assign _zz_b2m_fsm_cmd_maskLast_4 = 4'b0001;
  assign _zz_b2m_fsm_cmd_maskLast_5 = 4'b0000;
  assign _zz_b2m_fsm_cmd_maskFirst = 4'b1010;
  assign _zz_b2m_fsm_cmd_maskFirst_1 = (b2m_fsm_cmd_maskFirstTrigger <= 4'b1001);
  assign _zz_b2m_fsm_cmd_maskFirst_2 = (b2m_fsm_cmd_maskFirstTrigger <= 4'b1000);
  assign _zz_b2m_fsm_cmd_maskFirst_3 = {(b2m_fsm_cmd_maskFirstTrigger <= 4'b0111),{(b2m_fsm_cmd_maskFirstTrigger <= 4'b0110),{(b2m_fsm_cmd_maskFirstTrigger <= 4'b0101),{(b2m_fsm_cmd_maskFirstTrigger <= 4'b0100),{(b2m_fsm_cmd_maskFirstTrigger <= 4'b0011),{(b2m_fsm_cmd_maskFirstTrigger <= 4'b0010),{(b2m_fsm_cmd_maskFirstTrigger <= _zz_b2m_fsm_cmd_maskFirst_4),(b2m_fsm_cmd_maskFirstTrigger <= _zz_b2m_fsm_cmd_maskFirst_5)}}}}}}};
  assign _zz_b2m_fsm_cmd_maskFirst_4 = 4'b0001;
  assign _zz_b2m_fsm_cmd_maskFirst_5 = 4'b0000;
  EfxDMA_DmaMemoryCore memory_core (
    .io_writes_0_cmd_valid               (s2b_0_cmd_sinkHalted_valid                         ), //i
    .io_writes_0_cmd_ready               (memory_core_io_writes_0_cmd_ready                  ), //o
    .io_writes_0_cmd_payload_address     (memory_core_io_writes_0_cmd_payload_address[10:0]  ), //i
    .io_writes_0_cmd_payload_data        (s2b_0_cmd_sinkHalted_payload_data[63:0]            ), //i
    .io_writes_0_cmd_payload_mask        (s2b_0_cmd_sinkHalted_payload_mask[7:0]             ), //i
    .io_writes_0_cmd_payload_priority    (channels_0_priority[1:0]                           ), //i
    .io_writes_0_cmd_payload_context     (memory_core_io_writes_0_cmd_payload_context[6:0]   ), //i
    .io_writes_0_rsp_valid               (memory_core_io_writes_0_rsp_valid                  ), //o
    .io_writes_0_rsp_payload_context     (memory_core_io_writes_0_rsp_payload_context[6:0]   ), //o
    .io_writes_1_cmd_valid               (s2b_1_cmd_sinkHalted_valid                         ), //i
    .io_writes_1_cmd_ready               (memory_core_io_writes_1_cmd_ready                  ), //o
    .io_writes_1_cmd_payload_address     (memory_core_io_writes_1_cmd_payload_address[10:0]  ), //i
    .io_writes_1_cmd_payload_data        (s2b_1_cmd_sinkHalted_payload_data[63:0]            ), //i
    .io_writes_1_cmd_payload_mask        (s2b_1_cmd_sinkHalted_payload_mask[7:0]             ), //i
    .io_writes_1_cmd_payload_priority    (channels_2_priority[1:0]                           ), //i
    .io_writes_1_cmd_payload_context     (memory_core_io_writes_1_cmd_payload_context[6:0]   ), //i
    .io_writes_1_rsp_valid               (memory_core_io_writes_1_rsp_valid                  ), //o
    .io_writes_1_rsp_payload_context     (memory_core_io_writes_1_rsp_payload_context[6:0]   ), //o
    .io_writes_2_cmd_valid               (io_read_rsp_valid                                  ), //i
    .io_writes_2_cmd_ready               (memory_core_io_writes_2_cmd_ready                  ), //o
    .io_writes_2_cmd_payload_address     (memory_core_io_writes_2_cmd_payload_address[10:0]  ), //i
    .io_writes_2_cmd_payload_data        (io_read_rsp_payload_fragment_data[127:0]           ), //i
    .io_writes_2_cmd_payload_mask        (memory_core_io_writes_2_cmd_payload_mask[15:0]     ), //i
    .io_writes_2_cmd_payload_context     (memory_core_io_writes_2_cmd_payload_context[7:0]   ), //i
    .io_writes_2_rsp_valid               (memory_core_io_writes_2_rsp_valid                  ), //o
    .io_writes_2_rsp_payload_context     (memory_core_io_writes_2_rsp_payload_context[7:0]   ), //o
    .io_reads_0_cmd_valid                (memory_core_io_reads_0_cmd_valid                   ), //i
    .io_reads_0_cmd_ready                (memory_core_io_reads_0_cmd_ready                   ), //o
    .io_reads_0_cmd_payload_address      (memory_core_io_reads_0_cmd_payload_address[10:0]   ), //i
    .io_reads_0_cmd_payload_priority     (channels_1_priority[1:0]                           ), //i
    .io_reads_0_cmd_payload_context      (memory_core_io_reads_0_cmd_payload_context[2:0]    ), //i
    .io_reads_0_rsp_valid                (memory_core_io_reads_0_rsp_valid                   ), //o
    .io_reads_0_rsp_ready                (io_outputs_0_ready                                 ), //i
    .io_reads_0_rsp_payload_data         (memory_core_io_reads_0_rsp_payload_data[63:0]      ), //o
    .io_reads_0_rsp_payload_mask         (memory_core_io_reads_0_rsp_payload_mask[7:0]       ), //o
    .io_reads_0_rsp_payload_context      (memory_core_io_reads_0_rsp_payload_context[2:0]    ), //o
    .io_reads_1_cmd_valid                (memory_core_io_reads_1_cmd_valid                   ), //i
    .io_reads_1_cmd_ready                (memory_core_io_reads_1_cmd_ready                   ), //o
    .io_reads_1_cmd_payload_address      (memory_core_io_reads_1_cmd_payload_address[10:0]   ), //i
    .io_reads_1_cmd_payload_priority     (channels_3_priority[1:0]                           ), //i
    .io_reads_1_cmd_payload_context      (memory_core_io_reads_1_cmd_payload_context[2:0]    ), //i
    .io_reads_1_rsp_valid                (memory_core_io_reads_1_rsp_valid                   ), //o
    .io_reads_1_rsp_ready                (io_outputs_1_ready                                 ), //i
    .io_reads_1_rsp_payload_data         (memory_core_io_reads_1_rsp_payload_data[63:0]      ), //o
    .io_reads_1_rsp_payload_mask         (memory_core_io_reads_1_rsp_payload_mask[7:0]       ), //o
    .io_reads_1_rsp_payload_context      (memory_core_io_reads_1_rsp_payload_context[2:0]    ), //o
    .io_reads_2_cmd_valid                (b2m_fsm_sel_valid                                  ), //i
    .io_reads_2_cmd_ready                (memory_core_io_reads_2_cmd_ready                   ), //o
    .io_reads_2_cmd_payload_address      (memory_core_io_reads_2_cmd_payload_address[10:0]   ), //i
    .io_reads_2_cmd_payload_context      (memory_core_io_reads_2_cmd_payload_context[12:0]   ), //i
    .io_reads_2_rsp_valid                (memory_core_io_reads_2_rsp_valid                   ), //o
    .io_reads_2_rsp_ready                (memory_core_io_reads_2_rsp_ready                   ), //i
    .io_reads_2_rsp_payload_data         (memory_core_io_reads_2_rsp_payload_data[127:0]     ), //o
    .io_reads_2_rsp_payload_mask         (memory_core_io_reads_2_rsp_payload_mask[15:0]      ), //o
    .io_reads_2_rsp_payload_context      (memory_core_io_reads_2_rsp_payload_context[12:0]   ), //o
    .clk                                 (clk                                                ), //i
    .reset                               (reset                                              )  //i
  );
  EfxDMA_Aggregator b2m_fsm_aggregate_engine (
    .io_input_valid            (b2m_fsm_aggregate_memoryPort_valid                    ), //i
    .io_input_ready            (b2m_fsm_aggregate_engine_io_input_ready               ), //o
    .io_input_payload_data     (b2m_fsm_aggregate_memoryPort_payload_data[127:0]      ), //i
    .io_input_payload_mask     (b2m_fsm_aggregate_engine_io_input_payload_mask[15:0]  ), //i
    .io_output_data            (b2m_fsm_aggregate_engine_io_output_data[127:0]        ), //o
    .io_output_mask            (b2m_fsm_aggregate_engine_io_output_mask[15:0]         ), //o
    .io_output_enough          (b2m_fsm_cmd_enoughAggregation                         ), //i
    .io_output_consume         (io_write_cmd_fire                                     ), //i
    .io_output_consumed        (b2m_fsm_aggregate_engine_io_output_consumed           ), //o
    .io_output_lastByteUsed    (b2m_fsm_cmd_maskLastTriggerReg[3:0]                   ), //i
    .io_output_usedUntil       (b2m_fsm_aggregate_engine_io_output_usedUntil[3:0]     ), //o
    .io_flush                  (b2m_fsm_aggregate_engine_io_flush                     ), //i
    .io_offset                 (b2m_fsm_aggregate_engine_io_offset[3:0]               ), //i
    .io_burstLength            (b2m_fsm_sel_bytesInBurst[11:0]                        ), //i
    .clk                       (clk                                                   ), //i
    .reset                     (reset                                                 )  //i
  );
  always @(*) begin
    case(_zz_s2b_0_cmd_byteCount_10)
      3'b000 : begin
        _zz_s2b_0_cmd_byteCount_9 = _zz_s2b_0_cmd_byteCount;
      end
      3'b001 : begin
        _zz_s2b_0_cmd_byteCount_9 = _zz_s2b_0_cmd_byteCount_1;
      end
      3'b010 : begin
        _zz_s2b_0_cmd_byteCount_9 = _zz_s2b_0_cmd_byteCount_2;
      end
      3'b011 : begin
        _zz_s2b_0_cmd_byteCount_9 = _zz_s2b_0_cmd_byteCount_3;
      end
      3'b100 : begin
        _zz_s2b_0_cmd_byteCount_9 = _zz_s2b_0_cmd_byteCount_4;
      end
      3'b101 : begin
        _zz_s2b_0_cmd_byteCount_9 = _zz_s2b_0_cmd_byteCount_5;
      end
      3'b110 : begin
        _zz_s2b_0_cmd_byteCount_9 = _zz_s2b_0_cmd_byteCount_6;
      end
      default : begin
        _zz_s2b_0_cmd_byteCount_9 = _zz_s2b_0_cmd_byteCount_7;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s2b_0_cmd_byteCount_12)
      3'b000 : begin
        _zz_s2b_0_cmd_byteCount_11 = _zz_s2b_0_cmd_byteCount;
      end
      3'b001 : begin
        _zz_s2b_0_cmd_byteCount_11 = _zz_s2b_0_cmd_byteCount_1;
      end
      3'b010 : begin
        _zz_s2b_0_cmd_byteCount_11 = _zz_s2b_0_cmd_byteCount_2;
      end
      3'b011 : begin
        _zz_s2b_0_cmd_byteCount_11 = _zz_s2b_0_cmd_byteCount_3;
      end
      3'b100 : begin
        _zz_s2b_0_cmd_byteCount_11 = _zz_s2b_0_cmd_byteCount_4;
      end
      3'b101 : begin
        _zz_s2b_0_cmd_byteCount_11 = _zz_s2b_0_cmd_byteCount_5;
      end
      3'b110 : begin
        _zz_s2b_0_cmd_byteCount_11 = _zz_s2b_0_cmd_byteCount_6;
      end
      default : begin
        _zz_s2b_0_cmd_byteCount_11 = _zz_s2b_0_cmd_byteCount_7;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s2b_0_cmd_byteCount_14)
      3'b000 : begin
        _zz_s2b_0_cmd_byteCount_13 = _zz_s2b_0_cmd_byteCount;
      end
      3'b001 : begin
        _zz_s2b_0_cmd_byteCount_13 = _zz_s2b_0_cmd_byteCount_1;
      end
      3'b010 : begin
        _zz_s2b_0_cmd_byteCount_13 = _zz_s2b_0_cmd_byteCount_2;
      end
      3'b011 : begin
        _zz_s2b_0_cmd_byteCount_13 = _zz_s2b_0_cmd_byteCount_3;
      end
      3'b100 : begin
        _zz_s2b_0_cmd_byteCount_13 = _zz_s2b_0_cmd_byteCount_4;
      end
      3'b101 : begin
        _zz_s2b_0_cmd_byteCount_13 = _zz_s2b_0_cmd_byteCount_5;
      end
      3'b110 : begin
        _zz_s2b_0_cmd_byteCount_13 = _zz_s2b_0_cmd_byteCount_6;
      end
      default : begin
        _zz_s2b_0_cmd_byteCount_13 = _zz_s2b_0_cmd_byteCount_7;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s2b_1_cmd_byteCount_10)
      3'b000 : begin
        _zz_s2b_1_cmd_byteCount_9 = _zz_s2b_1_cmd_byteCount;
      end
      3'b001 : begin
        _zz_s2b_1_cmd_byteCount_9 = _zz_s2b_1_cmd_byteCount_1;
      end
      3'b010 : begin
        _zz_s2b_1_cmd_byteCount_9 = _zz_s2b_1_cmd_byteCount_2;
      end
      3'b011 : begin
        _zz_s2b_1_cmd_byteCount_9 = _zz_s2b_1_cmd_byteCount_3;
      end
      3'b100 : begin
        _zz_s2b_1_cmd_byteCount_9 = _zz_s2b_1_cmd_byteCount_4;
      end
      3'b101 : begin
        _zz_s2b_1_cmd_byteCount_9 = _zz_s2b_1_cmd_byteCount_5;
      end
      3'b110 : begin
        _zz_s2b_1_cmd_byteCount_9 = _zz_s2b_1_cmd_byteCount_6;
      end
      default : begin
        _zz_s2b_1_cmd_byteCount_9 = _zz_s2b_1_cmd_byteCount_7;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s2b_1_cmd_byteCount_12)
      3'b000 : begin
        _zz_s2b_1_cmd_byteCount_11 = _zz_s2b_1_cmd_byteCount;
      end
      3'b001 : begin
        _zz_s2b_1_cmd_byteCount_11 = _zz_s2b_1_cmd_byteCount_1;
      end
      3'b010 : begin
        _zz_s2b_1_cmd_byteCount_11 = _zz_s2b_1_cmd_byteCount_2;
      end
      3'b011 : begin
        _zz_s2b_1_cmd_byteCount_11 = _zz_s2b_1_cmd_byteCount_3;
      end
      3'b100 : begin
        _zz_s2b_1_cmd_byteCount_11 = _zz_s2b_1_cmd_byteCount_4;
      end
      3'b101 : begin
        _zz_s2b_1_cmd_byteCount_11 = _zz_s2b_1_cmd_byteCount_5;
      end
      3'b110 : begin
        _zz_s2b_1_cmd_byteCount_11 = _zz_s2b_1_cmd_byteCount_6;
      end
      default : begin
        _zz_s2b_1_cmd_byteCount_11 = _zz_s2b_1_cmd_byteCount_7;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s2b_1_cmd_byteCount_14)
      3'b000 : begin
        _zz_s2b_1_cmd_byteCount_13 = _zz_s2b_1_cmd_byteCount;
      end
      3'b001 : begin
        _zz_s2b_1_cmd_byteCount_13 = _zz_s2b_1_cmd_byteCount_1;
      end
      3'b010 : begin
        _zz_s2b_1_cmd_byteCount_13 = _zz_s2b_1_cmd_byteCount_2;
      end
      3'b011 : begin
        _zz_s2b_1_cmd_byteCount_13 = _zz_s2b_1_cmd_byteCount_3;
      end
      3'b100 : begin
        _zz_s2b_1_cmd_byteCount_13 = _zz_s2b_1_cmd_byteCount_4;
      end
      3'b101 : begin
        _zz_s2b_1_cmd_byteCount_13 = _zz_s2b_1_cmd_byteCount_5;
      end
      3'b110 : begin
        _zz_s2b_1_cmd_byteCount_13 = _zz_s2b_1_cmd_byteCount_6;
      end
      default : begin
        _zz_s2b_1_cmd_byteCount_13 = _zz_s2b_1_cmd_byteCount_7;
      end
    endcase
  end

  always @(*) begin
    case(_zz_m2b_cmd_s0_priority_masked_2)
      2'b00 : begin
        _zz__zz_m2b_cmd_s0_priority_chosenOh_2_3 = m2b_cmd_s0_priority_roundRobins_0;
      end
      2'b01 : begin
        _zz__zz_m2b_cmd_s0_priority_chosenOh_2_3 = m2b_cmd_s0_priority_roundRobins_1;
      end
      2'b10 : begin
        _zz__zz_m2b_cmd_s0_priority_chosenOh_2_3 = m2b_cmd_s0_priority_roundRobins_2;
      end
      default : begin
        _zz__zz_m2b_cmd_s0_priority_chosenOh_2_3 = m2b_cmd_s0_priority_roundRobins_3;
      end
    endcase
  end

  always @(*) begin
    case(m2b_cmd_s0_priority_chosen)
      1'b0 : begin
        _zz_m2b_cmd_s0_priority_weightLast = (channels_1_weight == m2b_cmd_s0_priority_counter);
      end
      default : begin
        _zz_m2b_cmd_s0_priority_weightLast = (channels_3_weight == m2b_cmd_s0_priority_counter);
      end
    endcase
  end

  always @(*) begin
    case(m2b_cmd_s0_chosen)
      1'b0 : begin
        _zz_m2b_cmd_s0_address = channels_1_push_m2b_address;
        _zz_m2b_cmd_s0_bytesLeft = channels_1_push_m2b_bytesLeft;
        _zz_m2b_cmd_s0_lengthHead = channels_1_push_m2b_bytePerBurst;
      end
      default : begin
        _zz_m2b_cmd_s0_address = channels_3_push_m2b_address;
        _zz_m2b_cmd_s0_bytesLeft = channels_3_push_m2b_bytesLeft;
        _zz_m2b_cmd_s0_lengthHead = channels_3_push_m2b_bytePerBurst;
      end
    endcase
  end

  always @(*) begin
    case(m2b_rsp_context_channel)
      1'b0 : begin
        _zz_io_writes_2_cmd_payload_address = channels_1_fifo_push_ptrWithBase;
      end
      default : begin
        _zz_io_writes_2_cmd_payload_address = channels_3_fifo_push_ptrWithBase;
      end
    endcase
  end

  always @(*) begin
    case(_zz_b2m_fsm_arbiter_logic_priority_masked_2)
      2'b00 : begin
        _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2_3 = b2m_fsm_arbiter_logic_priority_roundRobins_0;
      end
      2'b01 : begin
        _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2_3 = b2m_fsm_arbiter_logic_priority_roundRobins_1;
      end
      2'b10 : begin
        _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2_3 = b2m_fsm_arbiter_logic_priority_roundRobins_2;
      end
      default : begin
        _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2_3 = b2m_fsm_arbiter_logic_priority_roundRobins_3;
      end
    endcase
  end

  always @(*) begin
    case(b2m_fsm_arbiter_logic_priority_chosen)
      1'b0 : begin
        _zz_b2m_fsm_arbiter_logic_priority_weightLast = (channels_0_weight == b2m_fsm_arbiter_logic_priority_counter);
      end
      default : begin
        _zz_b2m_fsm_arbiter_logic_priority_weightLast = (channels_2_weight == b2m_fsm_arbiter_logic_priority_counter);
      end
    endcase
  end

  always @(*) begin
    case(b2m_fsm_arbiter_logic_chosen)
      1'b0 : begin
        _zz_b2m_fsm_sel_address = channels_0_pop_b2m_address;
        _zz_b2m_fsm_sel_ptr = channels_0_fifo_pop_ptrWithBase;
        _zz_b2m_fsm_sel_ptrMask = channels_0_fifo_words;
        _zz_b2m_fsm_sel_bytePerBurst = channels_0_pop_b2m_bytePerBurst;
        _zz_b2m_fsm_sel_bytesInFifo = channels_0_fifo_pop_bytes;
        _zz_b2m_fsm_sel_flush = channels_0_pop_b2m_flush;
        _zz_b2m_fsm_sel_packet = channels_0_pop_b2m_packet;
        _zz_b2m_fsm_sel_bytesLeft = channels_0_pop_b2m_bytesLeft;
      end
      default : begin
        _zz_b2m_fsm_sel_address = channels_2_pop_b2m_address;
        _zz_b2m_fsm_sel_ptr = channels_2_fifo_pop_ptrWithBase;
        _zz_b2m_fsm_sel_ptrMask = channels_2_fifo_words;
        _zz_b2m_fsm_sel_bytePerBurst = channels_2_pop_b2m_bytePerBurst;
        _zz_b2m_fsm_sel_bytesInFifo = channels_2_fifo_pop_bytes;
        _zz_b2m_fsm_sel_flush = channels_2_pop_b2m_flush;
        _zz_b2m_fsm_sel_packet = channels_2_pop_b2m_packet;
        _zz_b2m_fsm_sel_bytesLeft = channels_2_pop_b2m_bytesLeft;
      end
    endcase
  end

  always @(*) begin
    case(b2m_fsm_sel_channel)
      1'b0 : begin
        _zz_b2m_fsm_fetch_context_ptr = channels_0_fifo_pop_ptr;
        _zz_b2m_fsm_aggregate_bytesToSkip = channels_0_pop_b2m_bytesToSkip;
      end
      default : begin
        _zz_b2m_fsm_fetch_context_ptr = channels_2_fifo_pop_ptr;
        _zz_b2m_fsm_aggregate_bytesToSkip = channels_2_pop_b2m_bytesToSkip;
      end
    endcase
  end

  assign io_ctrl_PREADY = 1'b1;
  always @(*) begin
    io_ctrl_PRDATA = 32'h0;
    case(io_ctrl_PADDR)
      14'h002c : begin
        io_ctrl_PRDATA[0 : 0] = channels_0_channelValid;
      end
      14'h0054 : begin
        io_ctrl_PRDATA[0 : 0] = channels_0_interrupts_completion_valid;
        io_ctrl_PRDATA[2 : 2] = channels_0_interrupts_onChannelCompletion_valid;
        io_ctrl_PRDATA[4 : 4] = channels_0_interrupts_s2mPacket_valid;
      end
      14'h00ac : begin
        io_ctrl_PRDATA[0 : 0] = channels_1_channelValid;
      end
      14'h00d4 : begin
        io_ctrl_PRDATA[0 : 0] = channels_1_interrupts_completion_valid;
        io_ctrl_PRDATA[2 : 2] = channels_1_interrupts_onChannelCompletion_valid;
      end
      14'h012c : begin
        io_ctrl_PRDATA[0 : 0] = channels_2_channelValid;
      end
      14'h0154 : begin
        io_ctrl_PRDATA[0 : 0] = channels_2_interrupts_completion_valid;
        io_ctrl_PRDATA[2 : 2] = channels_2_interrupts_onChannelCompletion_valid;
        io_ctrl_PRDATA[4 : 4] = channels_2_interrupts_s2mPacket_valid;
      end
      14'h01ac : begin
        io_ctrl_PRDATA[0 : 0] = channels_3_channelValid;
      end
      14'h01d4 : begin
        io_ctrl_PRDATA[0 : 0] = channels_3_interrupts_completion_valid;
        io_ctrl_PRDATA[2 : 2] = channels_3_interrupts_onChannelCompletion_valid;
      end
      default : begin
      end
    endcase
  end

  assign io_ctrl_PSLVERROR = 1'b0;
  assign ctrl_askWrite = ((io_ctrl_PSEL[0] && io_ctrl_PENABLE) && io_ctrl_PWRITE);
  assign ctrl_askRead = ((io_ctrl_PSEL[0] && io_ctrl_PENABLE) && (! io_ctrl_PWRITE));
  assign ctrl_doWrite = (((io_ctrl_PSEL[0] && io_ctrl_PENABLE) && io_ctrl_PREADY) && io_ctrl_PWRITE);
  assign ctrl_doRead = (((io_ctrl_PSEL[0] && io_ctrl_PENABLE) && io_ctrl_PREADY) && (! io_ctrl_PWRITE));
  always @(*) begin
    channels_0_channelStart = 1'b0;
    if(when_BusSlaveFactory_l366) begin
      if(when_BusSlaveFactory_l368) begin
        channels_0_channelStart = _zz_channels_0_channelStart[0];
      end
    end
  end

  always @(*) begin
    channels_0_channelCompletion = 1'b0;
    if(channels_0_channelValid) begin
      if(channels_0_channelStop) begin
        if(channels_0_readyToStop) begin
          channels_0_channelCompletion = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    channels_0_descriptorStart = 1'b0;
    if(channels_0_ctrl_kick) begin
      channels_0_descriptorStart = 1'b1;
    end
    if(channels_0_channelValid) begin
      if(!channels_0_channelStop) begin
        if(when_DmaSg_l537) begin
          if(when_DmaSg_l540) begin
            channels_0_descriptorStart = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    channels_0_descriptorCompletion = 1'b0;
    if(channels_0_pop_b2m_packetSync) begin
      if(when_DmaSg_l494) begin
        if(channels_0_push_s2b_completionOnLast) begin
          channels_0_descriptorCompletion = 1'b1;
        end
      end
    end
    if(when_DmaSg_l509) begin
      channels_0_descriptorCompletion = 1'b1;
    end
    if(channels_0_channelValid) begin
      if(channels_0_channelStop) begin
        if(channels_0_readyToStop) begin
          channels_0_descriptorCompletion = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    channels_0_readyToStop = 1'b1;
    if(when_DmaSg_l525) begin
      channels_0_readyToStop = 1'b0;
    end
  end

  assign channels_0_fifo_base = 12'h0;
  assign channels_0_fifo_words = 12'h0ff;
  assign channels_0_fifo_push_availableDecr = 12'h0;
  assign channels_0_fifo_push_ptrWithBase = ((channels_0_fifo_base & (~ channels_0_fifo_words)) | (channels_0_fifo_push_ptr & channels_0_fifo_words));
  assign channels_0_fifo_pop_ptrWithBase = ((channels_0_fifo_base & (~ channels_0_fifo_words)) | (channels_0_fifo_pop_ptr & channels_0_fifo_words));
  assign channels_0_fifo_pop_empty = (channels_0_fifo_pop_ptr == channels_0_fifo_push_ptr);
  assign channels_0_fifo_pop_withOverride_backupNext = (_zz_channels_0_fifo_pop_withOverride_backupNext - channels_0_fifo_pop_bytesDecr_value);
  always @(*) begin
    channels_0_fifo_pop_withOverride_load = 1'b0;
    if(when_DmaSg_l415) begin
      channels_0_fifo_pop_withOverride_load = 1'b1;
    end
  end

  always @(*) begin
    channels_0_fifo_pop_withOverride_unload = 1'b0;
    if(channels_0_pop_b2m_packetSync) begin
      channels_0_fifo_pop_withOverride_unload = 1'b1;
    end
  end

  assign when_DmaSg_l367 = (channels_0_channelStart || channels_0_fifo_pop_withOverride_unload);
  assign channels_0_fifo_pop_bytes = channels_0_fifo_pop_withOverride_exposed;
  assign channels_0_fifo_empty = (channels_0_fifo_push_ptr == channels_0_fifo_pop_ptr);
  always @(*) begin
    channels_0_push_s2b_packetEvent = 1'b0;
    if(when_DmaSg_l641) begin
      channels_0_push_s2b_packetEvent = 1'b1;
    end
  end

  assign when_DmaSg_l415 = (channels_0_push_s2b_packetEvent && channels_0_push_s2b_completionOnLast);
  assign channels_0_pop_b2m_bytePerBurst = 12'h1ff;
  always @(*) begin
    channels_0_pop_b2m_fire = 1'b0;
    if(when_DmaSg_l897) begin
      if(_zz_1[0]) begin
        channels_0_pop_b2m_fire = 1'b1;
      end
    end
  end

  always @(*) begin
    channels_0_pop_b2m_packetSync = 1'b0;
    if(when_DmaSg_l485) begin
      if(channels_0_pop_b2m_packet) begin
        channels_0_pop_b2m_packetSync = 1'b1;
      end
    end
    if(io_write_rsp_fire) begin
      if(when_DmaSg_l1078) begin
        if(b2m_rsp_context_doPacketSync) begin
          channels_0_pop_b2m_packetSync = 1'b1;
        end
      end
    end
  end

  assign when_DmaSg_l463 = (channels_0_channelStart || channels_0_pop_b2m_fire);
  always @(*) begin
    channels_0_pop_b2m_memRsp = 1'b0;
    if(io_write_rsp_fire) begin
      if(_zz_3[0]) begin
        channels_0_pop_b2m_memRsp = 1'b1;
      end
    end
  end

  assign channels_0_pop_b2m_request = ((((((channels_0_descriptorValid && (! channels_0_channelStop)) && (! channels_0_pop_b2m_waitFinalRsp)) && channels_0_pop_memory) && ((_zz_channels_0_pop_b2m_request < channels_0_fifo_pop_bytes) || ((channels_0_fifo_push_available < _zz_channels_0_pop_b2m_request_1) || channels_0_pop_b2m_flush))) && (channels_0_fifo_pop_bytes != 15'h0)) && (channels_0_pop_b2m_memPending != 4'b1111));
  always @(*) begin
    channels_0_pop_b2m_memPendingInc = 1'b0;
    if(when_DmaSg_l720_1) begin
      if(when_DmaSg_l735_2) begin
        channels_0_pop_b2m_memPendingInc = 1'b1;
      end
    end
  end

  always @(*) begin
    channels_0_pop_b2m_decrBytes = 15'h0;
    if(b2m_fsm_s1) begin
      if(when_DmaSg_l958) begin
        channels_0_pop_b2m_decrBytes = {2'd0, b2m_fsm_bytesInBurstP1};
      end
    end
  end

  assign when_DmaSg_l481 = (channels_0_pop_b2m_bytesLeft < _zz_when_DmaSg_l481);
  assign when_DmaSg_l485 = ((channels_0_pop_b2m_memPending == 4'b0000) && (channels_0_fifo_pop_bytes == 15'h0));
  assign when_DmaSg_l494 = (channels_0_descriptorValid && (! channels_0_push_memory));
  assign when_DmaSg_l509 = ((channels_0_descriptorValid && (channels_0_pop_b2m_memPending == 4'b0000)) && channels_0_pop_b2m_waitFinalRsp);
  assign when_DmaSg_l525 = (channels_0_pop_b2m_memPending != 4'b0000);
  assign channels_0_readyForChannelCompletion = 1'b1;
  assign when_DmaSg_l537 = (! channels_0_descriptorValid);
  always @(*) begin
    _zz_when_DmaSg_l555 = 1'b1;
    if(when_DmaSg_l540) begin
      _zz_when_DmaSg_l555 = 1'b0;
    end
    if(channels_0_ctrl_kick) begin
      _zz_when_DmaSg_l555 = 1'b0;
    end
  end

  assign when_DmaSg_l540 = (channels_0_selfRestart && (! channels_0_ctrl_kick));
  assign when_DmaSg_l555 = (_zz_when_DmaSg_l555 && channels_0_readyForChannelCompletion);
  assign channels_0_s2b_full = (channels_0_fifo_push_available < 12'h002);
  assign when_DmaSg_l219 = (channels_0_descriptorValid && channels_0_descriptorCompletion);
  assign when_DmaSg_l219_1 = (! channels_0_interrupts_completion_enable);
  assign when_DmaSg_l219_2 = (channels_0_channelValid && channels_0_channelCompletion);
  assign when_DmaSg_l219_3 = (! channels_0_interrupts_onChannelCompletion_enable);
  assign when_DmaSg_l219_4 = (! channels_0_interrupts_s2mPacket_enable);
  always @(*) begin
    channels_1_channelStart = 1'b0;
    if(when_BusSlaveFactory_l366_2) begin
      if(when_BusSlaveFactory_l368_2) begin
        channels_1_channelStart = _zz_channels_1_channelStart[0];
      end
    end
  end

  always @(*) begin
    channels_1_channelCompletion = 1'b0;
    if(channels_1_channelValid) begin
      if(channels_1_channelStop) begin
        if(channels_1_readyToStop) begin
          channels_1_channelCompletion = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    channels_1_descriptorStart = 1'b0;
    if(channels_1_ctrl_kick) begin
      channels_1_descriptorStart = 1'b1;
    end
    if(channels_1_channelValid) begin
      if(!channels_1_channelStop) begin
        if(when_DmaSg_l537_1) begin
          if(when_DmaSg_l540_1) begin
            channels_1_descriptorStart = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    channels_1_descriptorCompletion = 1'b0;
    if(when_DmaSg_l441) begin
      channels_1_descriptorCompletion = 1'b1;
    end
    if(channels_1_channelValid) begin
      if(channels_1_channelStop) begin
        if(channels_1_readyToStop) begin
          channels_1_descriptorCompletion = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    channels_1_readyToStop = 1'b1;
    if(when_DmaSg_l524) begin
      channels_1_readyToStop = 1'b0;
    end
  end

  assign channels_1_fifo_base = 12'h100;
  assign channels_1_fifo_words = 12'h0ff;
  always @(*) begin
    channels_1_fifo_push_availableDecr = 12'h0;
    if(m2b_cmd_s1_valid) begin
      if(io_read_cmd_ready) begin
        if(when_DmaSg_l790) begin
          channels_1_fifo_push_availableDecr = {2'd0, m2b_cmd_s1_fifoPushDecr};
        end
      end
    end
  end

  assign channels_1_fifo_push_ptrWithBase = ((channels_1_fifo_base & (~ channels_1_fifo_words)) | (channels_1_fifo_push_ptr & channels_1_fifo_words));
  assign channels_1_fifo_pop_ptrWithBase = ((channels_1_fifo_base & (~ channels_1_fifo_words)) | (channels_1_fifo_pop_ptr & channels_1_fifo_words));
  assign channels_1_fifo_pop_empty = (channels_1_fifo_pop_ptr == channels_1_fifo_push_ptr);
  assign channels_1_fifo_pop_bytes = channels_1_fifo_pop_withoutOverride_exposed;
  assign channels_1_fifo_empty = (channels_1_fifo_push_ptr == channels_1_fifo_pop_ptr);
  assign channels_1_push_m2b_bytePerBurst = 12'h3ff;
  always @(*) begin
    channels_1_push_m2b_memPendingIncr = 1'b0;
    if(when_DmaSg_l720) begin
      if(when_DmaSg_l735) begin
        channels_1_push_m2b_memPendingIncr = 1'b1;
      end
    end
  end

  always @(*) begin
    channels_1_push_m2b_memPendingDecr = 1'b0;
    if(when_DmaSg_l855) begin
      channels_1_push_m2b_memPendingDecr = 1'b1;
    end
  end

  always @(*) begin
    channels_1_push_m2b_loadRequest = (((((channels_1_descriptorValid && (! channels_1_channelStop)) && (! channels_1_push_m2b_loadDone)) && channels_1_push_memory) && (_zz_channels_1_push_m2b_loadRequest < channels_1_fifo_push_available)) && (channels_1_push_m2b_memPending != 4'b1111));
    if(when_DmaSg_l444) begin
      channels_1_push_m2b_loadRequest = 1'b0;
    end
  end

  always @(*) begin
    channels_1_pop_b2s_veryLastTrigger = 1'b0;
    if(when_DmaSg_l809) begin
      if(when_DmaSg_l810) begin
        channels_1_pop_b2s_veryLastTrigger = 1'b1;
      end
    end
  end

  assign when_DmaSg_l441 = ((((channels_1_descriptorValid && (! channels_1_pop_memory)) && channels_1_push_memory) && channels_1_push_m2b_loadDone) && (channels_1_push_m2b_memPending == 4'b0000));
  assign when_DmaSg_l444 = (((! channels_1_pop_memory) && channels_1_pop_b2s_veryLastValid) && (channels_1_push_m2b_bytesLeft <= _zz_when_DmaSg_l444));
  assign when_DmaSg_l524 = (channels_1_push_m2b_memPending != 4'b0000);
  always @(*) begin
    channels_1_readyForChannelCompletion = 1'b1;
    if(when_DmaSg_l528) begin
      channels_1_readyForChannelCompletion = 1'b0;
    end
  end

  assign when_DmaSg_l528 = ((! channels_1_pop_memory) && (! channels_1_fifo_pop_empty));
  assign when_DmaSg_l537_1 = (! channels_1_descriptorValid);
  always @(*) begin
    _zz_when_DmaSg_l555_1 = 1'b1;
    if(when_DmaSg_l540_1) begin
      _zz_when_DmaSg_l555_1 = 1'b0;
    end
    if(channels_1_ctrl_kick) begin
      _zz_when_DmaSg_l555_1 = 1'b0;
    end
  end

  assign when_DmaSg_l540_1 = (channels_1_selfRestart && (! channels_1_ctrl_kick));
  assign when_DmaSg_l555_1 = (_zz_when_DmaSg_l555_1 && channels_1_readyForChannelCompletion);
  assign channels_1_s2b_full = (channels_1_fifo_push_available < 12'h002);
  assign when_DmaSg_l219_5 = (channels_1_descriptorValid && channels_1_descriptorCompletion);
  assign when_DmaSg_l219_6 = (! channels_1_interrupts_completion_enable);
  assign when_DmaSg_l219_7 = (channels_1_channelValid && channels_1_channelCompletion);
  assign when_DmaSg_l219_8 = (! channels_1_interrupts_onChannelCompletion_enable);
  always @(*) begin
    channels_2_channelStart = 1'b0;
    if(when_BusSlaveFactory_l366_4) begin
      if(when_BusSlaveFactory_l368_4) begin
        channels_2_channelStart = _zz_channels_2_channelStart[0];
      end
    end
  end

  always @(*) begin
    channels_2_channelCompletion = 1'b0;
    if(channels_2_channelValid) begin
      if(channels_2_channelStop) begin
        if(channels_2_readyToStop) begin
          channels_2_channelCompletion = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    channels_2_descriptorStart = 1'b0;
    if(channels_2_ctrl_kick) begin
      channels_2_descriptorStart = 1'b1;
    end
    if(channels_2_channelValid) begin
      if(!channels_2_channelStop) begin
        if(when_DmaSg_l537_2) begin
          if(when_DmaSg_l540_2) begin
            channels_2_descriptorStart = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    channels_2_descriptorCompletion = 1'b0;
    if(channels_2_pop_b2m_packetSync) begin
      if(when_DmaSg_l494_1) begin
        if(channels_2_push_s2b_completionOnLast) begin
          channels_2_descriptorCompletion = 1'b1;
        end
      end
    end
    if(when_DmaSg_l509_1) begin
      channels_2_descriptorCompletion = 1'b1;
    end
    if(channels_2_channelValid) begin
      if(channels_2_channelStop) begin
        if(channels_2_readyToStop) begin
          channels_2_descriptorCompletion = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    channels_2_readyToStop = 1'b1;
    if(when_DmaSg_l525_1) begin
      channels_2_readyToStop = 1'b0;
    end
  end

  assign channels_2_fifo_base = 12'h200;
  assign channels_2_fifo_words = 12'h0ff;
  assign channels_2_fifo_push_availableDecr = 12'h0;
  assign channels_2_fifo_push_ptrWithBase = ((channels_2_fifo_base & (~ channels_2_fifo_words)) | (channels_2_fifo_push_ptr & channels_2_fifo_words));
  assign channels_2_fifo_pop_ptrWithBase = ((channels_2_fifo_base & (~ channels_2_fifo_words)) | (channels_2_fifo_pop_ptr & channels_2_fifo_words));
  assign channels_2_fifo_pop_empty = (channels_2_fifo_pop_ptr == channels_2_fifo_push_ptr);
  assign channels_2_fifo_pop_withOverride_backupNext = (_zz_channels_2_fifo_pop_withOverride_backupNext - channels_2_fifo_pop_bytesDecr_value);
  always @(*) begin
    channels_2_fifo_pop_withOverride_load = 1'b0;
    if(when_DmaSg_l415_1) begin
      channels_2_fifo_pop_withOverride_load = 1'b1;
    end
  end

  always @(*) begin
    channels_2_fifo_pop_withOverride_unload = 1'b0;
    if(channels_2_pop_b2m_packetSync) begin
      channels_2_fifo_pop_withOverride_unload = 1'b1;
    end
  end

  assign when_DmaSg_l367_1 = (channels_2_channelStart || channels_2_fifo_pop_withOverride_unload);
  assign channels_2_fifo_pop_bytes = channels_2_fifo_pop_withOverride_exposed;
  assign channels_2_fifo_empty = (channels_2_fifo_push_ptr == channels_2_fifo_pop_ptr);
  always @(*) begin
    channels_2_push_s2b_packetEvent = 1'b0;
    if(when_DmaSg_l641_1) begin
      channels_2_push_s2b_packetEvent = 1'b1;
    end
  end

  assign when_DmaSg_l415_1 = (channels_2_push_s2b_packetEvent && channels_2_push_s2b_completionOnLast);
  assign channels_2_pop_b2m_bytePerBurst = 12'h1ff;
  always @(*) begin
    channels_2_pop_b2m_fire = 1'b0;
    if(when_DmaSg_l897) begin
      if(_zz_1[1]) begin
        channels_2_pop_b2m_fire = 1'b1;
      end
    end
  end

  always @(*) begin
    channels_2_pop_b2m_packetSync = 1'b0;
    if(when_DmaSg_l485_1) begin
      if(channels_2_pop_b2m_packet) begin
        channels_2_pop_b2m_packetSync = 1'b1;
      end
    end
    if(io_write_rsp_fire) begin
      if(when_DmaSg_l1078_1) begin
        if(b2m_rsp_context_doPacketSync) begin
          channels_2_pop_b2m_packetSync = 1'b1;
        end
      end
    end
  end

  assign when_DmaSg_l463_1 = (channels_2_channelStart || channels_2_pop_b2m_fire);
  always @(*) begin
    channels_2_pop_b2m_memRsp = 1'b0;
    if(io_write_rsp_fire) begin
      if(_zz_3[1]) begin
        channels_2_pop_b2m_memRsp = 1'b1;
      end
    end
  end

  assign channels_2_pop_b2m_request = ((((((channels_2_descriptorValid && (! channels_2_channelStop)) && (! channels_2_pop_b2m_waitFinalRsp)) && channels_2_pop_memory) && ((_zz_channels_2_pop_b2m_request < channels_2_fifo_pop_bytes) || ((channels_2_fifo_push_available < _zz_channels_2_pop_b2m_request_1) || channels_2_pop_b2m_flush))) && (channels_2_fifo_pop_bytes != 15'h0)) && (channels_2_pop_b2m_memPending != 4'b1111));
  always @(*) begin
    channels_2_pop_b2m_memPendingInc = 1'b0;
    if(when_DmaSg_l720_1) begin
      if(when_DmaSg_l735_3) begin
        channels_2_pop_b2m_memPendingInc = 1'b1;
      end
    end
  end

  always @(*) begin
    channels_2_pop_b2m_decrBytes = 15'h0;
    if(b2m_fsm_s1) begin
      if(when_DmaSg_l958_1) begin
        channels_2_pop_b2m_decrBytes = {2'd0, b2m_fsm_bytesInBurstP1};
      end
    end
  end

  assign when_DmaSg_l481_1 = (channels_2_pop_b2m_bytesLeft < _zz_when_DmaSg_l481_1);
  assign when_DmaSg_l485_1 = ((channels_2_pop_b2m_memPending == 4'b0000) && (channels_2_fifo_pop_bytes == 15'h0));
  assign when_DmaSg_l494_1 = (channels_2_descriptorValid && (! channels_2_push_memory));
  assign when_DmaSg_l509_1 = ((channels_2_descriptorValid && (channels_2_pop_b2m_memPending == 4'b0000)) && channels_2_pop_b2m_waitFinalRsp);
  assign when_DmaSg_l525_1 = (channels_2_pop_b2m_memPending != 4'b0000);
  assign channels_2_readyForChannelCompletion = 1'b1;
  assign when_DmaSg_l537_2 = (! channels_2_descriptorValid);
  always @(*) begin
    _zz_when_DmaSg_l555_2 = 1'b1;
    if(when_DmaSg_l540_2) begin
      _zz_when_DmaSg_l555_2 = 1'b0;
    end
    if(channels_2_ctrl_kick) begin
      _zz_when_DmaSg_l555_2 = 1'b0;
    end
  end

  assign when_DmaSg_l540_2 = (channels_2_selfRestart && (! channels_2_ctrl_kick));
  assign when_DmaSg_l555_2 = (_zz_when_DmaSg_l555_2 && channels_2_readyForChannelCompletion);
  assign channels_2_s2b_full = (channels_2_fifo_push_available < 12'h002);
  assign when_DmaSg_l219_9 = (channels_2_descriptorValid && channels_2_descriptorCompletion);
  assign when_DmaSg_l219_10 = (! channels_2_interrupts_completion_enable);
  assign when_DmaSg_l219_11 = (channels_2_channelValid && channels_2_channelCompletion);
  assign when_DmaSg_l219_12 = (! channels_2_interrupts_onChannelCompletion_enable);
  assign when_DmaSg_l219_13 = (! channels_2_interrupts_s2mPacket_enable);
  always @(*) begin
    channels_3_channelStart = 1'b0;
    if(when_BusSlaveFactory_l366_6) begin
      if(when_BusSlaveFactory_l368_6) begin
        channels_3_channelStart = _zz_channels_3_channelStart[0];
      end
    end
  end

  always @(*) begin
    channels_3_channelCompletion = 1'b0;
    if(channels_3_channelValid) begin
      if(channels_3_channelStop) begin
        if(channels_3_readyToStop) begin
          channels_3_channelCompletion = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    channels_3_descriptorStart = 1'b0;
    if(channels_3_ctrl_kick) begin
      channels_3_descriptorStart = 1'b1;
    end
    if(channels_3_channelValid) begin
      if(!channels_3_channelStop) begin
        if(when_DmaSg_l537_3) begin
          if(when_DmaSg_l540_3) begin
            channels_3_descriptorStart = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    channels_3_descriptorCompletion = 1'b0;
    if(when_DmaSg_l441_1) begin
      channels_3_descriptorCompletion = 1'b1;
    end
    if(channels_3_channelValid) begin
      if(channels_3_channelStop) begin
        if(channels_3_readyToStop) begin
          channels_3_descriptorCompletion = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    channels_3_readyToStop = 1'b1;
    if(when_DmaSg_l524_1) begin
      channels_3_readyToStop = 1'b0;
    end
  end

  assign channels_3_fifo_base = 12'h300;
  assign channels_3_fifo_words = 12'h0ff;
  always @(*) begin
    channels_3_fifo_push_availableDecr = 12'h0;
    if(m2b_cmd_s1_valid) begin
      if(io_read_cmd_ready) begin
        if(when_DmaSg_l790_1) begin
          channels_3_fifo_push_availableDecr = {2'd0, m2b_cmd_s1_fifoPushDecr};
        end
      end
    end
  end

  assign channels_3_fifo_push_ptrWithBase = ((channels_3_fifo_base & (~ channels_3_fifo_words)) | (channels_3_fifo_push_ptr & channels_3_fifo_words));
  assign channels_3_fifo_pop_ptrWithBase = ((channels_3_fifo_base & (~ channels_3_fifo_words)) | (channels_3_fifo_pop_ptr & channels_3_fifo_words));
  assign channels_3_fifo_pop_empty = (channels_3_fifo_pop_ptr == channels_3_fifo_push_ptr);
  assign channels_3_fifo_pop_bytes = channels_3_fifo_pop_withoutOverride_exposed;
  assign channels_3_fifo_empty = (channels_3_fifo_push_ptr == channels_3_fifo_pop_ptr);
  assign channels_3_push_m2b_bytePerBurst = 12'h1ff;
  always @(*) begin
    channels_3_push_m2b_memPendingIncr = 1'b0;
    if(when_DmaSg_l720) begin
      if(when_DmaSg_l735_1) begin
        channels_3_push_m2b_memPendingIncr = 1'b1;
      end
    end
  end

  always @(*) begin
    channels_3_push_m2b_memPendingDecr = 1'b0;
    if(when_DmaSg_l855_1) begin
      channels_3_push_m2b_memPendingDecr = 1'b1;
    end
  end

  always @(*) begin
    channels_3_push_m2b_loadRequest = (((((channels_3_descriptorValid && (! channels_3_channelStop)) && (! channels_3_push_m2b_loadDone)) && channels_3_push_memory) && (_zz_channels_3_push_m2b_loadRequest < channels_3_fifo_push_available)) && (channels_3_push_m2b_memPending != 4'b1111));
    if(when_DmaSg_l444_1) begin
      channels_3_push_m2b_loadRequest = 1'b0;
    end
  end

  always @(*) begin
    channels_3_pop_b2s_veryLastTrigger = 1'b0;
    if(when_DmaSg_l809) begin
      if(when_DmaSg_l810_1) begin
        channels_3_pop_b2s_veryLastTrigger = 1'b1;
      end
    end
  end

  assign when_DmaSg_l441_1 = ((((channels_3_descriptorValid && (! channels_3_pop_memory)) && channels_3_push_memory) && channels_3_push_m2b_loadDone) && (channels_3_push_m2b_memPending == 4'b0000));
  assign when_DmaSg_l444_1 = (((! channels_3_pop_memory) && channels_3_pop_b2s_veryLastValid) && (channels_3_push_m2b_bytesLeft <= _zz_when_DmaSg_l444_1));
  assign when_DmaSg_l524_1 = (channels_3_push_m2b_memPending != 4'b0000);
  always @(*) begin
    channels_3_readyForChannelCompletion = 1'b1;
    if(when_DmaSg_l528_1) begin
      channels_3_readyForChannelCompletion = 1'b0;
    end
  end

  assign when_DmaSg_l528_1 = ((! channels_3_pop_memory) && (! channels_3_fifo_pop_empty));
  assign when_DmaSg_l537_3 = (! channels_3_descriptorValid);
  always @(*) begin
    _zz_when_DmaSg_l555_3 = 1'b1;
    if(when_DmaSg_l540_3) begin
      _zz_when_DmaSg_l555_3 = 1'b0;
    end
    if(channels_3_ctrl_kick) begin
      _zz_when_DmaSg_l555_3 = 1'b0;
    end
  end

  assign when_DmaSg_l540_3 = (channels_3_selfRestart && (! channels_3_ctrl_kick));
  assign when_DmaSg_l555_3 = (_zz_when_DmaSg_l555_3 && channels_3_readyForChannelCompletion);
  assign channels_3_s2b_full = (channels_3_fifo_push_available < 12'h002);
  assign when_DmaSg_l219_14 = (channels_3_descriptorValid && channels_3_descriptorCompletion);
  assign when_DmaSg_l219_15 = (! channels_3_interrupts_completion_enable);
  assign when_DmaSg_l219_16 = (channels_3_channelValid && channels_3_channelCompletion);
  assign when_DmaSg_l219_17 = (! channels_3_interrupts_onChannelCompletion_enable);
  assign io_inputs_0_fire = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12 = (io_inputs_0_fire && (io_inputs_0_payload_sink == 4'b0000));
  assign io_inputs_0_fire_1 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_1 = (io_inputs_0_fire_1 && (io_inputs_0_payload_sink == 4'b0001));
  assign io_inputs_0_fire_2 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_2 = (io_inputs_0_fire_2 && (io_inputs_0_payload_sink == 4'b0010));
  assign io_inputs_0_fire_3 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_3 = (io_inputs_0_fire_3 && (io_inputs_0_payload_sink == 4'b0011));
  assign io_inputs_0_fire_4 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_4 = (io_inputs_0_fire_4 && (io_inputs_0_payload_sink == 4'b0100));
  assign io_inputs_0_fire_5 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_5 = (io_inputs_0_fire_5 && (io_inputs_0_payload_sink == 4'b0101));
  assign io_inputs_0_fire_6 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_6 = (io_inputs_0_fire_6 && (io_inputs_0_payload_sink == 4'b0110));
  assign io_inputs_0_fire_7 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_7 = (io_inputs_0_fire_7 && (io_inputs_0_payload_sink == 4'b0111));
  assign io_inputs_0_fire_8 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_8 = (io_inputs_0_fire_8 && (io_inputs_0_payload_sink == 4'b1000));
  assign io_inputs_0_fire_9 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_9 = (io_inputs_0_fire_9 && (io_inputs_0_payload_sink == 4'b1001));
  assign io_inputs_0_fire_10 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_10 = (io_inputs_0_fire_10 && (io_inputs_0_payload_sink == 4'b1010));
  assign io_inputs_0_fire_11 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_11 = (io_inputs_0_fire_11 && (io_inputs_0_payload_sink == 4'b1011));
  assign io_inputs_0_fire_12 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_12 = (io_inputs_0_fire_12 && (io_inputs_0_payload_sink == 4'b1100));
  assign io_inputs_0_fire_13 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_13 = (io_inputs_0_fire_13 && (io_inputs_0_payload_sink == 4'b1101));
  assign io_inputs_0_fire_14 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_14 = (io_inputs_0_fire_14 && (io_inputs_0_payload_sink == 4'b1110));
  assign io_inputs_0_fire_15 = (io_inputs_0_valid && io_inputs_0_ready);
  assign when_package_l12_15 = (io_inputs_0_fire_15 && (io_inputs_0_payload_sink == 4'b1111));
  assign s2b_0_cmd_firsts = {io_inputs_0_payload_last_regNextWhen_15,{io_inputs_0_payload_last_regNextWhen_14,{io_inputs_0_payload_last_regNextWhen_13,{io_inputs_0_payload_last_regNextWhen_12,{io_inputs_0_payload_last_regNextWhen_11,{io_inputs_0_payload_last_regNextWhen_10,{io_inputs_0_payload_last_regNextWhen_9,{io_inputs_0_payload_last_regNextWhen_8,{io_inputs_0_payload_last_regNextWhen_7,{io_inputs_0_payload_last_regNextWhen_6,{_zz_s2b_0_cmd_firsts,_zz_s2b_0_cmd_firsts_1}}}}}}}}}}};
  assign s2b_0_cmd_first = s2b_0_cmd_firsts[io_inputs_0_payload_sink];
  assign s2b_0_cmd_channelsOh = ((((channels_0_channelValid && (s2b_0_cmd_first || (! channels_0_push_s2b_waitFirst))) && (! channels_0_push_memory)) && 1'b1) && (io_inputs_0_payload_sink == 4'b0000));
  assign s2b_0_cmd_noHit = (! (s2b_0_cmd_channelsOh != 1'b0));
  assign s2b_0_cmd_channelsFull = (channels_0_s2b_full || (channels_0_push_s2b_packetLock && io_inputs_0_payload_last));
  always @(*) begin
    io_inputs_0_thrown_valid = io_inputs_0_valid;
    if(s2b_0_cmd_noHit) begin
      io_inputs_0_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    io_inputs_0_ready = io_inputs_0_thrown_ready;
    if(s2b_0_cmd_noHit) begin
      io_inputs_0_ready = 1'b1;
    end
  end

  assign io_inputs_0_thrown_payload_data = io_inputs_0_payload_data;
  assign io_inputs_0_thrown_payload_mask = io_inputs_0_payload_mask;
  assign io_inputs_0_thrown_payload_sink = io_inputs_0_payload_sink;
  assign io_inputs_0_thrown_payload_last = io_inputs_0_payload_last;
  assign _zz_io_inputs_0_thrown_ready = (! ((s2b_0_cmd_channelsOh & s2b_0_cmd_channelsFull) != 1'b0));
  assign s2b_0_cmd_sinkHalted_valid = (io_inputs_0_thrown_valid && _zz_io_inputs_0_thrown_ready);
  assign io_inputs_0_thrown_ready = (s2b_0_cmd_sinkHalted_ready && _zz_io_inputs_0_thrown_ready);
  assign s2b_0_cmd_sinkHalted_payload_data = io_inputs_0_thrown_payload_data;
  assign s2b_0_cmd_sinkHalted_payload_mask = io_inputs_0_thrown_payload_mask;
  assign s2b_0_cmd_sinkHalted_payload_sink = io_inputs_0_thrown_payload_sink;
  assign s2b_0_cmd_sinkHalted_payload_last = io_inputs_0_thrown_payload_last;
  assign _zz_s2b_0_cmd_byteCount = 4'b0000;
  assign _zz_s2b_0_cmd_byteCount_1 = 4'b0001;
  assign _zz_s2b_0_cmd_byteCount_2 = 4'b0001;
  assign _zz_s2b_0_cmd_byteCount_3 = 4'b0010;
  assign _zz_s2b_0_cmd_byteCount_4 = 4'b0001;
  assign _zz_s2b_0_cmd_byteCount_5 = 4'b0010;
  assign _zz_s2b_0_cmd_byteCount_6 = 4'b0010;
  assign _zz_s2b_0_cmd_byteCount_7 = 4'b0011;
  assign s2b_0_cmd_byteCount = (_zz_s2b_0_cmd_byteCount_8 + _zz_s2b_0_cmd_byteCount_13);
  assign s2b_0_cmd_context_channel = s2b_0_cmd_channelsOh;
  assign s2b_0_cmd_context_bytes = s2b_0_cmd_byteCount;
  assign s2b_0_cmd_context_flush = io_inputs_0_payload_last;
  assign s2b_0_cmd_context_packet = io_inputs_0_payload_last;
  assign s2b_0_cmd_sinkHalted_ready = memory_core_io_writes_0_cmd_ready;
  assign memory_core_io_writes_0_cmd_payload_address = channels_0_fifo_push_ptrWithBase[10:0];
  assign memory_core_io_writes_0_cmd_payload_context = {s2b_0_cmd_context_packet,{s2b_0_cmd_context_flush,{s2b_0_cmd_context_bytes,s2b_0_cmd_context_channel}}};
  assign memory_core_io_writes_0_cmd_fire = (s2b_0_cmd_sinkHalted_valid && memory_core_io_writes_0_cmd_ready);
  assign when_DmaSg_l627 = (s2b_0_cmd_channelsOh[0] && memory_core_io_writes_0_cmd_fire);
  assign _zz_s2b_0_rsp_context_channel = memory_core_io_writes_0_rsp_payload_context;
  assign s2b_0_rsp_context_channel = _zz_s2b_0_rsp_context_channel[0 : 0];
  assign s2b_0_rsp_context_bytes = _zz_s2b_0_rsp_context_channel[4 : 1];
  assign s2b_0_rsp_context_flush = _zz_s2b_0_rsp_context_channel[5];
  assign s2b_0_rsp_context_packet = _zz_s2b_0_rsp_context_channel[6];
  assign _zz_channels_0_fifo_pop_bytesIncr_value = (memory_core_io_writes_0_rsp_valid && s2b_0_rsp_context_channel[0]);
  assign when_DmaSg_l641 = (_zz_channels_0_fifo_pop_bytesIncr_value && s2b_0_rsp_context_packet);
  assign when_DmaSg_l643 = (_zz_channels_0_fifo_pop_bytesIncr_value && s2b_0_rsp_context_flush);
  assign when_DmaSg_l644 = (_zz_channels_0_fifo_pop_bytesIncr_value && s2b_0_rsp_context_packet);
  assign io_inputs_1_fire = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_16 = (io_inputs_1_fire && (io_inputs_1_payload_sink == 4'b0000));
  assign io_inputs_1_fire_1 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_17 = (io_inputs_1_fire_1 && (io_inputs_1_payload_sink == 4'b0001));
  assign io_inputs_1_fire_2 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_18 = (io_inputs_1_fire_2 && (io_inputs_1_payload_sink == 4'b0010));
  assign io_inputs_1_fire_3 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_19 = (io_inputs_1_fire_3 && (io_inputs_1_payload_sink == 4'b0011));
  assign io_inputs_1_fire_4 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_20 = (io_inputs_1_fire_4 && (io_inputs_1_payload_sink == 4'b0100));
  assign io_inputs_1_fire_5 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_21 = (io_inputs_1_fire_5 && (io_inputs_1_payload_sink == 4'b0101));
  assign io_inputs_1_fire_6 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_22 = (io_inputs_1_fire_6 && (io_inputs_1_payload_sink == 4'b0110));
  assign io_inputs_1_fire_7 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_23 = (io_inputs_1_fire_7 && (io_inputs_1_payload_sink == 4'b0111));
  assign io_inputs_1_fire_8 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_24 = (io_inputs_1_fire_8 && (io_inputs_1_payload_sink == 4'b1000));
  assign io_inputs_1_fire_9 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_25 = (io_inputs_1_fire_9 && (io_inputs_1_payload_sink == 4'b1001));
  assign io_inputs_1_fire_10 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_26 = (io_inputs_1_fire_10 && (io_inputs_1_payload_sink == 4'b1010));
  assign io_inputs_1_fire_11 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_27 = (io_inputs_1_fire_11 && (io_inputs_1_payload_sink == 4'b1011));
  assign io_inputs_1_fire_12 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_28 = (io_inputs_1_fire_12 && (io_inputs_1_payload_sink == 4'b1100));
  assign io_inputs_1_fire_13 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_29 = (io_inputs_1_fire_13 && (io_inputs_1_payload_sink == 4'b1101));
  assign io_inputs_1_fire_14 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_30 = (io_inputs_1_fire_14 && (io_inputs_1_payload_sink == 4'b1110));
  assign io_inputs_1_fire_15 = (io_inputs_1_valid && io_inputs_1_ready);
  assign when_package_l12_31 = (io_inputs_1_fire_15 && (io_inputs_1_payload_sink == 4'b1111));
  assign s2b_1_cmd_firsts = {io_inputs_1_payload_last_regNextWhen_15,{io_inputs_1_payload_last_regNextWhen_14,{io_inputs_1_payload_last_regNextWhen_13,{io_inputs_1_payload_last_regNextWhen_12,{io_inputs_1_payload_last_regNextWhen_11,{io_inputs_1_payload_last_regNextWhen_10,{io_inputs_1_payload_last_regNextWhen_9,{io_inputs_1_payload_last_regNextWhen_8,{io_inputs_1_payload_last_regNextWhen_7,{io_inputs_1_payload_last_regNextWhen_6,{_zz_s2b_1_cmd_firsts,_zz_s2b_1_cmd_firsts_1}}}}}}}}}}};
  assign s2b_1_cmd_first = s2b_1_cmd_firsts[io_inputs_1_payload_sink];
  assign s2b_1_cmd_channelsOh = ((((channels_2_channelValid && (s2b_1_cmd_first || (! channels_2_push_s2b_waitFirst))) && (! channels_2_push_memory)) && 1'b1) && (io_inputs_1_payload_sink == 4'b0000));
  assign s2b_1_cmd_noHit = (! (s2b_1_cmd_channelsOh != 1'b0));
  assign s2b_1_cmd_channelsFull = (channels_2_s2b_full || (channels_2_push_s2b_packetLock && io_inputs_1_payload_last));
  always @(*) begin
    io_inputs_1_thrown_valid = io_inputs_1_valid;
    if(s2b_1_cmd_noHit) begin
      io_inputs_1_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    io_inputs_1_ready = io_inputs_1_thrown_ready;
    if(s2b_1_cmd_noHit) begin
      io_inputs_1_ready = 1'b1;
    end
  end

  assign io_inputs_1_thrown_payload_data = io_inputs_1_payload_data;
  assign io_inputs_1_thrown_payload_mask = io_inputs_1_payload_mask;
  assign io_inputs_1_thrown_payload_sink = io_inputs_1_payload_sink;
  assign io_inputs_1_thrown_payload_last = io_inputs_1_payload_last;
  assign _zz_io_inputs_1_thrown_ready = (! ((s2b_1_cmd_channelsOh & s2b_1_cmd_channelsFull) != 1'b0));
  assign s2b_1_cmd_sinkHalted_valid = (io_inputs_1_thrown_valid && _zz_io_inputs_1_thrown_ready);
  assign io_inputs_1_thrown_ready = (s2b_1_cmd_sinkHalted_ready && _zz_io_inputs_1_thrown_ready);
  assign s2b_1_cmd_sinkHalted_payload_data = io_inputs_1_thrown_payload_data;
  assign s2b_1_cmd_sinkHalted_payload_mask = io_inputs_1_thrown_payload_mask;
  assign s2b_1_cmd_sinkHalted_payload_sink = io_inputs_1_thrown_payload_sink;
  assign s2b_1_cmd_sinkHalted_payload_last = io_inputs_1_thrown_payload_last;
  assign _zz_s2b_1_cmd_byteCount = 4'b0000;
  assign _zz_s2b_1_cmd_byteCount_1 = 4'b0001;
  assign _zz_s2b_1_cmd_byteCount_2 = 4'b0001;
  assign _zz_s2b_1_cmd_byteCount_3 = 4'b0010;
  assign _zz_s2b_1_cmd_byteCount_4 = 4'b0001;
  assign _zz_s2b_1_cmd_byteCount_5 = 4'b0010;
  assign _zz_s2b_1_cmd_byteCount_6 = 4'b0010;
  assign _zz_s2b_1_cmd_byteCount_7 = 4'b0011;
  assign s2b_1_cmd_byteCount = (_zz_s2b_1_cmd_byteCount_8 + _zz_s2b_1_cmd_byteCount_13);
  assign s2b_1_cmd_context_channel = s2b_1_cmd_channelsOh;
  assign s2b_1_cmd_context_bytes = s2b_1_cmd_byteCount;
  assign s2b_1_cmd_context_flush = io_inputs_1_payload_last;
  assign s2b_1_cmd_context_packet = io_inputs_1_payload_last;
  assign s2b_1_cmd_sinkHalted_ready = memory_core_io_writes_1_cmd_ready;
  assign memory_core_io_writes_1_cmd_payload_address = channels_2_fifo_push_ptrWithBase[10:0];
  assign memory_core_io_writes_1_cmd_payload_context = {s2b_1_cmd_context_packet,{s2b_1_cmd_context_flush,{s2b_1_cmd_context_bytes,s2b_1_cmd_context_channel}}};
  assign memory_core_io_writes_1_cmd_fire = (s2b_1_cmd_sinkHalted_valid && memory_core_io_writes_1_cmd_ready);
  assign when_DmaSg_l627_1 = (s2b_1_cmd_channelsOh[0] && memory_core_io_writes_1_cmd_fire);
  assign _zz_s2b_1_rsp_context_channel = memory_core_io_writes_1_rsp_payload_context;
  assign s2b_1_rsp_context_channel = _zz_s2b_1_rsp_context_channel[0 : 0];
  assign s2b_1_rsp_context_bytes = _zz_s2b_1_rsp_context_channel[4 : 1];
  assign s2b_1_rsp_context_flush = _zz_s2b_1_rsp_context_channel[5];
  assign s2b_1_rsp_context_packet = _zz_s2b_1_rsp_context_channel[6];
  assign _zz_channels_2_fifo_pop_bytesIncr_value = (memory_core_io_writes_1_rsp_valid && s2b_1_rsp_context_channel[0]);
  assign when_DmaSg_l641_1 = (_zz_channels_2_fifo_pop_bytesIncr_value && s2b_1_rsp_context_packet);
  assign when_DmaSg_l643_1 = (_zz_channels_2_fifo_pop_bytesIncr_value && s2b_1_rsp_context_flush);
  assign when_DmaSg_l644_1 = (_zz_channels_2_fifo_pop_bytesIncr_value && s2b_1_rsp_context_packet);
  assign b2s_0_cmd_channelsOh = (((channels_1_channelValid && (! channels_1_pop_memory)) && (channels_1_pop_b2s_portId == 1'b0)) && (! channels_1_fifo_pop_empty));
  assign b2s_0_cmd_veryLastPtr = channels_1_pop_b2s_veryLastPtr;
  assign b2s_0_cmd_address = channels_1_fifo_pop_ptrWithBase;
  assign b2s_0_cmd_context_channel = b2s_0_cmd_channelsOh;
  assign b2s_0_cmd_context_veryLast = ((channels_1_pop_b2s_veryLastValid && (b2s_0_cmd_address[11 : 1] == b2s_0_cmd_veryLastPtr[11 : 1])) && (b2s_0_cmd_address[0 : 0] == 1'b1));
  assign b2s_0_cmd_context_endPacket = channels_1_pop_b2s_veryLastEndPacket;
  assign memory_core_io_reads_0_cmd_valid = (b2s_0_cmd_channelsOh != 1'b0);
  assign memory_core_io_reads_0_cmd_payload_address = b2s_0_cmd_address[10:0];
  assign memory_core_io_reads_0_cmd_payload_context = {b2s_0_cmd_context_endPacket,{b2s_0_cmd_context_veryLast,b2s_0_cmd_context_channel}};
  assign _zz_b2s_0_rsp_context_channel = memory_core_io_reads_0_rsp_payload_context;
  assign b2s_0_rsp_context_channel = _zz_b2s_0_rsp_context_channel[0 : 0];
  assign b2s_0_rsp_context_veryLast = _zz_b2s_0_rsp_context_channel[1];
  assign b2s_0_rsp_context_endPacket = _zz_b2s_0_rsp_context_channel[2];
  assign io_outputs_0_valid = memory_core_io_reads_0_rsp_valid;
  assign io_outputs_0_payload_data = memory_core_io_reads_0_rsp_payload_data;
  assign io_outputs_0_payload_mask = memory_core_io_reads_0_rsp_payload_mask;
  assign io_outputs_0_payload_sink = channels_1_pop_b2s_sinkId;
  assign io_outputs_0_payload_last = (b2s_0_rsp_context_veryLast && b2s_0_rsp_context_endPacket);
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign when_DmaSg_l687 = (io_outputs_0_fire && b2s_0_rsp_context_veryLast);
  assign when_DmaSg_l688 = b2s_0_rsp_context_channel[0];
  assign b2s_1_cmd_channelsOh = (((channels_3_channelValid && (! channels_3_pop_memory)) && (channels_3_pop_b2s_portId == 1'b0)) && (! channels_3_fifo_pop_empty));
  assign b2s_1_cmd_veryLastPtr = channels_3_pop_b2s_veryLastPtr;
  assign b2s_1_cmd_address = channels_3_fifo_pop_ptrWithBase;
  assign b2s_1_cmd_context_channel = b2s_1_cmd_channelsOh;
  assign b2s_1_cmd_context_veryLast = ((channels_3_pop_b2s_veryLastValid && (b2s_1_cmd_address[11 : 1] == b2s_1_cmd_veryLastPtr[11 : 1])) && (b2s_1_cmd_address[0 : 0] == 1'b1));
  assign b2s_1_cmd_context_endPacket = channels_3_pop_b2s_veryLastEndPacket;
  assign memory_core_io_reads_1_cmd_valid = (b2s_1_cmd_channelsOh != 1'b0);
  assign memory_core_io_reads_1_cmd_payload_address = b2s_1_cmd_address[10:0];
  assign memory_core_io_reads_1_cmd_payload_context = {b2s_1_cmd_context_endPacket,{b2s_1_cmd_context_veryLast,b2s_1_cmd_context_channel}};
  assign _zz_b2s_1_rsp_context_channel = memory_core_io_reads_1_rsp_payload_context;
  assign b2s_1_rsp_context_channel = _zz_b2s_1_rsp_context_channel[0 : 0];
  assign b2s_1_rsp_context_veryLast = _zz_b2s_1_rsp_context_channel[1];
  assign b2s_1_rsp_context_endPacket = _zz_b2s_1_rsp_context_channel[2];
  assign io_outputs_1_valid = memory_core_io_reads_1_rsp_valid;
  assign io_outputs_1_payload_data = memory_core_io_reads_1_rsp_payload_data;
  assign io_outputs_1_payload_mask = memory_core_io_reads_1_rsp_payload_mask;
  assign io_outputs_1_payload_sink = channels_3_pop_b2s_sinkId;
  assign io_outputs_1_payload_last = (b2s_1_rsp_context_veryLast && b2s_1_rsp_context_endPacket);
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  assign when_DmaSg_l687_1 = (io_outputs_1_fire && b2s_1_rsp_context_veryLast);
  assign when_DmaSg_l688_1 = b2s_1_rsp_context_channel[0];
  assign _zz_m2b_cmd_s0_priority_masked = channels_1_priority;
  assign _zz_m2b_cmd_s0_priority_masked_1 = channels_3_priority;
  assign _zz_m2b_cmd_s0_priority_masked_2 = (((! channels_3_push_m2b_loadRequest) || (channels_1_push_m2b_loadRequest && (_zz_m2b_cmd_s0_priority_masked_1 < _zz_m2b_cmd_s0_priority_masked))) ? _zz_m2b_cmd_s0_priority_masked : _zz_m2b_cmd_s0_priority_masked_1);
  assign m2b_cmd_s0_priority_masked = {(channels_3_push_m2b_loadRequest && (channels_3_priority == _zz_m2b_cmd_s0_priority_masked_2)),(channels_1_push_m2b_loadRequest && (channels_1_priority == _zz_m2b_cmd_s0_priority_masked_2))};
  assign _zz_m2b_cmd_s0_priority_chosenOh = m2b_cmd_s0_priority_masked;
  assign _zz_m2b_cmd_s0_priority_chosenOh_1 = {_zz_m2b_cmd_s0_priority_chosenOh,_zz_m2b_cmd_s0_priority_chosenOh};
  assign _zz_m2b_cmd_s0_priority_chosenOh_2 = (_zz_m2b_cmd_s0_priority_chosenOh_1 & (~ _zz__zz_m2b_cmd_s0_priority_chosenOh_2));
  assign m2b_cmd_s0_priority_chosenOh = (_zz_m2b_cmd_s0_priority_chosenOh_2[3 : 2] | _zz_m2b_cmd_s0_priority_chosenOh_2[1 : 0]);
  assign _zz_m2b_cmd_s0_priority_chosen = m2b_cmd_s0_priority_chosenOh[1];
  assign m2b_cmd_s0_priority_chosen = _zz_m2b_cmd_s0_priority_chosen;
  assign m2b_cmd_s0_priority_weightLast = _zz_m2b_cmd_s0_priority_weightLast;
  assign m2b_cmd_s0_priority_contextNext = (m2b_cmd_s0_priority_weightLast ? {m2b_cmd_s0_priority_chosenOh[0 : 0],m2b_cmd_s0_priority_chosenOh[1 : 1]} : m2b_cmd_s0_priority_chosenOh);
  assign when_DmaSg_l720 = (! m2b_cmd_s0_valid);
  assign when_DmaSg_l722 = ({channels_3_push_m2b_loadRequest,channels_1_push_m2b_loadRequest} != 2'b00);
  assign when_DmaSg_l725 = (2'b00 == _zz_m2b_cmd_s0_priority_masked_2);
  assign when_DmaSg_l725_1 = (2'b01 == _zz_m2b_cmd_s0_priority_masked_2);
  assign when_DmaSg_l725_2 = (2'b10 == _zz_m2b_cmd_s0_priority_masked_2);
  assign when_DmaSg_l725_3 = (2'b11 == _zz_m2b_cmd_s0_priority_masked_2);
  assign when_DmaSg_l735 = (channels_1_push_m2b_loadRequest && m2b_cmd_s0_priority_chosenOh[0]);
  assign when_DmaSg_l735_1 = (channels_3_push_m2b_loadRequest && m2b_cmd_s0_priority_chosenOh[1]);
  assign m2b_cmd_s0_address = _zz_m2b_cmd_s0_address;
  assign m2b_cmd_s0_bytesLeft = _zz_m2b_cmd_s0_bytesLeft;
  assign m2b_cmd_s0_readAddressBurstRange = m2b_cmd_s0_address[11 : 0];
  assign m2b_cmd_s0_lengthHead = ((~ m2b_cmd_s0_readAddressBurstRange) & _zz_m2b_cmd_s0_lengthHead);
  assign m2b_cmd_s0_length = _zz_m2b_cmd_s0_length[11:0];
  assign m2b_cmd_s0_lastBurst = (m2b_cmd_s0_bytesLeft == _zz_m2b_cmd_s0_lastBurst);
  assign m2b_cmd_s1_context_channel = m2b_cmd_s0_chosen;
  assign m2b_cmd_s1_context_start = m2b_cmd_s1_address[3:0];
  assign m2b_cmd_s1_context_stop = _zz_m2b_cmd_s1_context_stop[3:0];
  assign m2b_cmd_s1_context_last = m2b_cmd_s1_lastBurst;
  assign m2b_cmd_s1_context_length = m2b_cmd_s1_length;
  always @(*) begin
    io_read_cmd_valid = 1'b0;
    if(m2b_cmd_s1_valid) begin
      io_read_cmd_valid = 1'b1;
    end
  end

  assign io_read_cmd_payload_last = 1'b1;
  assign io_read_cmd_payload_fragment_source = m2b_cmd_s0_chosen;
  assign io_read_cmd_payload_fragment_opcode = 1'b0;
  assign io_read_cmd_payload_fragment_address = m2b_cmd_s1_address;
  assign io_read_cmd_payload_fragment_length = m2b_cmd_s1_length;
  assign io_read_cmd_payload_fragment_context = {m2b_cmd_s1_context_last,{m2b_cmd_s1_context_length,{m2b_cmd_s1_context_stop,{m2b_cmd_s1_context_start,m2b_cmd_s1_context_channel}}}};
  assign m2b_cmd_s1_addressNext = (_zz_m2b_cmd_s1_addressNext + 32'h00000001);
  assign m2b_cmd_s1_byteLeftNext = (_zz_m2b_cmd_s1_byteLeftNext - 26'h0000001);
  assign m2b_cmd_s1_fifoPushDecr = (_zz_m2b_cmd_s1_fifoPushDecr >>> 3);
  assign when_DmaSg_l790 = (1'b0 == m2b_cmd_s0_chosen);
  assign when_DmaSg_l790_1 = (1'b1 == m2b_cmd_s0_chosen);
  assign _zz_m2b_rsp_context_channel = io_read_rsp_payload_fragment_context;
  assign m2b_rsp_context_channel = _zz_m2b_rsp_context_channel[0 : 0];
  assign m2b_rsp_context_start = _zz_m2b_rsp_context_channel[4 : 1];
  assign m2b_rsp_context_stop = _zz_m2b_rsp_context_channel[8 : 5];
  assign m2b_rsp_context_length = _zz_m2b_rsp_context_channel[20 : 9];
  assign m2b_rsp_context_last = _zz_m2b_rsp_context_channel[21];
  assign m2b_rsp_veryLast = (m2b_rsp_context_last && io_read_rsp_payload_last);
  assign io_read_rsp_fire = (io_read_rsp_valid && io_read_rsp_ready);
  assign when_DmaSg_l809 = (io_read_rsp_fire && m2b_rsp_veryLast);
  assign when_DmaSg_l810 = (m2b_rsp_context_channel == 1'b0);
  assign when_DmaSg_l810_1 = (m2b_rsp_context_channel == 1'b1);
  assign io_read_rsp_fire_1 = (io_read_rsp_valid && io_read_rsp_ready);
  always @(*) begin
    memory_core_io_writes_2_cmd_payload_mask[0] = ((! (m2b_rsp_first && (4'b0000 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b0000))));
    memory_core_io_writes_2_cmd_payload_mask[1] = ((! (m2b_rsp_first && (4'b0001 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b0001))));
    memory_core_io_writes_2_cmd_payload_mask[2] = ((! (m2b_rsp_first && (4'b0010 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b0010))));
    memory_core_io_writes_2_cmd_payload_mask[3] = ((! (m2b_rsp_first && (4'b0011 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b0011))));
    memory_core_io_writes_2_cmd_payload_mask[4] = ((! (m2b_rsp_first && (4'b0100 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b0100))));
    memory_core_io_writes_2_cmd_payload_mask[5] = ((! (m2b_rsp_first && (4'b0101 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b0101))));
    memory_core_io_writes_2_cmd_payload_mask[6] = ((! (m2b_rsp_first && (4'b0110 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b0110))));
    memory_core_io_writes_2_cmd_payload_mask[7] = ((! (m2b_rsp_first && (4'b0111 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b0111))));
    memory_core_io_writes_2_cmd_payload_mask[8] = ((! (m2b_rsp_first && (4'b1000 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b1000))));
    memory_core_io_writes_2_cmd_payload_mask[9] = ((! (m2b_rsp_first && (4'b1001 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b1001))));
    memory_core_io_writes_2_cmd_payload_mask[10] = ((! (m2b_rsp_first && (4'b1010 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b1010))));
    memory_core_io_writes_2_cmd_payload_mask[11] = ((! (m2b_rsp_first && (4'b1011 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b1011))));
    memory_core_io_writes_2_cmd_payload_mask[12] = ((! (m2b_rsp_first && (4'b1100 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b1100))));
    memory_core_io_writes_2_cmd_payload_mask[13] = ((! (m2b_rsp_first && (4'b1101 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b1101))));
    memory_core_io_writes_2_cmd_payload_mask[14] = ((! (m2b_rsp_first && (4'b1110 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b1110))));
    memory_core_io_writes_2_cmd_payload_mask[15] = ((! (m2b_rsp_first && (4'b1111 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 4'b1111))));
  end

  assign m2b_rsp_writeContext_last = m2b_rsp_veryLast;
  assign m2b_rsp_writeContext_lastOfBurst = io_read_rsp_payload_last;
  assign m2b_rsp_writeContext_channel = m2b_rsp_context_channel;
  assign m2b_rsp_writeContext_loadByteInNextBeat = ({1'b0,(io_read_rsp_payload_last ? m2b_rsp_context_stop : 4'b1111)} - {1'b0,(m2b_rsp_first ? m2b_rsp_context_start : 4'b0000)});
  assign memory_core_io_writes_2_cmd_payload_address = _zz_io_writes_2_cmd_payload_address[10:0];
  assign io_read_rsp_ready = memory_core_io_writes_2_cmd_ready;
  assign memory_core_io_writes_2_cmd_payload_context = {m2b_rsp_writeContext_loadByteInNextBeat,{m2b_rsp_writeContext_channel,{m2b_rsp_writeContext_lastOfBurst,m2b_rsp_writeContext_last}}};
  assign memory_core_io_writes_2_cmd_fire = (io_read_rsp_valid && memory_core_io_writes_2_cmd_ready);
  assign memory_core_io_writes_2_cmd_fire_1 = (io_read_rsp_valid && memory_core_io_writes_2_cmd_ready);
  assign _zz_m2b_writeRsp_context_last = memory_core_io_writes_2_rsp_payload_context;
  assign m2b_writeRsp_context_last = _zz_m2b_writeRsp_context_last[0];
  assign m2b_writeRsp_context_lastOfBurst = _zz_m2b_writeRsp_context_last[1];
  assign m2b_writeRsp_context_channel = _zz_m2b_writeRsp_context_last[2 : 2];
  assign m2b_writeRsp_context_loadByteInNextBeat = _zz_m2b_writeRsp_context_last[7 : 3];
  assign _zz_channels_1_fifo_pop_bytesIncr_value = (memory_core_io_writes_2_rsp_valid && (m2b_writeRsp_context_channel == 1'b0));
  assign when_DmaSg_l855 = (_zz_channels_1_fifo_pop_bytesIncr_value && m2b_writeRsp_context_lastOfBurst);
  assign _zz_channels_3_fifo_pop_bytesIncr_value = (memory_core_io_writes_2_rsp_valid && (m2b_writeRsp_context_channel == 1'b1));
  assign when_DmaSg_l855_1 = (_zz_channels_3_fifo_pop_bytesIncr_value && m2b_writeRsp_context_lastOfBurst);
  assign _zz_b2m_fsm_arbiter_logic_priority_masked = channels_0_priority;
  assign _zz_b2m_fsm_arbiter_logic_priority_masked_1 = channels_2_priority;
  assign _zz_b2m_fsm_arbiter_logic_priority_masked_2 = (((! channels_2_pop_b2m_request) || (channels_0_pop_b2m_request && (_zz_b2m_fsm_arbiter_logic_priority_masked_1 < _zz_b2m_fsm_arbiter_logic_priority_masked))) ? _zz_b2m_fsm_arbiter_logic_priority_masked : _zz_b2m_fsm_arbiter_logic_priority_masked_1);
  assign b2m_fsm_arbiter_logic_priority_masked = {(channels_2_pop_b2m_request && (channels_2_priority == _zz_b2m_fsm_arbiter_logic_priority_masked_2)),(channels_0_pop_b2m_request && (channels_0_priority == _zz_b2m_fsm_arbiter_logic_priority_masked_2))};
  assign _zz_b2m_fsm_arbiter_logic_priority_chosenOh = b2m_fsm_arbiter_logic_priority_masked;
  assign _zz_b2m_fsm_arbiter_logic_priority_chosenOh_1 = {_zz_b2m_fsm_arbiter_logic_priority_chosenOh,_zz_b2m_fsm_arbiter_logic_priority_chosenOh};
  assign _zz_b2m_fsm_arbiter_logic_priority_chosenOh_2 = (_zz_b2m_fsm_arbiter_logic_priority_chosenOh_1 & (~ _zz__zz_b2m_fsm_arbiter_logic_priority_chosenOh_2));
  assign b2m_fsm_arbiter_logic_priority_chosenOh = (_zz_b2m_fsm_arbiter_logic_priority_chosenOh_2[3 : 2] | _zz_b2m_fsm_arbiter_logic_priority_chosenOh_2[1 : 0]);
  assign _zz_b2m_fsm_arbiter_logic_priority_chosen = b2m_fsm_arbiter_logic_priority_chosenOh[1];
  assign b2m_fsm_arbiter_logic_priority_chosen = _zz_b2m_fsm_arbiter_logic_priority_chosen;
  assign b2m_fsm_arbiter_logic_priority_weightLast = _zz_b2m_fsm_arbiter_logic_priority_weightLast;
  assign b2m_fsm_arbiter_logic_priority_contextNext = (b2m_fsm_arbiter_logic_priority_weightLast ? {b2m_fsm_arbiter_logic_priority_chosenOh[0 : 0],b2m_fsm_arbiter_logic_priority_chosenOh[1 : 1]} : b2m_fsm_arbiter_logic_priority_chosenOh);
  assign when_DmaSg_l720_1 = (! b2m_fsm_arbiter_logic_valid);
  assign when_DmaSg_l722_1 = ({channels_2_pop_b2m_request,channels_0_pop_b2m_request} != 2'b00);
  assign when_DmaSg_l725_4 = (2'b00 == _zz_b2m_fsm_arbiter_logic_priority_masked_2);
  assign when_DmaSg_l725_5 = (2'b01 == _zz_b2m_fsm_arbiter_logic_priority_masked_2);
  assign when_DmaSg_l725_6 = (2'b10 == _zz_b2m_fsm_arbiter_logic_priority_masked_2);
  assign when_DmaSg_l725_7 = (2'b11 == _zz_b2m_fsm_arbiter_logic_priority_masked_2);
  assign when_DmaSg_l735_2 = (channels_0_pop_b2m_request && b2m_fsm_arbiter_logic_priority_chosenOh[0]);
  assign when_DmaSg_l735_3 = (channels_2_pop_b2m_request && b2m_fsm_arbiter_logic_priority_chosenOh[1]);
  assign when_DmaSg_l897 = ((! b2m_fsm_sel_valid) && b2m_fsm_arbiter_logic_valid);
  assign _zz_1 = ({1'd0,1'b1} <<< b2m_fsm_arbiter_logic_chosen);
  assign b2m_fsm_bytesInBurstP1 = ({1'b0,b2m_fsm_sel_bytesInBurst} + _zz_b2m_fsm_bytesInBurstP1);
  assign b2m_fsm_addressNext = (b2m_fsm_sel_address + _zz_b2m_fsm_addressNext);
  assign b2m_fsm_bytesLeftNext = ({1'b0,b2m_fsm_sel_bytesLeft} - _zz_b2m_fsm_bytesLeftNext);
  assign b2m_fsm_isFinalCmd = b2m_fsm_bytesLeftNext[26];
  assign b2m_fsm_s0 = (b2m_fsm_sel_valid && (! b2m_fsm_sel_valid_regNext));
  assign when_DmaSg_l948 = (! b2m_fsm_sel_valid);
  assign _zz_b2m_fsm_sel_bytesInBurst = (b2m_fsm_sel_bytesInFifo - 15'h0001);
  assign _zz_b2m_fsm_sel_bytesInBurst_1 = ((_zz__zz_b2m_fsm_sel_bytesInBurst_1 < b2m_fsm_sel_bytesLeft) ? _zz__zz_b2m_fsm_sel_bytesInBurst_1_1 : b2m_fsm_sel_bytesLeft);
  assign _zz_b2m_fsm_sel_bytesInBurst_2 = (b2m_fsm_sel_bytePerBurst - (_zz__zz_b2m_fsm_sel_bytesInBurst_2 & b2m_fsm_sel_bytePerBurst));
  assign b2m_fsm_fifoCompletion = (_zz_b2m_fsm_fifoCompletion == _zz_b2m_fsm_fifoCompletion_1);
  assign when_DmaSg_l958 = (b2m_fsm_sel_channel == 1'b0);
  assign when_DmaSg_l963 = (! b2m_fsm_fifoCompletion);
  assign when_DmaSg_l958_1 = (b2m_fsm_sel_channel == 1'b1);
  assign when_DmaSg_l963_1 = (! b2m_fsm_fifoCompletion);
  assign when_DmaSg_l975 = (b2m_fsm_sel_valid && b2m_fsm_sel_ready);
  always @(*) begin
    b2m_fsm_sel_ready = 1'b0;
    if(when_DmaSg_l1064) begin
      b2m_fsm_sel_ready = 1'b1;
    end
  end

  assign b2m_fsm_fetch_context_ptr = _zz_b2m_fsm_fetch_context_ptr;
  assign b2m_fsm_fetch_context_toggle = b2m_fsm_toggle;
  assign memory_core_io_reads_2_cmd_payload_address = b2m_fsm_sel_ptr[10:0];
  assign memory_core_io_reads_2_cmd_payload_context = {b2m_fsm_fetch_context_toggle,b2m_fsm_fetch_context_ptr};
  assign when_DmaSg_l995 = (b2m_fsm_sel_valid && memory_core_io_reads_2_cmd_ready);
  assign _zz_b2m_fsm_aggregate_context_ptr = memory_core_io_reads_2_rsp_payload_context;
  assign b2m_fsm_aggregate_context_ptr = _zz_b2m_fsm_aggregate_context_ptr[11 : 0];
  assign b2m_fsm_aggregate_context_toggle = _zz_b2m_fsm_aggregate_context_ptr[12];
  assign memory_core_io_reads_2_rsp_ready = (! memory_core_io_reads_2_rsp_rValid);
  assign memory_core_io_reads_2_rsp_s2mPipe_valid = (memory_core_io_reads_2_rsp_valid || memory_core_io_reads_2_rsp_rValid);
  assign memory_core_io_reads_2_rsp_s2mPipe_payload_data = (memory_core_io_reads_2_rsp_rValid ? memory_core_io_reads_2_rsp_rData_data : memory_core_io_reads_2_rsp_payload_data);
  assign memory_core_io_reads_2_rsp_s2mPipe_payload_mask = (memory_core_io_reads_2_rsp_rValid ? memory_core_io_reads_2_rsp_rData_mask : memory_core_io_reads_2_rsp_payload_mask);
  assign memory_core_io_reads_2_rsp_s2mPipe_payload_context = (memory_core_io_reads_2_rsp_rValid ? memory_core_io_reads_2_rsp_rData_context : memory_core_io_reads_2_rsp_payload_context);
  assign when_Stream_l408 = (b2m_fsm_aggregate_context_toggle != b2m_fsm_toggle);
  always @(*) begin
    b2m_fsm_aggregate_memoryPort_valid = memory_core_io_reads_2_rsp_s2mPipe_valid;
    if(when_Stream_l408) begin
      b2m_fsm_aggregate_memoryPort_valid = 1'b0;
    end
  end

  always @(*) begin
    memory_core_io_reads_2_rsp_s2mPipe_ready = b2m_fsm_aggregate_memoryPort_ready;
    if(when_Stream_l408) begin
      memory_core_io_reads_2_rsp_s2mPipe_ready = 1'b1;
    end
  end

  assign b2m_fsm_aggregate_memoryPort_payload_data = memory_core_io_reads_2_rsp_s2mPipe_payload_data;
  assign b2m_fsm_aggregate_memoryPort_payload_mask = memory_core_io_reads_2_rsp_s2mPipe_payload_mask;
  assign b2m_fsm_aggregate_memoryPort_payload_context = memory_core_io_reads_2_rsp_s2mPipe_payload_context;
  assign b2m_fsm_aggregate_memoryPort_fire = (b2m_fsm_aggregate_memoryPort_valid && b2m_fsm_aggregate_memoryPort_ready);
  assign when_DmaSg_l1012 = (! (b2m_fsm_sel_valid && (! b2m_fsm_sel_ready)));
  assign b2m_fsm_aggregate_bytesToSkip = _zz_b2m_fsm_aggregate_bytesToSkip;
  assign b2m_fsm_aggregate_bytesToSkipMask = {((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 4'b1111)),{((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 4'b1110)),{((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= _zz_b2m_fsm_aggregate_bytesToSkipMask)),{(_zz_b2m_fsm_aggregate_bytesToSkipMask_1 || _zz_b2m_fsm_aggregate_bytesToSkipMask_2),{_zz_b2m_fsm_aggregate_bytesToSkipMask_3,{_zz_b2m_fsm_aggregate_bytesToSkipMask_4,_zz_b2m_fsm_aggregate_bytesToSkipMask_5}}}}}};
  assign b2m_fsm_aggregate_memoryPort_ready = b2m_fsm_aggregate_engine_io_input_ready;
  assign b2m_fsm_aggregate_engine_io_input_payload_mask = (b2m_fsm_aggregate_memoryPort_payload_mask & b2m_fsm_aggregate_bytesToSkipMask);
  assign b2m_fsm_aggregate_engine_io_offset = b2m_fsm_sel_address[3:0];
  assign b2m_fsm_aggregate_engine_io_flush = (! _zz_io_flush);
  assign b2m_fsm_cmd_maskFirstTrigger = b2m_fsm_sel_address[3:0];
  assign b2m_fsm_cmd_maskLastTriggerComb = (b2m_fsm_cmd_maskFirstTrigger + _zz_b2m_fsm_cmd_maskLastTriggerComb);
  assign b2m_fsm_cmd_maskFirst = {(b2m_fsm_cmd_maskFirstTrigger <= 4'b1111),{(b2m_fsm_cmd_maskFirstTrigger <= 4'b1110),{(b2m_fsm_cmd_maskFirstTrigger <= 4'b1101),{(b2m_fsm_cmd_maskFirstTrigger <= 4'b1100),{(b2m_fsm_cmd_maskFirstTrigger <= 4'b1011),{(b2m_fsm_cmd_maskFirstTrigger <= _zz_b2m_fsm_cmd_maskFirst),{_zz_b2m_fsm_cmd_maskFirst_1,{_zz_b2m_fsm_cmd_maskFirst_2,_zz_b2m_fsm_cmd_maskFirst_3}}}}}}}};
  assign b2m_fsm_cmd_enoughAggregation = (((b2m_fsm_s2 && b2m_fsm_sel_valid) && (! b2m_fsm_aggregate_engine_io_flush)) && (io_write_cmd_payload_last ? ((b2m_fsm_aggregate_engine_io_output_mask & b2m_fsm_cmd_maskLast) == b2m_fsm_cmd_maskLast) : (b2m_fsm_aggregate_engine_io_output_mask == 16'hffff)));
  assign io_write_cmd_fire = (io_write_cmd_valid && io_write_cmd_ready);
  assign io_write_cmd_valid = b2m_fsm_cmd_enoughAggregation;
  assign io_write_cmd_payload_last = (b2m_fsm_beatCounter == 8'h0);
  assign io_write_cmd_payload_fragment_address = b2m_fsm_sel_address;
  assign io_write_cmd_payload_fragment_opcode = 1'b1;
  assign io_write_cmd_payload_fragment_data = b2m_fsm_aggregate_engine_io_output_data;
  assign io_write_cmd_fire_1 = (io_write_cmd_valid && io_write_cmd_ready);
  assign io_write_cmd_payload_fragment_mask = (~ ((io_write_cmd_payload_first ? (~ b2m_fsm_cmd_maskFirst) : 16'h0) | (io_write_cmd_payload_last ? (~ b2m_fsm_cmd_maskLast) : 16'h0)));
  assign io_write_cmd_payload_fragment_length = b2m_fsm_sel_bytesInBurst;
  assign io_write_cmd_payload_fragment_source = b2m_fsm_sel_channel;
  assign io_write_cmd_fire_2 = (io_write_cmd_valid && io_write_cmd_ready);
  assign b2m_fsm_cmd_doPtrIncr = (b2m_fsm_sel_valid && (b2m_fsm_aggregate_engine_io_output_consumed || ((io_write_cmd_fire_2 && io_write_cmd_payload_last) && (b2m_fsm_aggregate_engine_io_output_usedUntil == 4'b1111))));
  assign b2m_fsm_cmd_context_channel = b2m_fsm_sel_channel;
  assign b2m_fsm_cmd_context_length = b2m_fsm_sel_bytesInBurst;
  assign b2m_fsm_cmd_context_doPacketSync = (b2m_fsm_sel_packet && b2m_fsm_fifoCompletion);
  assign io_write_cmd_payload_fragment_context = {b2m_fsm_cmd_context_doPacketSync,{b2m_fsm_cmd_context_length,b2m_fsm_cmd_context_channel}};
  assign io_write_cmd_fire_3 = (io_write_cmd_valid && io_write_cmd_ready);
  assign io_write_cmd_fire_4 = (io_write_cmd_valid && io_write_cmd_ready);
  assign when_DmaSg_l1064 = (io_write_cmd_fire_4 && io_write_cmd_payload_last);
  assign _zz_2 = ({1'd0,1'b1} <<< b2m_fsm_sel_channel);
  assign _zz_channels_0_pop_b2m_bytesToSkip = (b2m_fsm_aggregate_engine_io_output_usedUntil + 4'b0001);
  assign io_write_rsp_ready = 1'b1;
  assign _zz_b2m_rsp_context_channel = io_write_rsp_payload_fragment_context;
  assign b2m_rsp_context_channel = _zz_b2m_rsp_context_channel[0 : 0];
  assign b2m_rsp_context_length = _zz_b2m_rsp_context_channel[12 : 1];
  assign b2m_rsp_context_doPacketSync = _zz_b2m_rsp_context_channel[13];
  assign io_write_rsp_fire = (io_write_rsp_valid && io_write_rsp_ready);
  assign _zz_3 = ({1'd0,1'b1} <<< b2m_rsp_context_channel);
  assign when_DmaSg_l1078 = (b2m_rsp_context_channel == 1'b0);
  assign when_DmaSg_l1078_1 = (b2m_rsp_context_channel == 1'b1);
  always @(*) begin
    io_interrupts = 4'b0000;
    if(channels_0_interrupts_completion_valid) begin
      io_interrupts[0] = 1'b1;
    end
    if(channels_0_interrupts_onChannelCompletion_valid) begin
      io_interrupts[0] = 1'b1;
    end
    if(channels_0_interrupts_s2mPacket_valid) begin
      io_interrupts[0] = 1'b1;
    end
    if(channels_1_interrupts_completion_valid) begin
      io_interrupts[1] = 1'b1;
    end
    if(channels_1_interrupts_onChannelCompletion_valid) begin
      io_interrupts[1] = 1'b1;
    end
    if(channels_2_interrupts_completion_valid) begin
      io_interrupts[2] = 1'b1;
    end
    if(channels_2_interrupts_onChannelCompletion_valid) begin
      io_interrupts[2] = 1'b1;
    end
    if(channels_2_interrupts_s2mPacket_valid) begin
      io_interrupts[2] = 1'b1;
    end
    if(channels_3_interrupts_completion_valid) begin
      io_interrupts[3] = 1'b1;
    end
    if(channels_3_interrupts_onChannelCompletion_valid) begin
      io_interrupts[3] = 1'b1;
    end
  end

  always @(*) begin
    when_BusSlaveFactory_l366 = 1'b0;
    case(io_ctrl_PADDR)
      14'h002c : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l366 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368 = io_ctrl_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l366_1 = 1'b0;
    case(io_ctrl_PADDR)
      14'h002c : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l366_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368_1 = io_ctrl_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l335 = 1'b0;
    case(io_ctrl_PADDR)
      14'h0054 : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l335 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337 = io_ctrl_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l335_1 = 1'b0;
    case(io_ctrl_PADDR)
      14'h0054 : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l335_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_1 = io_ctrl_PWDATA[2];
  always @(*) begin
    when_BusSlaveFactory_l335_2 = 1'b0;
    case(io_ctrl_PADDR)
      14'h0054 : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l335_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_2 = io_ctrl_PWDATA[4];
  always @(*) begin
    when_BusSlaveFactory_l366_2 = 1'b0;
    case(io_ctrl_PADDR)
      14'h00ac : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l366_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368_2 = io_ctrl_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l366_3 = 1'b0;
    case(io_ctrl_PADDR)
      14'h00ac : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l366_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368_3 = io_ctrl_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l335_3 = 1'b0;
    case(io_ctrl_PADDR)
      14'h00d4 : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l335_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_3 = io_ctrl_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l335_4 = 1'b0;
    case(io_ctrl_PADDR)
      14'h00d4 : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l335_4 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_4 = io_ctrl_PWDATA[2];
  always @(*) begin
    when_BusSlaveFactory_l366_4 = 1'b0;
    case(io_ctrl_PADDR)
      14'h012c : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l366_4 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368_4 = io_ctrl_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l366_5 = 1'b0;
    case(io_ctrl_PADDR)
      14'h012c : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l366_5 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368_5 = io_ctrl_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l335_5 = 1'b0;
    case(io_ctrl_PADDR)
      14'h0154 : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l335_5 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_5 = io_ctrl_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l335_6 = 1'b0;
    case(io_ctrl_PADDR)
      14'h0154 : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l335_6 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_6 = io_ctrl_PWDATA[2];
  always @(*) begin
    when_BusSlaveFactory_l335_7 = 1'b0;
    case(io_ctrl_PADDR)
      14'h0154 : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l335_7 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_7 = io_ctrl_PWDATA[4];
  always @(*) begin
    when_BusSlaveFactory_l366_6 = 1'b0;
    case(io_ctrl_PADDR)
      14'h01ac : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l366_6 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368_6 = io_ctrl_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l366_7 = 1'b0;
    case(io_ctrl_PADDR)
      14'h01ac : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l366_7 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368_7 = io_ctrl_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l335_8 = 1'b0;
    case(io_ctrl_PADDR)
      14'h01d4 : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l335_8 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_8 = io_ctrl_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l335_9 = 1'b0;
    case(io_ctrl_PADDR)
      14'h01d4 : begin
        if(ctrl_doWrite) begin
          when_BusSlaveFactory_l335_9 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_9 = io_ctrl_PWDATA[2];
  assign when_Apb3SlaveFactory_l82 = ((io_ctrl_PADDR & (~ 14'h0003)) == 14'h0010);
  assign when_Apb3SlaveFactory_l82_1 = ((io_ctrl_PADDR & (~ 14'h0003)) == 14'h0080);
  assign when_Apb3SlaveFactory_l82_2 = ((io_ctrl_PADDR & (~ 14'h0003)) == 14'h0110);
  assign when_Apb3SlaveFactory_l82_3 = ((io_ctrl_PADDR & (~ 14'h0003)) == 14'h0180);
  assign channels_0_fifo_push_ptrIncr_value = _zz_channels_0_fifo_push_ptrIncr_value;
  assign channels_0_fifo_pop_bytesIncr_value = _zz_channels_0_fifo_pop_bytesIncr_value_1;
  assign channels_0_fifo_pop_bytesDecr_value = channels_0_pop_b2m_decrBytes;
  assign channels_0_fifo_pop_ptrIncr_value = _zz_channels_0_fifo_pop_ptrIncr_value;
  assign channels_1_fifo_push_ptrIncr_value = _zz_channels_1_fifo_push_ptrIncr_value;
  assign channels_1_fifo_pop_bytesIncr_value = _zz_channels_1_fifo_pop_bytesIncr_value_1;
  assign channels_1_fifo_pop_bytesDecr_value = 15'h0;
  assign channels_1_fifo_pop_ptrIncr_value = _zz_channels_1_fifo_pop_ptrIncr_value;
  assign channels_2_fifo_push_ptrIncr_value = _zz_channels_2_fifo_push_ptrIncr_value;
  assign channels_2_fifo_pop_bytesIncr_value = _zz_channels_2_fifo_pop_bytesIncr_value_1;
  assign channels_2_fifo_pop_bytesDecr_value = channels_2_pop_b2m_decrBytes;
  assign channels_2_fifo_pop_ptrIncr_value = _zz_channels_2_fifo_pop_ptrIncr_value;
  assign channels_3_fifo_push_ptrIncr_value = _zz_channels_3_fifo_push_ptrIncr_value;
  assign channels_3_fifo_pop_bytesIncr_value = _zz_channels_3_fifo_pop_bytesIncr_value_1;
  assign channels_3_fifo_pop_bytesDecr_value = 15'h0;
  assign channels_3_fifo_pop_ptrIncr_value = _zz_channels_3_fifo_pop_ptrIncr_value;
  always @(posedge clk) begin
    if(reset) begin
      channels_0_channelValid <= 1'b0;
      channels_0_descriptorValid <= 1'b0;
      channels_0_priority <= 2'b00;
      channels_0_weight <= 2'b00;
      channels_0_ctrl_kick <= 1'b0;
      channels_0_pop_b2m_memPending <= 4'b0000;
      channels_0_interrupts_completion_enable <= 1'b0;
      channels_0_interrupts_completion_valid <= 1'b0;
      channels_0_interrupts_onChannelCompletion_enable <= 1'b0;
      channels_0_interrupts_onChannelCompletion_valid <= 1'b0;
      channels_0_interrupts_s2mPacket_enable <= 1'b0;
      channels_0_interrupts_s2mPacket_valid <= 1'b0;
      channels_1_channelValid <= 1'b0;
      channels_1_descriptorValid <= 1'b0;
      channels_1_priority <= 2'b00;
      channels_1_weight <= 2'b00;
      channels_1_ctrl_kick <= 1'b0;
      channels_1_push_m2b_loadDone <= 1'b1;
      channels_1_push_m2b_memPending <= 4'b0000;
      channels_1_interrupts_completion_enable <= 1'b0;
      channels_1_interrupts_completion_valid <= 1'b0;
      channels_1_interrupts_onChannelCompletion_enable <= 1'b0;
      channels_1_interrupts_onChannelCompletion_valid <= 1'b0;
      channels_2_channelValid <= 1'b0;
      channels_2_descriptorValid <= 1'b0;
      channels_2_priority <= 2'b00;
      channels_2_weight <= 2'b00;
      channels_2_ctrl_kick <= 1'b0;
      channels_2_pop_b2m_memPending <= 4'b0000;
      channels_2_interrupts_completion_enable <= 1'b0;
      channels_2_interrupts_completion_valid <= 1'b0;
      channels_2_interrupts_onChannelCompletion_enable <= 1'b0;
      channels_2_interrupts_onChannelCompletion_valid <= 1'b0;
      channels_2_interrupts_s2mPacket_enable <= 1'b0;
      channels_2_interrupts_s2mPacket_valid <= 1'b0;
      channels_3_channelValid <= 1'b0;
      channels_3_descriptorValid <= 1'b0;
      channels_3_priority <= 2'b00;
      channels_3_weight <= 2'b00;
      channels_3_ctrl_kick <= 1'b0;
      channels_3_push_m2b_loadDone <= 1'b1;
      channels_3_push_m2b_memPending <= 4'b0000;
      channels_3_interrupts_completion_enable <= 1'b0;
      channels_3_interrupts_completion_valid <= 1'b0;
      channels_3_interrupts_onChannelCompletion_enable <= 1'b0;
      channels_3_interrupts_onChannelCompletion_valid <= 1'b0;
      io_inputs_0_payload_last_regNextWhen <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_1 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_2 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_3 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_4 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_5 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_6 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_7 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_8 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_9 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_10 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_11 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_12 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_13 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_14 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_15 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_1 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_2 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_3 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_4 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_5 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_6 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_7 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_8 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_9 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_10 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_11 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_12 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_13 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_14 <= 1'b1;
      io_inputs_1_payload_last_regNextWhen_15 <= 1'b1;
      m2b_cmd_s0_valid <= 1'b0;
      m2b_cmd_s0_priority_roundRobins_0 <= 2'b01;
      m2b_cmd_s0_priority_roundRobins_1 <= 2'b01;
      m2b_cmd_s0_priority_roundRobins_2 <= 2'b01;
      m2b_cmd_s0_priority_roundRobins_3 <= 2'b01;
      m2b_cmd_s0_priority_counter <= 2'b00;
      m2b_cmd_s1_valid <= 1'b0;
      m2b_rsp_first <= 1'b1;
      b2m_fsm_sel_valid <= 1'b0;
      b2m_fsm_arbiter_logic_valid <= 1'b0;
      b2m_fsm_arbiter_logic_priority_roundRobins_0 <= 2'b01;
      b2m_fsm_arbiter_logic_priority_roundRobins_1 <= 2'b01;
      b2m_fsm_arbiter_logic_priority_roundRobins_2 <= 2'b01;
      b2m_fsm_arbiter_logic_priority_roundRobins_3 <= 2'b01;
      b2m_fsm_arbiter_logic_priority_counter <= 2'b00;
      b2m_fsm_sel_valid_regNext <= 1'b0;
      b2m_fsm_s1 <= 1'b0;
      b2m_fsm_s2 <= 1'b0;
      b2m_fsm_toggle <= 1'b0;
      memory_core_io_reads_2_rsp_rValid <= 1'b0;
      _zz_io_flush <= 1'b0;
      io_write_cmd_payload_first <= 1'b1;
    end else begin
      if(channels_0_channelStart) begin
        channels_0_channelValid <= 1'b1;
      end
      if(channels_0_channelCompletion) begin
        channels_0_channelValid <= 1'b0;
      end
      if(channels_0_descriptorStart) begin
        channels_0_descriptorValid <= 1'b1;
      end
      if(channels_0_descriptorCompletion) begin
        channels_0_descriptorValid <= 1'b0;
      end
      channels_0_ctrl_kick <= 1'b0;
      if(channels_0_channelCompletion) begin
        channels_0_ctrl_kick <= 1'b0;
      end
      channels_0_pop_b2m_memPending <= (_zz_channels_0_pop_b2m_memPending - _zz_channels_0_pop_b2m_memPending_3);
      if(when_DmaSg_l219) begin
        channels_0_interrupts_completion_valid <= 1'b1;
      end
      if(when_DmaSg_l219_1) begin
        channels_0_interrupts_completion_valid <= 1'b0;
      end
      if(when_DmaSg_l219_2) begin
        channels_0_interrupts_onChannelCompletion_valid <= 1'b1;
      end
      if(when_DmaSg_l219_3) begin
        channels_0_interrupts_onChannelCompletion_valid <= 1'b0;
      end
      if(channels_0_pop_b2m_packetSync) begin
        channels_0_interrupts_s2mPacket_valid <= 1'b1;
      end
      if(when_DmaSg_l219_4) begin
        channels_0_interrupts_s2mPacket_valid <= 1'b0;
      end
      if(channels_1_channelStart) begin
        channels_1_channelValid <= 1'b1;
      end
      if(channels_1_channelCompletion) begin
        channels_1_channelValid <= 1'b0;
      end
      if(channels_1_descriptorStart) begin
        channels_1_descriptorValid <= 1'b1;
      end
      if(channels_1_descriptorCompletion) begin
        channels_1_descriptorValid <= 1'b0;
      end
      channels_1_ctrl_kick <= 1'b0;
      if(channels_1_channelCompletion) begin
        channels_1_ctrl_kick <= 1'b0;
      end
      channels_1_push_m2b_memPending <= (_zz_channels_1_push_m2b_memPending - _zz_channels_1_push_m2b_memPending_3);
      if(channels_1_descriptorStart) begin
        channels_1_push_m2b_loadDone <= 1'b0;
      end
      if(when_DmaSg_l219_5) begin
        channels_1_interrupts_completion_valid <= 1'b1;
      end
      if(when_DmaSg_l219_6) begin
        channels_1_interrupts_completion_valid <= 1'b0;
      end
      if(when_DmaSg_l219_7) begin
        channels_1_interrupts_onChannelCompletion_valid <= 1'b1;
      end
      if(when_DmaSg_l219_8) begin
        channels_1_interrupts_onChannelCompletion_valid <= 1'b0;
      end
      if(channels_2_channelStart) begin
        channels_2_channelValid <= 1'b1;
      end
      if(channels_2_channelCompletion) begin
        channels_2_channelValid <= 1'b0;
      end
      if(channels_2_descriptorStart) begin
        channels_2_descriptorValid <= 1'b1;
      end
      if(channels_2_descriptorCompletion) begin
        channels_2_descriptorValid <= 1'b0;
      end
      channels_2_ctrl_kick <= 1'b0;
      if(channels_2_channelCompletion) begin
        channels_2_ctrl_kick <= 1'b0;
      end
      channels_2_pop_b2m_memPending <= (_zz_channels_2_pop_b2m_memPending - _zz_channels_2_pop_b2m_memPending_3);
      if(when_DmaSg_l219_9) begin
        channels_2_interrupts_completion_valid <= 1'b1;
      end
      if(when_DmaSg_l219_10) begin
        channels_2_interrupts_completion_valid <= 1'b0;
      end
      if(when_DmaSg_l219_11) begin
        channels_2_interrupts_onChannelCompletion_valid <= 1'b1;
      end
      if(when_DmaSg_l219_12) begin
        channels_2_interrupts_onChannelCompletion_valid <= 1'b0;
      end
      if(channels_2_pop_b2m_packetSync) begin
        channels_2_interrupts_s2mPacket_valid <= 1'b1;
      end
      if(when_DmaSg_l219_13) begin
        channels_2_interrupts_s2mPacket_valid <= 1'b0;
      end
      if(channels_3_channelStart) begin
        channels_3_channelValid <= 1'b1;
      end
      if(channels_3_channelCompletion) begin
        channels_3_channelValid <= 1'b0;
      end
      if(channels_3_descriptorStart) begin
        channels_3_descriptorValid <= 1'b1;
      end
      if(channels_3_descriptorCompletion) begin
        channels_3_descriptorValid <= 1'b0;
      end
      channels_3_ctrl_kick <= 1'b0;
      if(channels_3_channelCompletion) begin
        channels_3_ctrl_kick <= 1'b0;
      end
      channels_3_push_m2b_memPending <= (_zz_channels_3_push_m2b_memPending - _zz_channels_3_push_m2b_memPending_3);
      if(channels_3_descriptorStart) begin
        channels_3_push_m2b_loadDone <= 1'b0;
      end
      if(when_DmaSg_l219_14) begin
        channels_3_interrupts_completion_valid <= 1'b1;
      end
      if(when_DmaSg_l219_15) begin
        channels_3_interrupts_completion_valid <= 1'b0;
      end
      if(when_DmaSg_l219_16) begin
        channels_3_interrupts_onChannelCompletion_valid <= 1'b1;
      end
      if(when_DmaSg_l219_17) begin
        channels_3_interrupts_onChannelCompletion_valid <= 1'b0;
      end
      if(when_package_l12) begin
        io_inputs_0_payload_last_regNextWhen <= io_inputs_0_payload_last;
      end
      if(when_package_l12_1) begin
        io_inputs_0_payload_last_regNextWhen_1 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_2) begin
        io_inputs_0_payload_last_regNextWhen_2 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_3) begin
        io_inputs_0_payload_last_regNextWhen_3 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_4) begin
        io_inputs_0_payload_last_regNextWhen_4 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_5) begin
        io_inputs_0_payload_last_regNextWhen_5 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_6) begin
        io_inputs_0_payload_last_regNextWhen_6 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_7) begin
        io_inputs_0_payload_last_regNextWhen_7 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_8) begin
        io_inputs_0_payload_last_regNextWhen_8 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_9) begin
        io_inputs_0_payload_last_regNextWhen_9 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_10) begin
        io_inputs_0_payload_last_regNextWhen_10 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_11) begin
        io_inputs_0_payload_last_regNextWhen_11 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_12) begin
        io_inputs_0_payload_last_regNextWhen_12 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_13) begin
        io_inputs_0_payload_last_regNextWhen_13 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_14) begin
        io_inputs_0_payload_last_regNextWhen_14 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_15) begin
        io_inputs_0_payload_last_regNextWhen_15 <= io_inputs_0_payload_last;
      end
      if(when_package_l12_16) begin
        io_inputs_1_payload_last_regNextWhen <= io_inputs_1_payload_last;
      end
      if(when_package_l12_17) begin
        io_inputs_1_payload_last_regNextWhen_1 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_18) begin
        io_inputs_1_payload_last_regNextWhen_2 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_19) begin
        io_inputs_1_payload_last_regNextWhen_3 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_20) begin
        io_inputs_1_payload_last_regNextWhen_4 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_21) begin
        io_inputs_1_payload_last_regNextWhen_5 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_22) begin
        io_inputs_1_payload_last_regNextWhen_6 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_23) begin
        io_inputs_1_payload_last_regNextWhen_7 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_24) begin
        io_inputs_1_payload_last_regNextWhen_8 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_25) begin
        io_inputs_1_payload_last_regNextWhen_9 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_26) begin
        io_inputs_1_payload_last_regNextWhen_10 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_27) begin
        io_inputs_1_payload_last_regNextWhen_11 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_28) begin
        io_inputs_1_payload_last_regNextWhen_12 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_29) begin
        io_inputs_1_payload_last_regNextWhen_13 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_30) begin
        io_inputs_1_payload_last_regNextWhen_14 <= io_inputs_1_payload_last;
      end
      if(when_package_l12_31) begin
        io_inputs_1_payload_last_regNextWhen_15 <= io_inputs_1_payload_last;
      end
      if(when_DmaSg_l720) begin
        if(when_DmaSg_l722) begin
          m2b_cmd_s0_valid <= 1'b1;
          if(when_DmaSg_l725) begin
            m2b_cmd_s0_priority_roundRobins_0 <= m2b_cmd_s0_priority_contextNext;
          end
          if(when_DmaSg_l725_1) begin
            m2b_cmd_s0_priority_roundRobins_1 <= m2b_cmd_s0_priority_contextNext;
          end
          if(when_DmaSg_l725_2) begin
            m2b_cmd_s0_priority_roundRobins_2 <= m2b_cmd_s0_priority_contextNext;
          end
          if(when_DmaSg_l725_3) begin
            m2b_cmd_s0_priority_roundRobins_3 <= m2b_cmd_s0_priority_contextNext;
          end
          m2b_cmd_s0_priority_counter <= (m2b_cmd_s0_priority_counter + 2'b01);
          if(m2b_cmd_s0_priority_weightLast) begin
            m2b_cmd_s0_priority_counter <= 2'b00;
          end
        end
      end
      if(m2b_cmd_s0_valid) begin
        m2b_cmd_s1_valid <= 1'b1;
      end
      if(m2b_cmd_s1_valid) begin
        if(io_read_cmd_ready) begin
          m2b_cmd_s0_valid <= 1'b0;
          m2b_cmd_s1_valid <= 1'b0;
          if(when_DmaSg_l790) begin
            if(m2b_cmd_s1_lastBurst) begin
              channels_1_push_m2b_loadDone <= 1'b1;
            end
          end
          if(when_DmaSg_l790_1) begin
            if(m2b_cmd_s1_lastBurst) begin
              channels_3_push_m2b_loadDone <= 1'b1;
            end
          end
        end
      end
      if(io_read_rsp_fire_1) begin
        m2b_rsp_first <= io_read_rsp_payload_last;
      end
      if(when_DmaSg_l720_1) begin
        if(when_DmaSg_l722_1) begin
          b2m_fsm_arbiter_logic_valid <= 1'b1;
          if(when_DmaSg_l725_4) begin
            b2m_fsm_arbiter_logic_priority_roundRobins_0 <= b2m_fsm_arbiter_logic_priority_contextNext;
          end
          if(when_DmaSg_l725_5) begin
            b2m_fsm_arbiter_logic_priority_roundRobins_1 <= b2m_fsm_arbiter_logic_priority_contextNext;
          end
          if(when_DmaSg_l725_6) begin
            b2m_fsm_arbiter_logic_priority_roundRobins_2 <= b2m_fsm_arbiter_logic_priority_contextNext;
          end
          if(when_DmaSg_l725_7) begin
            b2m_fsm_arbiter_logic_priority_roundRobins_3 <= b2m_fsm_arbiter_logic_priority_contextNext;
          end
          b2m_fsm_arbiter_logic_priority_counter <= (b2m_fsm_arbiter_logic_priority_counter + 2'b01);
          if(b2m_fsm_arbiter_logic_priority_weightLast) begin
            b2m_fsm_arbiter_logic_priority_counter <= 2'b00;
          end
        end
      end
      if(b2m_fsm_sel_ready) begin
        b2m_fsm_sel_valid <= 1'b0;
        if(b2m_fsm_sel_valid) begin
          b2m_fsm_arbiter_logic_valid <= 1'b0;
        end
      end
      if(when_DmaSg_l897) begin
        b2m_fsm_sel_valid <= 1'b1;
      end
      b2m_fsm_sel_valid_regNext <= b2m_fsm_sel_valid;
      b2m_fsm_s1 <= b2m_fsm_s0;
      if(b2m_fsm_s1) begin
        b2m_fsm_s2 <= 1'b1;
      end
      if(when_DmaSg_l948) begin
        b2m_fsm_s2 <= 1'b0;
      end
      if(when_DmaSg_l975) begin
        b2m_fsm_toggle <= (! b2m_fsm_toggle);
      end
      if(memory_core_io_reads_2_rsp_valid) begin
        memory_core_io_reads_2_rsp_rValid <= 1'b1;
      end
      if(memory_core_io_reads_2_rsp_s2mPipe_ready) begin
        memory_core_io_reads_2_rsp_rValid <= 1'b0;
      end
      _zz_io_flush <= (b2m_fsm_sel_valid && (! b2m_fsm_sel_ready));
      if(io_write_cmd_fire_1) begin
        io_write_cmd_payload_first <= io_write_cmd_payload_last;
      end
      if(when_BusSlaveFactory_l366_1) begin
        if(when_BusSlaveFactory_l368_1) begin
          channels_0_ctrl_kick <= _zz_channels_0_ctrl_kick[0];
        end
      end
      if(when_BusSlaveFactory_l335) begin
        if(when_BusSlaveFactory_l337) begin
          channels_0_interrupts_completion_valid <= _zz_channels_0_interrupts_completion_valid[0];
        end
      end
      if(when_BusSlaveFactory_l335_1) begin
        if(when_BusSlaveFactory_l337_1) begin
          channels_0_interrupts_onChannelCompletion_valid <= _zz_channels_0_interrupts_onChannelCompletion_valid[0];
        end
      end
      if(when_BusSlaveFactory_l335_2) begin
        if(when_BusSlaveFactory_l337_2) begin
          channels_0_interrupts_s2mPacket_valid <= _zz_channels_0_interrupts_s2mPacket_valid[0];
        end
      end
      if(when_BusSlaveFactory_l366_3) begin
        if(when_BusSlaveFactory_l368_3) begin
          channels_1_ctrl_kick <= _zz_channels_1_ctrl_kick[0];
        end
      end
      if(when_BusSlaveFactory_l335_3) begin
        if(when_BusSlaveFactory_l337_3) begin
          channels_1_interrupts_completion_valid <= _zz_channels_1_interrupts_completion_valid[0];
        end
      end
      if(when_BusSlaveFactory_l335_4) begin
        if(when_BusSlaveFactory_l337_4) begin
          channels_1_interrupts_onChannelCompletion_valid <= _zz_channels_1_interrupts_onChannelCompletion_valid[0];
        end
      end
      if(when_BusSlaveFactory_l366_5) begin
        if(when_BusSlaveFactory_l368_5) begin
          channels_2_ctrl_kick <= _zz_channels_2_ctrl_kick[0];
        end
      end
      if(when_BusSlaveFactory_l335_5) begin
        if(when_BusSlaveFactory_l337_5) begin
          channels_2_interrupts_completion_valid <= _zz_channels_2_interrupts_completion_valid[0];
        end
      end
      if(when_BusSlaveFactory_l335_6) begin
        if(when_BusSlaveFactory_l337_6) begin
          channels_2_interrupts_onChannelCompletion_valid <= _zz_channels_2_interrupts_onChannelCompletion_valid[0];
        end
      end
      if(when_BusSlaveFactory_l335_7) begin
        if(when_BusSlaveFactory_l337_7) begin
          channels_2_interrupts_s2mPacket_valid <= _zz_channels_2_interrupts_s2mPacket_valid[0];
        end
      end
      if(when_BusSlaveFactory_l366_7) begin
        if(when_BusSlaveFactory_l368_7) begin
          channels_3_ctrl_kick <= _zz_channels_3_ctrl_kick[0];
        end
      end
      if(when_BusSlaveFactory_l335_8) begin
        if(when_BusSlaveFactory_l337_8) begin
          channels_3_interrupts_completion_valid <= _zz_channels_3_interrupts_completion_valid[0];
        end
      end
      if(when_BusSlaveFactory_l335_9) begin
        if(when_BusSlaveFactory_l337_9) begin
          channels_3_interrupts_onChannelCompletion_valid <= _zz_channels_3_interrupts_onChannelCompletion_valid[0];
        end
      end
      case(io_ctrl_PADDR)
        14'h0044 : begin
          if(ctrl_doWrite) begin
            channels_0_priority <= io_ctrl_PWDATA[1 : 0];
            channels_0_weight <= io_ctrl_PWDATA[9 : 8];
          end
        end
        14'h0050 : begin
          if(ctrl_doWrite) begin
            channels_0_interrupts_completion_enable <= io_ctrl_PWDATA[0];
            channels_0_interrupts_onChannelCompletion_enable <= io_ctrl_PWDATA[2];
            channels_0_interrupts_s2mPacket_enable <= io_ctrl_PWDATA[4];
          end
        end
        14'h00c4 : begin
          if(ctrl_doWrite) begin
            channels_1_priority <= io_ctrl_PWDATA[1 : 0];
            channels_1_weight <= io_ctrl_PWDATA[9 : 8];
          end
        end
        14'h00d0 : begin
          if(ctrl_doWrite) begin
            channels_1_interrupts_completion_enable <= io_ctrl_PWDATA[0];
            channels_1_interrupts_onChannelCompletion_enable <= io_ctrl_PWDATA[2];
          end
        end
        14'h0144 : begin
          if(ctrl_doWrite) begin
            channels_2_priority <= io_ctrl_PWDATA[1 : 0];
            channels_2_weight <= io_ctrl_PWDATA[9 : 8];
          end
        end
        14'h0150 : begin
          if(ctrl_doWrite) begin
            channels_2_interrupts_completion_enable <= io_ctrl_PWDATA[0];
            channels_2_interrupts_onChannelCompletion_enable <= io_ctrl_PWDATA[2];
            channels_2_interrupts_s2mPacket_enable <= io_ctrl_PWDATA[4];
          end
        end
        14'h01c4 : begin
          if(ctrl_doWrite) begin
            channels_3_priority <= io_ctrl_PWDATA[1 : 0];
            channels_3_weight <= io_ctrl_PWDATA[9 : 8];
          end
        end
        14'h01d0 : begin
          if(ctrl_doWrite) begin
            channels_3_interrupts_completion_enable <= io_ctrl_PWDATA[0];
            channels_3_interrupts_onChannelCompletion_enable <= io_ctrl_PWDATA[2];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    channels_0_fifo_push_ptr <= (channels_0_fifo_push_ptr + channels_0_fifo_push_ptrIncr_value);
    if(channels_0_channelStart) begin
      channels_0_fifo_push_ptr <= 12'h0;
    end
    channels_0_fifo_pop_ptr <= (channels_0_fifo_pop_ptr + channels_0_fifo_pop_ptrIncr_value);
    channels_0_fifo_pop_withOverride_backup <= channels_0_fifo_pop_withOverride_backupNext;
    if(when_DmaSg_l367) begin
      channels_0_fifo_pop_withOverride_valid <= 1'b0;
    end
    if(channels_0_fifo_pop_withOverride_load) begin
      channels_0_fifo_pop_withOverride_valid <= 1'b1;
    end
    channels_0_fifo_pop_withOverride_exposed <= ((! channels_0_fifo_pop_withOverride_valid) ? channels_0_fifo_pop_withOverride_backupNext : _zz_channels_0_fifo_pop_withOverride_exposed);
    if(channels_0_channelStart) begin
      channels_0_fifo_pop_withOverride_backup <= 15'h0;
      channels_0_fifo_pop_withOverride_valid <= 1'b0;
    end
    if(channels_0_channelStart) begin
      channels_0_push_s2b_packetLock <= 1'b0;
    end
    if(channels_0_pop_b2m_fire) begin
      channels_0_pop_b2m_flush <= 1'b0;
    end
    if(when_DmaSg_l463) begin
      channels_0_pop_b2m_packet <= 1'b0;
    end
    if(when_DmaSg_l481) begin
      channels_0_pop_b2m_flush <= 1'b1;
    end
    if(when_DmaSg_l485) begin
      channels_0_pop_b2m_flush <= 1'b0;
      channels_0_pop_b2m_packet <= 1'b0;
    end
    if(channels_0_pop_b2m_packetSync) begin
      channels_0_push_s2b_packetLock <= 1'b0;
    end
    if(channels_0_channelStart) begin
      channels_0_pop_b2m_bytesToSkip <= 4'b0000;
      channels_0_pop_b2m_flush <= 1'b0;
    end
    if(channels_0_descriptorStart) begin
      channels_0_pop_b2m_bytesLeft <= {1'd0, channels_0_bytes};
      channels_0_pop_b2m_waitFinalRsp <= 1'b0;
    end
    if(channels_0_channelValid) begin
      if(!channels_0_channelStop) begin
        if(when_DmaSg_l537) begin
          if(when_DmaSg_l540) begin
            channels_0_pop_b2m_address <= (_zz_channels_0_pop_b2m_address - 32'h00000001);
          end
          if(when_DmaSg_l555) begin
            channels_0_channelStop <= 1'b1;
          end
        end
      end
    end
    channels_0_fifo_pop_ptrIncr_value_regNext <= channels_0_fifo_pop_ptrIncr_value;
    channels_0_fifo_push_available <= (_zz_channels_0_fifo_push_available - (channels_0_push_memory ? channels_0_fifo_push_availableDecr : channels_0_fifo_push_ptrIncr_value));
    if(channels_0_channelStart) begin
      channels_0_fifo_push_ptr <= 12'h0;
      channels_0_fifo_push_available <= (channels_0_fifo_words + 12'h001);
      channels_0_fifo_pop_ptr <= 12'h0;
    end
    channels_1_fifo_push_ptr <= (channels_1_fifo_push_ptr + channels_1_fifo_push_ptrIncr_value);
    if(channels_1_channelStart) begin
      channels_1_fifo_push_ptr <= 12'h0;
    end
    channels_1_fifo_pop_ptr <= (channels_1_fifo_pop_ptr + channels_1_fifo_pop_ptrIncr_value);
    channels_1_fifo_pop_withoutOverride_exposed <= (_zz_channels_1_fifo_pop_withoutOverride_exposed - channels_1_fifo_pop_bytesDecr_value);
    if(channels_1_channelStart) begin
      channels_1_fifo_pop_withoutOverride_exposed <= 15'h0;
    end
    if(channels_1_descriptorStart) begin
      channels_1_push_m2b_bytesLeft <= channels_1_bytes;
    end
    if(channels_1_pop_b2s_veryLastTrigger) begin
      channels_1_pop_b2s_veryLastValid <= 1'b1;
    end
    if(channels_1_pop_b2s_veryLastTrigger) begin
      channels_1_pop_b2s_veryLastPtr <= channels_1_fifo_push_ptrWithBase;
      channels_1_pop_b2s_veryLastEndPacket <= channels_1_pop_b2s_last;
    end
    if(channels_1_channelStart) begin
      channels_1_pop_b2s_veryLastValid <= 1'b0;
    end
    if(channels_1_channelValid) begin
      if(!channels_1_channelStop) begin
        if(when_DmaSg_l537_1) begin
          if(when_DmaSg_l540_1) begin
            channels_1_push_m2b_address <= (_zz_channels_1_push_m2b_address - 32'h00000001);
          end
          if(when_DmaSg_l555_1) begin
            channels_1_channelStop <= 1'b1;
          end
        end
      end
    end
    channels_1_fifo_pop_ptrIncr_value_regNext <= channels_1_fifo_pop_ptrIncr_value;
    channels_1_fifo_push_available <= (_zz_channels_1_fifo_push_available - (channels_1_push_memory ? channels_1_fifo_push_availableDecr : channels_1_fifo_push_ptrIncr_value));
    if(channels_1_channelStart) begin
      channels_1_fifo_push_ptr <= 12'h0;
      channels_1_fifo_push_available <= (channels_1_fifo_words + 12'h001);
      channels_1_fifo_pop_ptr <= 12'h0;
    end
    channels_2_fifo_push_ptr <= (channels_2_fifo_push_ptr + channels_2_fifo_push_ptrIncr_value);
    if(channels_2_channelStart) begin
      channels_2_fifo_push_ptr <= 12'h0;
    end
    channels_2_fifo_pop_ptr <= (channels_2_fifo_pop_ptr + channels_2_fifo_pop_ptrIncr_value);
    channels_2_fifo_pop_withOverride_backup <= channels_2_fifo_pop_withOverride_backupNext;
    if(when_DmaSg_l367_1) begin
      channels_2_fifo_pop_withOverride_valid <= 1'b0;
    end
    if(channels_2_fifo_pop_withOverride_load) begin
      channels_2_fifo_pop_withOverride_valid <= 1'b1;
    end
    channels_2_fifo_pop_withOverride_exposed <= ((! channels_2_fifo_pop_withOverride_valid) ? channels_2_fifo_pop_withOverride_backupNext : _zz_channels_2_fifo_pop_withOverride_exposed);
    if(channels_2_channelStart) begin
      channels_2_fifo_pop_withOverride_backup <= 15'h0;
      channels_2_fifo_pop_withOverride_valid <= 1'b0;
    end
    if(channels_2_channelStart) begin
      channels_2_push_s2b_packetLock <= 1'b0;
    end
    if(channels_2_pop_b2m_fire) begin
      channels_2_pop_b2m_flush <= 1'b0;
    end
    if(when_DmaSg_l463_1) begin
      channels_2_pop_b2m_packet <= 1'b0;
    end
    if(when_DmaSg_l481_1) begin
      channels_2_pop_b2m_flush <= 1'b1;
    end
    if(when_DmaSg_l485_1) begin
      channels_2_pop_b2m_flush <= 1'b0;
      channels_2_pop_b2m_packet <= 1'b0;
    end
    if(channels_2_pop_b2m_packetSync) begin
      channels_2_push_s2b_packetLock <= 1'b0;
    end
    if(channels_2_channelStart) begin
      channels_2_pop_b2m_bytesToSkip <= 4'b0000;
      channels_2_pop_b2m_flush <= 1'b0;
    end
    if(channels_2_descriptorStart) begin
      channels_2_pop_b2m_bytesLeft <= {1'd0, channels_2_bytes};
      channels_2_pop_b2m_waitFinalRsp <= 1'b0;
    end
    if(channels_2_channelValid) begin
      if(!channels_2_channelStop) begin
        if(when_DmaSg_l537_2) begin
          if(when_DmaSg_l540_2) begin
            channels_2_pop_b2m_address <= (_zz_channels_2_pop_b2m_address - 32'h00000001);
          end
          if(when_DmaSg_l555_2) begin
            channels_2_channelStop <= 1'b1;
          end
        end
      end
    end
    channels_2_fifo_pop_ptrIncr_value_regNext <= channels_2_fifo_pop_ptrIncr_value;
    channels_2_fifo_push_available <= (_zz_channels_2_fifo_push_available - (channels_2_push_memory ? channels_2_fifo_push_availableDecr : channels_2_fifo_push_ptrIncr_value));
    if(channels_2_channelStart) begin
      channels_2_fifo_push_ptr <= 12'h0;
      channels_2_fifo_push_available <= (channels_2_fifo_words + 12'h001);
      channels_2_fifo_pop_ptr <= 12'h0;
    end
    channels_3_fifo_push_ptr <= (channels_3_fifo_push_ptr + channels_3_fifo_push_ptrIncr_value);
    if(channels_3_channelStart) begin
      channels_3_fifo_push_ptr <= 12'h0;
    end
    channels_3_fifo_pop_ptr <= (channels_3_fifo_pop_ptr + channels_3_fifo_pop_ptrIncr_value);
    channels_3_fifo_pop_withoutOverride_exposed <= (_zz_channels_3_fifo_pop_withoutOverride_exposed - channels_3_fifo_pop_bytesDecr_value);
    if(channels_3_channelStart) begin
      channels_3_fifo_pop_withoutOverride_exposed <= 15'h0;
    end
    if(channels_3_descriptorStart) begin
      channels_3_push_m2b_bytesLeft <= channels_3_bytes;
    end
    if(channels_3_pop_b2s_veryLastTrigger) begin
      channels_3_pop_b2s_veryLastValid <= 1'b1;
    end
    if(channels_3_pop_b2s_veryLastTrigger) begin
      channels_3_pop_b2s_veryLastPtr <= channels_3_fifo_push_ptrWithBase;
      channels_3_pop_b2s_veryLastEndPacket <= channels_3_pop_b2s_last;
    end
    if(channels_3_channelStart) begin
      channels_3_pop_b2s_veryLastValid <= 1'b0;
    end
    if(channels_3_channelValid) begin
      if(!channels_3_channelStop) begin
        if(when_DmaSg_l537_3) begin
          if(when_DmaSg_l540_3) begin
            channels_3_push_m2b_address <= (_zz_channels_3_push_m2b_address - 32'h00000001);
          end
          if(when_DmaSg_l555_3) begin
            channels_3_channelStop <= 1'b1;
          end
        end
      end
    end
    channels_3_fifo_pop_ptrIncr_value_regNext <= channels_3_fifo_pop_ptrIncr_value;
    channels_3_fifo_push_available <= (_zz_channels_3_fifo_push_available - (channels_3_push_memory ? channels_3_fifo_push_availableDecr : channels_3_fifo_push_ptrIncr_value));
    if(channels_3_channelStart) begin
      channels_3_fifo_push_ptr <= 12'h0;
      channels_3_fifo_push_available <= (channels_3_fifo_words + 12'h001);
      channels_3_fifo_pop_ptr <= 12'h0;
    end
    if(when_DmaSg_l627) begin
      channels_0_push_s2b_waitFirst <= 1'b0;
      if(io_inputs_0_payload_last) begin
        channels_0_push_s2b_packetLock <= 1'b1;
      end
    end
    if(when_DmaSg_l643) begin
      channels_0_pop_b2m_flush <= 1'b1;
    end
    if(when_DmaSg_l644) begin
      channels_0_pop_b2m_packet <= 1'b1;
    end
    if(when_DmaSg_l627_1) begin
      channels_2_push_s2b_waitFirst <= 1'b0;
      if(io_inputs_1_payload_last) begin
        channels_2_push_s2b_packetLock <= 1'b1;
      end
    end
    if(when_DmaSg_l643_1) begin
      channels_2_pop_b2m_flush <= 1'b1;
    end
    if(when_DmaSg_l644_1) begin
      channels_2_pop_b2m_packet <= 1'b1;
    end
    if(when_DmaSg_l687) begin
      if(when_DmaSg_l688) begin
        channels_1_pop_b2s_veryLastValid <= 1'b0;
      end
    end
    if(when_DmaSg_l687_1) begin
      if(when_DmaSg_l688_1) begin
        channels_3_pop_b2s_veryLastValid <= 1'b0;
      end
    end
    if(when_DmaSg_l720) begin
      m2b_cmd_s0_chosen <= m2b_cmd_s0_priority_chosen;
    end
    m2b_cmd_s1_address <= m2b_cmd_s0_address;
    m2b_cmd_s1_length <= m2b_cmd_s0_length;
    m2b_cmd_s1_lastBurst <= m2b_cmd_s0_lastBurst;
    m2b_cmd_s1_bytesLeft <= m2b_cmd_s0_bytesLeft;
    if(m2b_cmd_s1_valid) begin
      if(io_read_cmd_ready) begin
        if(when_DmaSg_l790) begin
          channels_1_push_m2b_address <= m2b_cmd_s1_addressNext;
          channels_1_push_m2b_bytesLeft <= m2b_cmd_s1_byteLeftNext;
        end
        if(when_DmaSg_l790_1) begin
          channels_3_push_m2b_address <= m2b_cmd_s1_addressNext;
          channels_3_push_m2b_bytesLeft <= m2b_cmd_s1_byteLeftNext;
        end
      end
    end
    if(when_DmaSg_l720_1) begin
      b2m_fsm_arbiter_logic_chosen <= b2m_fsm_arbiter_logic_priority_chosen;
    end
    if(when_DmaSg_l897) begin
      b2m_fsm_sel_channel <= b2m_fsm_arbiter_logic_chosen;
      b2m_fsm_sel_address <= _zz_b2m_fsm_sel_address;
      b2m_fsm_sel_ptr <= _zz_b2m_fsm_sel_ptr;
      b2m_fsm_sel_ptrMask <= _zz_b2m_fsm_sel_ptrMask;
      b2m_fsm_sel_bytePerBurst <= _zz_b2m_fsm_sel_bytePerBurst;
      b2m_fsm_sel_bytesInFifo <= _zz_b2m_fsm_sel_bytesInFifo;
      b2m_fsm_sel_flush <= _zz_b2m_fsm_sel_flush;
      b2m_fsm_sel_packet <= _zz_b2m_fsm_sel_packet;
      b2m_fsm_sel_bytesLeft <= _zz_b2m_fsm_sel_bytesLeft[25:0];
    end
    if(b2m_fsm_s0) begin
      b2m_fsm_sel_bytesInBurst <= _zz_b2m_fsm_sel_bytesInBurst_3[11:0];
    end
    if(b2m_fsm_s1) begin
      b2m_fsm_beatCounter <= (_zz_b2m_fsm_beatCounter >>> 4);
      if(when_DmaSg_l958) begin
        channels_0_pop_b2m_address <= b2m_fsm_addressNext;
        channels_0_pop_b2m_bytesLeft <= b2m_fsm_bytesLeftNext;
        if(b2m_fsm_isFinalCmd) begin
          channels_0_pop_b2m_waitFinalRsp <= 1'b1;
        end
        if(when_DmaSg_l963) begin
          if(b2m_fsm_sel_flush) begin
            channels_0_pop_b2m_flush <= 1'b1;
          end
          if(b2m_fsm_sel_packet) begin
            channels_0_pop_b2m_packet <= 1'b1;
          end
        end
      end
      if(when_DmaSg_l958_1) begin
        channels_2_pop_b2m_address <= b2m_fsm_addressNext;
        channels_2_pop_b2m_bytesLeft <= b2m_fsm_bytesLeftNext;
        if(b2m_fsm_isFinalCmd) begin
          channels_2_pop_b2m_waitFinalRsp <= 1'b1;
        end
        if(when_DmaSg_l963_1) begin
          if(b2m_fsm_sel_flush) begin
            channels_2_pop_b2m_flush <= 1'b1;
          end
          if(b2m_fsm_sel_packet) begin
            channels_2_pop_b2m_packet <= 1'b1;
          end
        end
      end
    end
    if(when_DmaSg_l995) begin
      b2m_fsm_sel_ptr <= ((b2m_fsm_sel_ptr & (~ b2m_fsm_sel_ptrMask)) | (_zz_b2m_fsm_sel_ptr_1 & b2m_fsm_sel_ptrMask));
    end
    if(memory_core_io_reads_2_rsp_ready) begin
      memory_core_io_reads_2_rsp_rData_data <= memory_core_io_reads_2_rsp_payload_data;
      memory_core_io_reads_2_rsp_rData_mask <= memory_core_io_reads_2_rsp_payload_mask;
      memory_core_io_reads_2_rsp_rData_context <= memory_core_io_reads_2_rsp_payload_context;
    end
    if(b2m_fsm_aggregate_memoryPort_fire) begin
      b2m_fsm_aggregate_first <= 1'b0;
    end
    if(when_DmaSg_l1012) begin
      b2m_fsm_aggregate_first <= 1'b1;
    end
    b2m_fsm_cmd_maskLastTriggerReg <= b2m_fsm_cmd_maskLastTriggerComb;
    b2m_fsm_cmd_maskLast <= {(4'b1111 <= b2m_fsm_cmd_maskLastTriggerComb),{(4'b1110 <= b2m_fsm_cmd_maskLastTriggerComb),{(4'b1101 <= b2m_fsm_cmd_maskLastTriggerComb),{(4'b1100 <= b2m_fsm_cmd_maskLastTriggerComb),{(4'b1011 <= b2m_fsm_cmd_maskLastTriggerComb),{(_zz_b2m_fsm_cmd_maskLast <= b2m_fsm_cmd_maskLastTriggerComb),{_zz_b2m_fsm_cmd_maskLast_1,{_zz_b2m_fsm_cmd_maskLast_2,_zz_b2m_fsm_cmd_maskLast_3}}}}}}}};
    if(io_write_cmd_fire_3) begin
      b2m_fsm_beatCounter <= (b2m_fsm_beatCounter - 8'h01);
    end
    if(when_DmaSg_l1064) begin
      if(_zz_2[0]) begin
        channels_0_pop_b2m_bytesToSkip <= _zz_channels_0_pop_b2m_bytesToSkip;
      end
      if(_zz_2[1]) begin
        channels_2_pop_b2m_bytesToSkip <= _zz_channels_0_pop_b2m_bytesToSkip;
      end
    end
    case(io_ctrl_PADDR)
      14'h000c : begin
        if(ctrl_doWrite) begin
          channels_0_push_memory <= io_ctrl_PWDATA[12];
          channels_0_push_s2b_completionOnLast <= io_ctrl_PWDATA[13];
          channels_0_push_s2b_waitFirst <= io_ctrl_PWDATA[14];
        end
      end
      14'h001c : begin
        if(ctrl_doWrite) begin
          channels_0_pop_memory <= io_ctrl_PWDATA[12];
        end
      end
      14'h002c : begin
        if(ctrl_doWrite) begin
          channels_0_channelStop <= io_ctrl_PWDATA[2];
          channels_0_selfRestart <= io_ctrl_PWDATA[1];
        end
      end
      14'h0020 : begin
        if(ctrl_doWrite) begin
          channels_0_bytes <= io_ctrl_PWDATA[25 : 0];
        end
      end
      14'h008c : begin
        if(ctrl_doWrite) begin
          channels_1_push_memory <= io_ctrl_PWDATA[12];
        end
      end
      14'h0098 : begin
        if(ctrl_doWrite) begin
          channels_1_pop_b2s_portId <= io_ctrl_PWDATA[0 : 0];
          channels_1_pop_b2s_sinkId <= io_ctrl_PWDATA[19 : 16];
        end
      end
      14'h009c : begin
        if(ctrl_doWrite) begin
          channels_1_pop_memory <= io_ctrl_PWDATA[12];
          channels_1_pop_b2s_last <= io_ctrl_PWDATA[13];
        end
      end
      14'h00ac : begin
        if(ctrl_doWrite) begin
          channels_1_channelStop <= io_ctrl_PWDATA[2];
          channels_1_selfRestart <= io_ctrl_PWDATA[1];
        end
      end
      14'h00a0 : begin
        if(ctrl_doWrite) begin
          channels_1_bytes <= io_ctrl_PWDATA[25 : 0];
        end
      end
      14'h010c : begin
        if(ctrl_doWrite) begin
          channels_2_push_memory <= io_ctrl_PWDATA[12];
          channels_2_push_s2b_completionOnLast <= io_ctrl_PWDATA[13];
          channels_2_push_s2b_waitFirst <= io_ctrl_PWDATA[14];
        end
      end
      14'h011c : begin
        if(ctrl_doWrite) begin
          channels_2_pop_memory <= io_ctrl_PWDATA[12];
        end
      end
      14'h012c : begin
        if(ctrl_doWrite) begin
          channels_2_channelStop <= io_ctrl_PWDATA[2];
          channels_2_selfRestart <= io_ctrl_PWDATA[1];
        end
      end
      14'h0120 : begin
        if(ctrl_doWrite) begin
          channels_2_bytes <= io_ctrl_PWDATA[25 : 0];
        end
      end
      14'h018c : begin
        if(ctrl_doWrite) begin
          channels_3_push_memory <= io_ctrl_PWDATA[12];
        end
      end
      14'h0198 : begin
        if(ctrl_doWrite) begin
          channels_3_pop_b2s_portId <= io_ctrl_PWDATA[0 : 0];
          channels_3_pop_b2s_sinkId <= io_ctrl_PWDATA[19 : 16];
        end
      end
      14'h019c : begin
        if(ctrl_doWrite) begin
          channels_3_pop_memory <= io_ctrl_PWDATA[12];
          channels_3_pop_b2s_last <= io_ctrl_PWDATA[13];
        end
      end
      14'h01ac : begin
        if(ctrl_doWrite) begin
          channels_3_channelStop <= io_ctrl_PWDATA[2];
          channels_3_selfRestart <= io_ctrl_PWDATA[1];
        end
      end
      14'h01a0 : begin
        if(ctrl_doWrite) begin
          channels_3_bytes <= io_ctrl_PWDATA[25 : 0];
        end
      end
      default : begin
      end
    endcase
    if(when_Apb3SlaveFactory_l82) begin
      if(ctrl_doWrite) begin
        channels_0_pop_b2m_address[31 : 0] <= _zz_channels_0_pop_b2m_address_2;
      end
    end
    if(when_Apb3SlaveFactory_l82_1) begin
      if(ctrl_doWrite) begin
        channels_1_push_m2b_address[31 : 0] <= _zz_channels_1_push_m2b_address_2;
      end
    end
    if(when_Apb3SlaveFactory_l82_2) begin
      if(ctrl_doWrite) begin
        channels_2_pop_b2m_address[31 : 0] <= _zz_channels_2_pop_b2m_address_2;
      end
    end
    if(when_Apb3SlaveFactory_l82_3) begin
      if(ctrl_doWrite) begin
        channels_3_push_m2b_address[31 : 0] <= _zz_channels_3_push_m2b_address_2;
      end
    end
  end


endmodule

module EfxDMA_BufferCC_10 (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               dat3_o_clk,
  input               dat3_o_reset
);
  (* async_reg = "true" *) reg        [4:0]    buffers_0;
  (* async_reg = "true" *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge dat3_o_clk) begin
    if(dat3_o_reset) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

//EfxDMA_BufferCC_4 replaced by EfxDMA_BufferCC_4

module EfxDMA_BufferCC_8 (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               dat1_o_clk,
  input               dat1_o_reset
);
  (* async_reg = "true" *) reg        [4:0]    buffers_0;
  (* async_reg = "true" *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge dat1_o_clk) begin
    if(dat1_o_reset) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

//EfxDMA_BufferCC_4 replaced by EfxDMA_BufferCC_4

//EfxDMA_BufferCC_4 replaced by EfxDMA_BufferCC_4

module EfxDMA_BufferCC_5 (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               dat2_i_clk,
  input               dat2_i_reset
);
  (* async_reg = "true" *) reg        [4:0]    buffers_0;
  (* async_reg = "true" *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge dat2_i_clk) begin
    if(dat2_i_reset) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module EfxDMA_BufferCC_4 (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               clk,
  input               reset
);
  (* async_reg = "true" *) reg        [4:0]    buffers_0;
  (* async_reg = "true" *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk) begin
    if(reset) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module EfxDMA_BufferCC_3 (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               dat0_i_clk,
  input               dat0_i_reset
);
  (* async_reg = "true" *) reg        [4:0]    buffers_0;
  (* async_reg = "true" *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge dat0_i_clk) begin
    if(dat0_i_reset) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module EfxDMA_StreamFork_2 (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_last,
  input      [0:0]    io_input_payload_fragment_opcode,
  input      [31:0]   io_input_payload_fragment_address,
  input      [11:0]   io_input_payload_fragment_length,
  input      [127:0]  io_input_payload_fragment_data,
  input      [15:0]   io_input_payload_fragment_mask,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output              io_outputs_0_payload_last,
  output     [0:0]    io_outputs_0_payload_fragment_opcode,
  output     [31:0]   io_outputs_0_payload_fragment_address,
  output     [11:0]   io_outputs_0_payload_fragment_length,
  output     [127:0]  io_outputs_0_payload_fragment_data,
  output     [15:0]   io_outputs_0_payload_fragment_mask,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output              io_outputs_1_payload_last,
  output     [0:0]    io_outputs_1_payload_fragment_opcode,
  output     [31:0]   io_outputs_1_payload_fragment_address,
  output     [11:0]   io_outputs_1_payload_fragment_length,
  output     [127:0]  io_outputs_1_payload_fragment_data,
  output     [15:0]   io_outputs_1_payload_fragment_mask,
  input               clk,
  input               reset
);
  reg                 _zz_io_outputs_0_valid;
  reg                 _zz_io_outputs_1_valid;
  wire                when_Stream_l806;
  wire                when_Stream_l806_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l806) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l806_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l806 = ((! io_outputs_0_ready) && _zz_io_outputs_0_valid);
  assign when_Stream_l806_1 = ((! io_outputs_1_ready) && _zz_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && _zz_io_outputs_0_valid);
  assign io_outputs_0_payload_last = io_input_payload_last;
  assign io_outputs_0_payload_fragment_opcode = io_input_payload_fragment_opcode;
  assign io_outputs_0_payload_fragment_address = io_input_payload_fragment_address;
  assign io_outputs_0_payload_fragment_length = io_input_payload_fragment_length;
  assign io_outputs_0_payload_fragment_data = io_input_payload_fragment_data;
  assign io_outputs_0_payload_fragment_mask = io_input_payload_fragment_mask;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && _zz_io_outputs_1_valid);
  assign io_outputs_1_payload_last = io_input_payload_last;
  assign io_outputs_1_payload_fragment_opcode = io_input_payload_fragment_opcode;
  assign io_outputs_1_payload_fragment_address = io_input_payload_fragment_address;
  assign io_outputs_1_payload_fragment_length = io_input_payload_fragment_length;
  assign io_outputs_1_payload_fragment_data = io_input_payload_fragment_data;
  assign io_outputs_1_payload_fragment_mask = io_input_payload_fragment_mask;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge clk) begin
    if(reset) begin
      _zz_io_outputs_0_valid <= 1'b1;
      _zz_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        _zz_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        _zz_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        _zz_io_outputs_0_valid <= 1'b1;
        _zz_io_outputs_1_valid <= 1'b1;
      end
    end
  end


endmodule

module EfxDMA_BmbContextRemover_1 (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [11:0]   io_input_cmd_payload_fragment_length,
  input      [127:0]  io_input_cmd_payload_fragment_data,
  input      [15:0]   io_input_cmd_payload_fragment_mask,
  input      [14:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [14:0]   io_input_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [31:0]   io_output_cmd_payload_fragment_address,
  output     [11:0]   io_output_cmd_payload_fragment_length,
  output     [127:0]  io_output_cmd_payload_fragment_data,
  output     [15:0]   io_output_cmd_payload_fragment_mask,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input               clk,
  input               reset
);
  reg                 io_input_cmd_fork_io_outputs_0_ready;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_ready;
  wire                io_input_cmd_fork_io_input_ready;
  wire                io_input_cmd_fork_io_outputs_0_valid;
  wire                io_input_cmd_fork_io_outputs_0_payload_last;
  wire       [0:0]    io_input_cmd_fork_io_outputs_0_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_address;
  wire       [11:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_length;
  wire       [127:0]  io_input_cmd_fork_io_outputs_0_payload_fragment_data;
  wire       [15:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_mask;
  wire       [14:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_context;
  wire                io_input_cmd_fork_io_outputs_1_valid;
  wire                io_input_cmd_fork_io_outputs_1_payload_last;
  wire       [0:0]    io_input_cmd_fork_io_outputs_1_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_address;
  wire       [11:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_length;
  wire       [127:0]  io_input_cmd_fork_io_outputs_1_payload_fragment_data;
  wire       [15:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_mask;
  wire       [14:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_context;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_push_ready;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_valid;
  wire       [14:0]   io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_payload;
  wire       [2:0]    io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_occupancy;
  wire       [2:0]    io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_availability;
  wire                io_input_cmd_fork_io_outputs_0_fire;
  reg                 io_input_cmd_fork_io_outputs_0_payload_first;
  wire                when_Stream_l408;
  reg                 io_input_cmd_fork_io_outputs_0_thrown_valid;
  wire                io_input_cmd_fork_io_outputs_0_thrown_ready;
  wire                io_input_cmd_fork_io_outputs_0_thrown_payload_last;
  wire       [0:0]    io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_address;
  wire       [11:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_length;
  wire       [127:0]  io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_data;
  wire       [15:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_mask;
  wire       [14:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_context;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_valid;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_ready;
  wire       [14:0]   io_input_cmd_fork_io_outputs_0_thrown_translated_payload;
  wire                _zz_io_input_rsp_valid;

  EfxDMA_StreamFork_1 io_input_cmd_fork (
    .io_input_valid                           (io_input_cmd_valid                                             ), //i
    .io_input_ready                           (io_input_cmd_fork_io_input_ready                               ), //o
    .io_input_payload_last                    (io_input_cmd_payload_last                                      ), //i
    .io_input_payload_fragment_opcode         (io_input_cmd_payload_fragment_opcode                           ), //i
    .io_input_payload_fragment_address        (io_input_cmd_payload_fragment_address[31:0]                    ), //i
    .io_input_payload_fragment_length         (io_input_cmd_payload_fragment_length[11:0]                     ), //i
    .io_input_payload_fragment_data           (io_input_cmd_payload_fragment_data[127:0]                      ), //i
    .io_input_payload_fragment_mask           (io_input_cmd_payload_fragment_mask[15:0]                       ), //i
    .io_input_payload_fragment_context        (io_input_cmd_payload_fragment_context[14:0]                    ), //i
    .io_outputs_0_valid                       (io_input_cmd_fork_io_outputs_0_valid                           ), //o
    .io_outputs_0_ready                       (io_input_cmd_fork_io_outputs_0_ready                           ), //i
    .io_outputs_0_payload_last                (io_input_cmd_fork_io_outputs_0_payload_last                    ), //o
    .io_outputs_0_payload_fragment_opcode     (io_input_cmd_fork_io_outputs_0_payload_fragment_opcode         ), //o
    .io_outputs_0_payload_fragment_address    (io_input_cmd_fork_io_outputs_0_payload_fragment_address[31:0]  ), //o
    .io_outputs_0_payload_fragment_length     (io_input_cmd_fork_io_outputs_0_payload_fragment_length[11:0]   ), //o
    .io_outputs_0_payload_fragment_data       (io_input_cmd_fork_io_outputs_0_payload_fragment_data[127:0]    ), //o
    .io_outputs_0_payload_fragment_mask       (io_input_cmd_fork_io_outputs_0_payload_fragment_mask[15:0]     ), //o
    .io_outputs_0_payload_fragment_context    (io_input_cmd_fork_io_outputs_0_payload_fragment_context[14:0]  ), //o
    .io_outputs_1_valid                       (io_input_cmd_fork_io_outputs_1_valid                           ), //o
    .io_outputs_1_ready                       (io_output_cmd_ready                                            ), //i
    .io_outputs_1_payload_last                (io_input_cmd_fork_io_outputs_1_payload_last                    ), //o
    .io_outputs_1_payload_fragment_opcode     (io_input_cmd_fork_io_outputs_1_payload_fragment_opcode         ), //o
    .io_outputs_1_payload_fragment_address    (io_input_cmd_fork_io_outputs_1_payload_fragment_address[31:0]  ), //o
    .io_outputs_1_payload_fragment_length     (io_input_cmd_fork_io_outputs_1_payload_fragment_length[11:0]   ), //o
    .io_outputs_1_payload_fragment_data       (io_input_cmd_fork_io_outputs_1_payload_fragment_data[127:0]    ), //o
    .io_outputs_1_payload_fragment_mask       (io_input_cmd_fork_io_outputs_1_payload_fragment_mask[15:0]     ), //o
    .io_outputs_1_payload_fragment_context    (io_input_cmd_fork_io_outputs_1_payload_fragment_context[14:0]  ), //o
    .clk                                      (clk                                                            ), //i
    .reset                                    (reset                                                          )  //i
  );
  EfxDMA_StreamFifo_1 io_input_cmd_fork_io_outputs_0_thrown_translated_fifo (
    .io_push_valid      (io_input_cmd_fork_io_outputs_0_thrown_translated_valid                      ), //i
    .io_push_ready      (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_push_ready         ), //o
    .io_push_payload    (io_input_cmd_fork_io_outputs_0_thrown_translated_payload[14:0]              ), //i
    .io_pop_valid       (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_valid          ), //o
    .io_pop_ready       (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_ready          ), //i
    .io_pop_payload     (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_payload[14:0]  ), //o
    .io_flush           (1'b0                                                                        ), //i
    .io_occupancy       (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_occupancy[2:0]     ), //o
    .io_availability    (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_availability[2:0]  ), //o
    .clk                (clk                                                                         ), //i
    .reset              (reset                                                                       )  //i
  );
  assign io_input_cmd_ready = io_input_cmd_fork_io_input_ready;
  assign io_output_cmd_valid = io_input_cmd_fork_io_outputs_1_valid;
  assign io_output_cmd_payload_last = io_input_cmd_fork_io_outputs_1_payload_last;
  assign io_output_cmd_payload_fragment_opcode = io_input_cmd_fork_io_outputs_1_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = io_input_cmd_fork_io_outputs_1_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = io_input_cmd_fork_io_outputs_1_payload_fragment_length;
  assign io_output_cmd_payload_fragment_data = io_input_cmd_fork_io_outputs_1_payload_fragment_data;
  assign io_output_cmd_payload_fragment_mask = io_input_cmd_fork_io_outputs_1_payload_fragment_mask;
  assign io_input_cmd_fork_io_outputs_0_fire = (io_input_cmd_fork_io_outputs_0_valid && io_input_cmd_fork_io_outputs_0_ready);
  assign when_Stream_l408 = (! io_input_cmd_fork_io_outputs_0_payload_first);
  always @(*) begin
    io_input_cmd_fork_io_outputs_0_thrown_valid = io_input_cmd_fork_io_outputs_0_valid;
    if(when_Stream_l408) begin
      io_input_cmd_fork_io_outputs_0_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    io_input_cmd_fork_io_outputs_0_ready = io_input_cmd_fork_io_outputs_0_thrown_ready;
    if(when_Stream_l408) begin
      io_input_cmd_fork_io_outputs_0_ready = 1'b1;
    end
  end

  assign io_input_cmd_fork_io_outputs_0_thrown_payload_last = io_input_cmd_fork_io_outputs_0_payload_last;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_opcode = io_input_cmd_fork_io_outputs_0_payload_fragment_opcode;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_address = io_input_cmd_fork_io_outputs_0_payload_fragment_address;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_length = io_input_cmd_fork_io_outputs_0_payload_fragment_length;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_data = io_input_cmd_fork_io_outputs_0_payload_fragment_data;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_mask = io_input_cmd_fork_io_outputs_0_payload_fragment_mask;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_context = io_input_cmd_fork_io_outputs_0_payload_fragment_context;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_valid = io_input_cmd_fork_io_outputs_0_thrown_valid;
  assign io_input_cmd_fork_io_outputs_0_thrown_ready = io_input_cmd_fork_io_outputs_0_thrown_translated_ready;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_payload = io_input_cmd_fork_io_outputs_0_payload_fragment_context;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_ready = io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_push_ready;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_ready = ((io_output_rsp_valid && io_output_rsp_payload_last) && io_input_rsp_ready);
  assign _zz_io_input_rsp_valid = (! (! io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_valid));
  assign io_output_rsp_ready = (io_input_rsp_ready && _zz_io_input_rsp_valid);
  assign io_input_rsp_valid = (io_output_rsp_valid && _zz_io_input_rsp_valid);
  assign io_input_rsp_payload_last = io_output_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_context = io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_payload;
  always @(posedge clk) begin
    if(reset) begin
      io_input_cmd_fork_io_outputs_0_payload_first <= 1'b1;
    end else begin
      if(io_input_cmd_fork_io_outputs_0_fire) begin
        io_input_cmd_fork_io_outputs_0_payload_first <= io_input_cmd_fork_io_outputs_0_payload_last;
      end
    end
  end


endmodule

module EfxDMA_StreamFifo_2 (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_last,
  input      [0:0]    io_push_payload_fragment_opcode,
  input      [31:0]   io_push_payload_fragment_address,
  input      [11:0]   io_push_payload_fragment_length,
  input      [127:0]  io_push_payload_fragment_data,
  input      [15:0]   io_push_payload_fragment_mask,
  input      [14:0]   io_push_payload_fragment_context,
  output              io_pop_valid,
  input               io_pop_ready,
  output              io_pop_payload_last,
  output     [0:0]    io_pop_payload_fragment_opcode,
  output     [31:0]   io_pop_payload_fragment_address,
  output     [11:0]   io_pop_payload_fragment_length,
  output     [127:0]  io_pop_payload_fragment_data,
  output     [15:0]   io_pop_payload_fragment_mask,
  output     [14:0]   io_pop_payload_fragment_context,
  input               io_flush,
  output     [8:0]    io_occupancy,
  output     [8:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [204:0]  _zz_logic_ram_port0;
  wire       [7:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [7:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz__zz_io_pop_payload_last;
  wire       [204:0]  _zz_logic_ram_port_1;
  wire       [7:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [7:0]    logic_pushPtr_valueNext;
  reg        [7:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [7:0]    logic_popPtr_valueNext;
  reg        [7:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire       [204:0]  _zz_io_pop_payload_last;
  wire       [203:0]  _zz_io_pop_payload_fragment_opcode;
  wire                when_Stream_l933;
  wire       [7:0]    logic_ptrDif;
  reg [204:0] logic_ram [0:255];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {7'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {7'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz__zz_io_pop_payload_last = 1'b1;
  assign _zz_logic_ram_port_1 = {{io_push_payload_fragment_context,{io_push_payload_fragment_mask,{io_push_payload_fragment_data,{io_push_payload_fragment_length,{io_push_payload_fragment_address,io_push_payload_fragment_opcode}}}}},io_push_payload_last};
  always @(posedge clk) begin
    if(_zz__zz_io_pop_payload_last) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 8'hff);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 8'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 8'hff);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 8'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign _zz_io_pop_payload_last = _zz_logic_ram_port0;
  assign _zz_io_pop_payload_fragment_opcode = _zz_io_pop_payload_last[204 : 1];
  assign io_pop_payload_last = _zz_io_pop_payload_last[0];
  assign io_pop_payload_fragment_opcode = _zz_io_pop_payload_fragment_opcode[0 : 0];
  assign io_pop_payload_fragment_address = _zz_io_pop_payload_fragment_opcode[32 : 1];
  assign io_pop_payload_fragment_length = _zz_io_pop_payload_fragment_opcode[44 : 33];
  assign io_pop_payload_fragment_data = _zz_io_pop_payload_fragment_opcode[172 : 45];
  assign io_pop_payload_fragment_mask = _zz_io_pop_payload_fragment_opcode[188 : 173];
  assign io_pop_payload_fragment_context = _zz_io_pop_payload_fragment_opcode[203 : 189];
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk) begin
    if(reset) begin
      logic_pushPtr_value <= 8'h0;
      logic_popPtr_value <= 8'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module EfxDMA_BmbContextRemover (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [11:0]   io_input_cmd_payload_fragment_length,
  input      [22:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [127:0]  io_input_rsp_payload_fragment_data,
  output     [22:0]   io_input_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [31:0]   io_output_cmd_payload_fragment_address,
  output     [11:0]   io_output_cmd_payload_fragment_length,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input      [127:0]  io_output_rsp_payload_fragment_data,
  input               clk,
  input               reset
);
  reg                 io_input_cmd_fork_io_outputs_0_ready;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_ready;
  wire                io_input_cmd_fork_io_input_ready;
  wire                io_input_cmd_fork_io_outputs_0_valid;
  wire                io_input_cmd_fork_io_outputs_0_payload_last;
  wire       [0:0]    io_input_cmd_fork_io_outputs_0_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_address;
  wire       [11:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_length;
  wire       [22:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_context;
  wire                io_input_cmd_fork_io_outputs_1_valid;
  wire                io_input_cmd_fork_io_outputs_1_payload_last;
  wire       [0:0]    io_input_cmd_fork_io_outputs_1_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_address;
  wire       [11:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_length;
  wire       [22:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_context;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_push_ready;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_valid;
  wire       [22:0]   io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_payload;
  wire       [2:0]    io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_occupancy;
  wire       [2:0]    io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_availability;
  wire                io_input_cmd_fork_io_outputs_0_fire;
  reg                 io_input_cmd_fork_io_outputs_0_payload_first;
  wire                when_Stream_l408;
  reg                 io_input_cmd_fork_io_outputs_0_thrown_valid;
  wire                io_input_cmd_fork_io_outputs_0_thrown_ready;
  wire                io_input_cmd_fork_io_outputs_0_thrown_payload_last;
  wire       [0:0]    io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_address;
  wire       [11:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_length;
  wire       [22:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_context;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_valid;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_ready;
  wire       [22:0]   io_input_cmd_fork_io_outputs_0_thrown_translated_payload;
  wire                _zz_io_input_rsp_valid;

  EfxDMA_StreamFork io_input_cmd_fork (
    .io_input_valid                           (io_input_cmd_valid                                             ), //i
    .io_input_ready                           (io_input_cmd_fork_io_input_ready                               ), //o
    .io_input_payload_last                    (io_input_cmd_payload_last                                      ), //i
    .io_input_payload_fragment_opcode         (io_input_cmd_payload_fragment_opcode                           ), //i
    .io_input_payload_fragment_address        (io_input_cmd_payload_fragment_address[31:0]                    ), //i
    .io_input_payload_fragment_length         (io_input_cmd_payload_fragment_length[11:0]                     ), //i
    .io_input_payload_fragment_context        (io_input_cmd_payload_fragment_context[22:0]                    ), //i
    .io_outputs_0_valid                       (io_input_cmd_fork_io_outputs_0_valid                           ), //o
    .io_outputs_0_ready                       (io_input_cmd_fork_io_outputs_0_ready                           ), //i
    .io_outputs_0_payload_last                (io_input_cmd_fork_io_outputs_0_payload_last                    ), //o
    .io_outputs_0_payload_fragment_opcode     (io_input_cmd_fork_io_outputs_0_payload_fragment_opcode         ), //o
    .io_outputs_0_payload_fragment_address    (io_input_cmd_fork_io_outputs_0_payload_fragment_address[31:0]  ), //o
    .io_outputs_0_payload_fragment_length     (io_input_cmd_fork_io_outputs_0_payload_fragment_length[11:0]   ), //o
    .io_outputs_0_payload_fragment_context    (io_input_cmd_fork_io_outputs_0_payload_fragment_context[22:0]  ), //o
    .io_outputs_1_valid                       (io_input_cmd_fork_io_outputs_1_valid                           ), //o
    .io_outputs_1_ready                       (io_output_cmd_ready                                            ), //i
    .io_outputs_1_payload_last                (io_input_cmd_fork_io_outputs_1_payload_last                    ), //o
    .io_outputs_1_payload_fragment_opcode     (io_input_cmd_fork_io_outputs_1_payload_fragment_opcode         ), //o
    .io_outputs_1_payload_fragment_address    (io_input_cmd_fork_io_outputs_1_payload_fragment_address[31:0]  ), //o
    .io_outputs_1_payload_fragment_length     (io_input_cmd_fork_io_outputs_1_payload_fragment_length[11:0]   ), //o
    .io_outputs_1_payload_fragment_context    (io_input_cmd_fork_io_outputs_1_payload_fragment_context[22:0]  ), //o
    .clk                                      (clk                                                            ), //i
    .reset                                    (reset                                                          )  //i
  );
  EfxDMA_StreamFifo io_input_cmd_fork_io_outputs_0_thrown_translated_fifo (
    .io_push_valid      (io_input_cmd_fork_io_outputs_0_thrown_translated_valid                      ), //i
    .io_push_ready      (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_push_ready         ), //o
    .io_push_payload    (io_input_cmd_fork_io_outputs_0_thrown_translated_payload[22:0]              ), //i
    .io_pop_valid       (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_valid          ), //o
    .io_pop_ready       (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_ready          ), //i
    .io_pop_payload     (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_payload[22:0]  ), //o
    .io_flush           (1'b0                                                                        ), //i
    .io_occupancy       (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_occupancy[2:0]     ), //o
    .io_availability    (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_availability[2:0]  ), //o
    .clk                (clk                                                                         ), //i
    .reset              (reset                                                                       )  //i
  );
  assign io_input_cmd_ready = io_input_cmd_fork_io_input_ready;
  assign io_output_cmd_valid = io_input_cmd_fork_io_outputs_1_valid;
  assign io_output_cmd_payload_last = io_input_cmd_fork_io_outputs_1_payload_last;
  assign io_output_cmd_payload_fragment_opcode = io_input_cmd_fork_io_outputs_1_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = io_input_cmd_fork_io_outputs_1_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = io_input_cmd_fork_io_outputs_1_payload_fragment_length;
  assign io_input_cmd_fork_io_outputs_0_fire = (io_input_cmd_fork_io_outputs_0_valid && io_input_cmd_fork_io_outputs_0_ready);
  assign when_Stream_l408 = (! io_input_cmd_fork_io_outputs_0_payload_first);
  always @(*) begin
    io_input_cmd_fork_io_outputs_0_thrown_valid = io_input_cmd_fork_io_outputs_0_valid;
    if(when_Stream_l408) begin
      io_input_cmd_fork_io_outputs_0_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    io_input_cmd_fork_io_outputs_0_ready = io_input_cmd_fork_io_outputs_0_thrown_ready;
    if(when_Stream_l408) begin
      io_input_cmd_fork_io_outputs_0_ready = 1'b1;
    end
  end

  assign io_input_cmd_fork_io_outputs_0_thrown_payload_last = io_input_cmd_fork_io_outputs_0_payload_last;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_opcode = io_input_cmd_fork_io_outputs_0_payload_fragment_opcode;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_address = io_input_cmd_fork_io_outputs_0_payload_fragment_address;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_length = io_input_cmd_fork_io_outputs_0_payload_fragment_length;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_context = io_input_cmd_fork_io_outputs_0_payload_fragment_context;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_valid = io_input_cmd_fork_io_outputs_0_thrown_valid;
  assign io_input_cmd_fork_io_outputs_0_thrown_ready = io_input_cmd_fork_io_outputs_0_thrown_translated_ready;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_payload = io_input_cmd_fork_io_outputs_0_payload_fragment_context;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_ready = io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_push_ready;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_ready = ((io_output_rsp_valid && io_output_rsp_payload_last) && io_input_rsp_ready);
  assign _zz_io_input_rsp_valid = (! (! io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_valid));
  assign io_output_rsp_ready = (io_input_rsp_ready && _zz_io_input_rsp_valid);
  assign io_input_rsp_valid = (io_output_rsp_valid && _zz_io_input_rsp_valid);
  assign io_input_rsp_payload_last = io_output_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_input_rsp_payload_fragment_context = io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_payload;
  always @(posedge clk) begin
    if(reset) begin
      io_input_cmd_fork_io_outputs_0_payload_first <= 1'b1;
    end else begin
      if(io_input_cmd_fork_io_outputs_0_fire) begin
        io_input_cmd_fork_io_outputs_0_payload_first <= io_input_cmd_fork_io_outputs_0_payload_last;
      end
    end
  end


endmodule

module EfxDMA_FlowCCByToggle (
  input               io_input_valid,
  input      [31:0]   io_input_payload_PRDATA,
  input               io_input_payload_PSLVERROR,
  output              io_output_valid,
  output     [31:0]   io_output_payload_PRDATA,
  output              io_output_payload_PSLVERROR,
  input               clk,
  input               reset,
  input               ctrl_clk,
  input               ctrl_reset
);
  wire                inputArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  reg                 inputArea_target;
  reg        [31:0]   inputArea_data_PRDATA;
  reg                 inputArea_data_PSLVERROR;
  wire                outputArea_target;
  reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  wire       [31:0]   outputArea_flow_payload_PRDATA;
  wire                outputArea_flow_payload_PSLVERROR;
  reg                 outputArea_flow_m2sPipe_valid;
  reg        [31:0]   outputArea_flow_m2sPipe_payload_PRDATA;
  reg                 outputArea_flow_m2sPipe_payload_PSLVERROR;

  EfxDMA_BufferCC inputArea_target_buffercc (
    .io_dataIn     (inputArea_target                      ), //i
    .io_dataOut    (inputArea_target_buffercc_io_dataOut  ), //o
    .ctrl_clk      (ctrl_clk                              ), //i
    .ctrl_reset    (ctrl_reset                            )  //i
  );
  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_PRDATA = inputArea_data_PRDATA;
  assign outputArea_flow_payload_PSLVERROR = inputArea_data_PSLVERROR;
  assign io_output_valid = outputArea_flow_m2sPipe_valid;
  assign io_output_payload_PRDATA = outputArea_flow_m2sPipe_payload_PRDATA;
  assign io_output_payload_PSLVERROR = outputArea_flow_m2sPipe_payload_PSLVERROR;
  always @(posedge clk) begin
    if(reset) begin
      inputArea_target <= 1'b0;
    end else begin
      if(io_input_valid) begin
        inputArea_target <= (! inputArea_target);
      end
    end
  end

  always @(posedge clk) begin
    if(io_input_valid) begin
      inputArea_data_PRDATA <= io_input_payload_PRDATA;
      inputArea_data_PSLVERROR <= io_input_payload_PSLVERROR;
    end
  end

  always @(posedge ctrl_clk) begin
    if(ctrl_reset) begin
      outputArea_flow_m2sPipe_valid <= 1'b0;
      outputArea_hit <= 1'b0;
    end else begin
      outputArea_hit <= outputArea_target;
      outputArea_flow_m2sPipe_valid <= outputArea_flow_valid;
    end
  end

  always @(posedge ctrl_clk) begin
    if(outputArea_flow_valid) begin
      outputArea_flow_m2sPipe_payload_PRDATA <= outputArea_flow_payload_PRDATA;
      outputArea_flow_m2sPipe_payload_PSLVERROR <= outputArea_flow_payload_PSLVERROR;
    end
  end


endmodule

module EfxDMA_StreamCCByToggle (
  input               io_input_valid,
  output              io_input_ready,
  input      [13:0]   io_input_payload_PADDR,
  input               io_input_payload_PWRITE,
  input      [31:0]   io_input_payload_PWDATA,
  output              io_output_valid,
  input               io_output_ready,
  output     [13:0]   io_output_payload_PADDR,
  output              io_output_payload_PWRITE,
  output     [31:0]   io_output_payload_PWDATA,
  input               ctrl_clk,
  input               ctrl_reset,
  input               clk,
  input               reset
);
  wire                outHitSignal_buffercc_io_dataOut;
  wire                pushArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  wire                pushArea_hit;
  wire                pushArea_accept;
  reg                 pushArea_target;
  reg        [13:0]   pushArea_data_PADDR;
  reg                 pushArea_data_PWRITE;
  reg        [31:0]   pushArea_data_PWDATA;
  wire                io_input_fire;
  wire                popArea_stream_valid;
  reg                 popArea_stream_ready;
  wire       [13:0]   popArea_stream_payload_PADDR;
  wire                popArea_stream_payload_PWRITE;
  wire       [31:0]   popArea_stream_payload_PWDATA;
  wire                popArea_target;
  wire                popArea_stream_fire;
  reg                 popArea_hit;
  wire                popArea_stream_m2sPipe_valid;
  wire                popArea_stream_m2sPipe_ready;
  wire       [13:0]   popArea_stream_m2sPipe_payload_PADDR;
  wire                popArea_stream_m2sPipe_payload_PWRITE;
  wire       [31:0]   popArea_stream_m2sPipe_payload_PWDATA;
  reg                 popArea_stream_rValid;
  wire                popArea_stream_fire_1;
  reg        [13:0]   popArea_stream_rData_PADDR;
  reg                 popArea_stream_rData_PWRITE;
  reg        [31:0]   popArea_stream_rData_PWDATA;
  wire                when_Stream_l342;

  EfxDMA_BufferCC outHitSignal_buffercc (
    .io_dataIn     (outHitSignal                      ), //i
    .io_dataOut    (outHitSignal_buffercc_io_dataOut  ), //o
    .ctrl_clk      (ctrl_clk                          ), //i
    .ctrl_reset    (ctrl_reset                        )  //i
  );
  EfxDMA_BufferCC_1 pushArea_target_buffercc (
    .io_dataIn     (pushArea_target                      ), //i
    .io_dataOut    (pushArea_target_buffercc_io_dataOut  ), //o
    .clk           (clk                                  ), //i
    .reset         (reset                                )  //i
  );
  assign pushArea_hit = outHitSignal_buffercc_io_dataOut;
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign pushArea_accept = io_input_fire;
  assign io_input_ready = (pushArea_hit == pushArea_target);
  assign popArea_target = pushArea_target_buffercc_io_dataOut;
  assign popArea_stream_fire = (popArea_stream_valid && popArea_stream_ready);
  assign outHitSignal = popArea_hit;
  assign popArea_stream_valid = (popArea_target != popArea_hit);
  assign popArea_stream_payload_PADDR = pushArea_data_PADDR;
  assign popArea_stream_payload_PWRITE = pushArea_data_PWRITE;
  assign popArea_stream_payload_PWDATA = pushArea_data_PWDATA;
  assign popArea_stream_fire_1 = (popArea_stream_valid && popArea_stream_ready);
  always @(*) begin
    popArea_stream_ready = popArea_stream_m2sPipe_ready;
    if(when_Stream_l342) begin
      popArea_stream_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! popArea_stream_m2sPipe_valid);
  assign popArea_stream_m2sPipe_valid = popArea_stream_rValid;
  assign popArea_stream_m2sPipe_payload_PADDR = popArea_stream_rData_PADDR;
  assign popArea_stream_m2sPipe_payload_PWRITE = popArea_stream_rData_PWRITE;
  assign popArea_stream_m2sPipe_payload_PWDATA = popArea_stream_rData_PWDATA;
  assign io_output_valid = popArea_stream_m2sPipe_valid;
  assign popArea_stream_m2sPipe_ready = io_output_ready;
  assign io_output_payload_PADDR = popArea_stream_m2sPipe_payload_PADDR;
  assign io_output_payload_PWRITE = popArea_stream_m2sPipe_payload_PWRITE;
  assign io_output_payload_PWDATA = popArea_stream_m2sPipe_payload_PWDATA;
  always @(posedge ctrl_clk) begin
    if(ctrl_reset) begin
      pushArea_target <= 1'b0;
    end else begin
      if(pushArea_accept) begin
        pushArea_target <= (! pushArea_target);
      end
    end
  end

  always @(posedge ctrl_clk) begin
    if(pushArea_accept) begin
      pushArea_data_PADDR <= io_input_payload_PADDR;
      pushArea_data_PWRITE <= io_input_payload_PWRITE;
      pushArea_data_PWDATA <= io_input_payload_PWDATA;
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      popArea_hit <= 1'b0;
      popArea_stream_rValid <= 1'b0;
    end else begin
      if(popArea_stream_fire) begin
        popArea_hit <= popArea_target;
      end
      if(popArea_stream_ready) begin
        popArea_stream_rValid <= popArea_stream_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(popArea_stream_fire_1) begin
      popArea_stream_rData_PADDR <= popArea_stream_payload_PADDR;
      popArea_stream_rData_PWRITE <= popArea_stream_payload_PWRITE;
      popArea_stream_rData_PWDATA <= popArea_stream_payload_PWDATA;
    end
  end


endmodule

module EfxDMA_Aggregator (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [127:0]  io_input_payload_data,
  input      [15:0]   io_input_payload_mask,
  output reg [127:0]  io_output_data,
  output reg [15:0]   io_output_mask,
  input               io_output_enough,
  input               io_output_consume,
  output              io_output_consumed,
  input      [3:0]    io_output_lastByteUsed,
  output     [3:0]    io_output_usedUntil,
  input               io_flush,
  input      [3:0]    io_offset,
  input      [11:0]   io_burstLength,
  input               clk,
  input               reset
);
  reg        [0:0]    _zz_s0_countOnesLogic_0_1;
  wire       [0:0]    _zz_s0_countOnesLogic_0_2;
  reg        [1:0]    _zz_s0_countOnesLogic_1_1;
  wire       [1:0]    _zz_s0_countOnesLogic_1_2;
  reg        [1:0]    _zz_s0_countOnesLogic_2_1;
  wire       [2:0]    _zz_s0_countOnesLogic_2_2;
  reg        [2:0]    _zz_s0_countOnesLogic_3_9;
  wire       [2:0]    _zz_s0_countOnesLogic_3_10;
  reg        [2:0]    _zz_s0_countOnesLogic_3_11;
  wire       [2:0]    _zz_s0_countOnesLogic_3_12;
  wire       [0:0]    _zz_s0_countOnesLogic_3_13;
  reg        [2:0]    _zz_s0_countOnesLogic_4_9;
  wire       [2:0]    _zz_s0_countOnesLogic_4_10;
  reg        [2:0]    _zz_s0_countOnesLogic_4_11;
  wire       [2:0]    _zz_s0_countOnesLogic_4_12;
  wire       [1:0]    _zz_s0_countOnesLogic_4_13;
  reg        [2:0]    _zz_s0_countOnesLogic_5_9;
  wire       [2:0]    _zz_s0_countOnesLogic_5_10;
  reg        [2:0]    _zz_s0_countOnesLogic_5_11;
  wire       [2:0]    _zz_s0_countOnesLogic_5_12;
  wire       [2:0]    _zz_s0_countOnesLogic_6_9;
  reg        [2:0]    _zz_s0_countOnesLogic_6_10;
  wire       [2:0]    _zz_s0_countOnesLogic_6_11;
  reg        [2:0]    _zz_s0_countOnesLogic_6_12;
  wire       [2:0]    _zz_s0_countOnesLogic_6_13;
  reg        [2:0]    _zz_s0_countOnesLogic_6_14;
  wire       [2:0]    _zz_s0_countOnesLogic_6_15;
  wire       [0:0]    _zz_s0_countOnesLogic_6_16;
  wire       [3:0]    _zz_s0_countOnesLogic_7_9;
  reg        [3:0]    _zz_s0_countOnesLogic_7_10;
  wire       [2:0]    _zz_s0_countOnesLogic_7_11;
  reg        [3:0]    _zz_s0_countOnesLogic_7_12;
  wire       [2:0]    _zz_s0_countOnesLogic_7_13;
  reg        [3:0]    _zz_s0_countOnesLogic_7_14;
  wire       [2:0]    _zz_s0_countOnesLogic_7_15;
  wire       [1:0]    _zz_s0_countOnesLogic_7_16;
  wire       [3:0]    _zz_s0_countOnesLogic_8_9;
  reg        [3:0]    _zz_s0_countOnesLogic_8_10;
  wire       [2:0]    _zz_s0_countOnesLogic_8_11;
  reg        [3:0]    _zz_s0_countOnesLogic_8_12;
  wire       [2:0]    _zz_s0_countOnesLogic_8_13;
  reg        [3:0]    _zz_s0_countOnesLogic_8_14;
  wire       [2:0]    _zz_s0_countOnesLogic_8_15;
  wire       [3:0]    _zz_s0_countOnesLogic_9_9;
  reg        [3:0]    _zz_s0_countOnesLogic_9_10;
  wire       [2:0]    _zz_s0_countOnesLogic_9_11;
  reg        [3:0]    _zz_s0_countOnesLogic_9_12;
  wire       [2:0]    _zz_s0_countOnesLogic_9_13;
  wire       [3:0]    _zz_s0_countOnesLogic_9_14;
  reg        [3:0]    _zz_s0_countOnesLogic_9_15;
  wire       [2:0]    _zz_s0_countOnesLogic_9_16;
  reg        [3:0]    _zz_s0_countOnesLogic_9_17;
  wire       [2:0]    _zz_s0_countOnesLogic_9_18;
  wire       [0:0]    _zz_s0_countOnesLogic_9_19;
  wire       [3:0]    _zz_s0_countOnesLogic_10_9;
  reg        [3:0]    _zz_s0_countOnesLogic_10_10;
  wire       [2:0]    _zz_s0_countOnesLogic_10_11;
  reg        [3:0]    _zz_s0_countOnesLogic_10_12;
  wire       [2:0]    _zz_s0_countOnesLogic_10_13;
  wire       [3:0]    _zz_s0_countOnesLogic_10_14;
  reg        [3:0]    _zz_s0_countOnesLogic_10_15;
  wire       [2:0]    _zz_s0_countOnesLogic_10_16;
  reg        [3:0]    _zz_s0_countOnesLogic_10_17;
  wire       [2:0]    _zz_s0_countOnesLogic_10_18;
  wire       [1:0]    _zz_s0_countOnesLogic_10_19;
  wire       [3:0]    _zz_s0_countOnesLogic_11_9;
  reg        [3:0]    _zz_s0_countOnesLogic_11_10;
  wire       [2:0]    _zz_s0_countOnesLogic_11_11;
  reg        [3:0]    _zz_s0_countOnesLogic_11_12;
  wire       [2:0]    _zz_s0_countOnesLogic_11_13;
  wire       [3:0]    _zz_s0_countOnesLogic_11_14;
  reg        [3:0]    _zz_s0_countOnesLogic_11_15;
  wire       [2:0]    _zz_s0_countOnesLogic_11_16;
  reg        [3:0]    _zz_s0_countOnesLogic_11_17;
  wire       [2:0]    _zz_s0_countOnesLogic_11_18;
  wire       [3:0]    _zz_s0_countOnesLogic_12_9;
  wire       [3:0]    _zz_s0_countOnesLogic_12_10;
  reg        [3:0]    _zz_s0_countOnesLogic_12_11;
  wire       [2:0]    _zz_s0_countOnesLogic_12_12;
  reg        [3:0]    _zz_s0_countOnesLogic_12_13;
  wire       [2:0]    _zz_s0_countOnesLogic_12_14;
  wire       [3:0]    _zz_s0_countOnesLogic_12_15;
  reg        [3:0]    _zz_s0_countOnesLogic_12_16;
  wire       [2:0]    _zz_s0_countOnesLogic_12_17;
  reg        [3:0]    _zz_s0_countOnesLogic_12_18;
  wire       [2:0]    _zz_s0_countOnesLogic_12_19;
  reg        [3:0]    _zz_s0_countOnesLogic_12_20;
  wire       [2:0]    _zz_s0_countOnesLogic_12_21;
  wire       [0:0]    _zz_s0_countOnesLogic_12_22;
  wire       [3:0]    _zz_s0_countOnesLogic_13_9;
  wire       [3:0]    _zz_s0_countOnesLogic_13_10;
  reg        [3:0]    _zz_s0_countOnesLogic_13_11;
  wire       [2:0]    _zz_s0_countOnesLogic_13_12;
  reg        [3:0]    _zz_s0_countOnesLogic_13_13;
  wire       [2:0]    _zz_s0_countOnesLogic_13_14;
  wire       [3:0]    _zz_s0_countOnesLogic_13_15;
  reg        [3:0]    _zz_s0_countOnesLogic_13_16;
  wire       [2:0]    _zz_s0_countOnesLogic_13_17;
  reg        [3:0]    _zz_s0_countOnesLogic_13_18;
  wire       [2:0]    _zz_s0_countOnesLogic_13_19;
  reg        [3:0]    _zz_s0_countOnesLogic_13_20;
  wire       [2:0]    _zz_s0_countOnesLogic_13_21;
  wire       [1:0]    _zz_s0_countOnesLogic_13_22;
  wire       [3:0]    _zz_s0_countOnesLogic_14_9;
  wire       [3:0]    _zz_s0_countOnesLogic_14_10;
  reg        [3:0]    _zz_s0_countOnesLogic_14_11;
  wire       [2:0]    _zz_s0_countOnesLogic_14_12;
  reg        [3:0]    _zz_s0_countOnesLogic_14_13;
  wire       [2:0]    _zz_s0_countOnesLogic_14_14;
  wire       [3:0]    _zz_s0_countOnesLogic_14_15;
  reg        [3:0]    _zz_s0_countOnesLogic_14_16;
  wire       [2:0]    _zz_s0_countOnesLogic_14_17;
  reg        [3:0]    _zz_s0_countOnesLogic_14_18;
  wire       [2:0]    _zz_s0_countOnesLogic_14_19;
  reg        [3:0]    _zz_s0_countOnesLogic_14_20;
  wire       [2:0]    _zz_s0_countOnesLogic_14_21;
  wire       [4:0]    _zz_s0_countOnesLogic_15_8;
  wire       [4:0]    _zz_s0_countOnesLogic_15_9;
  reg        [4:0]    _zz_s0_countOnesLogic_15_10;
  wire       [2:0]    _zz_s0_countOnesLogic_15_11;
  reg        [4:0]    _zz_s0_countOnesLogic_15_12;
  wire       [2:0]    _zz_s0_countOnesLogic_15_13;
  wire       [4:0]    _zz_s0_countOnesLogic_15_14;
  reg        [4:0]    _zz_s0_countOnesLogic_15_15;
  wire       [2:0]    _zz_s0_countOnesLogic_15_16;
  reg        [4:0]    _zz_s0_countOnesLogic_15_17;
  wire       [2:0]    _zz_s0_countOnesLogic_15_18;
  wire       [4:0]    _zz_s0_countOnesLogic_15_19;
  reg        [4:0]    _zz_s0_countOnesLogic_15_20;
  wire       [2:0]    _zz_s0_countOnesLogic_15_21;
  reg        [4:0]    _zz_s0_countOnesLogic_15_22;
  wire       [2:0]    _zz_s0_countOnesLogic_15_23;
  wire       [0:0]    _zz_s0_countOnesLogic_15_24;
  wire       [4:0]    _zz_s1_offsetNext;
  wire       [12:0]   _zz_s1_byteCounter;
  wire       [3:0]    _zz_s1_inputIndexes_1;
  wire       [3:0]    _zz_s1_inputIndexes_2;
  wire       [3:0]    _zz_s1_inputIndexes_3;
  wire       [3:0]    _zz_s1_inputIndexes_4;
  wire       [3:0]    _zz_s1_inputIndexes_5;
  wire       [3:0]    _zz_s1_inputIndexes_6;
  wire       [3:0]    _zz_s1_inputIndexes_7;
  wire       [0:0]    _zz_s1_outputPayload_selValid;
  wire       [6:0]    _zz_s1_outputPayload_selValid_1;
  wire       [0:0]    _zz_s1_outputPayload_selValid_2;
  wire       [6:0]    _zz_s1_outputPayload_selValid_3;
  wire       [0:0]    _zz_s1_outputPayload_selValid_4;
  wire       [6:0]    _zz_s1_outputPayload_selValid_5;
  wire       [0:0]    _zz_s1_outputPayload_selValid_6;
  wire       [6:0]    _zz_s1_outputPayload_selValid_7;
  wire       [0:0]    _zz_s1_outputPayload_selValid_8;
  wire       [6:0]    _zz_s1_outputPayload_selValid_9;
  wire       [0:0]    _zz_s1_outputPayload_selValid_10;
  wire       [6:0]    _zz_s1_outputPayload_selValid_11;
  wire       [0:0]    _zz_s1_outputPayload_selValid_12;
  wire       [6:0]    _zz_s1_outputPayload_selValid_13;
  wire       [0:0]    _zz_s1_outputPayload_selValid_14;
  wire       [6:0]    _zz_s1_outputPayload_selValid_15;
  wire       [0:0]    _zz_s1_outputPayload_selValid_16;
  wire       [6:0]    _zz_s1_outputPayload_selValid_17;
  wire       [0:0]    _zz_s1_outputPayload_selValid_18;
  wire       [6:0]    _zz_s1_outputPayload_selValid_19;
  wire       [0:0]    _zz_s1_outputPayload_selValid_20;
  wire       [6:0]    _zz_s1_outputPayload_selValid_21;
  wire       [0:0]    _zz_s1_outputPayload_selValid_22;
  wire       [6:0]    _zz_s1_outputPayload_selValid_23;
  wire       [0:0]    _zz_s1_outputPayload_selValid_24;
  wire       [6:0]    _zz_s1_outputPayload_selValid_25;
  wire       [0:0]    _zz_s1_outputPayload_selValid_26;
  wire       [6:0]    _zz_s1_outputPayload_selValid_27;
  wire       [0:0]    _zz_s1_outputPayload_selValid_28;
  wire       [6:0]    _zz_s1_outputPayload_selValid_29;
  wire       [0:0]    _zz_s1_outputPayload_selValid_30;
  wire       [6:0]    _zz_s1_outputPayload_selValid_31;
  wire       [12:0]   _zz_when_DmaSg_l1387;
  reg        [7:0]    _zz_s2_byteLogic_0_inputData;
  reg        [7:0]    _zz_s2_byteLogic_1_inputData;
  reg        [7:0]    _zz_s2_byteLogic_2_inputData;
  reg        [7:0]    _zz_s2_byteLogic_3_inputData;
  reg        [7:0]    _zz_s2_byteLogic_4_inputData;
  reg        [7:0]    _zz_s2_byteLogic_5_inputData;
  reg        [7:0]    _zz_s2_byteLogic_6_inputData;
  reg        [7:0]    _zz_s2_byteLogic_7_inputData;
  reg        [7:0]    _zz_s2_byteLogic_8_inputData;
  reg        [7:0]    _zz_s2_byteLogic_9_inputData;
  reg        [7:0]    _zz_s2_byteLogic_10_inputData;
  reg        [7:0]    _zz_s2_byteLogic_11_inputData;
  reg        [7:0]    _zz_s2_byteLogic_12_inputData;
  reg        [7:0]    _zz_s2_byteLogic_13_inputData;
  reg        [7:0]    _zz_s2_byteLogic_14_inputData;
  reg        [7:0]    _zz_s2_byteLogic_15_inputData;
  reg        [3:0]    _zz_io_output_usedUntil_4;
  wire       [3:0]    _zz_io_output_usedUntil_5;
  wire                io_input_input_valid;
  wire                io_input_input_ready;
  wire       [127:0]  io_input_input_payload_data;
  wire       [15:0]   io_input_input_payload_mask;
  reg                 io_input_rValid;
  reg        [127:0]  io_input_rData_data;
  reg        [15:0]   io_input_rData_mask;
  wire                when_Stream_l342;
  wire                _zz_s0_countOnesLogic_0;
  wire                _zz_s0_countOnesLogic_1;
  wire                _zz_s0_countOnesLogic_2;
  wire                _zz_s0_countOnesLogic_3;
  wire                _zz_s0_countOnesLogic_4;
  wire                _zz_s0_countOnesLogic_5;
  wire                _zz_s0_countOnesLogic_6;
  wire                _zz_s0_countOnesLogic_7;
  wire                _zz_s0_countOnesLogic_8;
  wire                _zz_s0_countOnesLogic_9;
  wire                _zz_s0_countOnesLogic_10;
  wire                _zz_s0_countOnesLogic_11;
  wire                _zz_s0_countOnesLogic_12;
  wire                _zz_s0_countOnesLogic_13;
  wire                _zz_s0_countOnesLogic_14;
  wire       [0:0]    s0_countOnesLogic_0;
  wire       [1:0]    s0_countOnesLogic_1;
  wire       [1:0]    s0_countOnesLogic_2;
  wire       [2:0]    _zz_s0_countOnesLogic_3_1;
  wire       [2:0]    _zz_s0_countOnesLogic_3_2;
  wire       [2:0]    _zz_s0_countOnesLogic_3_3;
  wire       [2:0]    _zz_s0_countOnesLogic_3_4;
  wire       [2:0]    _zz_s0_countOnesLogic_3_5;
  wire       [2:0]    _zz_s0_countOnesLogic_3_6;
  wire       [2:0]    _zz_s0_countOnesLogic_3_7;
  wire       [2:0]    _zz_s0_countOnesLogic_3_8;
  wire       [2:0]    s0_countOnesLogic_3;
  wire       [2:0]    _zz_s0_countOnesLogic_4_1;
  wire       [2:0]    _zz_s0_countOnesLogic_4_2;
  wire       [2:0]    _zz_s0_countOnesLogic_4_3;
  wire       [2:0]    _zz_s0_countOnesLogic_4_4;
  wire       [2:0]    _zz_s0_countOnesLogic_4_5;
  wire       [2:0]    _zz_s0_countOnesLogic_4_6;
  wire       [2:0]    _zz_s0_countOnesLogic_4_7;
  wire       [2:0]    _zz_s0_countOnesLogic_4_8;
  wire       [2:0]    s0_countOnesLogic_4;
  wire       [2:0]    _zz_s0_countOnesLogic_5_1;
  wire       [2:0]    _zz_s0_countOnesLogic_5_2;
  wire       [2:0]    _zz_s0_countOnesLogic_5_3;
  wire       [2:0]    _zz_s0_countOnesLogic_5_4;
  wire       [2:0]    _zz_s0_countOnesLogic_5_5;
  wire       [2:0]    _zz_s0_countOnesLogic_5_6;
  wire       [2:0]    _zz_s0_countOnesLogic_5_7;
  wire       [2:0]    _zz_s0_countOnesLogic_5_8;
  wire       [2:0]    s0_countOnesLogic_5;
  wire       [2:0]    _zz_s0_countOnesLogic_6_1;
  wire       [2:0]    _zz_s0_countOnesLogic_6_2;
  wire       [2:0]    _zz_s0_countOnesLogic_6_3;
  wire       [2:0]    _zz_s0_countOnesLogic_6_4;
  wire       [2:0]    _zz_s0_countOnesLogic_6_5;
  wire       [2:0]    _zz_s0_countOnesLogic_6_6;
  wire       [2:0]    _zz_s0_countOnesLogic_6_7;
  wire       [2:0]    _zz_s0_countOnesLogic_6_8;
  wire       [2:0]    s0_countOnesLogic_6;
  wire       [3:0]    _zz_s0_countOnesLogic_7_1;
  wire       [3:0]    _zz_s0_countOnesLogic_7_2;
  wire       [3:0]    _zz_s0_countOnesLogic_7_3;
  wire       [3:0]    _zz_s0_countOnesLogic_7_4;
  wire       [3:0]    _zz_s0_countOnesLogic_7_5;
  wire       [3:0]    _zz_s0_countOnesLogic_7_6;
  wire       [3:0]    _zz_s0_countOnesLogic_7_7;
  wire       [3:0]    _zz_s0_countOnesLogic_7_8;
  wire       [3:0]    s0_countOnesLogic_7;
  wire       [3:0]    _zz_s0_countOnesLogic_8_1;
  wire       [3:0]    _zz_s0_countOnesLogic_8_2;
  wire       [3:0]    _zz_s0_countOnesLogic_8_3;
  wire       [3:0]    _zz_s0_countOnesLogic_8_4;
  wire       [3:0]    _zz_s0_countOnesLogic_8_5;
  wire       [3:0]    _zz_s0_countOnesLogic_8_6;
  wire       [3:0]    _zz_s0_countOnesLogic_8_7;
  wire       [3:0]    _zz_s0_countOnesLogic_8_8;
  wire       [3:0]    s0_countOnesLogic_8;
  wire       [3:0]    _zz_s0_countOnesLogic_9_1;
  wire       [3:0]    _zz_s0_countOnesLogic_9_2;
  wire       [3:0]    _zz_s0_countOnesLogic_9_3;
  wire       [3:0]    _zz_s0_countOnesLogic_9_4;
  wire       [3:0]    _zz_s0_countOnesLogic_9_5;
  wire       [3:0]    _zz_s0_countOnesLogic_9_6;
  wire       [3:0]    _zz_s0_countOnesLogic_9_7;
  wire       [3:0]    _zz_s0_countOnesLogic_9_8;
  wire       [3:0]    s0_countOnesLogic_9;
  wire       [3:0]    _zz_s0_countOnesLogic_10_1;
  wire       [3:0]    _zz_s0_countOnesLogic_10_2;
  wire       [3:0]    _zz_s0_countOnesLogic_10_3;
  wire       [3:0]    _zz_s0_countOnesLogic_10_4;
  wire       [3:0]    _zz_s0_countOnesLogic_10_5;
  wire       [3:0]    _zz_s0_countOnesLogic_10_6;
  wire       [3:0]    _zz_s0_countOnesLogic_10_7;
  wire       [3:0]    _zz_s0_countOnesLogic_10_8;
  wire       [3:0]    s0_countOnesLogic_10;
  wire       [3:0]    _zz_s0_countOnesLogic_11_1;
  wire       [3:0]    _zz_s0_countOnesLogic_11_2;
  wire       [3:0]    _zz_s0_countOnesLogic_11_3;
  wire       [3:0]    _zz_s0_countOnesLogic_11_4;
  wire       [3:0]    _zz_s0_countOnesLogic_11_5;
  wire       [3:0]    _zz_s0_countOnesLogic_11_6;
  wire       [3:0]    _zz_s0_countOnesLogic_11_7;
  wire       [3:0]    _zz_s0_countOnesLogic_11_8;
  wire       [3:0]    s0_countOnesLogic_11;
  wire       [3:0]    _zz_s0_countOnesLogic_12_1;
  wire       [3:0]    _zz_s0_countOnesLogic_12_2;
  wire       [3:0]    _zz_s0_countOnesLogic_12_3;
  wire       [3:0]    _zz_s0_countOnesLogic_12_4;
  wire       [3:0]    _zz_s0_countOnesLogic_12_5;
  wire       [3:0]    _zz_s0_countOnesLogic_12_6;
  wire       [3:0]    _zz_s0_countOnesLogic_12_7;
  wire       [3:0]    _zz_s0_countOnesLogic_12_8;
  wire       [3:0]    s0_countOnesLogic_12;
  wire       [3:0]    _zz_s0_countOnesLogic_13_1;
  wire       [3:0]    _zz_s0_countOnesLogic_13_2;
  wire       [3:0]    _zz_s0_countOnesLogic_13_3;
  wire       [3:0]    _zz_s0_countOnesLogic_13_4;
  wire       [3:0]    _zz_s0_countOnesLogic_13_5;
  wire       [3:0]    _zz_s0_countOnesLogic_13_6;
  wire       [3:0]    _zz_s0_countOnesLogic_13_7;
  wire       [3:0]    _zz_s0_countOnesLogic_13_8;
  wire       [3:0]    s0_countOnesLogic_13;
  wire       [3:0]    _zz_s0_countOnesLogic_14_1;
  wire       [3:0]    _zz_s0_countOnesLogic_14_2;
  wire       [3:0]    _zz_s0_countOnesLogic_14_3;
  wire       [3:0]    _zz_s0_countOnesLogic_14_4;
  wire       [3:0]    _zz_s0_countOnesLogic_14_5;
  wire       [3:0]    _zz_s0_countOnesLogic_14_6;
  wire       [3:0]    _zz_s0_countOnesLogic_14_7;
  wire       [3:0]    _zz_s0_countOnesLogic_14_8;
  wire       [3:0]    s0_countOnesLogic_14;
  wire       [4:0]    _zz_s0_countOnesLogic_15;
  wire       [4:0]    _zz_s0_countOnesLogic_15_1;
  wire       [4:0]    _zz_s0_countOnesLogic_15_2;
  wire       [4:0]    _zz_s0_countOnesLogic_15_3;
  wire       [4:0]    _zz_s0_countOnesLogic_15_4;
  wire       [4:0]    _zz_s0_countOnesLogic_15_5;
  wire       [4:0]    _zz_s0_countOnesLogic_15_6;
  wire       [4:0]    _zz_s0_countOnesLogic_15_7;
  wire       [4:0]    s0_countOnesLogic_15;
  wire       [127:0]  s0_outputPayload_cmd_data;
  wire       [15:0]   s0_outputPayload_cmd_mask;
  wire       [0:0]    s0_outputPayload_countOnes_0;
  wire       [1:0]    s0_outputPayload_countOnes_1;
  wire       [1:0]    s0_outputPayload_countOnes_2;
  wire       [2:0]    s0_outputPayload_countOnes_3;
  wire       [2:0]    s0_outputPayload_countOnes_4;
  wire       [2:0]    s0_outputPayload_countOnes_5;
  wire       [2:0]    s0_outputPayload_countOnes_6;
  wire       [3:0]    s0_outputPayload_countOnes_7;
  wire       [3:0]    s0_outputPayload_countOnes_8;
  wire       [3:0]    s0_outputPayload_countOnes_9;
  wire       [3:0]    s0_outputPayload_countOnes_10;
  wire       [3:0]    s0_outputPayload_countOnes_11;
  wire       [3:0]    s0_outputPayload_countOnes_12;
  wire       [3:0]    s0_outputPayload_countOnes_13;
  wire       [3:0]    s0_outputPayload_countOnes_14;
  wire       [4:0]    s0_outputPayload_countOnes_15;
  wire                s0_output_valid;
  reg                 s0_output_ready;
  wire       [127:0]  s0_output_payload_cmd_data;
  wire       [15:0]   s0_output_payload_cmd_mask;
  wire       [0:0]    s0_output_payload_countOnes_0;
  wire       [1:0]    s0_output_payload_countOnes_1;
  wire       [1:0]    s0_output_payload_countOnes_2;
  wire       [2:0]    s0_output_payload_countOnes_3;
  wire       [2:0]    s0_output_payload_countOnes_4;
  wire       [2:0]    s0_output_payload_countOnes_5;
  wire       [2:0]    s0_output_payload_countOnes_6;
  wire       [3:0]    s0_output_payload_countOnes_7;
  wire       [3:0]    s0_output_payload_countOnes_8;
  wire       [3:0]    s0_output_payload_countOnes_9;
  wire       [3:0]    s0_output_payload_countOnes_10;
  wire       [3:0]    s0_output_payload_countOnes_11;
  wire       [3:0]    s0_output_payload_countOnes_12;
  wire       [3:0]    s0_output_payload_countOnes_13;
  wire       [3:0]    s0_output_payload_countOnes_14;
  wire       [4:0]    s0_output_payload_countOnes_15;
  wire                s0_output_input_valid;
  wire                s0_output_input_ready;
  wire       [127:0]  s0_output_input_payload_cmd_data;
  wire       [15:0]   s0_output_input_payload_cmd_mask;
  wire       [0:0]    s0_output_input_payload_countOnes_0;
  wire       [1:0]    s0_output_input_payload_countOnes_1;
  wire       [1:0]    s0_output_input_payload_countOnes_2;
  wire       [2:0]    s0_output_input_payload_countOnes_3;
  wire       [2:0]    s0_output_input_payload_countOnes_4;
  wire       [2:0]    s0_output_input_payload_countOnes_5;
  wire       [2:0]    s0_output_input_payload_countOnes_6;
  wire       [3:0]    s0_output_input_payload_countOnes_7;
  wire       [3:0]    s0_output_input_payload_countOnes_8;
  wire       [3:0]    s0_output_input_payload_countOnes_9;
  wire       [3:0]    s0_output_input_payload_countOnes_10;
  wire       [3:0]    s0_output_input_payload_countOnes_11;
  wire       [3:0]    s0_output_input_payload_countOnes_12;
  wire       [3:0]    s0_output_input_payload_countOnes_13;
  wire       [3:0]    s0_output_input_payload_countOnes_14;
  wire       [4:0]    s0_output_input_payload_countOnes_15;
  reg                 s0_output_rValid;
  reg        [127:0]  s0_output_rData_cmd_data;
  reg        [15:0]   s0_output_rData_cmd_mask;
  reg        [0:0]    s0_output_rData_countOnes_0;
  reg        [1:0]    s0_output_rData_countOnes_1;
  reg        [1:0]    s0_output_rData_countOnes_2;
  reg        [2:0]    s0_output_rData_countOnes_3;
  reg        [2:0]    s0_output_rData_countOnes_4;
  reg        [2:0]    s0_output_rData_countOnes_5;
  reg        [2:0]    s0_output_rData_countOnes_6;
  reg        [3:0]    s0_output_rData_countOnes_7;
  reg        [3:0]    s0_output_rData_countOnes_8;
  reg        [3:0]    s0_output_rData_countOnes_9;
  reg        [3:0]    s0_output_rData_countOnes_10;
  reg        [3:0]    s0_output_rData_countOnes_11;
  reg        [3:0]    s0_output_rData_countOnes_12;
  reg        [3:0]    s0_output_rData_countOnes_13;
  reg        [3:0]    s0_output_rData_countOnes_14;
  reg        [4:0]    s0_output_rData_countOnes_15;
  wire                when_Stream_l342_1;
  reg        [3:0]    s1_offset;
  wire       [4:0]    s1_offsetNext;
  wire                s0_output_input_fire;
  reg        [12:0]   s1_byteCounter;
  wire                s0_output_input_fire_1;
  wire       [3:0]    s1_inputIndexes_0;
  wire       [3:0]    s1_inputIndexes_1;
  wire       [3:0]    s1_inputIndexes_2;
  wire       [3:0]    s1_inputIndexes_3;
  wire       [3:0]    s1_inputIndexes_4;
  wire       [3:0]    s1_inputIndexes_5;
  wire       [3:0]    s1_inputIndexes_6;
  wire       [3:0]    s1_inputIndexes_7;
  wire       [3:0]    s1_inputIndexes_8;
  wire       [3:0]    s1_inputIndexes_9;
  wire       [3:0]    s1_inputIndexes_10;
  wire       [3:0]    s1_inputIndexes_11;
  wire       [3:0]    s1_inputIndexes_12;
  wire       [3:0]    s1_inputIndexes_13;
  wire       [3:0]    s1_inputIndexes_14;
  wire       [3:0]    s1_inputIndexes_15;
  wire       [127:0]  s1_outputPayload_cmd_data;
  wire       [15:0]   s1_outputPayload_cmd_mask;
  wire       [3:0]    s1_outputPayload_index_0;
  wire       [3:0]    s1_outputPayload_index_1;
  wire       [3:0]    s1_outputPayload_index_2;
  wire       [3:0]    s1_outputPayload_index_3;
  wire       [3:0]    s1_outputPayload_index_4;
  wire       [3:0]    s1_outputPayload_index_5;
  wire       [3:0]    s1_outputPayload_index_6;
  wire       [3:0]    s1_outputPayload_index_7;
  wire       [3:0]    s1_outputPayload_index_8;
  wire       [3:0]    s1_outputPayload_index_9;
  wire       [3:0]    s1_outputPayload_index_10;
  wire       [3:0]    s1_outputPayload_index_11;
  wire       [3:0]    s1_outputPayload_index_12;
  wire       [3:0]    s1_outputPayload_index_13;
  wire       [3:0]    s1_outputPayload_index_14;
  wire       [3:0]    s1_outputPayload_index_15;
  wire                s1_outputPayload_last;
  wire       [3:0]    s1_outputPayload_sel_0;
  wire       [3:0]    s1_outputPayload_sel_1;
  wire       [3:0]    s1_outputPayload_sel_2;
  wire       [3:0]    s1_outputPayload_sel_3;
  wire       [3:0]    s1_outputPayload_sel_4;
  wire       [3:0]    s1_outputPayload_sel_5;
  wire       [3:0]    s1_outputPayload_sel_6;
  wire       [3:0]    s1_outputPayload_sel_7;
  wire       [3:0]    s1_outputPayload_sel_8;
  wire       [3:0]    s1_outputPayload_sel_9;
  wire       [3:0]    s1_outputPayload_sel_10;
  wire       [3:0]    s1_outputPayload_sel_11;
  wire       [3:0]    s1_outputPayload_sel_12;
  wire       [3:0]    s1_outputPayload_sel_13;
  wire       [3:0]    s1_outputPayload_sel_14;
  wire       [3:0]    s1_outputPayload_sel_15;
  reg        [15:0]   s1_outputPayload_selValid;
  wire                _zz_s1_outputPayload_sel_0;
  wire                _zz_s1_outputPayload_sel_0_1;
  wire                _zz_s1_outputPayload_sel_0_2;
  wire                _zz_s1_outputPayload_sel_0_3;
  wire                _zz_s1_outputPayload_sel_0_4;
  wire                _zz_s1_outputPayload_sel_0_5;
  wire                _zz_s1_outputPayload_sel_0_6;
  wire                _zz_s1_outputPayload_sel_0_7;
  wire                _zz_s1_outputPayload_sel_0_8;
  wire                _zz_s1_outputPayload_sel_0_9;
  wire                _zz_s1_outputPayload_sel_0_10;
  wire                _zz_s1_outputPayload_sel_0_11;
  wire                _zz_s1_outputPayload_sel_0_12;
  wire                _zz_s1_outputPayload_sel_0_13;
  wire                _zz_s1_outputPayload_sel_0_14;
  wire                _zz_s1_outputPayload_sel_0_15;
  wire                _zz_s1_outputPayload_sel_0_16;
  wire                _zz_s1_outputPayload_sel_0_17;
  wire                _zz_s1_outputPayload_sel_0_18;
  wire                _zz_s1_outputPayload_sel_1;
  wire                _zz_s1_outputPayload_sel_1_1;
  wire                _zz_s1_outputPayload_sel_1_2;
  wire                _zz_s1_outputPayload_sel_1_3;
  wire                _zz_s1_outputPayload_sel_1_4;
  wire                _zz_s1_outputPayload_sel_1_5;
  wire                _zz_s1_outputPayload_sel_1_6;
  wire                _zz_s1_outputPayload_sel_1_7;
  wire                _zz_s1_outputPayload_sel_1_8;
  wire                _zz_s1_outputPayload_sel_1_9;
  wire                _zz_s1_outputPayload_sel_1_10;
  wire                _zz_s1_outputPayload_sel_1_11;
  wire                _zz_s1_outputPayload_sel_1_12;
  wire                _zz_s1_outputPayload_sel_1_13;
  wire                _zz_s1_outputPayload_sel_1_14;
  wire                _zz_s1_outputPayload_sel_1_15;
  wire                _zz_s1_outputPayload_sel_1_16;
  wire                _zz_s1_outputPayload_sel_1_17;
  wire                _zz_s1_outputPayload_sel_1_18;
  wire                _zz_s1_outputPayload_sel_2;
  wire                _zz_s1_outputPayload_sel_2_1;
  wire                _zz_s1_outputPayload_sel_2_2;
  wire                _zz_s1_outputPayload_sel_2_3;
  wire                _zz_s1_outputPayload_sel_2_4;
  wire                _zz_s1_outputPayload_sel_2_5;
  wire                _zz_s1_outputPayload_sel_2_6;
  wire                _zz_s1_outputPayload_sel_2_7;
  wire                _zz_s1_outputPayload_sel_2_8;
  wire                _zz_s1_outputPayload_sel_2_9;
  wire                _zz_s1_outputPayload_sel_2_10;
  wire                _zz_s1_outputPayload_sel_2_11;
  wire                _zz_s1_outputPayload_sel_2_12;
  wire                _zz_s1_outputPayload_sel_2_13;
  wire                _zz_s1_outputPayload_sel_2_14;
  wire                _zz_s1_outputPayload_sel_2_15;
  wire                _zz_s1_outputPayload_sel_2_16;
  wire                _zz_s1_outputPayload_sel_2_17;
  wire                _zz_s1_outputPayload_sel_2_18;
  wire                _zz_s1_outputPayload_sel_3;
  wire                _zz_s1_outputPayload_sel_3_1;
  wire                _zz_s1_outputPayload_sel_3_2;
  wire                _zz_s1_outputPayload_sel_3_3;
  wire                _zz_s1_outputPayload_sel_3_4;
  wire                _zz_s1_outputPayload_sel_3_5;
  wire                _zz_s1_outputPayload_sel_3_6;
  wire                _zz_s1_outputPayload_sel_3_7;
  wire                _zz_s1_outputPayload_sel_3_8;
  wire                _zz_s1_outputPayload_sel_3_9;
  wire                _zz_s1_outputPayload_sel_3_10;
  wire                _zz_s1_outputPayload_sel_3_11;
  wire                _zz_s1_outputPayload_sel_3_12;
  wire                _zz_s1_outputPayload_sel_3_13;
  wire                _zz_s1_outputPayload_sel_3_14;
  wire                _zz_s1_outputPayload_sel_3_15;
  wire                _zz_s1_outputPayload_sel_3_16;
  wire                _zz_s1_outputPayload_sel_3_17;
  wire                _zz_s1_outputPayload_sel_3_18;
  wire                _zz_s1_outputPayload_sel_4;
  wire                _zz_s1_outputPayload_sel_4_1;
  wire                _zz_s1_outputPayload_sel_4_2;
  wire                _zz_s1_outputPayload_sel_4_3;
  wire                _zz_s1_outputPayload_sel_4_4;
  wire                _zz_s1_outputPayload_sel_4_5;
  wire                _zz_s1_outputPayload_sel_4_6;
  wire                _zz_s1_outputPayload_sel_4_7;
  wire                _zz_s1_outputPayload_sel_4_8;
  wire                _zz_s1_outputPayload_sel_4_9;
  wire                _zz_s1_outputPayload_sel_4_10;
  wire                _zz_s1_outputPayload_sel_4_11;
  wire                _zz_s1_outputPayload_sel_4_12;
  wire                _zz_s1_outputPayload_sel_4_13;
  wire                _zz_s1_outputPayload_sel_4_14;
  wire                _zz_s1_outputPayload_sel_4_15;
  wire                _zz_s1_outputPayload_sel_4_16;
  wire                _zz_s1_outputPayload_sel_4_17;
  wire                _zz_s1_outputPayload_sel_4_18;
  wire                _zz_s1_outputPayload_sel_5;
  wire                _zz_s1_outputPayload_sel_5_1;
  wire                _zz_s1_outputPayload_sel_5_2;
  wire                _zz_s1_outputPayload_sel_5_3;
  wire                _zz_s1_outputPayload_sel_5_4;
  wire                _zz_s1_outputPayload_sel_5_5;
  wire                _zz_s1_outputPayload_sel_5_6;
  wire                _zz_s1_outputPayload_sel_5_7;
  wire                _zz_s1_outputPayload_sel_5_8;
  wire                _zz_s1_outputPayload_sel_5_9;
  wire                _zz_s1_outputPayload_sel_5_10;
  wire                _zz_s1_outputPayload_sel_5_11;
  wire                _zz_s1_outputPayload_sel_5_12;
  wire                _zz_s1_outputPayload_sel_5_13;
  wire                _zz_s1_outputPayload_sel_5_14;
  wire                _zz_s1_outputPayload_sel_5_15;
  wire                _zz_s1_outputPayload_sel_5_16;
  wire                _zz_s1_outputPayload_sel_5_17;
  wire                _zz_s1_outputPayload_sel_5_18;
  wire                _zz_s1_outputPayload_sel_6;
  wire                _zz_s1_outputPayload_sel_6_1;
  wire                _zz_s1_outputPayload_sel_6_2;
  wire                _zz_s1_outputPayload_sel_6_3;
  wire                _zz_s1_outputPayload_sel_6_4;
  wire                _zz_s1_outputPayload_sel_6_5;
  wire                _zz_s1_outputPayload_sel_6_6;
  wire                _zz_s1_outputPayload_sel_6_7;
  wire                _zz_s1_outputPayload_sel_6_8;
  wire                _zz_s1_outputPayload_sel_6_9;
  wire                _zz_s1_outputPayload_sel_6_10;
  wire                _zz_s1_outputPayload_sel_6_11;
  wire                _zz_s1_outputPayload_sel_6_12;
  wire                _zz_s1_outputPayload_sel_6_13;
  wire                _zz_s1_outputPayload_sel_6_14;
  wire                _zz_s1_outputPayload_sel_6_15;
  wire                _zz_s1_outputPayload_sel_6_16;
  wire                _zz_s1_outputPayload_sel_6_17;
  wire                _zz_s1_outputPayload_sel_6_18;
  wire                _zz_s1_outputPayload_sel_7;
  wire                _zz_s1_outputPayload_sel_7_1;
  wire                _zz_s1_outputPayload_sel_7_2;
  wire                _zz_s1_outputPayload_sel_7_3;
  wire                _zz_s1_outputPayload_sel_7_4;
  wire                _zz_s1_outputPayload_sel_7_5;
  wire                _zz_s1_outputPayload_sel_7_6;
  wire                _zz_s1_outputPayload_sel_7_7;
  wire                _zz_s1_outputPayload_sel_7_8;
  wire                _zz_s1_outputPayload_sel_7_9;
  wire                _zz_s1_outputPayload_sel_7_10;
  wire                _zz_s1_outputPayload_sel_7_11;
  wire                _zz_s1_outputPayload_sel_7_12;
  wire                _zz_s1_outputPayload_sel_7_13;
  wire                _zz_s1_outputPayload_sel_7_14;
  wire                _zz_s1_outputPayload_sel_7_15;
  wire                _zz_s1_outputPayload_sel_7_16;
  wire                _zz_s1_outputPayload_sel_7_17;
  wire                _zz_s1_outputPayload_sel_7_18;
  wire                _zz_s1_outputPayload_sel_8;
  wire                _zz_s1_outputPayload_sel_8_1;
  wire                _zz_s1_outputPayload_sel_8_2;
  wire                _zz_s1_outputPayload_sel_8_3;
  wire                _zz_s1_outputPayload_sel_8_4;
  wire                _zz_s1_outputPayload_sel_8_5;
  wire                _zz_s1_outputPayload_sel_8_6;
  wire                _zz_s1_outputPayload_sel_8_7;
  wire                _zz_s1_outputPayload_sel_8_8;
  wire                _zz_s1_outputPayload_sel_8_9;
  wire                _zz_s1_outputPayload_sel_8_10;
  wire                _zz_s1_outputPayload_sel_8_11;
  wire                _zz_s1_outputPayload_sel_8_12;
  wire                _zz_s1_outputPayload_sel_8_13;
  wire                _zz_s1_outputPayload_sel_8_14;
  wire                _zz_s1_outputPayload_sel_8_15;
  wire                _zz_s1_outputPayload_sel_8_16;
  wire                _zz_s1_outputPayload_sel_8_17;
  wire                _zz_s1_outputPayload_sel_8_18;
  wire                _zz_s1_outputPayload_sel_9;
  wire                _zz_s1_outputPayload_sel_9_1;
  wire                _zz_s1_outputPayload_sel_9_2;
  wire                _zz_s1_outputPayload_sel_9_3;
  wire                _zz_s1_outputPayload_sel_9_4;
  wire                _zz_s1_outputPayload_sel_9_5;
  wire                _zz_s1_outputPayload_sel_9_6;
  wire                _zz_s1_outputPayload_sel_9_7;
  wire                _zz_s1_outputPayload_sel_9_8;
  wire                _zz_s1_outputPayload_sel_9_9;
  wire                _zz_s1_outputPayload_sel_9_10;
  wire                _zz_s1_outputPayload_sel_9_11;
  wire                _zz_s1_outputPayload_sel_9_12;
  wire                _zz_s1_outputPayload_sel_9_13;
  wire                _zz_s1_outputPayload_sel_9_14;
  wire                _zz_s1_outputPayload_sel_9_15;
  wire                _zz_s1_outputPayload_sel_9_16;
  wire                _zz_s1_outputPayload_sel_9_17;
  wire                _zz_s1_outputPayload_sel_9_18;
  wire                _zz_s1_outputPayload_sel_10;
  wire                _zz_s1_outputPayload_sel_10_1;
  wire                _zz_s1_outputPayload_sel_10_2;
  wire                _zz_s1_outputPayload_sel_10_3;
  wire                _zz_s1_outputPayload_sel_10_4;
  wire                _zz_s1_outputPayload_sel_10_5;
  wire                _zz_s1_outputPayload_sel_10_6;
  wire                _zz_s1_outputPayload_sel_10_7;
  wire                _zz_s1_outputPayload_sel_10_8;
  wire                _zz_s1_outputPayload_sel_10_9;
  wire                _zz_s1_outputPayload_sel_10_10;
  wire                _zz_s1_outputPayload_sel_10_11;
  wire                _zz_s1_outputPayload_sel_10_12;
  wire                _zz_s1_outputPayload_sel_10_13;
  wire                _zz_s1_outputPayload_sel_10_14;
  wire                _zz_s1_outputPayload_sel_10_15;
  wire                _zz_s1_outputPayload_sel_10_16;
  wire                _zz_s1_outputPayload_sel_10_17;
  wire                _zz_s1_outputPayload_sel_10_18;
  wire                _zz_s1_outputPayload_sel_11;
  wire                _zz_s1_outputPayload_sel_11_1;
  wire                _zz_s1_outputPayload_sel_11_2;
  wire                _zz_s1_outputPayload_sel_11_3;
  wire                _zz_s1_outputPayload_sel_11_4;
  wire                _zz_s1_outputPayload_sel_11_5;
  wire                _zz_s1_outputPayload_sel_11_6;
  wire                _zz_s1_outputPayload_sel_11_7;
  wire                _zz_s1_outputPayload_sel_11_8;
  wire                _zz_s1_outputPayload_sel_11_9;
  wire                _zz_s1_outputPayload_sel_11_10;
  wire                _zz_s1_outputPayload_sel_11_11;
  wire                _zz_s1_outputPayload_sel_11_12;
  wire                _zz_s1_outputPayload_sel_11_13;
  wire                _zz_s1_outputPayload_sel_11_14;
  wire                _zz_s1_outputPayload_sel_11_15;
  wire                _zz_s1_outputPayload_sel_11_16;
  wire                _zz_s1_outputPayload_sel_11_17;
  wire                _zz_s1_outputPayload_sel_11_18;
  wire                _zz_s1_outputPayload_sel_12;
  wire                _zz_s1_outputPayload_sel_12_1;
  wire                _zz_s1_outputPayload_sel_12_2;
  wire                _zz_s1_outputPayload_sel_12_3;
  wire                _zz_s1_outputPayload_sel_12_4;
  wire                _zz_s1_outputPayload_sel_12_5;
  wire                _zz_s1_outputPayload_sel_12_6;
  wire                _zz_s1_outputPayload_sel_12_7;
  wire                _zz_s1_outputPayload_sel_12_8;
  wire                _zz_s1_outputPayload_sel_12_9;
  wire                _zz_s1_outputPayload_sel_12_10;
  wire                _zz_s1_outputPayload_sel_12_11;
  wire                _zz_s1_outputPayload_sel_12_12;
  wire                _zz_s1_outputPayload_sel_12_13;
  wire                _zz_s1_outputPayload_sel_12_14;
  wire                _zz_s1_outputPayload_sel_12_15;
  wire                _zz_s1_outputPayload_sel_12_16;
  wire                _zz_s1_outputPayload_sel_12_17;
  wire                _zz_s1_outputPayload_sel_12_18;
  wire                _zz_s1_outputPayload_sel_13;
  wire                _zz_s1_outputPayload_sel_13_1;
  wire                _zz_s1_outputPayload_sel_13_2;
  wire                _zz_s1_outputPayload_sel_13_3;
  wire                _zz_s1_outputPayload_sel_13_4;
  wire                _zz_s1_outputPayload_sel_13_5;
  wire                _zz_s1_outputPayload_sel_13_6;
  wire                _zz_s1_outputPayload_sel_13_7;
  wire                _zz_s1_outputPayload_sel_13_8;
  wire                _zz_s1_outputPayload_sel_13_9;
  wire                _zz_s1_outputPayload_sel_13_10;
  wire                _zz_s1_outputPayload_sel_13_11;
  wire                _zz_s1_outputPayload_sel_13_12;
  wire                _zz_s1_outputPayload_sel_13_13;
  wire                _zz_s1_outputPayload_sel_13_14;
  wire                _zz_s1_outputPayload_sel_13_15;
  wire                _zz_s1_outputPayload_sel_13_16;
  wire                _zz_s1_outputPayload_sel_13_17;
  wire                _zz_s1_outputPayload_sel_13_18;
  wire                _zz_s1_outputPayload_sel_14;
  wire                _zz_s1_outputPayload_sel_14_1;
  wire                _zz_s1_outputPayload_sel_14_2;
  wire                _zz_s1_outputPayload_sel_14_3;
  wire                _zz_s1_outputPayload_sel_14_4;
  wire                _zz_s1_outputPayload_sel_14_5;
  wire                _zz_s1_outputPayload_sel_14_6;
  wire                _zz_s1_outputPayload_sel_14_7;
  wire                _zz_s1_outputPayload_sel_14_8;
  wire                _zz_s1_outputPayload_sel_14_9;
  wire                _zz_s1_outputPayload_sel_14_10;
  wire                _zz_s1_outputPayload_sel_14_11;
  wire                _zz_s1_outputPayload_sel_14_12;
  wire                _zz_s1_outputPayload_sel_14_13;
  wire                _zz_s1_outputPayload_sel_14_14;
  wire                _zz_s1_outputPayload_sel_14_15;
  wire                _zz_s1_outputPayload_sel_14_16;
  wire                _zz_s1_outputPayload_sel_14_17;
  wire                _zz_s1_outputPayload_sel_14_18;
  wire                _zz_s1_outputPayload_sel_15;
  wire                _zz_s1_outputPayload_sel_15_1;
  wire                _zz_s1_outputPayload_sel_15_2;
  wire                _zz_s1_outputPayload_sel_15_3;
  wire                _zz_s1_outputPayload_sel_15_4;
  wire                _zz_s1_outputPayload_sel_15_5;
  wire                _zz_s1_outputPayload_sel_15_6;
  wire                _zz_s1_outputPayload_sel_15_7;
  wire                _zz_s1_outputPayload_sel_15_8;
  wire                _zz_s1_outputPayload_sel_15_9;
  wire                _zz_s1_outputPayload_sel_15_10;
  wire                _zz_s1_outputPayload_sel_15_11;
  wire                _zz_s1_outputPayload_sel_15_12;
  wire                _zz_s1_outputPayload_sel_15_13;
  wire                _zz_s1_outputPayload_sel_15_14;
  wire                _zz_s1_outputPayload_sel_15_15;
  wire                _zz_s1_outputPayload_sel_15_16;
  wire                _zz_s1_outputPayload_sel_15_17;
  wire                _zz_s1_outputPayload_sel_15_18;
  wire                s1_output_valid;
  reg                 s1_output_ready;
  wire       [127:0]  s1_output_payload_cmd_data;
  wire       [15:0]   s1_output_payload_cmd_mask;
  wire       [3:0]    s1_output_payload_index_0;
  wire       [3:0]    s1_output_payload_index_1;
  wire       [3:0]    s1_output_payload_index_2;
  wire       [3:0]    s1_output_payload_index_3;
  wire       [3:0]    s1_output_payload_index_4;
  wire       [3:0]    s1_output_payload_index_5;
  wire       [3:0]    s1_output_payload_index_6;
  wire       [3:0]    s1_output_payload_index_7;
  wire       [3:0]    s1_output_payload_index_8;
  wire       [3:0]    s1_output_payload_index_9;
  wire       [3:0]    s1_output_payload_index_10;
  wire       [3:0]    s1_output_payload_index_11;
  wire       [3:0]    s1_output_payload_index_12;
  wire       [3:0]    s1_output_payload_index_13;
  wire       [3:0]    s1_output_payload_index_14;
  wire       [3:0]    s1_output_payload_index_15;
  wire                s1_output_payload_last;
  wire       [3:0]    s1_output_payload_sel_0;
  wire       [3:0]    s1_output_payload_sel_1;
  wire       [3:0]    s1_output_payload_sel_2;
  wire       [3:0]    s1_output_payload_sel_3;
  wire       [3:0]    s1_output_payload_sel_4;
  wire       [3:0]    s1_output_payload_sel_5;
  wire       [3:0]    s1_output_payload_sel_6;
  wire       [3:0]    s1_output_payload_sel_7;
  wire       [3:0]    s1_output_payload_sel_8;
  wire       [3:0]    s1_output_payload_sel_9;
  wire       [3:0]    s1_output_payload_sel_10;
  wire       [3:0]    s1_output_payload_sel_11;
  wire       [3:0]    s1_output_payload_sel_12;
  wire       [3:0]    s1_output_payload_sel_13;
  wire       [3:0]    s1_output_payload_sel_14;
  wire       [3:0]    s1_output_payload_sel_15;
  wire       [15:0]   s1_output_payload_selValid;
  wire                s1_output_input_valid;
  reg                 s1_output_input_ready;
  wire       [127:0]  s1_output_input_payload_cmd_data;
  wire       [15:0]   s1_output_input_payload_cmd_mask;
  wire       [3:0]    s1_output_input_payload_index_0;
  wire       [3:0]    s1_output_input_payload_index_1;
  wire       [3:0]    s1_output_input_payload_index_2;
  wire       [3:0]    s1_output_input_payload_index_3;
  wire       [3:0]    s1_output_input_payload_index_4;
  wire       [3:0]    s1_output_input_payload_index_5;
  wire       [3:0]    s1_output_input_payload_index_6;
  wire       [3:0]    s1_output_input_payload_index_7;
  wire       [3:0]    s1_output_input_payload_index_8;
  wire       [3:0]    s1_output_input_payload_index_9;
  wire       [3:0]    s1_output_input_payload_index_10;
  wire       [3:0]    s1_output_input_payload_index_11;
  wire       [3:0]    s1_output_input_payload_index_12;
  wire       [3:0]    s1_output_input_payload_index_13;
  wire       [3:0]    s1_output_input_payload_index_14;
  wire       [3:0]    s1_output_input_payload_index_15;
  wire                s1_output_input_payload_last;
  wire       [3:0]    s1_output_input_payload_sel_0;
  wire       [3:0]    s1_output_input_payload_sel_1;
  wire       [3:0]    s1_output_input_payload_sel_2;
  wire       [3:0]    s1_output_input_payload_sel_3;
  wire       [3:0]    s1_output_input_payload_sel_4;
  wire       [3:0]    s1_output_input_payload_sel_5;
  wire       [3:0]    s1_output_input_payload_sel_6;
  wire       [3:0]    s1_output_input_payload_sel_7;
  wire       [3:0]    s1_output_input_payload_sel_8;
  wire       [3:0]    s1_output_input_payload_sel_9;
  wire       [3:0]    s1_output_input_payload_sel_10;
  wire       [3:0]    s1_output_input_payload_sel_11;
  wire       [3:0]    s1_output_input_payload_sel_12;
  wire       [3:0]    s1_output_input_payload_sel_13;
  wire       [3:0]    s1_output_input_payload_sel_14;
  wire       [3:0]    s1_output_input_payload_sel_15;
  wire       [15:0]   s1_output_input_payload_selValid;
  reg                 s1_output_rValid;
  reg        [127:0]  s1_output_rData_cmd_data;
  reg        [15:0]   s1_output_rData_cmd_mask;
  reg        [3:0]    s1_output_rData_index_0;
  reg        [3:0]    s1_output_rData_index_1;
  reg        [3:0]    s1_output_rData_index_2;
  reg        [3:0]    s1_output_rData_index_3;
  reg        [3:0]    s1_output_rData_index_4;
  reg        [3:0]    s1_output_rData_index_5;
  reg        [3:0]    s1_output_rData_index_6;
  reg        [3:0]    s1_output_rData_index_7;
  reg        [3:0]    s1_output_rData_index_8;
  reg        [3:0]    s1_output_rData_index_9;
  reg        [3:0]    s1_output_rData_index_10;
  reg        [3:0]    s1_output_rData_index_11;
  reg        [3:0]    s1_output_rData_index_12;
  reg        [3:0]    s1_output_rData_index_13;
  reg        [3:0]    s1_output_rData_index_14;
  reg        [3:0]    s1_output_rData_index_15;
  reg                 s1_output_rData_last;
  reg        [3:0]    s1_output_rData_sel_0;
  reg        [3:0]    s1_output_rData_sel_1;
  reg        [3:0]    s1_output_rData_sel_2;
  reg        [3:0]    s1_output_rData_sel_3;
  reg        [3:0]    s1_output_rData_sel_4;
  reg        [3:0]    s1_output_rData_sel_5;
  reg        [3:0]    s1_output_rData_sel_6;
  reg        [3:0]    s1_output_rData_sel_7;
  reg        [3:0]    s1_output_rData_sel_8;
  reg        [3:0]    s1_output_rData_sel_9;
  reg        [3:0]    s1_output_rData_sel_10;
  reg        [3:0]    s1_output_rData_sel_11;
  reg        [3:0]    s1_output_rData_sel_12;
  reg        [3:0]    s1_output_rData_sel_13;
  reg        [3:0]    s1_output_rData_sel_14;
  reg        [3:0]    s1_output_rData_sel_15;
  reg        [15:0]   s1_output_rData_selValid;
  wire                when_Stream_l342_2;
  wire                when_DmaSg_l1387;
  wire                s1_output_input_fire;
  wire       [7:0]    s2_inputDataBytes_0;
  wire       [7:0]    s2_inputDataBytes_1;
  wire       [7:0]    s2_inputDataBytes_2;
  wire       [7:0]    s2_inputDataBytes_3;
  wire       [7:0]    s2_inputDataBytes_4;
  wire       [7:0]    s2_inputDataBytes_5;
  wire       [7:0]    s2_inputDataBytes_6;
  wire       [7:0]    s2_inputDataBytes_7;
  wire       [7:0]    s2_inputDataBytes_8;
  wire       [7:0]    s2_inputDataBytes_9;
  wire       [7:0]    s2_inputDataBytes_10;
  wire       [7:0]    s2_inputDataBytes_11;
  wire       [7:0]    s2_inputDataBytes_12;
  wire       [7:0]    s2_inputDataBytes_13;
  wire       [7:0]    s2_inputDataBytes_14;
  wire       [7:0]    s2_inputDataBytes_15;
  reg                 s2_byteLogic_0_buffer_valid;
  reg        [7:0]    s2_byteLogic_0_buffer_data;
  wire                s2_byteLogic_0_lastUsed;
  wire                s2_byteLogic_0_inputMask;
  wire       [7:0]    s2_byteLogic_0_inputData;
  wire                s2_byteLogic_0_outputMask;
  wire       [7:0]    s2_byteLogic_0_outputData;
  wire                s1_output_input_fire_1;
  wire                when_DmaSg_l1416;
  reg                 s2_byteLogic_1_buffer_valid;
  reg        [7:0]    s2_byteLogic_1_buffer_data;
  wire                s2_byteLogic_1_lastUsed;
  wire                s2_byteLogic_1_inputMask;
  wire       [7:0]    s2_byteLogic_1_inputData;
  wire                s2_byteLogic_1_outputMask;
  wire       [7:0]    s2_byteLogic_1_outputData;
  wire                s1_output_input_fire_2;
  wire                when_DmaSg_l1416_1;
  reg                 s2_byteLogic_2_buffer_valid;
  reg        [7:0]    s2_byteLogic_2_buffer_data;
  wire                s2_byteLogic_2_lastUsed;
  wire                s2_byteLogic_2_inputMask;
  wire       [7:0]    s2_byteLogic_2_inputData;
  wire                s2_byteLogic_2_outputMask;
  wire       [7:0]    s2_byteLogic_2_outputData;
  wire                s1_output_input_fire_3;
  wire                when_DmaSg_l1416_2;
  reg                 s2_byteLogic_3_buffer_valid;
  reg        [7:0]    s2_byteLogic_3_buffer_data;
  wire                s2_byteLogic_3_lastUsed;
  wire                s2_byteLogic_3_inputMask;
  wire       [7:0]    s2_byteLogic_3_inputData;
  wire                s2_byteLogic_3_outputMask;
  wire       [7:0]    s2_byteLogic_3_outputData;
  wire                s1_output_input_fire_4;
  wire                when_DmaSg_l1416_3;
  reg                 s2_byteLogic_4_buffer_valid;
  reg        [7:0]    s2_byteLogic_4_buffer_data;
  wire                s2_byteLogic_4_lastUsed;
  wire                s2_byteLogic_4_inputMask;
  wire       [7:0]    s2_byteLogic_4_inputData;
  wire                s2_byteLogic_4_outputMask;
  wire       [7:0]    s2_byteLogic_4_outputData;
  wire                s1_output_input_fire_5;
  wire                when_DmaSg_l1416_4;
  reg                 s2_byteLogic_5_buffer_valid;
  reg        [7:0]    s2_byteLogic_5_buffer_data;
  wire                s2_byteLogic_5_lastUsed;
  wire                s2_byteLogic_5_inputMask;
  wire       [7:0]    s2_byteLogic_5_inputData;
  wire                s2_byteLogic_5_outputMask;
  wire       [7:0]    s2_byteLogic_5_outputData;
  wire                s1_output_input_fire_6;
  wire                when_DmaSg_l1416_5;
  reg                 s2_byteLogic_6_buffer_valid;
  reg        [7:0]    s2_byteLogic_6_buffer_data;
  wire                s2_byteLogic_6_lastUsed;
  wire                s2_byteLogic_6_inputMask;
  wire       [7:0]    s2_byteLogic_6_inputData;
  wire                s2_byteLogic_6_outputMask;
  wire       [7:0]    s2_byteLogic_6_outputData;
  wire                s1_output_input_fire_7;
  wire                when_DmaSg_l1416_6;
  reg                 s2_byteLogic_7_buffer_valid;
  reg        [7:0]    s2_byteLogic_7_buffer_data;
  wire                s2_byteLogic_7_lastUsed;
  wire                s2_byteLogic_7_inputMask;
  wire       [7:0]    s2_byteLogic_7_inputData;
  wire                s2_byteLogic_7_outputMask;
  wire       [7:0]    s2_byteLogic_7_outputData;
  wire                s1_output_input_fire_8;
  wire                when_DmaSg_l1416_7;
  reg                 s2_byteLogic_8_buffer_valid;
  reg        [7:0]    s2_byteLogic_8_buffer_data;
  wire                s2_byteLogic_8_lastUsed;
  wire                s2_byteLogic_8_inputMask;
  wire       [7:0]    s2_byteLogic_8_inputData;
  wire                s2_byteLogic_8_outputMask;
  wire       [7:0]    s2_byteLogic_8_outputData;
  wire                s1_output_input_fire_9;
  wire                when_DmaSg_l1416_8;
  reg                 s2_byteLogic_9_buffer_valid;
  reg        [7:0]    s2_byteLogic_9_buffer_data;
  wire                s2_byteLogic_9_lastUsed;
  wire                s2_byteLogic_9_inputMask;
  wire       [7:0]    s2_byteLogic_9_inputData;
  wire                s2_byteLogic_9_outputMask;
  wire       [7:0]    s2_byteLogic_9_outputData;
  wire                s1_output_input_fire_10;
  wire                when_DmaSg_l1416_9;
  reg                 s2_byteLogic_10_buffer_valid;
  reg        [7:0]    s2_byteLogic_10_buffer_data;
  wire                s2_byteLogic_10_lastUsed;
  wire                s2_byteLogic_10_inputMask;
  wire       [7:0]    s2_byteLogic_10_inputData;
  wire                s2_byteLogic_10_outputMask;
  wire       [7:0]    s2_byteLogic_10_outputData;
  wire                s1_output_input_fire_11;
  wire                when_DmaSg_l1416_10;
  reg                 s2_byteLogic_11_buffer_valid;
  reg        [7:0]    s2_byteLogic_11_buffer_data;
  wire                s2_byteLogic_11_lastUsed;
  wire                s2_byteLogic_11_inputMask;
  wire       [7:0]    s2_byteLogic_11_inputData;
  wire                s2_byteLogic_11_outputMask;
  wire       [7:0]    s2_byteLogic_11_outputData;
  wire                s1_output_input_fire_12;
  wire                when_DmaSg_l1416_11;
  reg                 s2_byteLogic_12_buffer_valid;
  reg        [7:0]    s2_byteLogic_12_buffer_data;
  wire                s2_byteLogic_12_lastUsed;
  wire                s2_byteLogic_12_inputMask;
  wire       [7:0]    s2_byteLogic_12_inputData;
  wire                s2_byteLogic_12_outputMask;
  wire       [7:0]    s2_byteLogic_12_outputData;
  wire                s1_output_input_fire_13;
  wire                when_DmaSg_l1416_12;
  reg                 s2_byteLogic_13_buffer_valid;
  reg        [7:0]    s2_byteLogic_13_buffer_data;
  wire                s2_byteLogic_13_lastUsed;
  wire                s2_byteLogic_13_inputMask;
  wire       [7:0]    s2_byteLogic_13_inputData;
  wire                s2_byteLogic_13_outputMask;
  wire       [7:0]    s2_byteLogic_13_outputData;
  wire                s1_output_input_fire_14;
  wire                when_DmaSg_l1416_13;
  reg                 s2_byteLogic_14_buffer_valid;
  reg        [7:0]    s2_byteLogic_14_buffer_data;
  wire                s2_byteLogic_14_lastUsed;
  wire                s2_byteLogic_14_inputMask;
  wire       [7:0]    s2_byteLogic_14_inputData;
  wire                s2_byteLogic_14_outputMask;
  wire       [7:0]    s2_byteLogic_14_outputData;
  wire                s1_output_input_fire_15;
  wire                when_DmaSg_l1416_14;
  reg                 s2_byteLogic_15_buffer_valid;
  reg        [7:0]    s2_byteLogic_15_buffer_data;
  wire                s2_byteLogic_15_lastUsed;
  wire                s2_byteLogic_15_inputMask;
  wire       [7:0]    s2_byteLogic_15_inputData;
  wire                s2_byteLogic_15_outputMask;
  wire       [7:0]    s2_byteLogic_15_outputData;
  wire                s1_output_input_fire_16;
  wire                when_DmaSg_l1416_15;
  wire                _zz_io_output_usedUntil;
  wire                _zz_io_output_usedUntil_1;
  wire                _zz_io_output_usedUntil_2;
  wire                _zz_io_output_usedUntil_3;

  assign _zz_s0_countOnesLogic_3_13 = _zz_s0_countOnesLogic_3;
  assign _zz_s0_countOnesLogic_3_12 = {2'd0, _zz_s0_countOnesLogic_3_13};
  assign _zz_s0_countOnesLogic_4_13 = {_zz_s0_countOnesLogic_4,_zz_s0_countOnesLogic_3};
  assign _zz_s0_countOnesLogic_4_12 = {1'd0, _zz_s0_countOnesLogic_4_13};
  assign _zz_s0_countOnesLogic_6_9 = (_zz_s0_countOnesLogic_6_10 + _zz_s0_countOnesLogic_6_12);
  assign _zz_s0_countOnesLogic_6_16 = _zz_s0_countOnesLogic_6;
  assign _zz_s0_countOnesLogic_6_15 = {2'd0, _zz_s0_countOnesLogic_6_16};
  assign _zz_s0_countOnesLogic_7_9 = (_zz_s0_countOnesLogic_7_10 + _zz_s0_countOnesLogic_7_12);
  assign _zz_s0_countOnesLogic_7_16 = {_zz_s0_countOnesLogic_7,_zz_s0_countOnesLogic_6};
  assign _zz_s0_countOnesLogic_7_15 = {1'd0, _zz_s0_countOnesLogic_7_16};
  assign _zz_s0_countOnesLogic_8_9 = (_zz_s0_countOnesLogic_8_10 + _zz_s0_countOnesLogic_8_12);
  assign _zz_s0_countOnesLogic_9_9 = (_zz_s0_countOnesLogic_9_10 + _zz_s0_countOnesLogic_9_12);
  assign _zz_s0_countOnesLogic_9_14 = (_zz_s0_countOnesLogic_9_15 + _zz_s0_countOnesLogic_9_17);
  assign _zz_s0_countOnesLogic_9_19 = _zz_s0_countOnesLogic_9;
  assign _zz_s0_countOnesLogic_9_18 = {2'd0, _zz_s0_countOnesLogic_9_19};
  assign _zz_s0_countOnesLogic_10_9 = (_zz_s0_countOnesLogic_10_10 + _zz_s0_countOnesLogic_10_12);
  assign _zz_s0_countOnesLogic_10_14 = (_zz_s0_countOnesLogic_10_15 + _zz_s0_countOnesLogic_10_17);
  assign _zz_s0_countOnesLogic_10_19 = {_zz_s0_countOnesLogic_10,_zz_s0_countOnesLogic_9};
  assign _zz_s0_countOnesLogic_10_18 = {1'd0, _zz_s0_countOnesLogic_10_19};
  assign _zz_s0_countOnesLogic_11_9 = (_zz_s0_countOnesLogic_11_10 + _zz_s0_countOnesLogic_11_12);
  assign _zz_s0_countOnesLogic_11_14 = (_zz_s0_countOnesLogic_11_15 + _zz_s0_countOnesLogic_11_17);
  assign _zz_s0_countOnesLogic_12_9 = (_zz_s0_countOnesLogic_12_10 + _zz_s0_countOnesLogic_12_15);
  assign _zz_s0_countOnesLogic_12_10 = (_zz_s0_countOnesLogic_12_11 + _zz_s0_countOnesLogic_12_13);
  assign _zz_s0_countOnesLogic_12_15 = (_zz_s0_countOnesLogic_12_16 + _zz_s0_countOnesLogic_12_18);
  assign _zz_s0_countOnesLogic_12_22 = _zz_s0_countOnesLogic_12;
  assign _zz_s0_countOnesLogic_12_21 = {2'd0, _zz_s0_countOnesLogic_12_22};
  assign _zz_s0_countOnesLogic_13_9 = (_zz_s0_countOnesLogic_13_10 + _zz_s0_countOnesLogic_13_15);
  assign _zz_s0_countOnesLogic_13_10 = (_zz_s0_countOnesLogic_13_11 + _zz_s0_countOnesLogic_13_13);
  assign _zz_s0_countOnesLogic_13_15 = (_zz_s0_countOnesLogic_13_16 + _zz_s0_countOnesLogic_13_18);
  assign _zz_s0_countOnesLogic_13_22 = {_zz_s0_countOnesLogic_13,_zz_s0_countOnesLogic_12};
  assign _zz_s0_countOnesLogic_13_21 = {1'd0, _zz_s0_countOnesLogic_13_22};
  assign _zz_s0_countOnesLogic_14_9 = (_zz_s0_countOnesLogic_14_10 + _zz_s0_countOnesLogic_14_15);
  assign _zz_s0_countOnesLogic_14_10 = (_zz_s0_countOnesLogic_14_11 + _zz_s0_countOnesLogic_14_13);
  assign _zz_s0_countOnesLogic_14_15 = (_zz_s0_countOnesLogic_14_16 + _zz_s0_countOnesLogic_14_18);
  assign _zz_s0_countOnesLogic_15_8 = (_zz_s0_countOnesLogic_15_9 + _zz_s0_countOnesLogic_15_14);
  assign _zz_s0_countOnesLogic_15_9 = (_zz_s0_countOnesLogic_15_10 + _zz_s0_countOnesLogic_15_12);
  assign _zz_s0_countOnesLogic_15_14 = (_zz_s0_countOnesLogic_15_15 + _zz_s0_countOnesLogic_15_17);
  assign _zz_s0_countOnesLogic_15_19 = (_zz_s0_countOnesLogic_15_20 + _zz_s0_countOnesLogic_15_22);
  assign _zz_s0_countOnesLogic_15_24 = io_input_input_payload_mask[15];
  assign _zz_s0_countOnesLogic_15_23 = {2'd0, _zz_s0_countOnesLogic_15_24};
  assign _zz_s1_offsetNext = {1'd0, s1_offset};
  assign _zz_s1_byteCounter = {8'd0, s0_output_input_payload_countOnes_15};
  assign _zz_s1_inputIndexes_1 = {3'd0, s0_output_input_payload_countOnes_0};
  assign _zz_s1_inputIndexes_2 = {2'd0, s0_output_input_payload_countOnes_1};
  assign _zz_s1_inputIndexes_3 = {2'd0, s0_output_input_payload_countOnes_2};
  assign _zz_s1_inputIndexes_4 = {1'd0, s0_output_input_payload_countOnes_3};
  assign _zz_s1_inputIndexes_5 = {1'd0, s0_output_input_payload_countOnes_4};
  assign _zz_s1_inputIndexes_6 = {1'd0, s0_output_input_payload_countOnes_5};
  assign _zz_s1_inputIndexes_7 = {1'd0, s0_output_input_payload_countOnes_6};
  assign _zz_when_DmaSg_l1387 = {1'd0, io_burstLength};
  assign _zz_s0_countOnesLogic_0_2 = _zz_s0_countOnesLogic_0;
  assign _zz_s0_countOnesLogic_1_2 = {_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0};
  assign _zz_s0_countOnesLogic_2_2 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_3_10 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_4_10 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_5_10 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_5_12 = {_zz_s0_countOnesLogic_5,{_zz_s0_countOnesLogic_4,_zz_s0_countOnesLogic_3}};
  assign _zz_s0_countOnesLogic_6_11 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_6_13 = {_zz_s0_countOnesLogic_5,{_zz_s0_countOnesLogic_4,_zz_s0_countOnesLogic_3}};
  assign _zz_s0_countOnesLogic_7_11 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_7_13 = {_zz_s0_countOnesLogic_5,{_zz_s0_countOnesLogic_4,_zz_s0_countOnesLogic_3}};
  assign _zz_s0_countOnesLogic_8_11 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_8_13 = {_zz_s0_countOnesLogic_5,{_zz_s0_countOnesLogic_4,_zz_s0_countOnesLogic_3}};
  assign _zz_s0_countOnesLogic_8_15 = {_zz_s0_countOnesLogic_8,{_zz_s0_countOnesLogic_7,_zz_s0_countOnesLogic_6}};
  assign _zz_s0_countOnesLogic_9_11 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_9_13 = {_zz_s0_countOnesLogic_5,{_zz_s0_countOnesLogic_4,_zz_s0_countOnesLogic_3}};
  assign _zz_s0_countOnesLogic_9_16 = {_zz_s0_countOnesLogic_8,{_zz_s0_countOnesLogic_7,_zz_s0_countOnesLogic_6}};
  assign _zz_s0_countOnesLogic_10_11 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_10_13 = {_zz_s0_countOnesLogic_5,{_zz_s0_countOnesLogic_4,_zz_s0_countOnesLogic_3}};
  assign _zz_s0_countOnesLogic_10_16 = {_zz_s0_countOnesLogic_8,{_zz_s0_countOnesLogic_7,_zz_s0_countOnesLogic_6}};
  assign _zz_s0_countOnesLogic_11_11 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_11_13 = {_zz_s0_countOnesLogic_5,{_zz_s0_countOnesLogic_4,_zz_s0_countOnesLogic_3}};
  assign _zz_s0_countOnesLogic_11_16 = {_zz_s0_countOnesLogic_8,{_zz_s0_countOnesLogic_7,_zz_s0_countOnesLogic_6}};
  assign _zz_s0_countOnesLogic_11_18 = {_zz_s0_countOnesLogic_11,{_zz_s0_countOnesLogic_10,_zz_s0_countOnesLogic_9}};
  assign _zz_s0_countOnesLogic_12_12 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_12_14 = {_zz_s0_countOnesLogic_5,{_zz_s0_countOnesLogic_4,_zz_s0_countOnesLogic_3}};
  assign _zz_s0_countOnesLogic_12_17 = {_zz_s0_countOnesLogic_8,{_zz_s0_countOnesLogic_7,_zz_s0_countOnesLogic_6}};
  assign _zz_s0_countOnesLogic_12_19 = {_zz_s0_countOnesLogic_11,{_zz_s0_countOnesLogic_10,_zz_s0_countOnesLogic_9}};
  assign _zz_s0_countOnesLogic_13_12 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_13_14 = {_zz_s0_countOnesLogic_5,{_zz_s0_countOnesLogic_4,_zz_s0_countOnesLogic_3}};
  assign _zz_s0_countOnesLogic_13_17 = {_zz_s0_countOnesLogic_8,{_zz_s0_countOnesLogic_7,_zz_s0_countOnesLogic_6}};
  assign _zz_s0_countOnesLogic_13_19 = {_zz_s0_countOnesLogic_11,{_zz_s0_countOnesLogic_10,_zz_s0_countOnesLogic_9}};
  assign _zz_s0_countOnesLogic_14_12 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_14_14 = {_zz_s0_countOnesLogic_5,{_zz_s0_countOnesLogic_4,_zz_s0_countOnesLogic_3}};
  assign _zz_s0_countOnesLogic_14_17 = {_zz_s0_countOnesLogic_8,{_zz_s0_countOnesLogic_7,_zz_s0_countOnesLogic_6}};
  assign _zz_s0_countOnesLogic_14_19 = {_zz_s0_countOnesLogic_11,{_zz_s0_countOnesLogic_10,_zz_s0_countOnesLogic_9}};
  assign _zz_s0_countOnesLogic_14_21 = {_zz_s0_countOnesLogic_14,{_zz_s0_countOnesLogic_13,_zz_s0_countOnesLogic_12}};
  assign _zz_s0_countOnesLogic_15_11 = {_zz_s0_countOnesLogic_2,{_zz_s0_countOnesLogic_1,_zz_s0_countOnesLogic_0}};
  assign _zz_s0_countOnesLogic_15_13 = {_zz_s0_countOnesLogic_5,{_zz_s0_countOnesLogic_4,_zz_s0_countOnesLogic_3}};
  assign _zz_s0_countOnesLogic_15_16 = {_zz_s0_countOnesLogic_8,{_zz_s0_countOnesLogic_7,_zz_s0_countOnesLogic_6}};
  assign _zz_s0_countOnesLogic_15_18 = {_zz_s0_countOnesLogic_11,{_zz_s0_countOnesLogic_10,_zz_s0_countOnesLogic_9}};
  assign _zz_s0_countOnesLogic_15_21 = {_zz_s0_countOnesLogic_14,{_zz_s0_countOnesLogic_13,_zz_s0_countOnesLogic_12}};
  assign _zz_io_output_usedUntil_5 = {_zz_io_output_usedUntil_3,{_zz_io_output_usedUntil_2,{_zz_io_output_usedUntil_1,_zz_io_output_usedUntil}}};
  assign _zz_s1_outputPayload_selValid = _zz_s1_outputPayload_sel_0_6;
  assign _zz_s1_outputPayload_selValid_1 = {_zz_s1_outputPayload_sel_0_5,{_zz_s1_outputPayload_sel_0_4,{_zz_s1_outputPayload_sel_0_3,{_zz_s1_outputPayload_sel_0_2,{_zz_s1_outputPayload_sel_0_1,{_zz_s1_outputPayload_sel_0,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b0000))}}}}}};
  assign _zz_s1_outputPayload_selValid_2 = _zz_s1_outputPayload_sel_1_6;
  assign _zz_s1_outputPayload_selValid_3 = {_zz_s1_outputPayload_sel_1_5,{_zz_s1_outputPayload_sel_1_4,{_zz_s1_outputPayload_sel_1_3,{_zz_s1_outputPayload_sel_1_2,{_zz_s1_outputPayload_sel_1_1,{_zz_s1_outputPayload_sel_1,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b0001))}}}}}};
  assign _zz_s1_outputPayload_selValid_4 = _zz_s1_outputPayload_sel_2_6;
  assign _zz_s1_outputPayload_selValid_5 = {_zz_s1_outputPayload_sel_2_5,{_zz_s1_outputPayload_sel_2_4,{_zz_s1_outputPayload_sel_2_3,{_zz_s1_outputPayload_sel_2_2,{_zz_s1_outputPayload_sel_2_1,{_zz_s1_outputPayload_sel_2,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b0010))}}}}}};
  assign _zz_s1_outputPayload_selValid_6 = _zz_s1_outputPayload_sel_3_6;
  assign _zz_s1_outputPayload_selValid_7 = {_zz_s1_outputPayload_sel_3_5,{_zz_s1_outputPayload_sel_3_4,{_zz_s1_outputPayload_sel_3_3,{_zz_s1_outputPayload_sel_3_2,{_zz_s1_outputPayload_sel_3_1,{_zz_s1_outputPayload_sel_3,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b0011))}}}}}};
  assign _zz_s1_outputPayload_selValid_8 = _zz_s1_outputPayload_sel_4_6;
  assign _zz_s1_outputPayload_selValid_9 = {_zz_s1_outputPayload_sel_4_5,{_zz_s1_outputPayload_sel_4_4,{_zz_s1_outputPayload_sel_4_3,{_zz_s1_outputPayload_sel_4_2,{_zz_s1_outputPayload_sel_4_1,{_zz_s1_outputPayload_sel_4,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b0100))}}}}}};
  assign _zz_s1_outputPayload_selValid_10 = _zz_s1_outputPayload_sel_5_6;
  assign _zz_s1_outputPayload_selValid_11 = {_zz_s1_outputPayload_sel_5_5,{_zz_s1_outputPayload_sel_5_4,{_zz_s1_outputPayload_sel_5_3,{_zz_s1_outputPayload_sel_5_2,{_zz_s1_outputPayload_sel_5_1,{_zz_s1_outputPayload_sel_5,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b0101))}}}}}};
  assign _zz_s1_outputPayload_selValid_12 = _zz_s1_outputPayload_sel_6_6;
  assign _zz_s1_outputPayload_selValid_13 = {_zz_s1_outputPayload_sel_6_5,{_zz_s1_outputPayload_sel_6_4,{_zz_s1_outputPayload_sel_6_3,{_zz_s1_outputPayload_sel_6_2,{_zz_s1_outputPayload_sel_6_1,{_zz_s1_outputPayload_sel_6,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b0110))}}}}}};
  assign _zz_s1_outputPayload_selValid_14 = _zz_s1_outputPayload_sel_7_6;
  assign _zz_s1_outputPayload_selValid_15 = {_zz_s1_outputPayload_sel_7_5,{_zz_s1_outputPayload_sel_7_4,{_zz_s1_outputPayload_sel_7_3,{_zz_s1_outputPayload_sel_7_2,{_zz_s1_outputPayload_sel_7_1,{_zz_s1_outputPayload_sel_7,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b0111))}}}}}};
  assign _zz_s1_outputPayload_selValid_16 = _zz_s1_outputPayload_sel_8_6;
  assign _zz_s1_outputPayload_selValid_17 = {_zz_s1_outputPayload_sel_8_5,{_zz_s1_outputPayload_sel_8_4,{_zz_s1_outputPayload_sel_8_3,{_zz_s1_outputPayload_sel_8_2,{_zz_s1_outputPayload_sel_8_1,{_zz_s1_outputPayload_sel_8,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b1000))}}}}}};
  assign _zz_s1_outputPayload_selValid_18 = _zz_s1_outputPayload_sel_9_6;
  assign _zz_s1_outputPayload_selValid_19 = {_zz_s1_outputPayload_sel_9_5,{_zz_s1_outputPayload_sel_9_4,{_zz_s1_outputPayload_sel_9_3,{_zz_s1_outputPayload_sel_9_2,{_zz_s1_outputPayload_sel_9_1,{_zz_s1_outputPayload_sel_9,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b1001))}}}}}};
  assign _zz_s1_outputPayload_selValid_20 = _zz_s1_outputPayload_sel_10_6;
  assign _zz_s1_outputPayload_selValid_21 = {_zz_s1_outputPayload_sel_10_5,{_zz_s1_outputPayload_sel_10_4,{_zz_s1_outputPayload_sel_10_3,{_zz_s1_outputPayload_sel_10_2,{_zz_s1_outputPayload_sel_10_1,{_zz_s1_outputPayload_sel_10,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b1010))}}}}}};
  assign _zz_s1_outputPayload_selValid_22 = _zz_s1_outputPayload_sel_11_6;
  assign _zz_s1_outputPayload_selValid_23 = {_zz_s1_outputPayload_sel_11_5,{_zz_s1_outputPayload_sel_11_4,{_zz_s1_outputPayload_sel_11_3,{_zz_s1_outputPayload_sel_11_2,{_zz_s1_outputPayload_sel_11_1,{_zz_s1_outputPayload_sel_11,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b1011))}}}}}};
  assign _zz_s1_outputPayload_selValid_24 = _zz_s1_outputPayload_sel_12_6;
  assign _zz_s1_outputPayload_selValid_25 = {_zz_s1_outputPayload_sel_12_5,{_zz_s1_outputPayload_sel_12_4,{_zz_s1_outputPayload_sel_12_3,{_zz_s1_outputPayload_sel_12_2,{_zz_s1_outputPayload_sel_12_1,{_zz_s1_outputPayload_sel_12,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b1100))}}}}}};
  assign _zz_s1_outputPayload_selValid_26 = _zz_s1_outputPayload_sel_13_6;
  assign _zz_s1_outputPayload_selValid_27 = {_zz_s1_outputPayload_sel_13_5,{_zz_s1_outputPayload_sel_13_4,{_zz_s1_outputPayload_sel_13_3,{_zz_s1_outputPayload_sel_13_2,{_zz_s1_outputPayload_sel_13_1,{_zz_s1_outputPayload_sel_13,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b1101))}}}}}};
  assign _zz_s1_outputPayload_selValid_28 = _zz_s1_outputPayload_sel_14_6;
  assign _zz_s1_outputPayload_selValid_29 = {_zz_s1_outputPayload_sel_14_5,{_zz_s1_outputPayload_sel_14_4,{_zz_s1_outputPayload_sel_14_3,{_zz_s1_outputPayload_sel_14_2,{_zz_s1_outputPayload_sel_14_1,{_zz_s1_outputPayload_sel_14,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b1110))}}}}}};
  assign _zz_s1_outputPayload_selValid_30 = _zz_s1_outputPayload_sel_15_6;
  assign _zz_s1_outputPayload_selValid_31 = {_zz_s1_outputPayload_sel_15_5,{_zz_s1_outputPayload_sel_15_4,{_zz_s1_outputPayload_sel_15_3,{_zz_s1_outputPayload_sel_15_2,{_zz_s1_outputPayload_sel_15_1,{_zz_s1_outputPayload_sel_15,(s0_output_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 4'b1111))}}}}}};
  always @(*) begin
    case(_zz_s0_countOnesLogic_0_2)
      1'b0 : begin
        _zz_s0_countOnesLogic_0_1 = 1'b0;
      end
      default : begin
        _zz_s0_countOnesLogic_0_1 = 1'b1;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_1_2)
      2'b00 : begin
        _zz_s0_countOnesLogic_1_1 = 2'b00;
      end
      2'b01 : begin
        _zz_s0_countOnesLogic_1_1 = 2'b01;
      end
      2'b10 : begin
        _zz_s0_countOnesLogic_1_1 = 2'b01;
      end
      default : begin
        _zz_s0_countOnesLogic_1_1 = 2'b10;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_2_2)
      3'b000 : begin
        _zz_s0_countOnesLogic_2_1 = 2'b00;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_2_1 = 2'b01;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_2_1 = 2'b01;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_2_1 = 2'b10;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_2_1 = 2'b01;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_2_1 = 2'b10;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_2_1 = 2'b10;
      end
      default : begin
        _zz_s0_countOnesLogic_2_1 = 2'b11;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_3_10)
      3'b000 : begin
        _zz_s0_countOnesLogic_3_9 = _zz_s0_countOnesLogic_3_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_3_9 = _zz_s0_countOnesLogic_3_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_3_9 = _zz_s0_countOnesLogic_3_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_3_9 = _zz_s0_countOnesLogic_3_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_3_9 = _zz_s0_countOnesLogic_3_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_3_9 = _zz_s0_countOnesLogic_3_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_3_9 = _zz_s0_countOnesLogic_3_7;
      end
      default : begin
        _zz_s0_countOnesLogic_3_9 = _zz_s0_countOnesLogic_3_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_3_12)
      3'b000 : begin
        _zz_s0_countOnesLogic_3_11 = _zz_s0_countOnesLogic_3_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_3_11 = _zz_s0_countOnesLogic_3_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_3_11 = _zz_s0_countOnesLogic_3_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_3_11 = _zz_s0_countOnesLogic_3_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_3_11 = _zz_s0_countOnesLogic_3_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_3_11 = _zz_s0_countOnesLogic_3_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_3_11 = _zz_s0_countOnesLogic_3_7;
      end
      default : begin
        _zz_s0_countOnesLogic_3_11 = _zz_s0_countOnesLogic_3_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_4_10)
      3'b000 : begin
        _zz_s0_countOnesLogic_4_9 = _zz_s0_countOnesLogic_4_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_4_9 = _zz_s0_countOnesLogic_4_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_4_9 = _zz_s0_countOnesLogic_4_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_4_9 = _zz_s0_countOnesLogic_4_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_4_9 = _zz_s0_countOnesLogic_4_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_4_9 = _zz_s0_countOnesLogic_4_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_4_9 = _zz_s0_countOnesLogic_4_7;
      end
      default : begin
        _zz_s0_countOnesLogic_4_9 = _zz_s0_countOnesLogic_4_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_4_12)
      3'b000 : begin
        _zz_s0_countOnesLogic_4_11 = _zz_s0_countOnesLogic_4_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_4_11 = _zz_s0_countOnesLogic_4_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_4_11 = _zz_s0_countOnesLogic_4_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_4_11 = _zz_s0_countOnesLogic_4_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_4_11 = _zz_s0_countOnesLogic_4_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_4_11 = _zz_s0_countOnesLogic_4_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_4_11 = _zz_s0_countOnesLogic_4_7;
      end
      default : begin
        _zz_s0_countOnesLogic_4_11 = _zz_s0_countOnesLogic_4_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_5_10)
      3'b000 : begin
        _zz_s0_countOnesLogic_5_9 = _zz_s0_countOnesLogic_5_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_5_9 = _zz_s0_countOnesLogic_5_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_5_9 = _zz_s0_countOnesLogic_5_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_5_9 = _zz_s0_countOnesLogic_5_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_5_9 = _zz_s0_countOnesLogic_5_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_5_9 = _zz_s0_countOnesLogic_5_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_5_9 = _zz_s0_countOnesLogic_5_7;
      end
      default : begin
        _zz_s0_countOnesLogic_5_9 = _zz_s0_countOnesLogic_5_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_5_12)
      3'b000 : begin
        _zz_s0_countOnesLogic_5_11 = _zz_s0_countOnesLogic_5_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_5_11 = _zz_s0_countOnesLogic_5_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_5_11 = _zz_s0_countOnesLogic_5_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_5_11 = _zz_s0_countOnesLogic_5_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_5_11 = _zz_s0_countOnesLogic_5_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_5_11 = _zz_s0_countOnesLogic_5_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_5_11 = _zz_s0_countOnesLogic_5_7;
      end
      default : begin
        _zz_s0_countOnesLogic_5_11 = _zz_s0_countOnesLogic_5_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_6_11)
      3'b000 : begin
        _zz_s0_countOnesLogic_6_10 = _zz_s0_countOnesLogic_6_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_6_10 = _zz_s0_countOnesLogic_6_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_6_10 = _zz_s0_countOnesLogic_6_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_6_10 = _zz_s0_countOnesLogic_6_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_6_10 = _zz_s0_countOnesLogic_6_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_6_10 = _zz_s0_countOnesLogic_6_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_6_10 = _zz_s0_countOnesLogic_6_7;
      end
      default : begin
        _zz_s0_countOnesLogic_6_10 = _zz_s0_countOnesLogic_6_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_6_13)
      3'b000 : begin
        _zz_s0_countOnesLogic_6_12 = _zz_s0_countOnesLogic_6_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_6_12 = _zz_s0_countOnesLogic_6_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_6_12 = _zz_s0_countOnesLogic_6_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_6_12 = _zz_s0_countOnesLogic_6_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_6_12 = _zz_s0_countOnesLogic_6_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_6_12 = _zz_s0_countOnesLogic_6_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_6_12 = _zz_s0_countOnesLogic_6_7;
      end
      default : begin
        _zz_s0_countOnesLogic_6_12 = _zz_s0_countOnesLogic_6_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_6_15)
      3'b000 : begin
        _zz_s0_countOnesLogic_6_14 = _zz_s0_countOnesLogic_6_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_6_14 = _zz_s0_countOnesLogic_6_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_6_14 = _zz_s0_countOnesLogic_6_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_6_14 = _zz_s0_countOnesLogic_6_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_6_14 = _zz_s0_countOnesLogic_6_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_6_14 = _zz_s0_countOnesLogic_6_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_6_14 = _zz_s0_countOnesLogic_6_7;
      end
      default : begin
        _zz_s0_countOnesLogic_6_14 = _zz_s0_countOnesLogic_6_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_7_11)
      3'b000 : begin
        _zz_s0_countOnesLogic_7_10 = _zz_s0_countOnesLogic_7_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_7_10 = _zz_s0_countOnesLogic_7_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_7_10 = _zz_s0_countOnesLogic_7_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_7_10 = _zz_s0_countOnesLogic_7_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_7_10 = _zz_s0_countOnesLogic_7_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_7_10 = _zz_s0_countOnesLogic_7_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_7_10 = _zz_s0_countOnesLogic_7_7;
      end
      default : begin
        _zz_s0_countOnesLogic_7_10 = _zz_s0_countOnesLogic_7_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_7_13)
      3'b000 : begin
        _zz_s0_countOnesLogic_7_12 = _zz_s0_countOnesLogic_7_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_7_12 = _zz_s0_countOnesLogic_7_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_7_12 = _zz_s0_countOnesLogic_7_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_7_12 = _zz_s0_countOnesLogic_7_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_7_12 = _zz_s0_countOnesLogic_7_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_7_12 = _zz_s0_countOnesLogic_7_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_7_12 = _zz_s0_countOnesLogic_7_7;
      end
      default : begin
        _zz_s0_countOnesLogic_7_12 = _zz_s0_countOnesLogic_7_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_7_15)
      3'b000 : begin
        _zz_s0_countOnesLogic_7_14 = _zz_s0_countOnesLogic_7_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_7_14 = _zz_s0_countOnesLogic_7_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_7_14 = _zz_s0_countOnesLogic_7_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_7_14 = _zz_s0_countOnesLogic_7_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_7_14 = _zz_s0_countOnesLogic_7_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_7_14 = _zz_s0_countOnesLogic_7_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_7_14 = _zz_s0_countOnesLogic_7_7;
      end
      default : begin
        _zz_s0_countOnesLogic_7_14 = _zz_s0_countOnesLogic_7_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_8_11)
      3'b000 : begin
        _zz_s0_countOnesLogic_8_10 = _zz_s0_countOnesLogic_8_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_8_10 = _zz_s0_countOnesLogic_8_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_8_10 = _zz_s0_countOnesLogic_8_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_8_10 = _zz_s0_countOnesLogic_8_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_8_10 = _zz_s0_countOnesLogic_8_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_8_10 = _zz_s0_countOnesLogic_8_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_8_10 = _zz_s0_countOnesLogic_8_7;
      end
      default : begin
        _zz_s0_countOnesLogic_8_10 = _zz_s0_countOnesLogic_8_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_8_13)
      3'b000 : begin
        _zz_s0_countOnesLogic_8_12 = _zz_s0_countOnesLogic_8_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_8_12 = _zz_s0_countOnesLogic_8_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_8_12 = _zz_s0_countOnesLogic_8_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_8_12 = _zz_s0_countOnesLogic_8_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_8_12 = _zz_s0_countOnesLogic_8_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_8_12 = _zz_s0_countOnesLogic_8_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_8_12 = _zz_s0_countOnesLogic_8_7;
      end
      default : begin
        _zz_s0_countOnesLogic_8_12 = _zz_s0_countOnesLogic_8_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_8_15)
      3'b000 : begin
        _zz_s0_countOnesLogic_8_14 = _zz_s0_countOnesLogic_8_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_8_14 = _zz_s0_countOnesLogic_8_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_8_14 = _zz_s0_countOnesLogic_8_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_8_14 = _zz_s0_countOnesLogic_8_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_8_14 = _zz_s0_countOnesLogic_8_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_8_14 = _zz_s0_countOnesLogic_8_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_8_14 = _zz_s0_countOnesLogic_8_7;
      end
      default : begin
        _zz_s0_countOnesLogic_8_14 = _zz_s0_countOnesLogic_8_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_9_11)
      3'b000 : begin
        _zz_s0_countOnesLogic_9_10 = _zz_s0_countOnesLogic_9_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_9_10 = _zz_s0_countOnesLogic_9_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_9_10 = _zz_s0_countOnesLogic_9_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_9_10 = _zz_s0_countOnesLogic_9_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_9_10 = _zz_s0_countOnesLogic_9_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_9_10 = _zz_s0_countOnesLogic_9_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_9_10 = _zz_s0_countOnesLogic_9_7;
      end
      default : begin
        _zz_s0_countOnesLogic_9_10 = _zz_s0_countOnesLogic_9_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_9_13)
      3'b000 : begin
        _zz_s0_countOnesLogic_9_12 = _zz_s0_countOnesLogic_9_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_9_12 = _zz_s0_countOnesLogic_9_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_9_12 = _zz_s0_countOnesLogic_9_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_9_12 = _zz_s0_countOnesLogic_9_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_9_12 = _zz_s0_countOnesLogic_9_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_9_12 = _zz_s0_countOnesLogic_9_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_9_12 = _zz_s0_countOnesLogic_9_7;
      end
      default : begin
        _zz_s0_countOnesLogic_9_12 = _zz_s0_countOnesLogic_9_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_9_16)
      3'b000 : begin
        _zz_s0_countOnesLogic_9_15 = _zz_s0_countOnesLogic_9_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_9_15 = _zz_s0_countOnesLogic_9_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_9_15 = _zz_s0_countOnesLogic_9_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_9_15 = _zz_s0_countOnesLogic_9_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_9_15 = _zz_s0_countOnesLogic_9_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_9_15 = _zz_s0_countOnesLogic_9_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_9_15 = _zz_s0_countOnesLogic_9_7;
      end
      default : begin
        _zz_s0_countOnesLogic_9_15 = _zz_s0_countOnesLogic_9_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_9_18)
      3'b000 : begin
        _zz_s0_countOnesLogic_9_17 = _zz_s0_countOnesLogic_9_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_9_17 = _zz_s0_countOnesLogic_9_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_9_17 = _zz_s0_countOnesLogic_9_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_9_17 = _zz_s0_countOnesLogic_9_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_9_17 = _zz_s0_countOnesLogic_9_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_9_17 = _zz_s0_countOnesLogic_9_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_9_17 = _zz_s0_countOnesLogic_9_7;
      end
      default : begin
        _zz_s0_countOnesLogic_9_17 = _zz_s0_countOnesLogic_9_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_10_11)
      3'b000 : begin
        _zz_s0_countOnesLogic_10_10 = _zz_s0_countOnesLogic_10_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_10_10 = _zz_s0_countOnesLogic_10_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_10_10 = _zz_s0_countOnesLogic_10_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_10_10 = _zz_s0_countOnesLogic_10_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_10_10 = _zz_s0_countOnesLogic_10_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_10_10 = _zz_s0_countOnesLogic_10_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_10_10 = _zz_s0_countOnesLogic_10_7;
      end
      default : begin
        _zz_s0_countOnesLogic_10_10 = _zz_s0_countOnesLogic_10_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_10_13)
      3'b000 : begin
        _zz_s0_countOnesLogic_10_12 = _zz_s0_countOnesLogic_10_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_10_12 = _zz_s0_countOnesLogic_10_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_10_12 = _zz_s0_countOnesLogic_10_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_10_12 = _zz_s0_countOnesLogic_10_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_10_12 = _zz_s0_countOnesLogic_10_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_10_12 = _zz_s0_countOnesLogic_10_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_10_12 = _zz_s0_countOnesLogic_10_7;
      end
      default : begin
        _zz_s0_countOnesLogic_10_12 = _zz_s0_countOnesLogic_10_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_10_16)
      3'b000 : begin
        _zz_s0_countOnesLogic_10_15 = _zz_s0_countOnesLogic_10_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_10_15 = _zz_s0_countOnesLogic_10_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_10_15 = _zz_s0_countOnesLogic_10_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_10_15 = _zz_s0_countOnesLogic_10_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_10_15 = _zz_s0_countOnesLogic_10_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_10_15 = _zz_s0_countOnesLogic_10_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_10_15 = _zz_s0_countOnesLogic_10_7;
      end
      default : begin
        _zz_s0_countOnesLogic_10_15 = _zz_s0_countOnesLogic_10_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_10_18)
      3'b000 : begin
        _zz_s0_countOnesLogic_10_17 = _zz_s0_countOnesLogic_10_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_10_17 = _zz_s0_countOnesLogic_10_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_10_17 = _zz_s0_countOnesLogic_10_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_10_17 = _zz_s0_countOnesLogic_10_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_10_17 = _zz_s0_countOnesLogic_10_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_10_17 = _zz_s0_countOnesLogic_10_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_10_17 = _zz_s0_countOnesLogic_10_7;
      end
      default : begin
        _zz_s0_countOnesLogic_10_17 = _zz_s0_countOnesLogic_10_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_11_11)
      3'b000 : begin
        _zz_s0_countOnesLogic_11_10 = _zz_s0_countOnesLogic_11_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_11_10 = _zz_s0_countOnesLogic_11_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_11_10 = _zz_s0_countOnesLogic_11_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_11_10 = _zz_s0_countOnesLogic_11_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_11_10 = _zz_s0_countOnesLogic_11_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_11_10 = _zz_s0_countOnesLogic_11_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_11_10 = _zz_s0_countOnesLogic_11_7;
      end
      default : begin
        _zz_s0_countOnesLogic_11_10 = _zz_s0_countOnesLogic_11_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_11_13)
      3'b000 : begin
        _zz_s0_countOnesLogic_11_12 = _zz_s0_countOnesLogic_11_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_11_12 = _zz_s0_countOnesLogic_11_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_11_12 = _zz_s0_countOnesLogic_11_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_11_12 = _zz_s0_countOnesLogic_11_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_11_12 = _zz_s0_countOnesLogic_11_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_11_12 = _zz_s0_countOnesLogic_11_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_11_12 = _zz_s0_countOnesLogic_11_7;
      end
      default : begin
        _zz_s0_countOnesLogic_11_12 = _zz_s0_countOnesLogic_11_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_11_16)
      3'b000 : begin
        _zz_s0_countOnesLogic_11_15 = _zz_s0_countOnesLogic_11_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_11_15 = _zz_s0_countOnesLogic_11_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_11_15 = _zz_s0_countOnesLogic_11_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_11_15 = _zz_s0_countOnesLogic_11_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_11_15 = _zz_s0_countOnesLogic_11_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_11_15 = _zz_s0_countOnesLogic_11_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_11_15 = _zz_s0_countOnesLogic_11_7;
      end
      default : begin
        _zz_s0_countOnesLogic_11_15 = _zz_s0_countOnesLogic_11_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_11_18)
      3'b000 : begin
        _zz_s0_countOnesLogic_11_17 = _zz_s0_countOnesLogic_11_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_11_17 = _zz_s0_countOnesLogic_11_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_11_17 = _zz_s0_countOnesLogic_11_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_11_17 = _zz_s0_countOnesLogic_11_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_11_17 = _zz_s0_countOnesLogic_11_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_11_17 = _zz_s0_countOnesLogic_11_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_11_17 = _zz_s0_countOnesLogic_11_7;
      end
      default : begin
        _zz_s0_countOnesLogic_11_17 = _zz_s0_countOnesLogic_11_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_12_12)
      3'b000 : begin
        _zz_s0_countOnesLogic_12_11 = _zz_s0_countOnesLogic_12_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_12_11 = _zz_s0_countOnesLogic_12_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_12_11 = _zz_s0_countOnesLogic_12_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_12_11 = _zz_s0_countOnesLogic_12_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_12_11 = _zz_s0_countOnesLogic_12_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_12_11 = _zz_s0_countOnesLogic_12_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_12_11 = _zz_s0_countOnesLogic_12_7;
      end
      default : begin
        _zz_s0_countOnesLogic_12_11 = _zz_s0_countOnesLogic_12_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_12_14)
      3'b000 : begin
        _zz_s0_countOnesLogic_12_13 = _zz_s0_countOnesLogic_12_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_12_13 = _zz_s0_countOnesLogic_12_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_12_13 = _zz_s0_countOnesLogic_12_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_12_13 = _zz_s0_countOnesLogic_12_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_12_13 = _zz_s0_countOnesLogic_12_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_12_13 = _zz_s0_countOnesLogic_12_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_12_13 = _zz_s0_countOnesLogic_12_7;
      end
      default : begin
        _zz_s0_countOnesLogic_12_13 = _zz_s0_countOnesLogic_12_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_12_17)
      3'b000 : begin
        _zz_s0_countOnesLogic_12_16 = _zz_s0_countOnesLogic_12_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_12_16 = _zz_s0_countOnesLogic_12_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_12_16 = _zz_s0_countOnesLogic_12_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_12_16 = _zz_s0_countOnesLogic_12_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_12_16 = _zz_s0_countOnesLogic_12_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_12_16 = _zz_s0_countOnesLogic_12_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_12_16 = _zz_s0_countOnesLogic_12_7;
      end
      default : begin
        _zz_s0_countOnesLogic_12_16 = _zz_s0_countOnesLogic_12_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_12_19)
      3'b000 : begin
        _zz_s0_countOnesLogic_12_18 = _zz_s0_countOnesLogic_12_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_12_18 = _zz_s0_countOnesLogic_12_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_12_18 = _zz_s0_countOnesLogic_12_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_12_18 = _zz_s0_countOnesLogic_12_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_12_18 = _zz_s0_countOnesLogic_12_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_12_18 = _zz_s0_countOnesLogic_12_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_12_18 = _zz_s0_countOnesLogic_12_7;
      end
      default : begin
        _zz_s0_countOnesLogic_12_18 = _zz_s0_countOnesLogic_12_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_12_21)
      3'b000 : begin
        _zz_s0_countOnesLogic_12_20 = _zz_s0_countOnesLogic_12_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_12_20 = _zz_s0_countOnesLogic_12_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_12_20 = _zz_s0_countOnesLogic_12_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_12_20 = _zz_s0_countOnesLogic_12_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_12_20 = _zz_s0_countOnesLogic_12_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_12_20 = _zz_s0_countOnesLogic_12_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_12_20 = _zz_s0_countOnesLogic_12_7;
      end
      default : begin
        _zz_s0_countOnesLogic_12_20 = _zz_s0_countOnesLogic_12_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_13_12)
      3'b000 : begin
        _zz_s0_countOnesLogic_13_11 = _zz_s0_countOnesLogic_13_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_13_11 = _zz_s0_countOnesLogic_13_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_13_11 = _zz_s0_countOnesLogic_13_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_13_11 = _zz_s0_countOnesLogic_13_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_13_11 = _zz_s0_countOnesLogic_13_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_13_11 = _zz_s0_countOnesLogic_13_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_13_11 = _zz_s0_countOnesLogic_13_7;
      end
      default : begin
        _zz_s0_countOnesLogic_13_11 = _zz_s0_countOnesLogic_13_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_13_14)
      3'b000 : begin
        _zz_s0_countOnesLogic_13_13 = _zz_s0_countOnesLogic_13_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_13_13 = _zz_s0_countOnesLogic_13_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_13_13 = _zz_s0_countOnesLogic_13_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_13_13 = _zz_s0_countOnesLogic_13_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_13_13 = _zz_s0_countOnesLogic_13_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_13_13 = _zz_s0_countOnesLogic_13_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_13_13 = _zz_s0_countOnesLogic_13_7;
      end
      default : begin
        _zz_s0_countOnesLogic_13_13 = _zz_s0_countOnesLogic_13_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_13_17)
      3'b000 : begin
        _zz_s0_countOnesLogic_13_16 = _zz_s0_countOnesLogic_13_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_13_16 = _zz_s0_countOnesLogic_13_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_13_16 = _zz_s0_countOnesLogic_13_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_13_16 = _zz_s0_countOnesLogic_13_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_13_16 = _zz_s0_countOnesLogic_13_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_13_16 = _zz_s0_countOnesLogic_13_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_13_16 = _zz_s0_countOnesLogic_13_7;
      end
      default : begin
        _zz_s0_countOnesLogic_13_16 = _zz_s0_countOnesLogic_13_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_13_19)
      3'b000 : begin
        _zz_s0_countOnesLogic_13_18 = _zz_s0_countOnesLogic_13_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_13_18 = _zz_s0_countOnesLogic_13_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_13_18 = _zz_s0_countOnesLogic_13_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_13_18 = _zz_s0_countOnesLogic_13_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_13_18 = _zz_s0_countOnesLogic_13_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_13_18 = _zz_s0_countOnesLogic_13_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_13_18 = _zz_s0_countOnesLogic_13_7;
      end
      default : begin
        _zz_s0_countOnesLogic_13_18 = _zz_s0_countOnesLogic_13_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_13_21)
      3'b000 : begin
        _zz_s0_countOnesLogic_13_20 = _zz_s0_countOnesLogic_13_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_13_20 = _zz_s0_countOnesLogic_13_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_13_20 = _zz_s0_countOnesLogic_13_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_13_20 = _zz_s0_countOnesLogic_13_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_13_20 = _zz_s0_countOnesLogic_13_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_13_20 = _zz_s0_countOnesLogic_13_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_13_20 = _zz_s0_countOnesLogic_13_7;
      end
      default : begin
        _zz_s0_countOnesLogic_13_20 = _zz_s0_countOnesLogic_13_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_14_12)
      3'b000 : begin
        _zz_s0_countOnesLogic_14_11 = _zz_s0_countOnesLogic_14_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_14_11 = _zz_s0_countOnesLogic_14_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_14_11 = _zz_s0_countOnesLogic_14_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_14_11 = _zz_s0_countOnesLogic_14_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_14_11 = _zz_s0_countOnesLogic_14_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_14_11 = _zz_s0_countOnesLogic_14_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_14_11 = _zz_s0_countOnesLogic_14_7;
      end
      default : begin
        _zz_s0_countOnesLogic_14_11 = _zz_s0_countOnesLogic_14_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_14_14)
      3'b000 : begin
        _zz_s0_countOnesLogic_14_13 = _zz_s0_countOnesLogic_14_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_14_13 = _zz_s0_countOnesLogic_14_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_14_13 = _zz_s0_countOnesLogic_14_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_14_13 = _zz_s0_countOnesLogic_14_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_14_13 = _zz_s0_countOnesLogic_14_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_14_13 = _zz_s0_countOnesLogic_14_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_14_13 = _zz_s0_countOnesLogic_14_7;
      end
      default : begin
        _zz_s0_countOnesLogic_14_13 = _zz_s0_countOnesLogic_14_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_14_17)
      3'b000 : begin
        _zz_s0_countOnesLogic_14_16 = _zz_s0_countOnesLogic_14_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_14_16 = _zz_s0_countOnesLogic_14_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_14_16 = _zz_s0_countOnesLogic_14_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_14_16 = _zz_s0_countOnesLogic_14_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_14_16 = _zz_s0_countOnesLogic_14_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_14_16 = _zz_s0_countOnesLogic_14_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_14_16 = _zz_s0_countOnesLogic_14_7;
      end
      default : begin
        _zz_s0_countOnesLogic_14_16 = _zz_s0_countOnesLogic_14_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_14_19)
      3'b000 : begin
        _zz_s0_countOnesLogic_14_18 = _zz_s0_countOnesLogic_14_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_14_18 = _zz_s0_countOnesLogic_14_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_14_18 = _zz_s0_countOnesLogic_14_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_14_18 = _zz_s0_countOnesLogic_14_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_14_18 = _zz_s0_countOnesLogic_14_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_14_18 = _zz_s0_countOnesLogic_14_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_14_18 = _zz_s0_countOnesLogic_14_7;
      end
      default : begin
        _zz_s0_countOnesLogic_14_18 = _zz_s0_countOnesLogic_14_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_14_21)
      3'b000 : begin
        _zz_s0_countOnesLogic_14_20 = _zz_s0_countOnesLogic_14_1;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_14_20 = _zz_s0_countOnesLogic_14_2;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_14_20 = _zz_s0_countOnesLogic_14_3;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_14_20 = _zz_s0_countOnesLogic_14_4;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_14_20 = _zz_s0_countOnesLogic_14_5;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_14_20 = _zz_s0_countOnesLogic_14_6;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_14_20 = _zz_s0_countOnesLogic_14_7;
      end
      default : begin
        _zz_s0_countOnesLogic_14_20 = _zz_s0_countOnesLogic_14_8;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_15_11)
      3'b000 : begin
        _zz_s0_countOnesLogic_15_10 = _zz_s0_countOnesLogic_15;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_15_10 = _zz_s0_countOnesLogic_15_1;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_15_10 = _zz_s0_countOnesLogic_15_2;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_15_10 = _zz_s0_countOnesLogic_15_3;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_15_10 = _zz_s0_countOnesLogic_15_4;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_15_10 = _zz_s0_countOnesLogic_15_5;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_15_10 = _zz_s0_countOnesLogic_15_6;
      end
      default : begin
        _zz_s0_countOnesLogic_15_10 = _zz_s0_countOnesLogic_15_7;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_15_13)
      3'b000 : begin
        _zz_s0_countOnesLogic_15_12 = _zz_s0_countOnesLogic_15;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_15_12 = _zz_s0_countOnesLogic_15_1;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_15_12 = _zz_s0_countOnesLogic_15_2;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_15_12 = _zz_s0_countOnesLogic_15_3;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_15_12 = _zz_s0_countOnesLogic_15_4;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_15_12 = _zz_s0_countOnesLogic_15_5;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_15_12 = _zz_s0_countOnesLogic_15_6;
      end
      default : begin
        _zz_s0_countOnesLogic_15_12 = _zz_s0_countOnesLogic_15_7;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_15_16)
      3'b000 : begin
        _zz_s0_countOnesLogic_15_15 = _zz_s0_countOnesLogic_15;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_15_15 = _zz_s0_countOnesLogic_15_1;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_15_15 = _zz_s0_countOnesLogic_15_2;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_15_15 = _zz_s0_countOnesLogic_15_3;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_15_15 = _zz_s0_countOnesLogic_15_4;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_15_15 = _zz_s0_countOnesLogic_15_5;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_15_15 = _zz_s0_countOnesLogic_15_6;
      end
      default : begin
        _zz_s0_countOnesLogic_15_15 = _zz_s0_countOnesLogic_15_7;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_15_18)
      3'b000 : begin
        _zz_s0_countOnesLogic_15_17 = _zz_s0_countOnesLogic_15;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_15_17 = _zz_s0_countOnesLogic_15_1;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_15_17 = _zz_s0_countOnesLogic_15_2;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_15_17 = _zz_s0_countOnesLogic_15_3;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_15_17 = _zz_s0_countOnesLogic_15_4;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_15_17 = _zz_s0_countOnesLogic_15_5;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_15_17 = _zz_s0_countOnesLogic_15_6;
      end
      default : begin
        _zz_s0_countOnesLogic_15_17 = _zz_s0_countOnesLogic_15_7;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_15_21)
      3'b000 : begin
        _zz_s0_countOnesLogic_15_20 = _zz_s0_countOnesLogic_15;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_15_20 = _zz_s0_countOnesLogic_15_1;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_15_20 = _zz_s0_countOnesLogic_15_2;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_15_20 = _zz_s0_countOnesLogic_15_3;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_15_20 = _zz_s0_countOnesLogic_15_4;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_15_20 = _zz_s0_countOnesLogic_15_5;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_15_20 = _zz_s0_countOnesLogic_15_6;
      end
      default : begin
        _zz_s0_countOnesLogic_15_20 = _zz_s0_countOnesLogic_15_7;
      end
    endcase
  end

  always @(*) begin
    case(_zz_s0_countOnesLogic_15_23)
      3'b000 : begin
        _zz_s0_countOnesLogic_15_22 = _zz_s0_countOnesLogic_15;
      end
      3'b001 : begin
        _zz_s0_countOnesLogic_15_22 = _zz_s0_countOnesLogic_15_1;
      end
      3'b010 : begin
        _zz_s0_countOnesLogic_15_22 = _zz_s0_countOnesLogic_15_2;
      end
      3'b011 : begin
        _zz_s0_countOnesLogic_15_22 = _zz_s0_countOnesLogic_15_3;
      end
      3'b100 : begin
        _zz_s0_countOnesLogic_15_22 = _zz_s0_countOnesLogic_15_4;
      end
      3'b101 : begin
        _zz_s0_countOnesLogic_15_22 = _zz_s0_countOnesLogic_15_5;
      end
      3'b110 : begin
        _zz_s0_countOnesLogic_15_22 = _zz_s0_countOnesLogic_15_6;
      end
      default : begin
        _zz_s0_countOnesLogic_15_22 = _zz_s0_countOnesLogic_15_7;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_0)
      4'b0000 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_0_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_1)
      4'b0000 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_1_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_2)
      4'b0000 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_2_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_3)
      4'b0000 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_3_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_4)
      4'b0000 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_4_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_5)
      4'b0000 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_5_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_6)
      4'b0000 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_6_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_7)
      4'b0000 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_7_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_8)
      4'b0000 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_8_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_9)
      4'b0000 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_9_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_10)
      4'b0000 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_10_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_11)
      4'b0000 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_11_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_12)
      4'b0000 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_12_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_13)
      4'b0000 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_13_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_14)
      4'b0000 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_14_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(s1_output_input_payload_sel_15)
      4'b0000 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_0;
      end
      4'b0001 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_1;
      end
      4'b0010 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_2;
      end
      4'b0011 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_3;
      end
      4'b0100 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_4;
      end
      4'b0101 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_5;
      end
      4'b0110 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_6;
      end
      4'b0111 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_7;
      end
      4'b1000 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_8;
      end
      4'b1001 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_9;
      end
      4'b1010 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_10;
      end
      4'b1011 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_11;
      end
      4'b1100 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_12;
      end
      4'b1101 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_13;
      end
      4'b1110 : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_14;
      end
      default : begin
        _zz_s2_byteLogic_15_inputData = s2_inputDataBytes_15;
      end
    endcase
  end

  always @(*) begin
    case(_zz_io_output_usedUntil_5)
      4'b0000 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_0;
      end
      4'b0001 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_1;
      end
      4'b0010 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_2;
      end
      4'b0011 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_3;
      end
      4'b0100 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_4;
      end
      4'b0101 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_5;
      end
      4'b0110 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_6;
      end
      4'b0111 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_7;
      end
      4'b1000 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_8;
      end
      4'b1001 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_9;
      end
      4'b1010 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_10;
      end
      4'b1011 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_11;
      end
      4'b1100 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_12;
      end
      4'b1101 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_13;
      end
      4'b1110 : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_14;
      end
      default : begin
        _zz_io_output_usedUntil_4 = s1_output_input_payload_sel_15;
      end
    endcase
  end

  always @(*) begin
    io_input_ready = io_input_input_ready;
    if(when_Stream_l342) begin
      io_input_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! io_input_input_valid);
  assign io_input_input_valid = io_input_rValid;
  assign io_input_input_payload_data = io_input_rData_data;
  assign io_input_input_payload_mask = io_input_rData_mask;
  assign _zz_s0_countOnesLogic_0 = io_input_input_payload_mask[0];
  assign _zz_s0_countOnesLogic_1 = io_input_input_payload_mask[1];
  assign _zz_s0_countOnesLogic_2 = io_input_input_payload_mask[2];
  assign _zz_s0_countOnesLogic_3 = io_input_input_payload_mask[3];
  assign _zz_s0_countOnesLogic_4 = io_input_input_payload_mask[4];
  assign _zz_s0_countOnesLogic_5 = io_input_input_payload_mask[5];
  assign _zz_s0_countOnesLogic_6 = io_input_input_payload_mask[6];
  assign _zz_s0_countOnesLogic_7 = io_input_input_payload_mask[7];
  assign _zz_s0_countOnesLogic_8 = io_input_input_payload_mask[8];
  assign _zz_s0_countOnesLogic_9 = io_input_input_payload_mask[9];
  assign _zz_s0_countOnesLogic_10 = io_input_input_payload_mask[10];
  assign _zz_s0_countOnesLogic_11 = io_input_input_payload_mask[11];
  assign _zz_s0_countOnesLogic_12 = io_input_input_payload_mask[12];
  assign _zz_s0_countOnesLogic_13 = io_input_input_payload_mask[13];
  assign _zz_s0_countOnesLogic_14 = io_input_input_payload_mask[14];
  assign s0_countOnesLogic_0 = _zz_s0_countOnesLogic_0_1;
  assign s0_countOnesLogic_1 = _zz_s0_countOnesLogic_1_1;
  assign s0_countOnesLogic_2 = _zz_s0_countOnesLogic_2_1;
  assign _zz_s0_countOnesLogic_3_1 = 3'b000;
  assign _zz_s0_countOnesLogic_3_2 = 3'b001;
  assign _zz_s0_countOnesLogic_3_3 = 3'b001;
  assign _zz_s0_countOnesLogic_3_4 = 3'b010;
  assign _zz_s0_countOnesLogic_3_5 = 3'b001;
  assign _zz_s0_countOnesLogic_3_6 = 3'b010;
  assign _zz_s0_countOnesLogic_3_7 = 3'b010;
  assign _zz_s0_countOnesLogic_3_8 = 3'b011;
  assign s0_countOnesLogic_3 = (_zz_s0_countOnesLogic_3_9 + _zz_s0_countOnesLogic_3_11);
  assign _zz_s0_countOnesLogic_4_1 = 3'b000;
  assign _zz_s0_countOnesLogic_4_2 = 3'b001;
  assign _zz_s0_countOnesLogic_4_3 = 3'b001;
  assign _zz_s0_countOnesLogic_4_4 = 3'b010;
  assign _zz_s0_countOnesLogic_4_5 = 3'b001;
  assign _zz_s0_countOnesLogic_4_6 = 3'b010;
  assign _zz_s0_countOnesLogic_4_7 = 3'b010;
  assign _zz_s0_countOnesLogic_4_8 = 3'b011;
  assign s0_countOnesLogic_4 = (_zz_s0_countOnesLogic_4_9 + _zz_s0_countOnesLogic_4_11);
  assign _zz_s0_countOnesLogic_5_1 = 3'b000;
  assign _zz_s0_countOnesLogic_5_2 = 3'b001;
  assign _zz_s0_countOnesLogic_5_3 = 3'b001;
  assign _zz_s0_countOnesLogic_5_4 = 3'b010;
  assign _zz_s0_countOnesLogic_5_5 = 3'b001;
  assign _zz_s0_countOnesLogic_5_6 = 3'b010;
  assign _zz_s0_countOnesLogic_5_7 = 3'b010;
  assign _zz_s0_countOnesLogic_5_8 = 3'b011;
  assign s0_countOnesLogic_5 = (_zz_s0_countOnesLogic_5_9 + _zz_s0_countOnesLogic_5_11);
  assign _zz_s0_countOnesLogic_6_1 = 3'b000;
  assign _zz_s0_countOnesLogic_6_2 = 3'b001;
  assign _zz_s0_countOnesLogic_6_3 = 3'b001;
  assign _zz_s0_countOnesLogic_6_4 = 3'b010;
  assign _zz_s0_countOnesLogic_6_5 = 3'b001;
  assign _zz_s0_countOnesLogic_6_6 = 3'b010;
  assign _zz_s0_countOnesLogic_6_7 = 3'b010;
  assign _zz_s0_countOnesLogic_6_8 = 3'b011;
  assign s0_countOnesLogic_6 = (_zz_s0_countOnesLogic_6_9 + _zz_s0_countOnesLogic_6_14);
  assign _zz_s0_countOnesLogic_7_1 = 4'b0000;
  assign _zz_s0_countOnesLogic_7_2 = 4'b0001;
  assign _zz_s0_countOnesLogic_7_3 = 4'b0001;
  assign _zz_s0_countOnesLogic_7_4 = 4'b0010;
  assign _zz_s0_countOnesLogic_7_5 = 4'b0001;
  assign _zz_s0_countOnesLogic_7_6 = 4'b0010;
  assign _zz_s0_countOnesLogic_7_7 = 4'b0010;
  assign _zz_s0_countOnesLogic_7_8 = 4'b0011;
  assign s0_countOnesLogic_7 = (_zz_s0_countOnesLogic_7_9 + _zz_s0_countOnesLogic_7_14);
  assign _zz_s0_countOnesLogic_8_1 = 4'b0000;
  assign _zz_s0_countOnesLogic_8_2 = 4'b0001;
  assign _zz_s0_countOnesLogic_8_3 = 4'b0001;
  assign _zz_s0_countOnesLogic_8_4 = 4'b0010;
  assign _zz_s0_countOnesLogic_8_5 = 4'b0001;
  assign _zz_s0_countOnesLogic_8_6 = 4'b0010;
  assign _zz_s0_countOnesLogic_8_7 = 4'b0010;
  assign _zz_s0_countOnesLogic_8_8 = 4'b0011;
  assign s0_countOnesLogic_8 = (_zz_s0_countOnesLogic_8_9 + _zz_s0_countOnesLogic_8_14);
  assign _zz_s0_countOnesLogic_9_1 = 4'b0000;
  assign _zz_s0_countOnesLogic_9_2 = 4'b0001;
  assign _zz_s0_countOnesLogic_9_3 = 4'b0001;
  assign _zz_s0_countOnesLogic_9_4 = 4'b0010;
  assign _zz_s0_countOnesLogic_9_5 = 4'b0001;
  assign _zz_s0_countOnesLogic_9_6 = 4'b0010;
  assign _zz_s0_countOnesLogic_9_7 = 4'b0010;
  assign _zz_s0_countOnesLogic_9_8 = 4'b0011;
  assign s0_countOnesLogic_9 = (_zz_s0_countOnesLogic_9_9 + _zz_s0_countOnesLogic_9_14);
  assign _zz_s0_countOnesLogic_10_1 = 4'b0000;
  assign _zz_s0_countOnesLogic_10_2 = 4'b0001;
  assign _zz_s0_countOnesLogic_10_3 = 4'b0001;
  assign _zz_s0_countOnesLogic_10_4 = 4'b0010;
  assign _zz_s0_countOnesLogic_10_5 = 4'b0001;
  assign _zz_s0_countOnesLogic_10_6 = 4'b0010;
  assign _zz_s0_countOnesLogic_10_7 = 4'b0010;
  assign _zz_s0_countOnesLogic_10_8 = 4'b0011;
  assign s0_countOnesLogic_10 = (_zz_s0_countOnesLogic_10_9 + _zz_s0_countOnesLogic_10_14);
  assign _zz_s0_countOnesLogic_11_1 = 4'b0000;
  assign _zz_s0_countOnesLogic_11_2 = 4'b0001;
  assign _zz_s0_countOnesLogic_11_3 = 4'b0001;
  assign _zz_s0_countOnesLogic_11_4 = 4'b0010;
  assign _zz_s0_countOnesLogic_11_5 = 4'b0001;
  assign _zz_s0_countOnesLogic_11_6 = 4'b0010;
  assign _zz_s0_countOnesLogic_11_7 = 4'b0010;
  assign _zz_s0_countOnesLogic_11_8 = 4'b0011;
  assign s0_countOnesLogic_11 = (_zz_s0_countOnesLogic_11_9 + _zz_s0_countOnesLogic_11_14);
  assign _zz_s0_countOnesLogic_12_1 = 4'b0000;
  assign _zz_s0_countOnesLogic_12_2 = 4'b0001;
  assign _zz_s0_countOnesLogic_12_3 = 4'b0001;
  assign _zz_s0_countOnesLogic_12_4 = 4'b0010;
  assign _zz_s0_countOnesLogic_12_5 = 4'b0001;
  assign _zz_s0_countOnesLogic_12_6 = 4'b0010;
  assign _zz_s0_countOnesLogic_12_7 = 4'b0010;
  assign _zz_s0_countOnesLogic_12_8 = 4'b0011;
  assign s0_countOnesLogic_12 = (_zz_s0_countOnesLogic_12_9 + _zz_s0_countOnesLogic_12_20);
  assign _zz_s0_countOnesLogic_13_1 = 4'b0000;
  assign _zz_s0_countOnesLogic_13_2 = 4'b0001;
  assign _zz_s0_countOnesLogic_13_3 = 4'b0001;
  assign _zz_s0_countOnesLogic_13_4 = 4'b0010;
  assign _zz_s0_countOnesLogic_13_5 = 4'b0001;
  assign _zz_s0_countOnesLogic_13_6 = 4'b0010;
  assign _zz_s0_countOnesLogic_13_7 = 4'b0010;
  assign _zz_s0_countOnesLogic_13_8 = 4'b0011;
  assign s0_countOnesLogic_13 = (_zz_s0_countOnesLogic_13_9 + _zz_s0_countOnesLogic_13_20);
  assign _zz_s0_countOnesLogic_14_1 = 4'b0000;
  assign _zz_s0_countOnesLogic_14_2 = 4'b0001;
  assign _zz_s0_countOnesLogic_14_3 = 4'b0001;
  assign _zz_s0_countOnesLogic_14_4 = 4'b0010;
  assign _zz_s0_countOnesLogic_14_5 = 4'b0001;
  assign _zz_s0_countOnesLogic_14_6 = 4'b0010;
  assign _zz_s0_countOnesLogic_14_7 = 4'b0010;
  assign _zz_s0_countOnesLogic_14_8 = 4'b0011;
  assign s0_countOnesLogic_14 = (_zz_s0_countOnesLogic_14_9 + _zz_s0_countOnesLogic_14_20);
  assign _zz_s0_countOnesLogic_15 = 5'h0;
  assign _zz_s0_countOnesLogic_15_1 = 5'h01;
  assign _zz_s0_countOnesLogic_15_2 = 5'h01;
  assign _zz_s0_countOnesLogic_15_3 = 5'h02;
  assign _zz_s0_countOnesLogic_15_4 = 5'h01;
  assign _zz_s0_countOnesLogic_15_5 = 5'h02;
  assign _zz_s0_countOnesLogic_15_6 = 5'h02;
  assign _zz_s0_countOnesLogic_15_7 = 5'h03;
  assign s0_countOnesLogic_15 = (_zz_s0_countOnesLogic_15_8 + _zz_s0_countOnesLogic_15_19);
  assign s0_outputPayload_cmd_data = io_input_input_payload_data;
  assign s0_outputPayload_cmd_mask = io_input_input_payload_mask;
  assign s0_outputPayload_countOnes_0 = s0_countOnesLogic_0;
  assign s0_outputPayload_countOnes_1 = s0_countOnesLogic_1;
  assign s0_outputPayload_countOnes_2 = s0_countOnesLogic_2;
  assign s0_outputPayload_countOnes_3 = s0_countOnesLogic_3;
  assign s0_outputPayload_countOnes_4 = s0_countOnesLogic_4;
  assign s0_outputPayload_countOnes_5 = s0_countOnesLogic_5;
  assign s0_outputPayload_countOnes_6 = s0_countOnesLogic_6;
  assign s0_outputPayload_countOnes_7 = s0_countOnesLogic_7;
  assign s0_outputPayload_countOnes_8 = s0_countOnesLogic_8;
  assign s0_outputPayload_countOnes_9 = s0_countOnesLogic_9;
  assign s0_outputPayload_countOnes_10 = s0_countOnesLogic_10;
  assign s0_outputPayload_countOnes_11 = s0_countOnesLogic_11;
  assign s0_outputPayload_countOnes_12 = s0_countOnesLogic_12;
  assign s0_outputPayload_countOnes_13 = s0_countOnesLogic_13;
  assign s0_outputPayload_countOnes_14 = s0_countOnesLogic_14;
  assign s0_outputPayload_countOnes_15 = s0_countOnesLogic_15;
  assign s0_output_valid = io_input_input_valid;
  assign io_input_input_ready = s0_output_ready;
  assign s0_output_payload_cmd_data = s0_outputPayload_cmd_data;
  assign s0_output_payload_cmd_mask = s0_outputPayload_cmd_mask;
  assign s0_output_payload_countOnes_0 = s0_outputPayload_countOnes_0;
  assign s0_output_payload_countOnes_1 = s0_outputPayload_countOnes_1;
  assign s0_output_payload_countOnes_2 = s0_outputPayload_countOnes_2;
  assign s0_output_payload_countOnes_3 = s0_outputPayload_countOnes_3;
  assign s0_output_payload_countOnes_4 = s0_outputPayload_countOnes_4;
  assign s0_output_payload_countOnes_5 = s0_outputPayload_countOnes_5;
  assign s0_output_payload_countOnes_6 = s0_outputPayload_countOnes_6;
  assign s0_output_payload_countOnes_7 = s0_outputPayload_countOnes_7;
  assign s0_output_payload_countOnes_8 = s0_outputPayload_countOnes_8;
  assign s0_output_payload_countOnes_9 = s0_outputPayload_countOnes_9;
  assign s0_output_payload_countOnes_10 = s0_outputPayload_countOnes_10;
  assign s0_output_payload_countOnes_11 = s0_outputPayload_countOnes_11;
  assign s0_output_payload_countOnes_12 = s0_outputPayload_countOnes_12;
  assign s0_output_payload_countOnes_13 = s0_outputPayload_countOnes_13;
  assign s0_output_payload_countOnes_14 = s0_outputPayload_countOnes_14;
  assign s0_output_payload_countOnes_15 = s0_outputPayload_countOnes_15;
  always @(*) begin
    s0_output_ready = s0_output_input_ready;
    if(when_Stream_l342_1) begin
      s0_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! s0_output_input_valid);
  assign s0_output_input_valid = s0_output_rValid;
  assign s0_output_input_payload_cmd_data = s0_output_rData_cmd_data;
  assign s0_output_input_payload_cmd_mask = s0_output_rData_cmd_mask;
  assign s0_output_input_payload_countOnes_0 = s0_output_rData_countOnes_0;
  assign s0_output_input_payload_countOnes_1 = s0_output_rData_countOnes_1;
  assign s0_output_input_payload_countOnes_2 = s0_output_rData_countOnes_2;
  assign s0_output_input_payload_countOnes_3 = s0_output_rData_countOnes_3;
  assign s0_output_input_payload_countOnes_4 = s0_output_rData_countOnes_4;
  assign s0_output_input_payload_countOnes_5 = s0_output_rData_countOnes_5;
  assign s0_output_input_payload_countOnes_6 = s0_output_rData_countOnes_6;
  assign s0_output_input_payload_countOnes_7 = s0_output_rData_countOnes_7;
  assign s0_output_input_payload_countOnes_8 = s0_output_rData_countOnes_8;
  assign s0_output_input_payload_countOnes_9 = s0_output_rData_countOnes_9;
  assign s0_output_input_payload_countOnes_10 = s0_output_rData_countOnes_10;
  assign s0_output_input_payload_countOnes_11 = s0_output_rData_countOnes_11;
  assign s0_output_input_payload_countOnes_12 = s0_output_rData_countOnes_12;
  assign s0_output_input_payload_countOnes_13 = s0_output_rData_countOnes_13;
  assign s0_output_input_payload_countOnes_14 = s0_output_rData_countOnes_14;
  assign s0_output_input_payload_countOnes_15 = s0_output_rData_countOnes_15;
  assign s1_offsetNext = (_zz_s1_offsetNext + s0_output_input_payload_countOnes_15);
  assign s0_output_input_fire = (s0_output_input_valid && s0_output_input_ready);
  assign s0_output_input_fire_1 = (s0_output_input_valid && s0_output_input_ready);
  assign s1_inputIndexes_0 = (4'b0000 + s1_offset);
  assign s1_inputIndexes_1 = (_zz_s1_inputIndexes_1 + s1_offset);
  assign s1_inputIndexes_2 = (_zz_s1_inputIndexes_2 + s1_offset);
  assign s1_inputIndexes_3 = (_zz_s1_inputIndexes_3 + s1_offset);
  assign s1_inputIndexes_4 = (_zz_s1_inputIndexes_4 + s1_offset);
  assign s1_inputIndexes_5 = (_zz_s1_inputIndexes_5 + s1_offset);
  assign s1_inputIndexes_6 = (_zz_s1_inputIndexes_6 + s1_offset);
  assign s1_inputIndexes_7 = (_zz_s1_inputIndexes_7 + s1_offset);
  assign s1_inputIndexes_8 = (s0_output_input_payload_countOnes_7 + s1_offset);
  assign s1_inputIndexes_9 = (s0_output_input_payload_countOnes_8 + s1_offset);
  assign s1_inputIndexes_10 = (s0_output_input_payload_countOnes_9 + s1_offset);
  assign s1_inputIndexes_11 = (s0_output_input_payload_countOnes_10 + s1_offset);
  assign s1_inputIndexes_12 = (s0_output_input_payload_countOnes_11 + s1_offset);
  assign s1_inputIndexes_13 = (s0_output_input_payload_countOnes_12 + s1_offset);
  assign s1_inputIndexes_14 = (s0_output_input_payload_countOnes_13 + s1_offset);
  assign s1_inputIndexes_15 = (s0_output_input_payload_countOnes_14 + s1_offset);
  assign s1_outputPayload_cmd_data = s0_output_input_payload_cmd_data;
  assign s1_outputPayload_cmd_mask = s0_output_input_payload_cmd_mask;
  assign s1_outputPayload_index_0 = s1_inputIndexes_0;
  assign s1_outputPayload_index_1 = s1_inputIndexes_1;
  assign s1_outputPayload_index_2 = s1_inputIndexes_2;
  assign s1_outputPayload_index_3 = s1_inputIndexes_3;
  assign s1_outputPayload_index_4 = s1_inputIndexes_4;
  assign s1_outputPayload_index_5 = s1_inputIndexes_5;
  assign s1_outputPayload_index_6 = s1_inputIndexes_6;
  assign s1_outputPayload_index_7 = s1_inputIndexes_7;
  assign s1_outputPayload_index_8 = s1_inputIndexes_8;
  assign s1_outputPayload_index_9 = s1_inputIndexes_9;
  assign s1_outputPayload_index_10 = s1_inputIndexes_10;
  assign s1_outputPayload_index_11 = s1_inputIndexes_11;
  assign s1_outputPayload_index_12 = s1_inputIndexes_12;
  assign s1_outputPayload_index_13 = s1_inputIndexes_13;
  assign s1_outputPayload_index_14 = s1_inputIndexes_14;
  assign s1_outputPayload_index_15 = s1_inputIndexes_15;
  assign s1_outputPayload_last = s1_offsetNext[4];
  assign _zz_s1_outputPayload_sel_0 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b0000));
  assign _zz_s1_outputPayload_sel_0_15 = (((((((_zz_s1_outputPayload_sel_0 || _zz_s1_outputPayload_sel_0_2) || _zz_s1_outputPayload_sel_0_4) || _zz_s1_outputPayload_sel_0_6) || _zz_s1_outputPayload_sel_0_8) || _zz_s1_outputPayload_sel_0_10) || _zz_s1_outputPayload_sel_0_12) || _zz_s1_outputPayload_sel_0_14);
  assign _zz_s1_outputPayload_sel_0_16 = (((((((_zz_s1_outputPayload_sel_0_1 || _zz_s1_outputPayload_sel_0_2) || _zz_s1_outputPayload_sel_0_5) || _zz_s1_outputPayload_sel_0_6) || _zz_s1_outputPayload_sel_0_9) || _zz_s1_outputPayload_sel_0_10) || _zz_s1_outputPayload_sel_0_13) || _zz_s1_outputPayload_sel_0_14);
  assign _zz_s1_outputPayload_sel_0_17 = (((((((_zz_s1_outputPayload_sel_0_3 || _zz_s1_outputPayload_sel_0_4) || _zz_s1_outputPayload_sel_0_5) || _zz_s1_outputPayload_sel_0_6) || _zz_s1_outputPayload_sel_0_11) || _zz_s1_outputPayload_sel_0_12) || _zz_s1_outputPayload_sel_0_13) || _zz_s1_outputPayload_sel_0_14);
  assign _zz_s1_outputPayload_sel_0_18 = (((((((_zz_s1_outputPayload_sel_0_7 || _zz_s1_outputPayload_sel_0_8) || _zz_s1_outputPayload_sel_0_9) || _zz_s1_outputPayload_sel_0_10) || _zz_s1_outputPayload_sel_0_11) || _zz_s1_outputPayload_sel_0_12) || _zz_s1_outputPayload_sel_0_13) || _zz_s1_outputPayload_sel_0_14);
  assign s1_outputPayload_sel_0 = {_zz_s1_outputPayload_sel_0_18,{_zz_s1_outputPayload_sel_0_17,{_zz_s1_outputPayload_sel_0_16,_zz_s1_outputPayload_sel_0_15}}};
  always @(*) begin
    s1_outputPayload_selValid[0] = (({_zz_s1_outputPayload_sel_0_14,{_zz_s1_outputPayload_sel_0_13,{_zz_s1_outputPayload_sel_0_12,{_zz_s1_outputPayload_sel_0_11,{_zz_s1_outputPayload_sel_0_10,{_zz_s1_outputPayload_sel_0_9,{_zz_s1_outputPayload_sel_0_8,{_zz_s1_outputPayload_sel_0_7,{_zz_s1_outputPayload_selValid,_zz_s1_outputPayload_selValid_1}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_0]);
    s1_outputPayload_selValid[1] = (({_zz_s1_outputPayload_sel_1_14,{_zz_s1_outputPayload_sel_1_13,{_zz_s1_outputPayload_sel_1_12,{_zz_s1_outputPayload_sel_1_11,{_zz_s1_outputPayload_sel_1_10,{_zz_s1_outputPayload_sel_1_9,{_zz_s1_outputPayload_sel_1_8,{_zz_s1_outputPayload_sel_1_7,{_zz_s1_outputPayload_selValid_2,_zz_s1_outputPayload_selValid_3}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_1]);
    s1_outputPayload_selValid[2] = (({_zz_s1_outputPayload_sel_2_14,{_zz_s1_outputPayload_sel_2_13,{_zz_s1_outputPayload_sel_2_12,{_zz_s1_outputPayload_sel_2_11,{_zz_s1_outputPayload_sel_2_10,{_zz_s1_outputPayload_sel_2_9,{_zz_s1_outputPayload_sel_2_8,{_zz_s1_outputPayload_sel_2_7,{_zz_s1_outputPayload_selValid_4,_zz_s1_outputPayload_selValid_5}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_2]);
    s1_outputPayload_selValid[3] = (({_zz_s1_outputPayload_sel_3_14,{_zz_s1_outputPayload_sel_3_13,{_zz_s1_outputPayload_sel_3_12,{_zz_s1_outputPayload_sel_3_11,{_zz_s1_outputPayload_sel_3_10,{_zz_s1_outputPayload_sel_3_9,{_zz_s1_outputPayload_sel_3_8,{_zz_s1_outputPayload_sel_3_7,{_zz_s1_outputPayload_selValid_6,_zz_s1_outputPayload_selValid_7}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_3]);
    s1_outputPayload_selValid[4] = (({_zz_s1_outputPayload_sel_4_14,{_zz_s1_outputPayload_sel_4_13,{_zz_s1_outputPayload_sel_4_12,{_zz_s1_outputPayload_sel_4_11,{_zz_s1_outputPayload_sel_4_10,{_zz_s1_outputPayload_sel_4_9,{_zz_s1_outputPayload_sel_4_8,{_zz_s1_outputPayload_sel_4_7,{_zz_s1_outputPayload_selValid_8,_zz_s1_outputPayload_selValid_9}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_4]);
    s1_outputPayload_selValid[5] = (({_zz_s1_outputPayload_sel_5_14,{_zz_s1_outputPayload_sel_5_13,{_zz_s1_outputPayload_sel_5_12,{_zz_s1_outputPayload_sel_5_11,{_zz_s1_outputPayload_sel_5_10,{_zz_s1_outputPayload_sel_5_9,{_zz_s1_outputPayload_sel_5_8,{_zz_s1_outputPayload_sel_5_7,{_zz_s1_outputPayload_selValid_10,_zz_s1_outputPayload_selValid_11}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_5]);
    s1_outputPayload_selValid[6] = (({_zz_s1_outputPayload_sel_6_14,{_zz_s1_outputPayload_sel_6_13,{_zz_s1_outputPayload_sel_6_12,{_zz_s1_outputPayload_sel_6_11,{_zz_s1_outputPayload_sel_6_10,{_zz_s1_outputPayload_sel_6_9,{_zz_s1_outputPayload_sel_6_8,{_zz_s1_outputPayload_sel_6_7,{_zz_s1_outputPayload_selValid_12,_zz_s1_outputPayload_selValid_13}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_6]);
    s1_outputPayload_selValid[7] = (({_zz_s1_outputPayload_sel_7_14,{_zz_s1_outputPayload_sel_7_13,{_zz_s1_outputPayload_sel_7_12,{_zz_s1_outputPayload_sel_7_11,{_zz_s1_outputPayload_sel_7_10,{_zz_s1_outputPayload_sel_7_9,{_zz_s1_outputPayload_sel_7_8,{_zz_s1_outputPayload_sel_7_7,{_zz_s1_outputPayload_selValid_14,_zz_s1_outputPayload_selValid_15}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_7]);
    s1_outputPayload_selValid[8] = (({_zz_s1_outputPayload_sel_8_14,{_zz_s1_outputPayload_sel_8_13,{_zz_s1_outputPayload_sel_8_12,{_zz_s1_outputPayload_sel_8_11,{_zz_s1_outputPayload_sel_8_10,{_zz_s1_outputPayload_sel_8_9,{_zz_s1_outputPayload_sel_8_8,{_zz_s1_outputPayload_sel_8_7,{_zz_s1_outputPayload_selValid_16,_zz_s1_outputPayload_selValid_17}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_8]);
    s1_outputPayload_selValid[9] = (({_zz_s1_outputPayload_sel_9_14,{_zz_s1_outputPayload_sel_9_13,{_zz_s1_outputPayload_sel_9_12,{_zz_s1_outputPayload_sel_9_11,{_zz_s1_outputPayload_sel_9_10,{_zz_s1_outputPayload_sel_9_9,{_zz_s1_outputPayload_sel_9_8,{_zz_s1_outputPayload_sel_9_7,{_zz_s1_outputPayload_selValid_18,_zz_s1_outputPayload_selValid_19}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_9]);
    s1_outputPayload_selValid[10] = (({_zz_s1_outputPayload_sel_10_14,{_zz_s1_outputPayload_sel_10_13,{_zz_s1_outputPayload_sel_10_12,{_zz_s1_outputPayload_sel_10_11,{_zz_s1_outputPayload_sel_10_10,{_zz_s1_outputPayload_sel_10_9,{_zz_s1_outputPayload_sel_10_8,{_zz_s1_outputPayload_sel_10_7,{_zz_s1_outputPayload_selValid_20,_zz_s1_outputPayload_selValid_21}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_10]);
    s1_outputPayload_selValid[11] = (({_zz_s1_outputPayload_sel_11_14,{_zz_s1_outputPayload_sel_11_13,{_zz_s1_outputPayload_sel_11_12,{_zz_s1_outputPayload_sel_11_11,{_zz_s1_outputPayload_sel_11_10,{_zz_s1_outputPayload_sel_11_9,{_zz_s1_outputPayload_sel_11_8,{_zz_s1_outputPayload_sel_11_7,{_zz_s1_outputPayload_selValid_22,_zz_s1_outputPayload_selValid_23}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_11]);
    s1_outputPayload_selValid[12] = (({_zz_s1_outputPayload_sel_12_14,{_zz_s1_outputPayload_sel_12_13,{_zz_s1_outputPayload_sel_12_12,{_zz_s1_outputPayload_sel_12_11,{_zz_s1_outputPayload_sel_12_10,{_zz_s1_outputPayload_sel_12_9,{_zz_s1_outputPayload_sel_12_8,{_zz_s1_outputPayload_sel_12_7,{_zz_s1_outputPayload_selValid_24,_zz_s1_outputPayload_selValid_25}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_12]);
    s1_outputPayload_selValid[13] = (({_zz_s1_outputPayload_sel_13_14,{_zz_s1_outputPayload_sel_13_13,{_zz_s1_outputPayload_sel_13_12,{_zz_s1_outputPayload_sel_13_11,{_zz_s1_outputPayload_sel_13_10,{_zz_s1_outputPayload_sel_13_9,{_zz_s1_outputPayload_sel_13_8,{_zz_s1_outputPayload_sel_13_7,{_zz_s1_outputPayload_selValid_26,_zz_s1_outputPayload_selValid_27}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_13]);
    s1_outputPayload_selValid[14] = (({_zz_s1_outputPayload_sel_14_14,{_zz_s1_outputPayload_sel_14_13,{_zz_s1_outputPayload_sel_14_12,{_zz_s1_outputPayload_sel_14_11,{_zz_s1_outputPayload_sel_14_10,{_zz_s1_outputPayload_sel_14_9,{_zz_s1_outputPayload_sel_14_8,{_zz_s1_outputPayload_sel_14_7,{_zz_s1_outputPayload_selValid_28,_zz_s1_outputPayload_selValid_29}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_14]);
    s1_outputPayload_selValid[15] = (({_zz_s1_outputPayload_sel_15_14,{_zz_s1_outputPayload_sel_15_13,{_zz_s1_outputPayload_sel_15_12,{_zz_s1_outputPayload_sel_15_11,{_zz_s1_outputPayload_sel_15_10,{_zz_s1_outputPayload_sel_15_9,{_zz_s1_outputPayload_sel_15_8,{_zz_s1_outputPayload_sel_15_7,{_zz_s1_outputPayload_selValid_30,_zz_s1_outputPayload_selValid_31}}}}}}}}} != 16'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_15]);
  end

  assign _zz_s1_outputPayload_sel_1 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b0001));
  assign _zz_s1_outputPayload_sel_1_15 = (((((((_zz_s1_outputPayload_sel_1 || _zz_s1_outputPayload_sel_1_2) || _zz_s1_outputPayload_sel_1_4) || _zz_s1_outputPayload_sel_1_6) || _zz_s1_outputPayload_sel_1_8) || _zz_s1_outputPayload_sel_1_10) || _zz_s1_outputPayload_sel_1_12) || _zz_s1_outputPayload_sel_1_14);
  assign _zz_s1_outputPayload_sel_1_16 = (((((((_zz_s1_outputPayload_sel_1_1 || _zz_s1_outputPayload_sel_1_2) || _zz_s1_outputPayload_sel_1_5) || _zz_s1_outputPayload_sel_1_6) || _zz_s1_outputPayload_sel_1_9) || _zz_s1_outputPayload_sel_1_10) || _zz_s1_outputPayload_sel_1_13) || _zz_s1_outputPayload_sel_1_14);
  assign _zz_s1_outputPayload_sel_1_17 = (((((((_zz_s1_outputPayload_sel_1_3 || _zz_s1_outputPayload_sel_1_4) || _zz_s1_outputPayload_sel_1_5) || _zz_s1_outputPayload_sel_1_6) || _zz_s1_outputPayload_sel_1_11) || _zz_s1_outputPayload_sel_1_12) || _zz_s1_outputPayload_sel_1_13) || _zz_s1_outputPayload_sel_1_14);
  assign _zz_s1_outputPayload_sel_1_18 = (((((((_zz_s1_outputPayload_sel_1_7 || _zz_s1_outputPayload_sel_1_8) || _zz_s1_outputPayload_sel_1_9) || _zz_s1_outputPayload_sel_1_10) || _zz_s1_outputPayload_sel_1_11) || _zz_s1_outputPayload_sel_1_12) || _zz_s1_outputPayload_sel_1_13) || _zz_s1_outputPayload_sel_1_14);
  assign s1_outputPayload_sel_1 = {_zz_s1_outputPayload_sel_1_18,{_zz_s1_outputPayload_sel_1_17,{_zz_s1_outputPayload_sel_1_16,_zz_s1_outputPayload_sel_1_15}}};
  assign _zz_s1_outputPayload_sel_2 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b0010));
  assign _zz_s1_outputPayload_sel_2_15 = (((((((_zz_s1_outputPayload_sel_2 || _zz_s1_outputPayload_sel_2_2) || _zz_s1_outputPayload_sel_2_4) || _zz_s1_outputPayload_sel_2_6) || _zz_s1_outputPayload_sel_2_8) || _zz_s1_outputPayload_sel_2_10) || _zz_s1_outputPayload_sel_2_12) || _zz_s1_outputPayload_sel_2_14);
  assign _zz_s1_outputPayload_sel_2_16 = (((((((_zz_s1_outputPayload_sel_2_1 || _zz_s1_outputPayload_sel_2_2) || _zz_s1_outputPayload_sel_2_5) || _zz_s1_outputPayload_sel_2_6) || _zz_s1_outputPayload_sel_2_9) || _zz_s1_outputPayload_sel_2_10) || _zz_s1_outputPayload_sel_2_13) || _zz_s1_outputPayload_sel_2_14);
  assign _zz_s1_outputPayload_sel_2_17 = (((((((_zz_s1_outputPayload_sel_2_3 || _zz_s1_outputPayload_sel_2_4) || _zz_s1_outputPayload_sel_2_5) || _zz_s1_outputPayload_sel_2_6) || _zz_s1_outputPayload_sel_2_11) || _zz_s1_outputPayload_sel_2_12) || _zz_s1_outputPayload_sel_2_13) || _zz_s1_outputPayload_sel_2_14);
  assign _zz_s1_outputPayload_sel_2_18 = (((((((_zz_s1_outputPayload_sel_2_7 || _zz_s1_outputPayload_sel_2_8) || _zz_s1_outputPayload_sel_2_9) || _zz_s1_outputPayload_sel_2_10) || _zz_s1_outputPayload_sel_2_11) || _zz_s1_outputPayload_sel_2_12) || _zz_s1_outputPayload_sel_2_13) || _zz_s1_outputPayload_sel_2_14);
  assign s1_outputPayload_sel_2 = {_zz_s1_outputPayload_sel_2_18,{_zz_s1_outputPayload_sel_2_17,{_zz_s1_outputPayload_sel_2_16,_zz_s1_outputPayload_sel_2_15}}};
  assign _zz_s1_outputPayload_sel_3 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b0011));
  assign _zz_s1_outputPayload_sel_3_15 = (((((((_zz_s1_outputPayload_sel_3 || _zz_s1_outputPayload_sel_3_2) || _zz_s1_outputPayload_sel_3_4) || _zz_s1_outputPayload_sel_3_6) || _zz_s1_outputPayload_sel_3_8) || _zz_s1_outputPayload_sel_3_10) || _zz_s1_outputPayload_sel_3_12) || _zz_s1_outputPayload_sel_3_14);
  assign _zz_s1_outputPayload_sel_3_16 = (((((((_zz_s1_outputPayload_sel_3_1 || _zz_s1_outputPayload_sel_3_2) || _zz_s1_outputPayload_sel_3_5) || _zz_s1_outputPayload_sel_3_6) || _zz_s1_outputPayload_sel_3_9) || _zz_s1_outputPayload_sel_3_10) || _zz_s1_outputPayload_sel_3_13) || _zz_s1_outputPayload_sel_3_14);
  assign _zz_s1_outputPayload_sel_3_17 = (((((((_zz_s1_outputPayload_sel_3_3 || _zz_s1_outputPayload_sel_3_4) || _zz_s1_outputPayload_sel_3_5) || _zz_s1_outputPayload_sel_3_6) || _zz_s1_outputPayload_sel_3_11) || _zz_s1_outputPayload_sel_3_12) || _zz_s1_outputPayload_sel_3_13) || _zz_s1_outputPayload_sel_3_14);
  assign _zz_s1_outputPayload_sel_3_18 = (((((((_zz_s1_outputPayload_sel_3_7 || _zz_s1_outputPayload_sel_3_8) || _zz_s1_outputPayload_sel_3_9) || _zz_s1_outputPayload_sel_3_10) || _zz_s1_outputPayload_sel_3_11) || _zz_s1_outputPayload_sel_3_12) || _zz_s1_outputPayload_sel_3_13) || _zz_s1_outputPayload_sel_3_14);
  assign s1_outputPayload_sel_3 = {_zz_s1_outputPayload_sel_3_18,{_zz_s1_outputPayload_sel_3_17,{_zz_s1_outputPayload_sel_3_16,_zz_s1_outputPayload_sel_3_15}}};
  assign _zz_s1_outputPayload_sel_4 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b0100));
  assign _zz_s1_outputPayload_sel_4_15 = (((((((_zz_s1_outputPayload_sel_4 || _zz_s1_outputPayload_sel_4_2) || _zz_s1_outputPayload_sel_4_4) || _zz_s1_outputPayload_sel_4_6) || _zz_s1_outputPayload_sel_4_8) || _zz_s1_outputPayload_sel_4_10) || _zz_s1_outputPayload_sel_4_12) || _zz_s1_outputPayload_sel_4_14);
  assign _zz_s1_outputPayload_sel_4_16 = (((((((_zz_s1_outputPayload_sel_4_1 || _zz_s1_outputPayload_sel_4_2) || _zz_s1_outputPayload_sel_4_5) || _zz_s1_outputPayload_sel_4_6) || _zz_s1_outputPayload_sel_4_9) || _zz_s1_outputPayload_sel_4_10) || _zz_s1_outputPayload_sel_4_13) || _zz_s1_outputPayload_sel_4_14);
  assign _zz_s1_outputPayload_sel_4_17 = (((((((_zz_s1_outputPayload_sel_4_3 || _zz_s1_outputPayload_sel_4_4) || _zz_s1_outputPayload_sel_4_5) || _zz_s1_outputPayload_sel_4_6) || _zz_s1_outputPayload_sel_4_11) || _zz_s1_outputPayload_sel_4_12) || _zz_s1_outputPayload_sel_4_13) || _zz_s1_outputPayload_sel_4_14);
  assign _zz_s1_outputPayload_sel_4_18 = (((((((_zz_s1_outputPayload_sel_4_7 || _zz_s1_outputPayload_sel_4_8) || _zz_s1_outputPayload_sel_4_9) || _zz_s1_outputPayload_sel_4_10) || _zz_s1_outputPayload_sel_4_11) || _zz_s1_outputPayload_sel_4_12) || _zz_s1_outputPayload_sel_4_13) || _zz_s1_outputPayload_sel_4_14);
  assign s1_outputPayload_sel_4 = {_zz_s1_outputPayload_sel_4_18,{_zz_s1_outputPayload_sel_4_17,{_zz_s1_outputPayload_sel_4_16,_zz_s1_outputPayload_sel_4_15}}};
  assign _zz_s1_outputPayload_sel_5 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b0101));
  assign _zz_s1_outputPayload_sel_5_15 = (((((((_zz_s1_outputPayload_sel_5 || _zz_s1_outputPayload_sel_5_2) || _zz_s1_outputPayload_sel_5_4) || _zz_s1_outputPayload_sel_5_6) || _zz_s1_outputPayload_sel_5_8) || _zz_s1_outputPayload_sel_5_10) || _zz_s1_outputPayload_sel_5_12) || _zz_s1_outputPayload_sel_5_14);
  assign _zz_s1_outputPayload_sel_5_16 = (((((((_zz_s1_outputPayload_sel_5_1 || _zz_s1_outputPayload_sel_5_2) || _zz_s1_outputPayload_sel_5_5) || _zz_s1_outputPayload_sel_5_6) || _zz_s1_outputPayload_sel_5_9) || _zz_s1_outputPayload_sel_5_10) || _zz_s1_outputPayload_sel_5_13) || _zz_s1_outputPayload_sel_5_14);
  assign _zz_s1_outputPayload_sel_5_17 = (((((((_zz_s1_outputPayload_sel_5_3 || _zz_s1_outputPayload_sel_5_4) || _zz_s1_outputPayload_sel_5_5) || _zz_s1_outputPayload_sel_5_6) || _zz_s1_outputPayload_sel_5_11) || _zz_s1_outputPayload_sel_5_12) || _zz_s1_outputPayload_sel_5_13) || _zz_s1_outputPayload_sel_5_14);
  assign _zz_s1_outputPayload_sel_5_18 = (((((((_zz_s1_outputPayload_sel_5_7 || _zz_s1_outputPayload_sel_5_8) || _zz_s1_outputPayload_sel_5_9) || _zz_s1_outputPayload_sel_5_10) || _zz_s1_outputPayload_sel_5_11) || _zz_s1_outputPayload_sel_5_12) || _zz_s1_outputPayload_sel_5_13) || _zz_s1_outputPayload_sel_5_14);
  assign s1_outputPayload_sel_5 = {_zz_s1_outputPayload_sel_5_18,{_zz_s1_outputPayload_sel_5_17,{_zz_s1_outputPayload_sel_5_16,_zz_s1_outputPayload_sel_5_15}}};
  assign _zz_s1_outputPayload_sel_6 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b0110));
  assign _zz_s1_outputPayload_sel_6_15 = (((((((_zz_s1_outputPayload_sel_6 || _zz_s1_outputPayload_sel_6_2) || _zz_s1_outputPayload_sel_6_4) || _zz_s1_outputPayload_sel_6_6) || _zz_s1_outputPayload_sel_6_8) || _zz_s1_outputPayload_sel_6_10) || _zz_s1_outputPayload_sel_6_12) || _zz_s1_outputPayload_sel_6_14);
  assign _zz_s1_outputPayload_sel_6_16 = (((((((_zz_s1_outputPayload_sel_6_1 || _zz_s1_outputPayload_sel_6_2) || _zz_s1_outputPayload_sel_6_5) || _zz_s1_outputPayload_sel_6_6) || _zz_s1_outputPayload_sel_6_9) || _zz_s1_outputPayload_sel_6_10) || _zz_s1_outputPayload_sel_6_13) || _zz_s1_outputPayload_sel_6_14);
  assign _zz_s1_outputPayload_sel_6_17 = (((((((_zz_s1_outputPayload_sel_6_3 || _zz_s1_outputPayload_sel_6_4) || _zz_s1_outputPayload_sel_6_5) || _zz_s1_outputPayload_sel_6_6) || _zz_s1_outputPayload_sel_6_11) || _zz_s1_outputPayload_sel_6_12) || _zz_s1_outputPayload_sel_6_13) || _zz_s1_outputPayload_sel_6_14);
  assign _zz_s1_outputPayload_sel_6_18 = (((((((_zz_s1_outputPayload_sel_6_7 || _zz_s1_outputPayload_sel_6_8) || _zz_s1_outputPayload_sel_6_9) || _zz_s1_outputPayload_sel_6_10) || _zz_s1_outputPayload_sel_6_11) || _zz_s1_outputPayload_sel_6_12) || _zz_s1_outputPayload_sel_6_13) || _zz_s1_outputPayload_sel_6_14);
  assign s1_outputPayload_sel_6 = {_zz_s1_outputPayload_sel_6_18,{_zz_s1_outputPayload_sel_6_17,{_zz_s1_outputPayload_sel_6_16,_zz_s1_outputPayload_sel_6_15}}};
  assign _zz_s1_outputPayload_sel_7 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b0111));
  assign _zz_s1_outputPayload_sel_7_15 = (((((((_zz_s1_outputPayload_sel_7 || _zz_s1_outputPayload_sel_7_2) || _zz_s1_outputPayload_sel_7_4) || _zz_s1_outputPayload_sel_7_6) || _zz_s1_outputPayload_sel_7_8) || _zz_s1_outputPayload_sel_7_10) || _zz_s1_outputPayload_sel_7_12) || _zz_s1_outputPayload_sel_7_14);
  assign _zz_s1_outputPayload_sel_7_16 = (((((((_zz_s1_outputPayload_sel_7_1 || _zz_s1_outputPayload_sel_7_2) || _zz_s1_outputPayload_sel_7_5) || _zz_s1_outputPayload_sel_7_6) || _zz_s1_outputPayload_sel_7_9) || _zz_s1_outputPayload_sel_7_10) || _zz_s1_outputPayload_sel_7_13) || _zz_s1_outputPayload_sel_7_14);
  assign _zz_s1_outputPayload_sel_7_17 = (((((((_zz_s1_outputPayload_sel_7_3 || _zz_s1_outputPayload_sel_7_4) || _zz_s1_outputPayload_sel_7_5) || _zz_s1_outputPayload_sel_7_6) || _zz_s1_outputPayload_sel_7_11) || _zz_s1_outputPayload_sel_7_12) || _zz_s1_outputPayload_sel_7_13) || _zz_s1_outputPayload_sel_7_14);
  assign _zz_s1_outputPayload_sel_7_18 = (((((((_zz_s1_outputPayload_sel_7_7 || _zz_s1_outputPayload_sel_7_8) || _zz_s1_outputPayload_sel_7_9) || _zz_s1_outputPayload_sel_7_10) || _zz_s1_outputPayload_sel_7_11) || _zz_s1_outputPayload_sel_7_12) || _zz_s1_outputPayload_sel_7_13) || _zz_s1_outputPayload_sel_7_14);
  assign s1_outputPayload_sel_7 = {_zz_s1_outputPayload_sel_7_18,{_zz_s1_outputPayload_sel_7_17,{_zz_s1_outputPayload_sel_7_16,_zz_s1_outputPayload_sel_7_15}}};
  assign _zz_s1_outputPayload_sel_8 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b1000));
  assign _zz_s1_outputPayload_sel_8_15 = (((((((_zz_s1_outputPayload_sel_8 || _zz_s1_outputPayload_sel_8_2) || _zz_s1_outputPayload_sel_8_4) || _zz_s1_outputPayload_sel_8_6) || _zz_s1_outputPayload_sel_8_8) || _zz_s1_outputPayload_sel_8_10) || _zz_s1_outputPayload_sel_8_12) || _zz_s1_outputPayload_sel_8_14);
  assign _zz_s1_outputPayload_sel_8_16 = (((((((_zz_s1_outputPayload_sel_8_1 || _zz_s1_outputPayload_sel_8_2) || _zz_s1_outputPayload_sel_8_5) || _zz_s1_outputPayload_sel_8_6) || _zz_s1_outputPayload_sel_8_9) || _zz_s1_outputPayload_sel_8_10) || _zz_s1_outputPayload_sel_8_13) || _zz_s1_outputPayload_sel_8_14);
  assign _zz_s1_outputPayload_sel_8_17 = (((((((_zz_s1_outputPayload_sel_8_3 || _zz_s1_outputPayload_sel_8_4) || _zz_s1_outputPayload_sel_8_5) || _zz_s1_outputPayload_sel_8_6) || _zz_s1_outputPayload_sel_8_11) || _zz_s1_outputPayload_sel_8_12) || _zz_s1_outputPayload_sel_8_13) || _zz_s1_outputPayload_sel_8_14);
  assign _zz_s1_outputPayload_sel_8_18 = (((((((_zz_s1_outputPayload_sel_8_7 || _zz_s1_outputPayload_sel_8_8) || _zz_s1_outputPayload_sel_8_9) || _zz_s1_outputPayload_sel_8_10) || _zz_s1_outputPayload_sel_8_11) || _zz_s1_outputPayload_sel_8_12) || _zz_s1_outputPayload_sel_8_13) || _zz_s1_outputPayload_sel_8_14);
  assign s1_outputPayload_sel_8 = {_zz_s1_outputPayload_sel_8_18,{_zz_s1_outputPayload_sel_8_17,{_zz_s1_outputPayload_sel_8_16,_zz_s1_outputPayload_sel_8_15}}};
  assign _zz_s1_outputPayload_sel_9 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b1001));
  assign _zz_s1_outputPayload_sel_9_15 = (((((((_zz_s1_outputPayload_sel_9 || _zz_s1_outputPayload_sel_9_2) || _zz_s1_outputPayload_sel_9_4) || _zz_s1_outputPayload_sel_9_6) || _zz_s1_outputPayload_sel_9_8) || _zz_s1_outputPayload_sel_9_10) || _zz_s1_outputPayload_sel_9_12) || _zz_s1_outputPayload_sel_9_14);
  assign _zz_s1_outputPayload_sel_9_16 = (((((((_zz_s1_outputPayload_sel_9_1 || _zz_s1_outputPayload_sel_9_2) || _zz_s1_outputPayload_sel_9_5) || _zz_s1_outputPayload_sel_9_6) || _zz_s1_outputPayload_sel_9_9) || _zz_s1_outputPayload_sel_9_10) || _zz_s1_outputPayload_sel_9_13) || _zz_s1_outputPayload_sel_9_14);
  assign _zz_s1_outputPayload_sel_9_17 = (((((((_zz_s1_outputPayload_sel_9_3 || _zz_s1_outputPayload_sel_9_4) || _zz_s1_outputPayload_sel_9_5) || _zz_s1_outputPayload_sel_9_6) || _zz_s1_outputPayload_sel_9_11) || _zz_s1_outputPayload_sel_9_12) || _zz_s1_outputPayload_sel_9_13) || _zz_s1_outputPayload_sel_9_14);
  assign _zz_s1_outputPayload_sel_9_18 = (((((((_zz_s1_outputPayload_sel_9_7 || _zz_s1_outputPayload_sel_9_8) || _zz_s1_outputPayload_sel_9_9) || _zz_s1_outputPayload_sel_9_10) || _zz_s1_outputPayload_sel_9_11) || _zz_s1_outputPayload_sel_9_12) || _zz_s1_outputPayload_sel_9_13) || _zz_s1_outputPayload_sel_9_14);
  assign s1_outputPayload_sel_9 = {_zz_s1_outputPayload_sel_9_18,{_zz_s1_outputPayload_sel_9_17,{_zz_s1_outputPayload_sel_9_16,_zz_s1_outputPayload_sel_9_15}}};
  assign _zz_s1_outputPayload_sel_10 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b1010));
  assign _zz_s1_outputPayload_sel_10_15 = (((((((_zz_s1_outputPayload_sel_10 || _zz_s1_outputPayload_sel_10_2) || _zz_s1_outputPayload_sel_10_4) || _zz_s1_outputPayload_sel_10_6) || _zz_s1_outputPayload_sel_10_8) || _zz_s1_outputPayload_sel_10_10) || _zz_s1_outputPayload_sel_10_12) || _zz_s1_outputPayload_sel_10_14);
  assign _zz_s1_outputPayload_sel_10_16 = (((((((_zz_s1_outputPayload_sel_10_1 || _zz_s1_outputPayload_sel_10_2) || _zz_s1_outputPayload_sel_10_5) || _zz_s1_outputPayload_sel_10_6) || _zz_s1_outputPayload_sel_10_9) || _zz_s1_outputPayload_sel_10_10) || _zz_s1_outputPayload_sel_10_13) || _zz_s1_outputPayload_sel_10_14);
  assign _zz_s1_outputPayload_sel_10_17 = (((((((_zz_s1_outputPayload_sel_10_3 || _zz_s1_outputPayload_sel_10_4) || _zz_s1_outputPayload_sel_10_5) || _zz_s1_outputPayload_sel_10_6) || _zz_s1_outputPayload_sel_10_11) || _zz_s1_outputPayload_sel_10_12) || _zz_s1_outputPayload_sel_10_13) || _zz_s1_outputPayload_sel_10_14);
  assign _zz_s1_outputPayload_sel_10_18 = (((((((_zz_s1_outputPayload_sel_10_7 || _zz_s1_outputPayload_sel_10_8) || _zz_s1_outputPayload_sel_10_9) || _zz_s1_outputPayload_sel_10_10) || _zz_s1_outputPayload_sel_10_11) || _zz_s1_outputPayload_sel_10_12) || _zz_s1_outputPayload_sel_10_13) || _zz_s1_outputPayload_sel_10_14);
  assign s1_outputPayload_sel_10 = {_zz_s1_outputPayload_sel_10_18,{_zz_s1_outputPayload_sel_10_17,{_zz_s1_outputPayload_sel_10_16,_zz_s1_outputPayload_sel_10_15}}};
  assign _zz_s1_outputPayload_sel_11 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b1011));
  assign _zz_s1_outputPayload_sel_11_15 = (((((((_zz_s1_outputPayload_sel_11 || _zz_s1_outputPayload_sel_11_2) || _zz_s1_outputPayload_sel_11_4) || _zz_s1_outputPayload_sel_11_6) || _zz_s1_outputPayload_sel_11_8) || _zz_s1_outputPayload_sel_11_10) || _zz_s1_outputPayload_sel_11_12) || _zz_s1_outputPayload_sel_11_14);
  assign _zz_s1_outputPayload_sel_11_16 = (((((((_zz_s1_outputPayload_sel_11_1 || _zz_s1_outputPayload_sel_11_2) || _zz_s1_outputPayload_sel_11_5) || _zz_s1_outputPayload_sel_11_6) || _zz_s1_outputPayload_sel_11_9) || _zz_s1_outputPayload_sel_11_10) || _zz_s1_outputPayload_sel_11_13) || _zz_s1_outputPayload_sel_11_14);
  assign _zz_s1_outputPayload_sel_11_17 = (((((((_zz_s1_outputPayload_sel_11_3 || _zz_s1_outputPayload_sel_11_4) || _zz_s1_outputPayload_sel_11_5) || _zz_s1_outputPayload_sel_11_6) || _zz_s1_outputPayload_sel_11_11) || _zz_s1_outputPayload_sel_11_12) || _zz_s1_outputPayload_sel_11_13) || _zz_s1_outputPayload_sel_11_14);
  assign _zz_s1_outputPayload_sel_11_18 = (((((((_zz_s1_outputPayload_sel_11_7 || _zz_s1_outputPayload_sel_11_8) || _zz_s1_outputPayload_sel_11_9) || _zz_s1_outputPayload_sel_11_10) || _zz_s1_outputPayload_sel_11_11) || _zz_s1_outputPayload_sel_11_12) || _zz_s1_outputPayload_sel_11_13) || _zz_s1_outputPayload_sel_11_14);
  assign s1_outputPayload_sel_11 = {_zz_s1_outputPayload_sel_11_18,{_zz_s1_outputPayload_sel_11_17,{_zz_s1_outputPayload_sel_11_16,_zz_s1_outputPayload_sel_11_15}}};
  assign _zz_s1_outputPayload_sel_12 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b1100));
  assign _zz_s1_outputPayload_sel_12_15 = (((((((_zz_s1_outputPayload_sel_12 || _zz_s1_outputPayload_sel_12_2) || _zz_s1_outputPayload_sel_12_4) || _zz_s1_outputPayload_sel_12_6) || _zz_s1_outputPayload_sel_12_8) || _zz_s1_outputPayload_sel_12_10) || _zz_s1_outputPayload_sel_12_12) || _zz_s1_outputPayload_sel_12_14);
  assign _zz_s1_outputPayload_sel_12_16 = (((((((_zz_s1_outputPayload_sel_12_1 || _zz_s1_outputPayload_sel_12_2) || _zz_s1_outputPayload_sel_12_5) || _zz_s1_outputPayload_sel_12_6) || _zz_s1_outputPayload_sel_12_9) || _zz_s1_outputPayload_sel_12_10) || _zz_s1_outputPayload_sel_12_13) || _zz_s1_outputPayload_sel_12_14);
  assign _zz_s1_outputPayload_sel_12_17 = (((((((_zz_s1_outputPayload_sel_12_3 || _zz_s1_outputPayload_sel_12_4) || _zz_s1_outputPayload_sel_12_5) || _zz_s1_outputPayload_sel_12_6) || _zz_s1_outputPayload_sel_12_11) || _zz_s1_outputPayload_sel_12_12) || _zz_s1_outputPayload_sel_12_13) || _zz_s1_outputPayload_sel_12_14);
  assign _zz_s1_outputPayload_sel_12_18 = (((((((_zz_s1_outputPayload_sel_12_7 || _zz_s1_outputPayload_sel_12_8) || _zz_s1_outputPayload_sel_12_9) || _zz_s1_outputPayload_sel_12_10) || _zz_s1_outputPayload_sel_12_11) || _zz_s1_outputPayload_sel_12_12) || _zz_s1_outputPayload_sel_12_13) || _zz_s1_outputPayload_sel_12_14);
  assign s1_outputPayload_sel_12 = {_zz_s1_outputPayload_sel_12_18,{_zz_s1_outputPayload_sel_12_17,{_zz_s1_outputPayload_sel_12_16,_zz_s1_outputPayload_sel_12_15}}};
  assign _zz_s1_outputPayload_sel_13 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b1101));
  assign _zz_s1_outputPayload_sel_13_15 = (((((((_zz_s1_outputPayload_sel_13 || _zz_s1_outputPayload_sel_13_2) || _zz_s1_outputPayload_sel_13_4) || _zz_s1_outputPayload_sel_13_6) || _zz_s1_outputPayload_sel_13_8) || _zz_s1_outputPayload_sel_13_10) || _zz_s1_outputPayload_sel_13_12) || _zz_s1_outputPayload_sel_13_14);
  assign _zz_s1_outputPayload_sel_13_16 = (((((((_zz_s1_outputPayload_sel_13_1 || _zz_s1_outputPayload_sel_13_2) || _zz_s1_outputPayload_sel_13_5) || _zz_s1_outputPayload_sel_13_6) || _zz_s1_outputPayload_sel_13_9) || _zz_s1_outputPayload_sel_13_10) || _zz_s1_outputPayload_sel_13_13) || _zz_s1_outputPayload_sel_13_14);
  assign _zz_s1_outputPayload_sel_13_17 = (((((((_zz_s1_outputPayload_sel_13_3 || _zz_s1_outputPayload_sel_13_4) || _zz_s1_outputPayload_sel_13_5) || _zz_s1_outputPayload_sel_13_6) || _zz_s1_outputPayload_sel_13_11) || _zz_s1_outputPayload_sel_13_12) || _zz_s1_outputPayload_sel_13_13) || _zz_s1_outputPayload_sel_13_14);
  assign _zz_s1_outputPayload_sel_13_18 = (((((((_zz_s1_outputPayload_sel_13_7 || _zz_s1_outputPayload_sel_13_8) || _zz_s1_outputPayload_sel_13_9) || _zz_s1_outputPayload_sel_13_10) || _zz_s1_outputPayload_sel_13_11) || _zz_s1_outputPayload_sel_13_12) || _zz_s1_outputPayload_sel_13_13) || _zz_s1_outputPayload_sel_13_14);
  assign s1_outputPayload_sel_13 = {_zz_s1_outputPayload_sel_13_18,{_zz_s1_outputPayload_sel_13_17,{_zz_s1_outputPayload_sel_13_16,_zz_s1_outputPayload_sel_13_15}}};
  assign _zz_s1_outputPayload_sel_14 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b1110));
  assign _zz_s1_outputPayload_sel_14_15 = (((((((_zz_s1_outputPayload_sel_14 || _zz_s1_outputPayload_sel_14_2) || _zz_s1_outputPayload_sel_14_4) || _zz_s1_outputPayload_sel_14_6) || _zz_s1_outputPayload_sel_14_8) || _zz_s1_outputPayload_sel_14_10) || _zz_s1_outputPayload_sel_14_12) || _zz_s1_outputPayload_sel_14_14);
  assign _zz_s1_outputPayload_sel_14_16 = (((((((_zz_s1_outputPayload_sel_14_1 || _zz_s1_outputPayload_sel_14_2) || _zz_s1_outputPayload_sel_14_5) || _zz_s1_outputPayload_sel_14_6) || _zz_s1_outputPayload_sel_14_9) || _zz_s1_outputPayload_sel_14_10) || _zz_s1_outputPayload_sel_14_13) || _zz_s1_outputPayload_sel_14_14);
  assign _zz_s1_outputPayload_sel_14_17 = (((((((_zz_s1_outputPayload_sel_14_3 || _zz_s1_outputPayload_sel_14_4) || _zz_s1_outputPayload_sel_14_5) || _zz_s1_outputPayload_sel_14_6) || _zz_s1_outputPayload_sel_14_11) || _zz_s1_outputPayload_sel_14_12) || _zz_s1_outputPayload_sel_14_13) || _zz_s1_outputPayload_sel_14_14);
  assign _zz_s1_outputPayload_sel_14_18 = (((((((_zz_s1_outputPayload_sel_14_7 || _zz_s1_outputPayload_sel_14_8) || _zz_s1_outputPayload_sel_14_9) || _zz_s1_outputPayload_sel_14_10) || _zz_s1_outputPayload_sel_14_11) || _zz_s1_outputPayload_sel_14_12) || _zz_s1_outputPayload_sel_14_13) || _zz_s1_outputPayload_sel_14_14);
  assign s1_outputPayload_sel_14 = {_zz_s1_outputPayload_sel_14_18,{_zz_s1_outputPayload_sel_14_17,{_zz_s1_outputPayload_sel_14_16,_zz_s1_outputPayload_sel_14_15}}};
  assign _zz_s1_outputPayload_sel_15 = (s0_output_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_1 = (s0_output_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_2 = (s0_output_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_3 = (s0_output_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_4 = (s0_output_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_5 = (s0_output_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_6 = (s0_output_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_7 = (s0_output_input_payload_cmd_mask[8] && (s1_inputIndexes_8 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_8 = (s0_output_input_payload_cmd_mask[9] && (s1_inputIndexes_9 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_9 = (s0_output_input_payload_cmd_mask[10] && (s1_inputIndexes_10 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_10 = (s0_output_input_payload_cmd_mask[11] && (s1_inputIndexes_11 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_11 = (s0_output_input_payload_cmd_mask[12] && (s1_inputIndexes_12 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_12 = (s0_output_input_payload_cmd_mask[13] && (s1_inputIndexes_13 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_13 = (s0_output_input_payload_cmd_mask[14] && (s1_inputIndexes_14 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_14 = (s0_output_input_payload_cmd_mask[15] && (s1_inputIndexes_15 == 4'b1111));
  assign _zz_s1_outputPayload_sel_15_15 = (((((((_zz_s1_outputPayload_sel_15 || _zz_s1_outputPayload_sel_15_2) || _zz_s1_outputPayload_sel_15_4) || _zz_s1_outputPayload_sel_15_6) || _zz_s1_outputPayload_sel_15_8) || _zz_s1_outputPayload_sel_15_10) || _zz_s1_outputPayload_sel_15_12) || _zz_s1_outputPayload_sel_15_14);
  assign _zz_s1_outputPayload_sel_15_16 = (((((((_zz_s1_outputPayload_sel_15_1 || _zz_s1_outputPayload_sel_15_2) || _zz_s1_outputPayload_sel_15_5) || _zz_s1_outputPayload_sel_15_6) || _zz_s1_outputPayload_sel_15_9) || _zz_s1_outputPayload_sel_15_10) || _zz_s1_outputPayload_sel_15_13) || _zz_s1_outputPayload_sel_15_14);
  assign _zz_s1_outputPayload_sel_15_17 = (((((((_zz_s1_outputPayload_sel_15_3 || _zz_s1_outputPayload_sel_15_4) || _zz_s1_outputPayload_sel_15_5) || _zz_s1_outputPayload_sel_15_6) || _zz_s1_outputPayload_sel_15_11) || _zz_s1_outputPayload_sel_15_12) || _zz_s1_outputPayload_sel_15_13) || _zz_s1_outputPayload_sel_15_14);
  assign _zz_s1_outputPayload_sel_15_18 = (((((((_zz_s1_outputPayload_sel_15_7 || _zz_s1_outputPayload_sel_15_8) || _zz_s1_outputPayload_sel_15_9) || _zz_s1_outputPayload_sel_15_10) || _zz_s1_outputPayload_sel_15_11) || _zz_s1_outputPayload_sel_15_12) || _zz_s1_outputPayload_sel_15_13) || _zz_s1_outputPayload_sel_15_14);
  assign s1_outputPayload_sel_15 = {_zz_s1_outputPayload_sel_15_18,{_zz_s1_outputPayload_sel_15_17,{_zz_s1_outputPayload_sel_15_16,_zz_s1_outputPayload_sel_15_15}}};
  assign s1_output_valid = s0_output_input_valid;
  assign s0_output_input_ready = s1_output_ready;
  assign s1_output_payload_cmd_data = s1_outputPayload_cmd_data;
  assign s1_output_payload_cmd_mask = s1_outputPayload_cmd_mask;
  assign s1_output_payload_index_0 = s1_outputPayload_index_0;
  assign s1_output_payload_index_1 = s1_outputPayload_index_1;
  assign s1_output_payload_index_2 = s1_outputPayload_index_2;
  assign s1_output_payload_index_3 = s1_outputPayload_index_3;
  assign s1_output_payload_index_4 = s1_outputPayload_index_4;
  assign s1_output_payload_index_5 = s1_outputPayload_index_5;
  assign s1_output_payload_index_6 = s1_outputPayload_index_6;
  assign s1_output_payload_index_7 = s1_outputPayload_index_7;
  assign s1_output_payload_index_8 = s1_outputPayload_index_8;
  assign s1_output_payload_index_9 = s1_outputPayload_index_9;
  assign s1_output_payload_index_10 = s1_outputPayload_index_10;
  assign s1_output_payload_index_11 = s1_outputPayload_index_11;
  assign s1_output_payload_index_12 = s1_outputPayload_index_12;
  assign s1_output_payload_index_13 = s1_outputPayload_index_13;
  assign s1_output_payload_index_14 = s1_outputPayload_index_14;
  assign s1_output_payload_index_15 = s1_outputPayload_index_15;
  assign s1_output_payload_last = s1_outputPayload_last;
  assign s1_output_payload_sel_0 = s1_outputPayload_sel_0;
  assign s1_output_payload_sel_1 = s1_outputPayload_sel_1;
  assign s1_output_payload_sel_2 = s1_outputPayload_sel_2;
  assign s1_output_payload_sel_3 = s1_outputPayload_sel_3;
  assign s1_output_payload_sel_4 = s1_outputPayload_sel_4;
  assign s1_output_payload_sel_5 = s1_outputPayload_sel_5;
  assign s1_output_payload_sel_6 = s1_outputPayload_sel_6;
  assign s1_output_payload_sel_7 = s1_outputPayload_sel_7;
  assign s1_output_payload_sel_8 = s1_outputPayload_sel_8;
  assign s1_output_payload_sel_9 = s1_outputPayload_sel_9;
  assign s1_output_payload_sel_10 = s1_outputPayload_sel_10;
  assign s1_output_payload_sel_11 = s1_outputPayload_sel_11;
  assign s1_output_payload_sel_12 = s1_outputPayload_sel_12;
  assign s1_output_payload_sel_13 = s1_outputPayload_sel_13;
  assign s1_output_payload_sel_14 = s1_outputPayload_sel_14;
  assign s1_output_payload_sel_15 = s1_outputPayload_sel_15;
  assign s1_output_payload_selValid = s1_outputPayload_selValid;
  always @(*) begin
    s1_output_ready = s1_output_input_ready;
    if(when_Stream_l342_2) begin
      s1_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! s1_output_input_valid);
  assign s1_output_input_valid = s1_output_rValid;
  assign s1_output_input_payload_cmd_data = s1_output_rData_cmd_data;
  assign s1_output_input_payload_cmd_mask = s1_output_rData_cmd_mask;
  assign s1_output_input_payload_index_0 = s1_output_rData_index_0;
  assign s1_output_input_payload_index_1 = s1_output_rData_index_1;
  assign s1_output_input_payload_index_2 = s1_output_rData_index_2;
  assign s1_output_input_payload_index_3 = s1_output_rData_index_3;
  assign s1_output_input_payload_index_4 = s1_output_rData_index_4;
  assign s1_output_input_payload_index_5 = s1_output_rData_index_5;
  assign s1_output_input_payload_index_6 = s1_output_rData_index_6;
  assign s1_output_input_payload_index_7 = s1_output_rData_index_7;
  assign s1_output_input_payload_index_8 = s1_output_rData_index_8;
  assign s1_output_input_payload_index_9 = s1_output_rData_index_9;
  assign s1_output_input_payload_index_10 = s1_output_rData_index_10;
  assign s1_output_input_payload_index_11 = s1_output_rData_index_11;
  assign s1_output_input_payload_index_12 = s1_output_rData_index_12;
  assign s1_output_input_payload_index_13 = s1_output_rData_index_13;
  assign s1_output_input_payload_index_14 = s1_output_rData_index_14;
  assign s1_output_input_payload_index_15 = s1_output_rData_index_15;
  assign s1_output_input_payload_last = s1_output_rData_last;
  assign s1_output_input_payload_sel_0 = s1_output_rData_sel_0;
  assign s1_output_input_payload_sel_1 = s1_output_rData_sel_1;
  assign s1_output_input_payload_sel_2 = s1_output_rData_sel_2;
  assign s1_output_input_payload_sel_3 = s1_output_rData_sel_3;
  assign s1_output_input_payload_sel_4 = s1_output_rData_sel_4;
  assign s1_output_input_payload_sel_5 = s1_output_rData_sel_5;
  assign s1_output_input_payload_sel_6 = s1_output_rData_sel_6;
  assign s1_output_input_payload_sel_7 = s1_output_rData_sel_7;
  assign s1_output_input_payload_sel_8 = s1_output_rData_sel_8;
  assign s1_output_input_payload_sel_9 = s1_output_rData_sel_9;
  assign s1_output_input_payload_sel_10 = s1_output_rData_sel_10;
  assign s1_output_input_payload_sel_11 = s1_output_rData_sel_11;
  assign s1_output_input_payload_sel_12 = s1_output_rData_sel_12;
  assign s1_output_input_payload_sel_13 = s1_output_rData_sel_13;
  assign s1_output_input_payload_sel_14 = s1_output_rData_sel_14;
  assign s1_output_input_payload_sel_15 = s1_output_rData_sel_15;
  assign s1_output_input_payload_selValid = s1_output_rData_selValid;
  always @(*) begin
    s1_output_input_ready = ((! io_output_enough) || io_output_consume);
    if(when_DmaSg_l1387) begin
      s1_output_input_ready = 1'b0;
    end
  end

  assign when_DmaSg_l1387 = (_zz_when_DmaSg_l1387 < s1_byteCounter);
  assign s1_output_input_fire = (s1_output_input_valid && s1_output_input_ready);
  assign io_output_consumed = s1_output_input_fire;
  assign s2_inputDataBytes_0 = s1_output_input_payload_cmd_data[7 : 0];
  assign s2_inputDataBytes_1 = s1_output_input_payload_cmd_data[15 : 8];
  assign s2_inputDataBytes_2 = s1_output_input_payload_cmd_data[23 : 16];
  assign s2_inputDataBytes_3 = s1_output_input_payload_cmd_data[31 : 24];
  assign s2_inputDataBytes_4 = s1_output_input_payload_cmd_data[39 : 32];
  assign s2_inputDataBytes_5 = s1_output_input_payload_cmd_data[47 : 40];
  assign s2_inputDataBytes_6 = s1_output_input_payload_cmd_data[55 : 48];
  assign s2_inputDataBytes_7 = s1_output_input_payload_cmd_data[63 : 56];
  assign s2_inputDataBytes_8 = s1_output_input_payload_cmd_data[71 : 64];
  assign s2_inputDataBytes_9 = s1_output_input_payload_cmd_data[79 : 72];
  assign s2_inputDataBytes_10 = s1_output_input_payload_cmd_data[87 : 80];
  assign s2_inputDataBytes_11 = s1_output_input_payload_cmd_data[95 : 88];
  assign s2_inputDataBytes_12 = s1_output_input_payload_cmd_data[103 : 96];
  assign s2_inputDataBytes_13 = s1_output_input_payload_cmd_data[111 : 104];
  assign s2_inputDataBytes_14 = s1_output_input_payload_cmd_data[119 : 112];
  assign s2_inputDataBytes_15 = s1_output_input_payload_cmd_data[127 : 120];
  assign s2_byteLogic_0_lastUsed = (4'b0000 == io_output_lastByteUsed);
  assign s2_byteLogic_0_inputMask = s1_output_input_payload_selValid[0];
  assign s2_byteLogic_0_inputData = _zz_s2_byteLogic_0_inputData;
  assign s2_byteLogic_0_outputMask = (s2_byteLogic_0_buffer_valid || (s1_output_input_valid && s2_byteLogic_0_inputMask));
  assign s2_byteLogic_0_outputData = (s2_byteLogic_0_buffer_valid ? s2_byteLogic_0_buffer_data : s2_byteLogic_0_inputData);
  always @(*) begin
    io_output_mask[0] = s2_byteLogic_0_outputMask;
    io_output_mask[1] = s2_byteLogic_1_outputMask;
    io_output_mask[2] = s2_byteLogic_2_outputMask;
    io_output_mask[3] = s2_byteLogic_3_outputMask;
    io_output_mask[4] = s2_byteLogic_4_outputMask;
    io_output_mask[5] = s2_byteLogic_5_outputMask;
    io_output_mask[6] = s2_byteLogic_6_outputMask;
    io_output_mask[7] = s2_byteLogic_7_outputMask;
    io_output_mask[8] = s2_byteLogic_8_outputMask;
    io_output_mask[9] = s2_byteLogic_9_outputMask;
    io_output_mask[10] = s2_byteLogic_10_outputMask;
    io_output_mask[11] = s2_byteLogic_11_outputMask;
    io_output_mask[12] = s2_byteLogic_12_outputMask;
    io_output_mask[13] = s2_byteLogic_13_outputMask;
    io_output_mask[14] = s2_byteLogic_14_outputMask;
    io_output_mask[15] = s2_byteLogic_15_outputMask;
  end

  always @(*) begin
    io_output_data[7 : 0] = s2_byteLogic_0_outputData;
    io_output_data[15 : 8] = s2_byteLogic_1_outputData;
    io_output_data[23 : 16] = s2_byteLogic_2_outputData;
    io_output_data[31 : 24] = s2_byteLogic_3_outputData;
    io_output_data[39 : 32] = s2_byteLogic_4_outputData;
    io_output_data[47 : 40] = s2_byteLogic_5_outputData;
    io_output_data[55 : 48] = s2_byteLogic_6_outputData;
    io_output_data[63 : 56] = s2_byteLogic_7_outputData;
    io_output_data[71 : 64] = s2_byteLogic_8_outputData;
    io_output_data[79 : 72] = s2_byteLogic_9_outputData;
    io_output_data[87 : 80] = s2_byteLogic_10_outputData;
    io_output_data[95 : 88] = s2_byteLogic_11_outputData;
    io_output_data[103 : 96] = s2_byteLogic_12_outputData;
    io_output_data[111 : 104] = s2_byteLogic_13_outputData;
    io_output_data[119 : 112] = s2_byteLogic_14_outputData;
    io_output_data[127 : 120] = s2_byteLogic_15_outputData;
  end

  assign s1_output_input_fire_1 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416 = (s2_byteLogic_0_inputMask && ((! io_output_consume) || s2_byteLogic_0_buffer_valid));
  assign s2_byteLogic_1_lastUsed = (4'b0001 == io_output_lastByteUsed);
  assign s2_byteLogic_1_inputMask = s1_output_input_payload_selValid[1];
  assign s2_byteLogic_1_inputData = _zz_s2_byteLogic_1_inputData;
  assign s2_byteLogic_1_outputMask = (s2_byteLogic_1_buffer_valid || (s1_output_input_valid && s2_byteLogic_1_inputMask));
  assign s2_byteLogic_1_outputData = (s2_byteLogic_1_buffer_valid ? s2_byteLogic_1_buffer_data : s2_byteLogic_1_inputData);
  assign s1_output_input_fire_2 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_1 = (s2_byteLogic_1_inputMask && ((! io_output_consume) || s2_byteLogic_1_buffer_valid));
  assign s2_byteLogic_2_lastUsed = (4'b0010 == io_output_lastByteUsed);
  assign s2_byteLogic_2_inputMask = s1_output_input_payload_selValid[2];
  assign s2_byteLogic_2_inputData = _zz_s2_byteLogic_2_inputData;
  assign s2_byteLogic_2_outputMask = (s2_byteLogic_2_buffer_valid || (s1_output_input_valid && s2_byteLogic_2_inputMask));
  assign s2_byteLogic_2_outputData = (s2_byteLogic_2_buffer_valid ? s2_byteLogic_2_buffer_data : s2_byteLogic_2_inputData);
  assign s1_output_input_fire_3 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_2 = (s2_byteLogic_2_inputMask && ((! io_output_consume) || s2_byteLogic_2_buffer_valid));
  assign s2_byteLogic_3_lastUsed = (4'b0011 == io_output_lastByteUsed);
  assign s2_byteLogic_3_inputMask = s1_output_input_payload_selValid[3];
  assign s2_byteLogic_3_inputData = _zz_s2_byteLogic_3_inputData;
  assign s2_byteLogic_3_outputMask = (s2_byteLogic_3_buffer_valid || (s1_output_input_valid && s2_byteLogic_3_inputMask));
  assign s2_byteLogic_3_outputData = (s2_byteLogic_3_buffer_valid ? s2_byteLogic_3_buffer_data : s2_byteLogic_3_inputData);
  assign s1_output_input_fire_4 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_3 = (s2_byteLogic_3_inputMask && ((! io_output_consume) || s2_byteLogic_3_buffer_valid));
  assign s2_byteLogic_4_lastUsed = (4'b0100 == io_output_lastByteUsed);
  assign s2_byteLogic_4_inputMask = s1_output_input_payload_selValid[4];
  assign s2_byteLogic_4_inputData = _zz_s2_byteLogic_4_inputData;
  assign s2_byteLogic_4_outputMask = (s2_byteLogic_4_buffer_valid || (s1_output_input_valid && s2_byteLogic_4_inputMask));
  assign s2_byteLogic_4_outputData = (s2_byteLogic_4_buffer_valid ? s2_byteLogic_4_buffer_data : s2_byteLogic_4_inputData);
  assign s1_output_input_fire_5 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_4 = (s2_byteLogic_4_inputMask && ((! io_output_consume) || s2_byteLogic_4_buffer_valid));
  assign s2_byteLogic_5_lastUsed = (4'b0101 == io_output_lastByteUsed);
  assign s2_byteLogic_5_inputMask = s1_output_input_payload_selValid[5];
  assign s2_byteLogic_5_inputData = _zz_s2_byteLogic_5_inputData;
  assign s2_byteLogic_5_outputMask = (s2_byteLogic_5_buffer_valid || (s1_output_input_valid && s2_byteLogic_5_inputMask));
  assign s2_byteLogic_5_outputData = (s2_byteLogic_5_buffer_valid ? s2_byteLogic_5_buffer_data : s2_byteLogic_5_inputData);
  assign s1_output_input_fire_6 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_5 = (s2_byteLogic_5_inputMask && ((! io_output_consume) || s2_byteLogic_5_buffer_valid));
  assign s2_byteLogic_6_lastUsed = (4'b0110 == io_output_lastByteUsed);
  assign s2_byteLogic_6_inputMask = s1_output_input_payload_selValid[6];
  assign s2_byteLogic_6_inputData = _zz_s2_byteLogic_6_inputData;
  assign s2_byteLogic_6_outputMask = (s2_byteLogic_6_buffer_valid || (s1_output_input_valid && s2_byteLogic_6_inputMask));
  assign s2_byteLogic_6_outputData = (s2_byteLogic_6_buffer_valid ? s2_byteLogic_6_buffer_data : s2_byteLogic_6_inputData);
  assign s1_output_input_fire_7 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_6 = (s2_byteLogic_6_inputMask && ((! io_output_consume) || s2_byteLogic_6_buffer_valid));
  assign s2_byteLogic_7_lastUsed = (4'b0111 == io_output_lastByteUsed);
  assign s2_byteLogic_7_inputMask = s1_output_input_payload_selValid[7];
  assign s2_byteLogic_7_inputData = _zz_s2_byteLogic_7_inputData;
  assign s2_byteLogic_7_outputMask = (s2_byteLogic_7_buffer_valid || (s1_output_input_valid && s2_byteLogic_7_inputMask));
  assign s2_byteLogic_7_outputData = (s2_byteLogic_7_buffer_valid ? s2_byteLogic_7_buffer_data : s2_byteLogic_7_inputData);
  assign s1_output_input_fire_8 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_7 = (s2_byteLogic_7_inputMask && ((! io_output_consume) || s2_byteLogic_7_buffer_valid));
  assign s2_byteLogic_8_lastUsed = (4'b1000 == io_output_lastByteUsed);
  assign s2_byteLogic_8_inputMask = s1_output_input_payload_selValid[8];
  assign s2_byteLogic_8_inputData = _zz_s2_byteLogic_8_inputData;
  assign s2_byteLogic_8_outputMask = (s2_byteLogic_8_buffer_valid || (s1_output_input_valid && s2_byteLogic_8_inputMask));
  assign s2_byteLogic_8_outputData = (s2_byteLogic_8_buffer_valid ? s2_byteLogic_8_buffer_data : s2_byteLogic_8_inputData);
  assign s1_output_input_fire_9 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_8 = (s2_byteLogic_8_inputMask && ((! io_output_consume) || s2_byteLogic_8_buffer_valid));
  assign s2_byteLogic_9_lastUsed = (4'b1001 == io_output_lastByteUsed);
  assign s2_byteLogic_9_inputMask = s1_output_input_payload_selValid[9];
  assign s2_byteLogic_9_inputData = _zz_s2_byteLogic_9_inputData;
  assign s2_byteLogic_9_outputMask = (s2_byteLogic_9_buffer_valid || (s1_output_input_valid && s2_byteLogic_9_inputMask));
  assign s2_byteLogic_9_outputData = (s2_byteLogic_9_buffer_valid ? s2_byteLogic_9_buffer_data : s2_byteLogic_9_inputData);
  assign s1_output_input_fire_10 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_9 = (s2_byteLogic_9_inputMask && ((! io_output_consume) || s2_byteLogic_9_buffer_valid));
  assign s2_byteLogic_10_lastUsed = (4'b1010 == io_output_lastByteUsed);
  assign s2_byteLogic_10_inputMask = s1_output_input_payload_selValid[10];
  assign s2_byteLogic_10_inputData = _zz_s2_byteLogic_10_inputData;
  assign s2_byteLogic_10_outputMask = (s2_byteLogic_10_buffer_valid || (s1_output_input_valid && s2_byteLogic_10_inputMask));
  assign s2_byteLogic_10_outputData = (s2_byteLogic_10_buffer_valid ? s2_byteLogic_10_buffer_data : s2_byteLogic_10_inputData);
  assign s1_output_input_fire_11 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_10 = (s2_byteLogic_10_inputMask && ((! io_output_consume) || s2_byteLogic_10_buffer_valid));
  assign s2_byteLogic_11_lastUsed = (4'b1011 == io_output_lastByteUsed);
  assign s2_byteLogic_11_inputMask = s1_output_input_payload_selValid[11];
  assign s2_byteLogic_11_inputData = _zz_s2_byteLogic_11_inputData;
  assign s2_byteLogic_11_outputMask = (s2_byteLogic_11_buffer_valid || (s1_output_input_valid && s2_byteLogic_11_inputMask));
  assign s2_byteLogic_11_outputData = (s2_byteLogic_11_buffer_valid ? s2_byteLogic_11_buffer_data : s2_byteLogic_11_inputData);
  assign s1_output_input_fire_12 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_11 = (s2_byteLogic_11_inputMask && ((! io_output_consume) || s2_byteLogic_11_buffer_valid));
  assign s2_byteLogic_12_lastUsed = (4'b1100 == io_output_lastByteUsed);
  assign s2_byteLogic_12_inputMask = s1_output_input_payload_selValid[12];
  assign s2_byteLogic_12_inputData = _zz_s2_byteLogic_12_inputData;
  assign s2_byteLogic_12_outputMask = (s2_byteLogic_12_buffer_valid || (s1_output_input_valid && s2_byteLogic_12_inputMask));
  assign s2_byteLogic_12_outputData = (s2_byteLogic_12_buffer_valid ? s2_byteLogic_12_buffer_data : s2_byteLogic_12_inputData);
  assign s1_output_input_fire_13 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_12 = (s2_byteLogic_12_inputMask && ((! io_output_consume) || s2_byteLogic_12_buffer_valid));
  assign s2_byteLogic_13_lastUsed = (4'b1101 == io_output_lastByteUsed);
  assign s2_byteLogic_13_inputMask = s1_output_input_payload_selValid[13];
  assign s2_byteLogic_13_inputData = _zz_s2_byteLogic_13_inputData;
  assign s2_byteLogic_13_outputMask = (s2_byteLogic_13_buffer_valid || (s1_output_input_valid && s2_byteLogic_13_inputMask));
  assign s2_byteLogic_13_outputData = (s2_byteLogic_13_buffer_valid ? s2_byteLogic_13_buffer_data : s2_byteLogic_13_inputData);
  assign s1_output_input_fire_14 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_13 = (s2_byteLogic_13_inputMask && ((! io_output_consume) || s2_byteLogic_13_buffer_valid));
  assign s2_byteLogic_14_lastUsed = (4'b1110 == io_output_lastByteUsed);
  assign s2_byteLogic_14_inputMask = s1_output_input_payload_selValid[14];
  assign s2_byteLogic_14_inputData = _zz_s2_byteLogic_14_inputData;
  assign s2_byteLogic_14_outputMask = (s2_byteLogic_14_buffer_valid || (s1_output_input_valid && s2_byteLogic_14_inputMask));
  assign s2_byteLogic_14_outputData = (s2_byteLogic_14_buffer_valid ? s2_byteLogic_14_buffer_data : s2_byteLogic_14_inputData);
  assign s1_output_input_fire_15 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_14 = (s2_byteLogic_14_inputMask && ((! io_output_consume) || s2_byteLogic_14_buffer_valid));
  assign s2_byteLogic_15_lastUsed = (4'b1111 == io_output_lastByteUsed);
  assign s2_byteLogic_15_inputMask = s1_output_input_payload_selValid[15];
  assign s2_byteLogic_15_inputData = _zz_s2_byteLogic_15_inputData;
  assign s2_byteLogic_15_outputMask = (s2_byteLogic_15_buffer_valid || (s1_output_input_valid && s2_byteLogic_15_inputMask));
  assign s2_byteLogic_15_outputData = (s2_byteLogic_15_buffer_valid ? s2_byteLogic_15_buffer_data : s2_byteLogic_15_inputData);
  assign s1_output_input_fire_16 = (s1_output_input_valid && s1_output_input_ready);
  assign when_DmaSg_l1416_15 = (s2_byteLogic_15_inputMask && ((! io_output_consume) || s2_byteLogic_15_buffer_valid));
  assign _zz_io_output_usedUntil = (((((((s2_byteLogic_1_lastUsed || s2_byteLogic_3_lastUsed) || s2_byteLogic_5_lastUsed) || s2_byteLogic_7_lastUsed) || s2_byteLogic_9_lastUsed) || s2_byteLogic_11_lastUsed) || s2_byteLogic_13_lastUsed) || s2_byteLogic_15_lastUsed);
  assign _zz_io_output_usedUntil_1 = (((((((s2_byteLogic_2_lastUsed || s2_byteLogic_3_lastUsed) || s2_byteLogic_6_lastUsed) || s2_byteLogic_7_lastUsed) || s2_byteLogic_10_lastUsed) || s2_byteLogic_11_lastUsed) || s2_byteLogic_14_lastUsed) || s2_byteLogic_15_lastUsed);
  assign _zz_io_output_usedUntil_2 = (((((((s2_byteLogic_4_lastUsed || s2_byteLogic_5_lastUsed) || s2_byteLogic_6_lastUsed) || s2_byteLogic_7_lastUsed) || s2_byteLogic_12_lastUsed) || s2_byteLogic_13_lastUsed) || s2_byteLogic_14_lastUsed) || s2_byteLogic_15_lastUsed);
  assign _zz_io_output_usedUntil_3 = (((((((s2_byteLogic_8_lastUsed || s2_byteLogic_9_lastUsed) || s2_byteLogic_10_lastUsed) || s2_byteLogic_11_lastUsed) || s2_byteLogic_12_lastUsed) || s2_byteLogic_13_lastUsed) || s2_byteLogic_14_lastUsed) || s2_byteLogic_15_lastUsed);
  assign io_output_usedUntil = _zz_io_output_usedUntil_4;
  always @(posedge clk) begin
    if(reset) begin
      io_input_rValid <= 1'b0;
      s0_output_rValid <= 1'b0;
      s1_output_rValid <= 1'b0;
    end else begin
      if(io_input_ready) begin
        io_input_rValid <= io_input_valid;
      end
      if(io_flush) begin
        io_input_rValid <= 1'b0;
      end
      if(s0_output_ready) begin
        s0_output_rValid <= s0_output_valid;
      end
      if(io_flush) begin
        s0_output_rValid <= 1'b0;
      end
      if(s1_output_ready) begin
        s1_output_rValid <= s1_output_valid;
      end
      if(io_flush) begin
        s1_output_rValid <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_input_ready) begin
      io_input_rData_data <= io_input_payload_data;
      io_input_rData_mask <= io_input_payload_mask;
    end
    if(s0_output_ready) begin
      s0_output_rData_cmd_data <= s0_output_payload_cmd_data;
      s0_output_rData_cmd_mask <= s0_output_payload_cmd_mask;
      s0_output_rData_countOnes_0 <= s0_output_payload_countOnes_0;
      s0_output_rData_countOnes_1 <= s0_output_payload_countOnes_1;
      s0_output_rData_countOnes_2 <= s0_output_payload_countOnes_2;
      s0_output_rData_countOnes_3 <= s0_output_payload_countOnes_3;
      s0_output_rData_countOnes_4 <= s0_output_payload_countOnes_4;
      s0_output_rData_countOnes_5 <= s0_output_payload_countOnes_5;
      s0_output_rData_countOnes_6 <= s0_output_payload_countOnes_6;
      s0_output_rData_countOnes_7 <= s0_output_payload_countOnes_7;
      s0_output_rData_countOnes_8 <= s0_output_payload_countOnes_8;
      s0_output_rData_countOnes_9 <= s0_output_payload_countOnes_9;
      s0_output_rData_countOnes_10 <= s0_output_payload_countOnes_10;
      s0_output_rData_countOnes_11 <= s0_output_payload_countOnes_11;
      s0_output_rData_countOnes_12 <= s0_output_payload_countOnes_12;
      s0_output_rData_countOnes_13 <= s0_output_payload_countOnes_13;
      s0_output_rData_countOnes_14 <= s0_output_payload_countOnes_14;
      s0_output_rData_countOnes_15 <= s0_output_payload_countOnes_15;
    end
    if(s0_output_input_fire) begin
      s1_offset <= s1_offsetNext[3:0];
    end
    if(io_flush) begin
      s1_offset <= io_offset;
    end
    if(s0_output_input_fire_1) begin
      s1_byteCounter <= (s1_byteCounter + _zz_s1_byteCounter);
    end
    if(io_flush) begin
      s1_byteCounter <= 13'h0;
    end
    if(s1_output_ready) begin
      s1_output_rData_cmd_data <= s1_output_payload_cmd_data;
      s1_output_rData_cmd_mask <= s1_output_payload_cmd_mask;
      s1_output_rData_index_0 <= s1_output_payload_index_0;
      s1_output_rData_index_1 <= s1_output_payload_index_1;
      s1_output_rData_index_2 <= s1_output_payload_index_2;
      s1_output_rData_index_3 <= s1_output_payload_index_3;
      s1_output_rData_index_4 <= s1_output_payload_index_4;
      s1_output_rData_index_5 <= s1_output_payload_index_5;
      s1_output_rData_index_6 <= s1_output_payload_index_6;
      s1_output_rData_index_7 <= s1_output_payload_index_7;
      s1_output_rData_index_8 <= s1_output_payload_index_8;
      s1_output_rData_index_9 <= s1_output_payload_index_9;
      s1_output_rData_index_10 <= s1_output_payload_index_10;
      s1_output_rData_index_11 <= s1_output_payload_index_11;
      s1_output_rData_index_12 <= s1_output_payload_index_12;
      s1_output_rData_index_13 <= s1_output_payload_index_13;
      s1_output_rData_index_14 <= s1_output_payload_index_14;
      s1_output_rData_index_15 <= s1_output_payload_index_15;
      s1_output_rData_last <= s1_output_payload_last;
      s1_output_rData_sel_0 <= s1_output_payload_sel_0;
      s1_output_rData_sel_1 <= s1_output_payload_sel_1;
      s1_output_rData_sel_2 <= s1_output_payload_sel_2;
      s1_output_rData_sel_3 <= s1_output_payload_sel_3;
      s1_output_rData_sel_4 <= s1_output_payload_sel_4;
      s1_output_rData_sel_5 <= s1_output_payload_sel_5;
      s1_output_rData_sel_6 <= s1_output_payload_sel_6;
      s1_output_rData_sel_7 <= s1_output_payload_sel_7;
      s1_output_rData_sel_8 <= s1_output_payload_sel_8;
      s1_output_rData_sel_9 <= s1_output_payload_sel_9;
      s1_output_rData_sel_10 <= s1_output_payload_sel_10;
      s1_output_rData_sel_11 <= s1_output_payload_sel_11;
      s1_output_rData_sel_12 <= s1_output_payload_sel_12;
      s1_output_rData_sel_13 <= s1_output_payload_sel_13;
      s1_output_rData_sel_14 <= s1_output_payload_sel_14;
      s1_output_rData_sel_15 <= s1_output_payload_sel_15;
      s1_output_rData_selValid <= s1_output_payload_selValid;
    end
    if(io_output_consume) begin
      s2_byteLogic_0_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_1) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_0_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416) begin
        s2_byteLogic_0_buffer_valid <= 1'b1;
        s2_byteLogic_0_buffer_data <= s2_byteLogic_0_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_0_buffer_valid <= (4'b0000 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_1_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_2) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_1_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_1) begin
        s2_byteLogic_1_buffer_valid <= 1'b1;
        s2_byteLogic_1_buffer_data <= s2_byteLogic_1_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_1_buffer_valid <= (4'b0001 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_2_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_3) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_2_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_2) begin
        s2_byteLogic_2_buffer_valid <= 1'b1;
        s2_byteLogic_2_buffer_data <= s2_byteLogic_2_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_2_buffer_valid <= (4'b0010 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_3_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_4) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_3_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_3) begin
        s2_byteLogic_3_buffer_valid <= 1'b1;
        s2_byteLogic_3_buffer_data <= s2_byteLogic_3_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_3_buffer_valid <= (4'b0011 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_4_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_5) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_4_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_4) begin
        s2_byteLogic_4_buffer_valid <= 1'b1;
        s2_byteLogic_4_buffer_data <= s2_byteLogic_4_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_4_buffer_valid <= (4'b0100 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_5_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_6) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_5_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_5) begin
        s2_byteLogic_5_buffer_valid <= 1'b1;
        s2_byteLogic_5_buffer_data <= s2_byteLogic_5_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_5_buffer_valid <= (4'b0101 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_6_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_7) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_6_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_6) begin
        s2_byteLogic_6_buffer_valid <= 1'b1;
        s2_byteLogic_6_buffer_data <= s2_byteLogic_6_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_6_buffer_valid <= (4'b0110 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_7_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_8) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_7_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_7) begin
        s2_byteLogic_7_buffer_valid <= 1'b1;
        s2_byteLogic_7_buffer_data <= s2_byteLogic_7_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_7_buffer_valid <= (4'b0111 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_8_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_9) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_8_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_8) begin
        s2_byteLogic_8_buffer_valid <= 1'b1;
        s2_byteLogic_8_buffer_data <= s2_byteLogic_8_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_8_buffer_valid <= (4'b1000 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_9_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_10) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_9_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_9) begin
        s2_byteLogic_9_buffer_valid <= 1'b1;
        s2_byteLogic_9_buffer_data <= s2_byteLogic_9_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_9_buffer_valid <= (4'b1001 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_10_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_11) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_10_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_10) begin
        s2_byteLogic_10_buffer_valid <= 1'b1;
        s2_byteLogic_10_buffer_data <= s2_byteLogic_10_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_10_buffer_valid <= (4'b1010 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_11_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_12) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_11_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_11) begin
        s2_byteLogic_11_buffer_valid <= 1'b1;
        s2_byteLogic_11_buffer_data <= s2_byteLogic_11_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_11_buffer_valid <= (4'b1011 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_12_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_13) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_12_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_12) begin
        s2_byteLogic_12_buffer_valid <= 1'b1;
        s2_byteLogic_12_buffer_data <= s2_byteLogic_12_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_12_buffer_valid <= (4'b1100 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_13_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_14) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_13_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_13) begin
        s2_byteLogic_13_buffer_valid <= 1'b1;
        s2_byteLogic_13_buffer_data <= s2_byteLogic_13_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_13_buffer_valid <= (4'b1101 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_14_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_15) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_14_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_14) begin
        s2_byteLogic_14_buffer_valid <= 1'b1;
        s2_byteLogic_14_buffer_data <= s2_byteLogic_14_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_14_buffer_valid <= (4'b1110 < io_offset);
    end
    if(io_output_consume) begin
      s2_byteLogic_15_buffer_valid <= 1'b0;
    end
    if(s1_output_input_fire_16) begin
      if(s1_output_input_payload_last) begin
        s2_byteLogic_15_buffer_valid <= 1'b0;
      end
      if(when_DmaSg_l1416_15) begin
        s2_byteLogic_15_buffer_valid <= 1'b1;
        s2_byteLogic_15_buffer_data <= s2_byteLogic_15_inputData;
      end
    end
    if(io_flush) begin
      s2_byteLogic_15_buffer_valid <= (4'b1111 < io_offset);
    end
  end


endmodule

module EfxDMA_DmaMemoryCore (
  input               io_writes_0_cmd_valid,
  output              io_writes_0_cmd_ready,
  input      [10:0]   io_writes_0_cmd_payload_address,
  input      [63:0]   io_writes_0_cmd_payload_data,
  input      [7:0]    io_writes_0_cmd_payload_mask,
  input      [1:0]    io_writes_0_cmd_payload_priority,
  input      [6:0]    io_writes_0_cmd_payload_context,
  output              io_writes_0_rsp_valid,
  output     [6:0]    io_writes_0_rsp_payload_context,
  input               io_writes_1_cmd_valid,
  output              io_writes_1_cmd_ready,
  input      [10:0]   io_writes_1_cmd_payload_address,
  input      [63:0]   io_writes_1_cmd_payload_data,
  input      [7:0]    io_writes_1_cmd_payload_mask,
  input      [1:0]    io_writes_1_cmd_payload_priority,
  input      [6:0]    io_writes_1_cmd_payload_context,
  output              io_writes_1_rsp_valid,
  output     [6:0]    io_writes_1_rsp_payload_context,
  input               io_writes_2_cmd_valid,
  output              io_writes_2_cmd_ready,
  input      [10:0]   io_writes_2_cmd_payload_address,
  input      [127:0]  io_writes_2_cmd_payload_data,
  input      [15:0]   io_writes_2_cmd_payload_mask,
  input      [7:0]    io_writes_2_cmd_payload_context,
  output              io_writes_2_rsp_valid,
  output     [7:0]    io_writes_2_rsp_payload_context,
  input               io_reads_0_cmd_valid,
  output              io_reads_0_cmd_ready,
  input      [10:0]   io_reads_0_cmd_payload_address,
  input      [1:0]    io_reads_0_cmd_payload_priority,
  input      [2:0]    io_reads_0_cmd_payload_context,
  output              io_reads_0_rsp_valid,
  input               io_reads_0_rsp_ready,
  output     [63:0]   io_reads_0_rsp_payload_data,
  output     [7:0]    io_reads_0_rsp_payload_mask,
  output     [2:0]    io_reads_0_rsp_payload_context,
  input               io_reads_1_cmd_valid,
  output              io_reads_1_cmd_ready,
  input      [10:0]   io_reads_1_cmd_payload_address,
  input      [1:0]    io_reads_1_cmd_payload_priority,
  input      [2:0]    io_reads_1_cmd_payload_context,
  output              io_reads_1_rsp_valid,
  input               io_reads_1_rsp_ready,
  output     [63:0]   io_reads_1_rsp_payload_data,
  output     [7:0]    io_reads_1_rsp_payload_mask,
  output     [2:0]    io_reads_1_rsp_payload_context,
  input               io_reads_2_cmd_valid,
  output              io_reads_2_cmd_ready,
  input      [10:0]   io_reads_2_cmd_payload_address,
  input      [12:0]   io_reads_2_cmd_payload_context,
  output              io_reads_2_rsp_valid,
  input               io_reads_2_rsp_ready,
  output     [127:0]  io_reads_2_rsp_payload_data,
  output     [15:0]   io_reads_2_rsp_payload_mask,
  output     [12:0]   io_reads_2_rsp_payload_context,
  input               clk,
  input               reset
);
  reg        [71:0]   _zz_banks_0_ram_port1;
  reg        [71:0]   _zz_banks_1_ram_port1;
  wire       [71:0]   _zz_banks_0_ram_port;
  wire       [71:0]   _zz_banks_1_ram_port;
  wire       [7:0]    _zz_write_ports_0_priority_value;
  wire       [7:0]    _zz_write_ports_1_priority_value;
  wire       [10:0]   _zz_when_MemoryCore_l138;
  wire       [10:0]   _zz_when_MemoryCore_l138_1;
  wire       [10:0]   _zz_when_MemoryCore_l138_2;
  wire       [10:0]   _zz_when_MemoryCore_l138_3;
  reg        [63:0]   _zz_read_ports_0_buffer_bufferIn_payload_data;
  reg        [7:0]    _zz_read_ports_0_buffer_bufferIn_payload_mask;
  wire       [7:0]    _zz_read_ports_0_priority_value;
  reg        [63:0]   _zz_read_ports_1_buffer_bufferIn_payload_data;
  reg        [7:0]    _zz_read_ports_1_buffer_bufferIn_payload_mask;
  wire       [7:0]    _zz_read_ports_1_priority_value;
  wire       [10:0]   _zz_when_MemoryCore_l223;
  wire       [10:0]   _zz_when_MemoryCore_l223_1;
  wire       [10:0]   _zz_when_MemoryCore_l223_2;
  wire       [10:0]   _zz_when_MemoryCore_l223_3;
  reg                 _zz_1;
  reg                 _zz_2;
  wire                banks_0_write_valid;
  wire       [9:0]    banks_0_write_payload_address;
  wire       [63:0]   banks_0_write_payload_data_data;
  wire       [7:0]    banks_0_write_payload_data_mask;
  wire                banks_0_read_cmd_valid;
  wire       [9:0]    banks_0_read_cmd_payload;
  wire       [63:0]   banks_0_read_rsp_data;
  wire       [7:0]    banks_0_read_rsp_mask;
  wire       [71:0]   _zz_banks_0_read_rsp_data;
  wire                banks_0_writeOr_value_valid;
  wire       [9:0]    banks_0_writeOr_value_payload_address;
  wire       [63:0]   banks_0_writeOr_value_payload_data_data;
  wire       [7:0]    banks_0_writeOr_value_payload_data_mask;
  wire                banks_0_readOr_value_valid;
  wire       [9:0]    banks_0_readOr_value_payload;
  wire                banks_1_write_valid;
  wire       [9:0]    banks_1_write_payload_address;
  wire       [63:0]   banks_1_write_payload_data_data;
  wire       [7:0]    banks_1_write_payload_data_mask;
  wire                banks_1_read_cmd_valid;
  wire       [9:0]    banks_1_read_cmd_payload;
  wire       [63:0]   banks_1_read_rsp_data;
  wire       [7:0]    banks_1_read_rsp_mask;
  wire       [71:0]   _zz_banks_1_read_rsp_data;
  wire                banks_1_writeOr_value_valid;
  wire       [9:0]    banks_1_writeOr_value_payload_address;
  wire       [63:0]   banks_1_writeOr_value_payload_data_data;
  wire       [7:0]    banks_1_writeOr_value_payload_data_mask;
  wire                banks_1_readOr_value_valid;
  wire       [9:0]    banks_1_readOr_value_payload;
  reg        [7:0]    write_ports_0_priority_value = 8'b00000000;
  reg        [7:0]    write_ports_1_priority_value = 8'b00000000;
  wire                write_nodes_0_0_priority;
  wire                write_nodes_0_0_conflict;
  wire                write_nodes_0_1_priority;
  wire                write_nodes_0_1_conflict;
  wire                write_nodes_0_2_priority;
  wire                write_nodes_0_2_conflict;
  wire                write_nodes_1_0_priority;
  wire                write_nodes_1_0_conflict;
  wire                write_nodes_1_1_priority;
  wire                write_nodes_1_1_conflict;
  wire                write_nodes_1_2_priority;
  wire                write_nodes_1_2_conflict;
  wire                write_nodes_2_0_priority;
  wire                write_nodes_2_0_conflict;
  wire                write_nodes_2_1_priority;
  wire                write_nodes_2_1_conflict;
  wire                write_nodes_2_2_priority;
  wire                write_nodes_2_2_conflict;
  wire       [1:0]    write_arbiter_0_losedAgainst;
  wire                write_arbiter_0_doIt;
  reg                 _zz_banks_0_writeOr_value_valid;
  reg        [9:0]    _zz_banks_0_writeOr_value_valid_1;
  reg        [63:0]   _zz_banks_0_writeOr_value_valid_2;
  reg        [7:0]    _zz_banks_0_writeOr_value_valid_3;
  wire                when_MemoryCore_l138;
  reg                 _zz_banks_1_writeOr_value_valid;
  reg        [9:0]    _zz_banks_1_writeOr_value_valid_1;
  reg        [63:0]   _zz_banks_1_writeOr_value_valid_2;
  reg        [7:0]    _zz_banks_1_writeOr_value_valid_3;
  wire                when_MemoryCore_l138_1;
  reg                 write_arbiter_0_doIt_regNext;
  reg        [6:0]    io_writes_0_cmd_payload_context_regNext;
  wire       [1:0]    write_arbiter_1_losedAgainst;
  wire                write_arbiter_1_doIt;
  reg                 _zz_banks_0_writeOr_value_valid_4;
  reg        [9:0]    _zz_banks_0_writeOr_value_valid_5;
  reg        [63:0]   _zz_banks_0_writeOr_value_valid_6;
  reg        [7:0]    _zz_banks_0_writeOr_value_valid_7;
  wire                when_MemoryCore_l138_2;
  reg                 _zz_banks_1_writeOr_value_valid_4;
  reg        [9:0]    _zz_banks_1_writeOr_value_valid_5;
  reg        [63:0]   _zz_banks_1_writeOr_value_valid_6;
  reg        [7:0]    _zz_banks_1_writeOr_value_valid_7;
  wire                when_MemoryCore_l138_3;
  reg                 write_arbiter_1_doIt_regNext;
  reg        [6:0]    io_writes_1_cmd_payload_context_regNext;
  wire       [1:0]    write_arbiter_2_losedAgainst;
  wire                write_arbiter_2_doIt;
  reg                 _zz_banks_0_writeOr_value_valid_8;
  reg        [9:0]    _zz_banks_0_writeOr_value_valid_9;
  reg        [63:0]   _zz_banks_0_writeOr_value_valid_10;
  reg        [7:0]    _zz_banks_0_writeOr_value_valid_11;
  wire                when_MemoryCore_l138_4;
  reg                 _zz_banks_1_writeOr_value_valid_8;
  reg        [9:0]    _zz_banks_1_writeOr_value_valid_9;
  reg        [63:0]   _zz_banks_1_writeOr_value_valid_10;
  reg        [7:0]    _zz_banks_1_writeOr_value_valid_11;
  wire                when_MemoryCore_l138_5;
  reg                 write_arbiter_2_doIt_regNext;
  reg        [7:0]    io_writes_2_cmd_payload_context_regNext;
  wire                read_ports_0_buffer_s0_valid;
  wire       [2:0]    read_ports_0_buffer_s0_payload_context;
  wire       [10:0]   read_ports_0_buffer_s0_payload_address;
  reg                 read_ports_0_buffer_s1_valid;
  reg        [2:0]    read_ports_0_buffer_s1_payload_context;
  reg        [10:0]   read_ports_0_buffer_s1_payload_address;
  wire       [0:0]    read_ports_0_buffer_groupSel;
  wire                read_ports_0_buffer_bufferIn_valid;
  wire                read_ports_0_buffer_bufferIn_ready;
  wire       [63:0]   read_ports_0_buffer_bufferIn_payload_data;
  wire       [7:0]    read_ports_0_buffer_bufferIn_payload_mask;
  wire       [2:0]    read_ports_0_buffer_bufferIn_payload_context;
  wire                read_ports_0_buffer_bufferIn_bufferOut_valid;
  wire                read_ports_0_buffer_bufferIn_bufferOut_ready;
  wire       [63:0]   read_ports_0_buffer_bufferIn_bufferOut_payload_data;
  wire       [7:0]    read_ports_0_buffer_bufferIn_bufferOut_payload_mask;
  wire       [2:0]    read_ports_0_buffer_bufferIn_bufferOut_payload_context;
  reg                 read_ports_0_buffer_bufferIn_rValid;
  reg        [63:0]   read_ports_0_buffer_bufferIn_rData_data;
  reg        [7:0]    read_ports_0_buffer_bufferIn_rData_mask;
  reg        [2:0]    read_ports_0_buffer_bufferIn_rData_context;
  wire                read_ports_0_buffer_full;
  wire                _zz_io_reads_0_cmd_ready;
  wire                read_ports_0_cmd_valid;
  wire                read_ports_0_cmd_ready;
  wire       [10:0]   read_ports_0_cmd_payload_address;
  wire       [1:0]    read_ports_0_cmd_payload_priority;
  wire       [2:0]    read_ports_0_cmd_payload_context;
  reg        [7:0]    read_ports_0_priority_value = 8'b00000000;
  wire                read_ports_1_buffer_s0_valid;
  wire       [2:0]    read_ports_1_buffer_s0_payload_context;
  wire       [10:0]   read_ports_1_buffer_s0_payload_address;
  reg                 read_ports_1_buffer_s1_valid;
  reg        [2:0]    read_ports_1_buffer_s1_payload_context;
  reg        [10:0]   read_ports_1_buffer_s1_payload_address;
  wire       [0:0]    read_ports_1_buffer_groupSel;
  wire                read_ports_1_buffer_bufferIn_valid;
  wire                read_ports_1_buffer_bufferIn_ready;
  wire       [63:0]   read_ports_1_buffer_bufferIn_payload_data;
  wire       [7:0]    read_ports_1_buffer_bufferIn_payload_mask;
  wire       [2:0]    read_ports_1_buffer_bufferIn_payload_context;
  wire                read_ports_1_buffer_bufferIn_bufferOut_valid;
  wire                read_ports_1_buffer_bufferIn_bufferOut_ready;
  wire       [63:0]   read_ports_1_buffer_bufferIn_bufferOut_payload_data;
  wire       [7:0]    read_ports_1_buffer_bufferIn_bufferOut_payload_mask;
  wire       [2:0]    read_ports_1_buffer_bufferIn_bufferOut_payload_context;
  reg                 read_ports_1_buffer_bufferIn_rValid;
  reg        [63:0]   read_ports_1_buffer_bufferIn_rData_data;
  reg        [7:0]    read_ports_1_buffer_bufferIn_rData_mask;
  reg        [2:0]    read_ports_1_buffer_bufferIn_rData_context;
  wire                read_ports_1_buffer_full;
  wire                _zz_io_reads_1_cmd_ready;
  wire                read_ports_1_cmd_valid;
  wire                read_ports_1_cmd_ready;
  wire       [10:0]   read_ports_1_cmd_payload_address;
  wire       [1:0]    read_ports_1_cmd_payload_priority;
  wire       [2:0]    read_ports_1_cmd_payload_context;
  reg        [7:0]    read_ports_1_priority_value = 8'b00000000;
  wire                read_ports_2_buffer_s0_valid;
  wire       [12:0]   read_ports_2_buffer_s0_payload_context;
  wire       [10:0]   read_ports_2_buffer_s0_payload_address;
  reg                 read_ports_2_buffer_s1_valid;
  reg        [12:0]   read_ports_2_buffer_s1_payload_context;
  reg        [10:0]   read_ports_2_buffer_s1_payload_address;
  wire                read_ports_2_buffer_bufferIn_valid;
  wire                read_ports_2_buffer_bufferIn_ready;
  wire       [127:0]  read_ports_2_buffer_bufferIn_payload_data;
  wire       [15:0]   read_ports_2_buffer_bufferIn_payload_mask;
  wire       [12:0]   read_ports_2_buffer_bufferIn_payload_context;
  wire                read_ports_2_buffer_bufferIn_bufferOut_valid;
  wire                read_ports_2_buffer_bufferIn_bufferOut_ready;
  wire       [127:0]  read_ports_2_buffer_bufferIn_bufferOut_payload_data;
  wire       [15:0]   read_ports_2_buffer_bufferIn_bufferOut_payload_mask;
  wire       [12:0]   read_ports_2_buffer_bufferIn_bufferOut_payload_context;
  reg                 read_ports_2_buffer_bufferIn_rValid;
  reg        [127:0]  read_ports_2_buffer_bufferIn_rData_data;
  reg        [15:0]   read_ports_2_buffer_bufferIn_rData_mask;
  reg        [12:0]   read_ports_2_buffer_bufferIn_rData_context;
  wire                read_ports_2_buffer_full;
  wire                _zz_io_reads_2_cmd_ready;
  wire                read_ports_2_cmd_valid;
  wire                read_ports_2_cmd_ready;
  wire       [10:0]   read_ports_2_cmd_payload_address;
  wire       [12:0]   read_ports_2_cmd_payload_context;
  wire                read_nodes_0_0_priority;
  wire                read_nodes_0_0_conflict;
  wire                read_nodes_0_1_priority;
  wire                read_nodes_0_1_conflict;
  wire                read_nodes_0_2_priority;
  wire                read_nodes_0_2_conflict;
  wire                read_nodes_1_0_priority;
  wire                read_nodes_1_0_conflict;
  wire                read_nodes_1_1_priority;
  wire                read_nodes_1_1_conflict;
  wire                read_nodes_1_2_priority;
  wire                read_nodes_1_2_conflict;
  wire                read_nodes_2_0_priority;
  wire                read_nodes_2_0_conflict;
  wire                read_nodes_2_1_priority;
  wire                read_nodes_2_1_conflict;
  wire                read_nodes_2_2_priority;
  wire                read_nodes_2_2_conflict;
  wire       [1:0]    read_arbiter_0_losedAgainst;
  wire                read_arbiter_0_doIt;
  reg                 _zz_banks_0_readOr_value_valid;
  reg        [9:0]    _zz_banks_0_readOr_value_valid_1;
  wire                when_MemoryCore_l223;
  reg                 _zz_banks_1_readOr_value_valid;
  reg        [9:0]    _zz_banks_1_readOr_value_valid_1;
  wire                when_MemoryCore_l223_1;
  wire       [1:0]    read_arbiter_1_losedAgainst;
  wire                read_arbiter_1_doIt;
  reg                 _zz_banks_0_readOr_value_valid_2;
  reg        [9:0]    _zz_banks_0_readOr_value_valid_3;
  wire                when_MemoryCore_l223_2;
  reg                 _zz_banks_1_readOr_value_valid_2;
  reg        [9:0]    _zz_banks_1_readOr_value_valid_3;
  wire                when_MemoryCore_l223_3;
  wire       [1:0]    read_arbiter_2_losedAgainst;
  wire                read_arbiter_2_doIt;
  reg                 _zz_banks_0_readOr_value_valid_4;
  reg        [9:0]    _zz_banks_0_readOr_value_valid_5;
  wire                when_MemoryCore_l223_4;
  reg                 _zz_banks_1_readOr_value_valid_4;
  reg        [9:0]    _zz_banks_1_readOr_value_valid_5;
  wire                when_MemoryCore_l223_5;
  wire       [82:0]   _zz_banks_0_writeOr_value_valid_12;
  wire       [81:0]   _zz_banks_0_writeOr_value_payload_address;
  wire       [71:0]   _zz_banks_0_writeOr_value_payload_data_data;
  wire       [10:0]   _zz_banks_0_readOr_value_valid_6;
  wire       [82:0]   _zz_banks_1_writeOr_value_valid_12;
  wire       [81:0]   _zz_banks_1_writeOr_value_payload_address;
  wire       [71:0]   _zz_banks_1_writeOr_value_payload_data_data;
  wire       [10:0]   _zz_banks_1_readOr_value_valid_6;
  (* ram_style = "block" *) reg [71:0] banks_0_ram [0:1023];
  (* ram_style = "block" *) reg [71:0] banks_1_ram [0:1023];

  assign _zz_write_ports_0_priority_value = {6'd0, io_writes_0_cmd_payload_priority};
  assign _zz_write_ports_1_priority_value = {6'd0, io_writes_1_cmd_payload_priority};
  assign _zz_when_MemoryCore_l138 = (io_writes_0_cmd_payload_address ^ 11'h0);
  assign _zz_when_MemoryCore_l138_1 = (io_writes_0_cmd_payload_address ^ 11'h001);
  assign _zz_when_MemoryCore_l138_2 = (io_writes_1_cmd_payload_address ^ 11'h0);
  assign _zz_when_MemoryCore_l138_3 = (io_writes_1_cmd_payload_address ^ 11'h001);
  assign _zz_read_ports_0_priority_value = {6'd0, read_ports_0_cmd_payload_priority};
  assign _zz_read_ports_1_priority_value = {6'd0, read_ports_1_cmd_payload_priority};
  assign _zz_when_MemoryCore_l223 = (read_ports_0_cmd_payload_address ^ 11'h0);
  assign _zz_when_MemoryCore_l223_1 = (read_ports_0_cmd_payload_address ^ 11'h001);
  assign _zz_when_MemoryCore_l223_2 = (read_ports_1_cmd_payload_address ^ 11'h0);
  assign _zz_when_MemoryCore_l223_3 = (read_ports_1_cmd_payload_address ^ 11'h001);
  assign _zz_banks_0_ram_port = {banks_0_write_payload_data_mask,banks_0_write_payload_data_data};
  assign _zz_banks_1_ram_port = {banks_1_write_payload_data_mask,banks_1_write_payload_data_data};
  always @(posedge clk) begin
    if(_zz_2) begin
      banks_0_ram[banks_0_write_payload_address] <= _zz_banks_0_ram_port;
    end
  end

  always @(posedge clk) begin
    if(banks_0_read_cmd_valid) begin
      _zz_banks_0_ram_port1 <= banks_0_ram[banks_0_read_cmd_payload];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      banks_1_ram[banks_1_write_payload_address] <= _zz_banks_1_ram_port;
    end
  end

  always @(posedge clk) begin
    if(banks_1_read_cmd_valid) begin
      _zz_banks_1_ram_port1 <= banks_1_ram[banks_1_read_cmd_payload];
    end
  end

  always @(*) begin
    case(read_ports_0_buffer_groupSel)
      1'b0 : begin
        _zz_read_ports_0_buffer_bufferIn_payload_data = banks_0_read_rsp_data;
        _zz_read_ports_0_buffer_bufferIn_payload_mask = banks_0_read_rsp_mask;
      end
      default : begin
        _zz_read_ports_0_buffer_bufferIn_payload_data = banks_1_read_rsp_data;
        _zz_read_ports_0_buffer_bufferIn_payload_mask = banks_1_read_rsp_mask;
      end
    endcase
  end

  always @(*) begin
    case(read_ports_1_buffer_groupSel)
      1'b0 : begin
        _zz_read_ports_1_buffer_bufferIn_payload_data = banks_0_read_rsp_data;
        _zz_read_ports_1_buffer_bufferIn_payload_mask = banks_0_read_rsp_mask;
      end
      default : begin
        _zz_read_ports_1_buffer_bufferIn_payload_data = banks_1_read_rsp_data;
        _zz_read_ports_1_buffer_bufferIn_payload_mask = banks_1_read_rsp_mask;
      end
    endcase
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(banks_1_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(banks_0_write_valid) begin
      _zz_2 = 1'b1;
    end
  end

  assign _zz_banks_0_read_rsp_data = _zz_banks_0_ram_port1;
  assign banks_0_read_rsp_data = _zz_banks_0_read_rsp_data[63 : 0];
  assign banks_0_read_rsp_mask = _zz_banks_0_read_rsp_data[71 : 64];
  assign banks_0_write_valid = banks_0_writeOr_value_valid;
  assign banks_0_write_payload_address = banks_0_writeOr_value_payload_address;
  assign banks_0_write_payload_data_data = banks_0_writeOr_value_payload_data_data;
  assign banks_0_write_payload_data_mask = banks_0_writeOr_value_payload_data_mask;
  assign banks_0_read_cmd_valid = banks_0_readOr_value_valid;
  assign banks_0_read_cmd_payload = banks_0_readOr_value_payload;
  assign _zz_banks_1_read_rsp_data = _zz_banks_1_ram_port1;
  assign banks_1_read_rsp_data = _zz_banks_1_read_rsp_data[63 : 0];
  assign banks_1_read_rsp_mask = _zz_banks_1_read_rsp_data[71 : 64];
  assign banks_1_write_valid = banks_1_writeOr_value_valid;
  assign banks_1_write_payload_address = banks_1_writeOr_value_payload_address;
  assign banks_1_write_payload_data_data = banks_1_writeOr_value_payload_data_data;
  assign banks_1_write_payload_data_mask = banks_1_writeOr_value_payload_data_mask;
  assign banks_1_read_cmd_valid = banks_1_readOr_value_valid;
  assign banks_1_read_cmd_payload = banks_1_readOr_value_payload;
  assign write_nodes_0_1_priority = (write_ports_1_priority_value < write_ports_0_priority_value);
  assign write_nodes_1_0_priority = (! write_nodes_0_1_priority);
  assign write_nodes_0_1_conflict = ((io_writes_0_cmd_valid && io_writes_1_cmd_valid) && (((io_writes_0_cmd_payload_address ^ io_writes_1_cmd_payload_address) & 11'h001) == 11'h0));
  assign write_nodes_1_0_conflict = write_nodes_0_1_conflict;
  assign write_nodes_0_2_priority = 1'b0;
  assign write_nodes_2_0_priority = 1'b1;
  assign write_nodes_0_2_conflict = ((io_writes_0_cmd_valid && io_writes_2_cmd_valid) && (((io_writes_0_cmd_payload_address ^ io_writes_2_cmd_payload_address) & 11'h0) == 11'h0));
  assign write_nodes_2_0_conflict = write_nodes_0_2_conflict;
  assign write_nodes_1_2_priority = 1'b0;
  assign write_nodes_2_1_priority = 1'b1;
  assign write_nodes_1_2_conflict = ((io_writes_1_cmd_valid && io_writes_2_cmd_valid) && (((io_writes_1_cmd_payload_address ^ io_writes_2_cmd_payload_address) & 11'h0) == 11'h0));
  assign write_nodes_2_1_conflict = write_nodes_1_2_conflict;
  assign write_arbiter_0_losedAgainst = {(write_nodes_0_2_conflict && (! write_nodes_0_2_priority)),(write_nodes_0_1_conflict && (! write_nodes_0_1_priority))};
  assign write_arbiter_0_doIt = (io_writes_0_cmd_valid && (write_arbiter_0_losedAgainst == 2'b00));
  assign when_MemoryCore_l138 = (write_arbiter_0_doIt && (_zz_when_MemoryCore_l138[0 : 0] == 1'b0));
  always @(*) begin
    if(when_MemoryCore_l138) begin
      _zz_banks_0_writeOr_value_valid = 1'b1;
    end else begin
      _zz_banks_0_writeOr_value_valid = 1'b0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138) begin
      _zz_banks_0_writeOr_value_valid_1 = (io_writes_0_cmd_payload_address >>> 1);
    end else begin
      _zz_banks_0_writeOr_value_valid_1 = 10'h0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138) begin
      _zz_banks_0_writeOr_value_valid_2 = io_writes_0_cmd_payload_data[63 : 0];
    end else begin
      _zz_banks_0_writeOr_value_valid_2 = 64'h0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138) begin
      _zz_banks_0_writeOr_value_valid_3 = io_writes_0_cmd_payload_mask[7 : 0];
    end else begin
      _zz_banks_0_writeOr_value_valid_3 = 8'h0;
    end
  end

  assign when_MemoryCore_l138_1 = (write_arbiter_0_doIt && (_zz_when_MemoryCore_l138_1[0 : 0] == 1'b0));
  always @(*) begin
    if(when_MemoryCore_l138_1) begin
      _zz_banks_1_writeOr_value_valid = 1'b1;
    end else begin
      _zz_banks_1_writeOr_value_valid = 1'b0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_1) begin
      _zz_banks_1_writeOr_value_valid_1 = (io_writes_0_cmd_payload_address >>> 1);
    end else begin
      _zz_banks_1_writeOr_value_valid_1 = 10'h0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_1) begin
      _zz_banks_1_writeOr_value_valid_2 = io_writes_0_cmd_payload_data[63 : 0];
    end else begin
      _zz_banks_1_writeOr_value_valid_2 = 64'h0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_1) begin
      _zz_banks_1_writeOr_value_valid_3 = io_writes_0_cmd_payload_mask[7 : 0];
    end else begin
      _zz_banks_1_writeOr_value_valid_3 = 8'h0;
    end
  end

  assign io_writes_0_cmd_ready = write_arbiter_0_doIt;
  assign io_writes_0_rsp_valid = write_arbiter_0_doIt_regNext;
  assign io_writes_0_rsp_payload_context = io_writes_0_cmd_payload_context_regNext;
  assign write_arbiter_1_losedAgainst = {(write_nodes_1_2_conflict && (! write_nodes_1_2_priority)),(write_nodes_1_0_conflict && (! write_nodes_1_0_priority))};
  assign write_arbiter_1_doIt = (io_writes_1_cmd_valid && (write_arbiter_1_losedAgainst == 2'b00));
  assign when_MemoryCore_l138_2 = (write_arbiter_1_doIt && (_zz_when_MemoryCore_l138_2[0 : 0] == 1'b0));
  always @(*) begin
    if(when_MemoryCore_l138_2) begin
      _zz_banks_0_writeOr_value_valid_4 = 1'b1;
    end else begin
      _zz_banks_0_writeOr_value_valid_4 = 1'b0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_2) begin
      _zz_banks_0_writeOr_value_valid_5 = (io_writes_1_cmd_payload_address >>> 1);
    end else begin
      _zz_banks_0_writeOr_value_valid_5 = 10'h0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_2) begin
      _zz_banks_0_writeOr_value_valid_6 = io_writes_1_cmd_payload_data[63 : 0];
    end else begin
      _zz_banks_0_writeOr_value_valid_6 = 64'h0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_2) begin
      _zz_banks_0_writeOr_value_valid_7 = io_writes_1_cmd_payload_mask[7 : 0];
    end else begin
      _zz_banks_0_writeOr_value_valid_7 = 8'h0;
    end
  end

  assign when_MemoryCore_l138_3 = (write_arbiter_1_doIt && (_zz_when_MemoryCore_l138_3[0 : 0] == 1'b0));
  always @(*) begin
    if(when_MemoryCore_l138_3) begin
      _zz_banks_1_writeOr_value_valid_4 = 1'b1;
    end else begin
      _zz_banks_1_writeOr_value_valid_4 = 1'b0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_3) begin
      _zz_banks_1_writeOr_value_valid_5 = (io_writes_1_cmd_payload_address >>> 1);
    end else begin
      _zz_banks_1_writeOr_value_valid_5 = 10'h0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_3) begin
      _zz_banks_1_writeOr_value_valid_6 = io_writes_1_cmd_payload_data[63 : 0];
    end else begin
      _zz_banks_1_writeOr_value_valid_6 = 64'h0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_3) begin
      _zz_banks_1_writeOr_value_valid_7 = io_writes_1_cmd_payload_mask[7 : 0];
    end else begin
      _zz_banks_1_writeOr_value_valid_7 = 8'h0;
    end
  end

  assign io_writes_1_cmd_ready = write_arbiter_1_doIt;
  assign io_writes_1_rsp_valid = write_arbiter_1_doIt_regNext;
  assign io_writes_1_rsp_payload_context = io_writes_1_cmd_payload_context_regNext;
  assign write_arbiter_2_losedAgainst = {(write_nodes_2_1_conflict && (! write_nodes_2_1_priority)),(write_nodes_2_0_conflict && (! write_nodes_2_0_priority))};
  assign write_arbiter_2_doIt = (io_writes_2_cmd_valid && (write_arbiter_2_losedAgainst == 2'b00));
  assign when_MemoryCore_l138_4 = (write_arbiter_2_doIt && 1'b1);
  always @(*) begin
    if(when_MemoryCore_l138_4) begin
      _zz_banks_0_writeOr_value_valid_8 = 1'b1;
    end else begin
      _zz_banks_0_writeOr_value_valid_8 = 1'b0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_4) begin
      _zz_banks_0_writeOr_value_valid_9 = (io_writes_2_cmd_payload_address >>> 1);
    end else begin
      _zz_banks_0_writeOr_value_valid_9 = 10'h0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_4) begin
      _zz_banks_0_writeOr_value_valid_10 = io_writes_2_cmd_payload_data[63 : 0];
    end else begin
      _zz_banks_0_writeOr_value_valid_10 = 64'h0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_4) begin
      _zz_banks_0_writeOr_value_valid_11 = io_writes_2_cmd_payload_mask[7 : 0];
    end else begin
      _zz_banks_0_writeOr_value_valid_11 = 8'h0;
    end
  end

  assign when_MemoryCore_l138_5 = (write_arbiter_2_doIt && 1'b1);
  always @(*) begin
    if(when_MemoryCore_l138_5) begin
      _zz_banks_1_writeOr_value_valid_8 = 1'b1;
    end else begin
      _zz_banks_1_writeOr_value_valid_8 = 1'b0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_5) begin
      _zz_banks_1_writeOr_value_valid_9 = (io_writes_2_cmd_payload_address >>> 1);
    end else begin
      _zz_banks_1_writeOr_value_valid_9 = 10'h0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_5) begin
      _zz_banks_1_writeOr_value_valid_10 = io_writes_2_cmd_payload_data[127 : 64];
    end else begin
      _zz_banks_1_writeOr_value_valid_10 = 64'h0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l138_5) begin
      _zz_banks_1_writeOr_value_valid_11 = io_writes_2_cmd_payload_mask[15 : 8];
    end else begin
      _zz_banks_1_writeOr_value_valid_11 = 8'h0;
    end
  end

  assign io_writes_2_cmd_ready = write_arbiter_2_doIt;
  assign io_writes_2_rsp_valid = write_arbiter_2_doIt_regNext;
  assign io_writes_2_rsp_payload_context = io_writes_2_cmd_payload_context_regNext;
  assign read_ports_0_buffer_groupSel = read_ports_0_buffer_s1_payload_address[0 : 0];
  assign read_ports_0_buffer_bufferIn_valid = read_ports_0_buffer_s1_valid;
  assign read_ports_0_buffer_bufferIn_payload_context = read_ports_0_buffer_s1_payload_context;
  assign read_ports_0_buffer_bufferIn_payload_data = _zz_read_ports_0_buffer_bufferIn_payload_data;
  assign read_ports_0_buffer_bufferIn_payload_mask = _zz_read_ports_0_buffer_bufferIn_payload_mask;
  assign read_ports_0_buffer_bufferIn_ready = (! read_ports_0_buffer_bufferIn_rValid);
  assign read_ports_0_buffer_bufferIn_bufferOut_valid = (read_ports_0_buffer_bufferIn_valid || read_ports_0_buffer_bufferIn_rValid);
  assign read_ports_0_buffer_bufferIn_bufferOut_payload_data = (read_ports_0_buffer_bufferIn_rValid ? read_ports_0_buffer_bufferIn_rData_data : read_ports_0_buffer_bufferIn_payload_data);
  assign read_ports_0_buffer_bufferIn_bufferOut_payload_mask = (read_ports_0_buffer_bufferIn_rValid ? read_ports_0_buffer_bufferIn_rData_mask : read_ports_0_buffer_bufferIn_payload_mask);
  assign read_ports_0_buffer_bufferIn_bufferOut_payload_context = (read_ports_0_buffer_bufferIn_rValid ? read_ports_0_buffer_bufferIn_rData_context : read_ports_0_buffer_bufferIn_payload_context);
  assign io_reads_0_rsp_valid = read_ports_0_buffer_bufferIn_bufferOut_valid;
  assign read_ports_0_buffer_bufferIn_bufferOut_ready = io_reads_0_rsp_ready;
  assign io_reads_0_rsp_payload_data = read_ports_0_buffer_bufferIn_bufferOut_payload_data;
  assign io_reads_0_rsp_payload_mask = read_ports_0_buffer_bufferIn_bufferOut_payload_mask;
  assign io_reads_0_rsp_payload_context = read_ports_0_buffer_bufferIn_bufferOut_payload_context;
  assign read_ports_0_buffer_full = (read_ports_0_buffer_bufferIn_bufferOut_valid && (! read_ports_0_buffer_bufferIn_bufferOut_ready));
  assign _zz_io_reads_0_cmd_ready = (! read_ports_0_buffer_full);
  assign read_ports_0_cmd_valid = (io_reads_0_cmd_valid && _zz_io_reads_0_cmd_ready);
  assign io_reads_0_cmd_ready = (read_ports_0_cmd_ready && _zz_io_reads_0_cmd_ready);
  assign read_ports_0_cmd_payload_address = io_reads_0_cmd_payload_address;
  assign read_ports_0_cmd_payload_priority = io_reads_0_cmd_payload_priority;
  assign read_ports_0_cmd_payload_context = io_reads_0_cmd_payload_context;
  assign read_ports_1_buffer_groupSel = read_ports_1_buffer_s1_payload_address[0 : 0];
  assign read_ports_1_buffer_bufferIn_valid = read_ports_1_buffer_s1_valid;
  assign read_ports_1_buffer_bufferIn_payload_context = read_ports_1_buffer_s1_payload_context;
  assign read_ports_1_buffer_bufferIn_payload_data = _zz_read_ports_1_buffer_bufferIn_payload_data;
  assign read_ports_1_buffer_bufferIn_payload_mask = _zz_read_ports_1_buffer_bufferIn_payload_mask;
  assign read_ports_1_buffer_bufferIn_ready = (! read_ports_1_buffer_bufferIn_rValid);
  assign read_ports_1_buffer_bufferIn_bufferOut_valid = (read_ports_1_buffer_bufferIn_valid || read_ports_1_buffer_bufferIn_rValid);
  assign read_ports_1_buffer_bufferIn_bufferOut_payload_data = (read_ports_1_buffer_bufferIn_rValid ? read_ports_1_buffer_bufferIn_rData_data : read_ports_1_buffer_bufferIn_payload_data);
  assign read_ports_1_buffer_bufferIn_bufferOut_payload_mask = (read_ports_1_buffer_bufferIn_rValid ? read_ports_1_buffer_bufferIn_rData_mask : read_ports_1_buffer_bufferIn_payload_mask);
  assign read_ports_1_buffer_bufferIn_bufferOut_payload_context = (read_ports_1_buffer_bufferIn_rValid ? read_ports_1_buffer_bufferIn_rData_context : read_ports_1_buffer_bufferIn_payload_context);
  assign io_reads_1_rsp_valid = read_ports_1_buffer_bufferIn_bufferOut_valid;
  assign read_ports_1_buffer_bufferIn_bufferOut_ready = io_reads_1_rsp_ready;
  assign io_reads_1_rsp_payload_data = read_ports_1_buffer_bufferIn_bufferOut_payload_data;
  assign io_reads_1_rsp_payload_mask = read_ports_1_buffer_bufferIn_bufferOut_payload_mask;
  assign io_reads_1_rsp_payload_context = read_ports_1_buffer_bufferIn_bufferOut_payload_context;
  assign read_ports_1_buffer_full = (read_ports_1_buffer_bufferIn_bufferOut_valid && (! read_ports_1_buffer_bufferIn_bufferOut_ready));
  assign _zz_io_reads_1_cmd_ready = (! read_ports_1_buffer_full);
  assign read_ports_1_cmd_valid = (io_reads_1_cmd_valid && _zz_io_reads_1_cmd_ready);
  assign io_reads_1_cmd_ready = (read_ports_1_cmd_ready && _zz_io_reads_1_cmd_ready);
  assign read_ports_1_cmd_payload_address = io_reads_1_cmd_payload_address;
  assign read_ports_1_cmd_payload_priority = io_reads_1_cmd_payload_priority;
  assign read_ports_1_cmd_payload_context = io_reads_1_cmd_payload_context;
  assign read_ports_2_buffer_bufferIn_valid = read_ports_2_buffer_s1_valid;
  assign read_ports_2_buffer_bufferIn_payload_context = read_ports_2_buffer_s1_payload_context;
  assign read_ports_2_buffer_bufferIn_payload_data = {banks_1_read_rsp_data,banks_0_read_rsp_data};
  assign read_ports_2_buffer_bufferIn_payload_mask = {banks_1_read_rsp_mask,banks_0_read_rsp_mask};
  assign read_ports_2_buffer_bufferIn_ready = (! read_ports_2_buffer_bufferIn_rValid);
  assign read_ports_2_buffer_bufferIn_bufferOut_valid = (read_ports_2_buffer_bufferIn_valid || read_ports_2_buffer_bufferIn_rValid);
  assign read_ports_2_buffer_bufferIn_bufferOut_payload_data = (read_ports_2_buffer_bufferIn_rValid ? read_ports_2_buffer_bufferIn_rData_data : read_ports_2_buffer_bufferIn_payload_data);
  assign read_ports_2_buffer_bufferIn_bufferOut_payload_mask = (read_ports_2_buffer_bufferIn_rValid ? read_ports_2_buffer_bufferIn_rData_mask : read_ports_2_buffer_bufferIn_payload_mask);
  assign read_ports_2_buffer_bufferIn_bufferOut_payload_context = (read_ports_2_buffer_bufferIn_rValid ? read_ports_2_buffer_bufferIn_rData_context : read_ports_2_buffer_bufferIn_payload_context);
  assign io_reads_2_rsp_valid = read_ports_2_buffer_bufferIn_bufferOut_valid;
  assign read_ports_2_buffer_bufferIn_bufferOut_ready = io_reads_2_rsp_ready;
  assign io_reads_2_rsp_payload_data = read_ports_2_buffer_bufferIn_bufferOut_payload_data;
  assign io_reads_2_rsp_payload_mask = read_ports_2_buffer_bufferIn_bufferOut_payload_mask;
  assign io_reads_2_rsp_payload_context = read_ports_2_buffer_bufferIn_bufferOut_payload_context;
  assign read_ports_2_buffer_full = (read_ports_2_buffer_bufferIn_bufferOut_valid && (! read_ports_2_buffer_bufferIn_bufferOut_ready));
  assign _zz_io_reads_2_cmd_ready = (! read_ports_2_buffer_full);
  assign read_ports_2_cmd_valid = (io_reads_2_cmd_valid && _zz_io_reads_2_cmd_ready);
  assign io_reads_2_cmd_ready = (read_ports_2_cmd_ready && _zz_io_reads_2_cmd_ready);
  assign read_ports_2_cmd_payload_address = io_reads_2_cmd_payload_address;
  assign read_ports_2_cmd_payload_context = io_reads_2_cmd_payload_context;
  assign read_nodes_0_1_priority = (read_ports_1_priority_value < read_ports_0_priority_value);
  assign read_nodes_1_0_priority = (! read_nodes_0_1_priority);
  assign read_nodes_0_1_conflict = ((read_ports_0_cmd_valid && read_ports_1_cmd_valid) && (((read_ports_0_cmd_payload_address ^ io_reads_1_cmd_payload_address) & 11'h001) == 11'h0));
  assign read_nodes_1_0_conflict = read_nodes_0_1_conflict;
  assign read_nodes_0_2_priority = 1'b0;
  assign read_nodes_2_0_priority = 1'b1;
  assign read_nodes_0_2_conflict = ((read_ports_0_cmd_valid && read_ports_2_cmd_valid) && (((read_ports_0_cmd_payload_address ^ io_reads_2_cmd_payload_address) & 11'h0) == 11'h0));
  assign read_nodes_2_0_conflict = read_nodes_0_2_conflict;
  assign read_nodes_1_2_priority = 1'b0;
  assign read_nodes_2_1_priority = 1'b1;
  assign read_nodes_1_2_conflict = ((read_ports_1_cmd_valid && read_ports_2_cmd_valid) && (((read_ports_1_cmd_payload_address ^ io_reads_2_cmd_payload_address) & 11'h0) == 11'h0));
  assign read_nodes_2_1_conflict = read_nodes_1_2_conflict;
  assign read_arbiter_0_losedAgainst = {(read_nodes_0_2_conflict && (! read_nodes_0_2_priority)),(read_nodes_0_1_conflict && (! read_nodes_0_1_priority))};
  assign read_arbiter_0_doIt = (read_ports_0_cmd_valid && (read_arbiter_0_losedAgainst == 2'b00));
  assign when_MemoryCore_l223 = (read_arbiter_0_doIt && (_zz_when_MemoryCore_l223[0 : 0] == 1'b0));
  always @(*) begin
    if(when_MemoryCore_l223) begin
      _zz_banks_0_readOr_value_valid = 1'b1;
    end else begin
      _zz_banks_0_readOr_value_valid = 1'b0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l223) begin
      _zz_banks_0_readOr_value_valid_1 = (read_ports_0_cmd_payload_address >>> 1);
    end else begin
      _zz_banks_0_readOr_value_valid_1 = 10'h0;
    end
  end

  assign when_MemoryCore_l223_1 = (read_arbiter_0_doIt && (_zz_when_MemoryCore_l223_1[0 : 0] == 1'b0));
  always @(*) begin
    if(when_MemoryCore_l223_1) begin
      _zz_banks_1_readOr_value_valid = 1'b1;
    end else begin
      _zz_banks_1_readOr_value_valid = 1'b0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l223_1) begin
      _zz_banks_1_readOr_value_valid_1 = (read_ports_0_cmd_payload_address >>> 1);
    end else begin
      _zz_banks_1_readOr_value_valid_1 = 10'h0;
    end
  end

  assign read_ports_0_cmd_ready = read_arbiter_0_doIt;
  assign read_ports_0_buffer_s0_valid = read_arbiter_0_doIt;
  assign read_ports_0_buffer_s0_payload_context = read_ports_0_cmd_payload_context;
  assign read_ports_0_buffer_s0_payload_address = read_ports_0_cmd_payload_address;
  assign read_arbiter_1_losedAgainst = {(read_nodes_1_2_conflict && (! read_nodes_1_2_priority)),(read_nodes_1_0_conflict && (! read_nodes_1_0_priority))};
  assign read_arbiter_1_doIt = (read_ports_1_cmd_valid && (read_arbiter_1_losedAgainst == 2'b00));
  assign when_MemoryCore_l223_2 = (read_arbiter_1_doIt && (_zz_when_MemoryCore_l223_2[0 : 0] == 1'b0));
  always @(*) begin
    if(when_MemoryCore_l223_2) begin
      _zz_banks_0_readOr_value_valid_2 = 1'b1;
    end else begin
      _zz_banks_0_readOr_value_valid_2 = 1'b0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l223_2) begin
      _zz_banks_0_readOr_value_valid_3 = (read_ports_1_cmd_payload_address >>> 1);
    end else begin
      _zz_banks_0_readOr_value_valid_3 = 10'h0;
    end
  end

  assign when_MemoryCore_l223_3 = (read_arbiter_1_doIt && (_zz_when_MemoryCore_l223_3[0 : 0] == 1'b0));
  always @(*) begin
    if(when_MemoryCore_l223_3) begin
      _zz_banks_1_readOr_value_valid_2 = 1'b1;
    end else begin
      _zz_banks_1_readOr_value_valid_2 = 1'b0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l223_3) begin
      _zz_banks_1_readOr_value_valid_3 = (read_ports_1_cmd_payload_address >>> 1);
    end else begin
      _zz_banks_1_readOr_value_valid_3 = 10'h0;
    end
  end

  assign read_ports_1_cmd_ready = read_arbiter_1_doIt;
  assign read_ports_1_buffer_s0_valid = read_arbiter_1_doIt;
  assign read_ports_1_buffer_s0_payload_context = read_ports_1_cmd_payload_context;
  assign read_ports_1_buffer_s0_payload_address = read_ports_1_cmd_payload_address;
  assign read_arbiter_2_losedAgainst = {(read_nodes_2_1_conflict && (! read_nodes_2_1_priority)),(read_nodes_2_0_conflict && (! read_nodes_2_0_priority))};
  assign read_arbiter_2_doIt = (read_ports_2_cmd_valid && (read_arbiter_2_losedAgainst == 2'b00));
  assign when_MemoryCore_l223_4 = (read_arbiter_2_doIt && 1'b1);
  always @(*) begin
    if(when_MemoryCore_l223_4) begin
      _zz_banks_0_readOr_value_valid_4 = 1'b1;
    end else begin
      _zz_banks_0_readOr_value_valid_4 = 1'b0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l223_4) begin
      _zz_banks_0_readOr_value_valid_5 = (read_ports_2_cmd_payload_address >>> 1);
    end else begin
      _zz_banks_0_readOr_value_valid_5 = 10'h0;
    end
  end

  assign when_MemoryCore_l223_5 = (read_arbiter_2_doIt && 1'b1);
  always @(*) begin
    if(when_MemoryCore_l223_5) begin
      _zz_banks_1_readOr_value_valid_4 = 1'b1;
    end else begin
      _zz_banks_1_readOr_value_valid_4 = 1'b0;
    end
  end

  always @(*) begin
    if(when_MemoryCore_l223_5) begin
      _zz_banks_1_readOr_value_valid_5 = (read_ports_2_cmd_payload_address >>> 1);
    end else begin
      _zz_banks_1_readOr_value_valid_5 = 10'h0;
    end
  end

  assign read_ports_2_cmd_ready = read_arbiter_2_doIt;
  assign read_ports_2_buffer_s0_valid = read_arbiter_2_doIt;
  assign read_ports_2_buffer_s0_payload_context = read_ports_2_cmd_payload_context;
  assign read_ports_2_buffer_s0_payload_address = read_ports_2_cmd_payload_address;
  assign _zz_banks_0_writeOr_value_valid_12 = (({{{_zz_banks_0_writeOr_value_valid_3,_zz_banks_0_writeOr_value_valid_2},_zz_banks_0_writeOr_value_valid_1},_zz_banks_0_writeOr_value_valid} | {{{_zz_banks_0_writeOr_value_valid_7,_zz_banks_0_writeOr_value_valid_6},_zz_banks_0_writeOr_value_valid_5},_zz_banks_0_writeOr_value_valid_4}) | {{{_zz_banks_0_writeOr_value_valid_11,_zz_banks_0_writeOr_value_valid_10},_zz_banks_0_writeOr_value_valid_9},_zz_banks_0_writeOr_value_valid_8});
  assign banks_0_writeOr_value_valid = _zz_banks_0_writeOr_value_valid_12[0];
  assign _zz_banks_0_writeOr_value_payload_address = _zz_banks_0_writeOr_value_valid_12[82 : 1];
  assign banks_0_writeOr_value_payload_address = _zz_banks_0_writeOr_value_payload_address[9 : 0];
  assign _zz_banks_0_writeOr_value_payload_data_data = _zz_banks_0_writeOr_value_payload_address[81 : 10];
  assign banks_0_writeOr_value_payload_data_data = _zz_banks_0_writeOr_value_payload_data_data[63 : 0];
  assign banks_0_writeOr_value_payload_data_mask = _zz_banks_0_writeOr_value_payload_data_data[71 : 64];
  assign _zz_banks_0_readOr_value_valid_6 = (({_zz_banks_0_readOr_value_valid_1,_zz_banks_0_readOr_value_valid} | {_zz_banks_0_readOr_value_valid_3,_zz_banks_0_readOr_value_valid_2}) | {_zz_banks_0_readOr_value_valid_5,_zz_banks_0_readOr_value_valid_4});
  assign banks_0_readOr_value_valid = _zz_banks_0_readOr_value_valid_6[0];
  assign banks_0_readOr_value_payload = _zz_banks_0_readOr_value_valid_6[10 : 1];
  assign _zz_banks_1_writeOr_value_valid_12 = (({{{_zz_banks_1_writeOr_value_valid_3,_zz_banks_1_writeOr_value_valid_2},_zz_banks_1_writeOr_value_valid_1},_zz_banks_1_writeOr_value_valid} | {{{_zz_banks_1_writeOr_value_valid_7,_zz_banks_1_writeOr_value_valid_6},_zz_banks_1_writeOr_value_valid_5},_zz_banks_1_writeOr_value_valid_4}) | {{{_zz_banks_1_writeOr_value_valid_11,_zz_banks_1_writeOr_value_valid_10},_zz_banks_1_writeOr_value_valid_9},_zz_banks_1_writeOr_value_valid_8});
  assign banks_1_writeOr_value_valid = _zz_banks_1_writeOr_value_valid_12[0];
  assign _zz_banks_1_writeOr_value_payload_address = _zz_banks_1_writeOr_value_valid_12[82 : 1];
  assign banks_1_writeOr_value_payload_address = _zz_banks_1_writeOr_value_payload_address[9 : 0];
  assign _zz_banks_1_writeOr_value_payload_data_data = _zz_banks_1_writeOr_value_payload_address[81 : 10];
  assign banks_1_writeOr_value_payload_data_data = _zz_banks_1_writeOr_value_payload_data_data[63 : 0];
  assign banks_1_writeOr_value_payload_data_mask = _zz_banks_1_writeOr_value_payload_data_data[71 : 64];
  assign _zz_banks_1_readOr_value_valid_6 = (({_zz_banks_1_readOr_value_valid_1,_zz_banks_1_readOr_value_valid} | {_zz_banks_1_readOr_value_valid_3,_zz_banks_1_readOr_value_valid_2}) | {_zz_banks_1_readOr_value_valid_5,_zz_banks_1_readOr_value_valid_4});
  assign banks_1_readOr_value_valid = _zz_banks_1_readOr_value_valid_6[0];
  assign banks_1_readOr_value_payload = _zz_banks_1_readOr_value_valid_6[10 : 1];
  always @(posedge clk) begin
    if(io_writes_0_cmd_valid) begin
      write_ports_0_priority_value <= (write_ports_0_priority_value + _zz_write_ports_0_priority_value);
      if(io_writes_0_cmd_ready) begin
        write_ports_0_priority_value <= 8'h0;
      end
    end
    if(io_writes_1_cmd_valid) begin
      write_ports_1_priority_value <= (write_ports_1_priority_value + _zz_write_ports_1_priority_value);
      if(io_writes_1_cmd_ready) begin
        write_ports_1_priority_value <= 8'h0;
      end
    end
    io_writes_0_cmd_payload_context_regNext <= io_writes_0_cmd_payload_context;
    io_writes_1_cmd_payload_context_regNext <= io_writes_1_cmd_payload_context;
    io_writes_2_cmd_payload_context_regNext <= io_writes_2_cmd_payload_context;
    read_ports_0_buffer_s1_payload_context <= read_ports_0_buffer_s0_payload_context;
    read_ports_0_buffer_s1_payload_address <= read_ports_0_buffer_s0_payload_address;
    if(read_ports_0_buffer_bufferIn_ready) begin
      read_ports_0_buffer_bufferIn_rData_data <= read_ports_0_buffer_bufferIn_payload_data;
      read_ports_0_buffer_bufferIn_rData_mask <= read_ports_0_buffer_bufferIn_payload_mask;
      read_ports_0_buffer_bufferIn_rData_context <= read_ports_0_buffer_bufferIn_payload_context;
    end
    if(read_ports_0_cmd_valid) begin
      read_ports_0_priority_value <= (read_ports_0_priority_value + _zz_read_ports_0_priority_value);
      if(read_ports_0_cmd_ready) begin
        read_ports_0_priority_value <= 8'h0;
      end
    end
    read_ports_1_buffer_s1_payload_context <= read_ports_1_buffer_s0_payload_context;
    read_ports_1_buffer_s1_payload_address <= read_ports_1_buffer_s0_payload_address;
    if(read_ports_1_buffer_bufferIn_ready) begin
      read_ports_1_buffer_bufferIn_rData_data <= read_ports_1_buffer_bufferIn_payload_data;
      read_ports_1_buffer_bufferIn_rData_mask <= read_ports_1_buffer_bufferIn_payload_mask;
      read_ports_1_buffer_bufferIn_rData_context <= read_ports_1_buffer_bufferIn_payload_context;
    end
    if(read_ports_1_cmd_valid) begin
      read_ports_1_priority_value <= (read_ports_1_priority_value + _zz_read_ports_1_priority_value);
      if(read_ports_1_cmd_ready) begin
        read_ports_1_priority_value <= 8'h0;
      end
    end
    read_ports_2_buffer_s1_payload_context <= read_ports_2_buffer_s0_payload_context;
    read_ports_2_buffer_s1_payload_address <= read_ports_2_buffer_s0_payload_address;
    if(read_ports_2_buffer_bufferIn_ready) begin
      read_ports_2_buffer_bufferIn_rData_data <= read_ports_2_buffer_bufferIn_payload_data;
      read_ports_2_buffer_bufferIn_rData_mask <= read_ports_2_buffer_bufferIn_payload_mask;
      read_ports_2_buffer_bufferIn_rData_context <= read_ports_2_buffer_bufferIn_payload_context;
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      write_arbiter_0_doIt_regNext <= 1'b0;
      write_arbiter_1_doIt_regNext <= 1'b0;
      write_arbiter_2_doIt_regNext <= 1'b0;
      read_ports_0_buffer_s1_valid <= 1'b0;
      read_ports_0_buffer_bufferIn_rValid <= 1'b0;
      read_ports_1_buffer_s1_valid <= 1'b0;
      read_ports_1_buffer_bufferIn_rValid <= 1'b0;
      read_ports_2_buffer_s1_valid <= 1'b0;
      read_ports_2_buffer_bufferIn_rValid <= 1'b0;
    end else begin
      write_arbiter_0_doIt_regNext <= write_arbiter_0_doIt;
      write_arbiter_1_doIt_regNext <= write_arbiter_1_doIt;
      write_arbiter_2_doIt_regNext <= write_arbiter_2_doIt;
      read_ports_0_buffer_s1_valid <= read_ports_0_buffer_s0_valid;
      if(read_ports_0_buffer_bufferIn_valid) begin
        read_ports_0_buffer_bufferIn_rValid <= 1'b1;
      end
      if(read_ports_0_buffer_bufferIn_bufferOut_ready) begin
        read_ports_0_buffer_bufferIn_rValid <= 1'b0;
      end
      read_ports_1_buffer_s1_valid <= read_ports_1_buffer_s0_valid;
      if(read_ports_1_buffer_bufferIn_valid) begin
        read_ports_1_buffer_bufferIn_rValid <= 1'b1;
      end
      if(read_ports_1_buffer_bufferIn_bufferOut_ready) begin
        read_ports_1_buffer_bufferIn_rValid <= 1'b0;
      end
      read_ports_2_buffer_s1_valid <= read_ports_2_buffer_s0_valid;
      if(read_ports_2_buffer_bufferIn_valid) begin
        read_ports_2_buffer_bufferIn_rValid <= 1'b1;
      end
      if(read_ports_2_buffer_bufferIn_bufferOut_ready) begin
        read_ports_2_buffer_bufferIn_rValid <= 1'b0;
      end
    end
  end


endmodule

module EfxDMA_StreamFifo_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [14:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [14:0]   io_pop_payload,
  input               io_flush,
  output reg [2:0]    io_occupancy,
  output reg [2:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [14:0]   _zz_logic_ram_port0;
  wire       [2:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [2:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [2:0]    _zz_io_occupancy;
  wire       [2:0]    _zz_io_availability;
  wire       [2:0]    _zz_io_availability_1;
  wire       [2:0]    _zz_io_availability_2;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l933;
  wire       [2:0]    logic_ptrDif;
  reg [14:0] logic_ram [0:6];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {2'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {2'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_occupancy = (3'b111 + logic_ptrDif);
  assign _zz_io_availability = (3'b111 + _zz_io_availability_1);
  assign _zz_io_availability_1 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_availability_2 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b110);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    if(logic_pushPtr_willOverflow) begin
      logic_pushPtr_valueNext = 3'b000;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    end
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 3'b000;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b110);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    if(logic_popPtr_willOverflow) begin
      logic_popPtr_valueNext = 3'b000;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    end
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 3'b000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  always @(*) begin
    if(logic_ptrMatch) begin
      io_occupancy = (logic_risingOccupancy ? 3'b111 : 3'b000);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_io_occupancy);
    end
  end

  always @(*) begin
    if(logic_ptrMatch) begin
      io_availability = (logic_risingOccupancy ? 3'b000 : 3'b111);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_io_availability : _zz_io_availability_2);
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module EfxDMA_StreamFork_1 (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_last,
  input      [0:0]    io_input_payload_fragment_opcode,
  input      [31:0]   io_input_payload_fragment_address,
  input      [11:0]   io_input_payload_fragment_length,
  input      [127:0]  io_input_payload_fragment_data,
  input      [15:0]   io_input_payload_fragment_mask,
  input      [14:0]   io_input_payload_fragment_context,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output              io_outputs_0_payload_last,
  output     [0:0]    io_outputs_0_payload_fragment_opcode,
  output     [31:0]   io_outputs_0_payload_fragment_address,
  output     [11:0]   io_outputs_0_payload_fragment_length,
  output     [127:0]  io_outputs_0_payload_fragment_data,
  output     [15:0]   io_outputs_0_payload_fragment_mask,
  output     [14:0]   io_outputs_0_payload_fragment_context,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output              io_outputs_1_payload_last,
  output     [0:0]    io_outputs_1_payload_fragment_opcode,
  output     [31:0]   io_outputs_1_payload_fragment_address,
  output     [11:0]   io_outputs_1_payload_fragment_length,
  output     [127:0]  io_outputs_1_payload_fragment_data,
  output     [15:0]   io_outputs_1_payload_fragment_mask,
  output     [14:0]   io_outputs_1_payload_fragment_context,
  input               clk,
  input               reset
);
  reg                 _zz_io_outputs_0_valid;
  reg                 _zz_io_outputs_1_valid;
  wire                when_Stream_l806;
  wire                when_Stream_l806_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l806) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l806_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l806 = ((! io_outputs_0_ready) && _zz_io_outputs_0_valid);
  assign when_Stream_l806_1 = ((! io_outputs_1_ready) && _zz_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && _zz_io_outputs_0_valid);
  assign io_outputs_0_payload_last = io_input_payload_last;
  assign io_outputs_0_payload_fragment_opcode = io_input_payload_fragment_opcode;
  assign io_outputs_0_payload_fragment_address = io_input_payload_fragment_address;
  assign io_outputs_0_payload_fragment_length = io_input_payload_fragment_length;
  assign io_outputs_0_payload_fragment_data = io_input_payload_fragment_data;
  assign io_outputs_0_payload_fragment_mask = io_input_payload_fragment_mask;
  assign io_outputs_0_payload_fragment_context = io_input_payload_fragment_context;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && _zz_io_outputs_1_valid);
  assign io_outputs_1_payload_last = io_input_payload_last;
  assign io_outputs_1_payload_fragment_opcode = io_input_payload_fragment_opcode;
  assign io_outputs_1_payload_fragment_address = io_input_payload_fragment_address;
  assign io_outputs_1_payload_fragment_length = io_input_payload_fragment_length;
  assign io_outputs_1_payload_fragment_data = io_input_payload_fragment_data;
  assign io_outputs_1_payload_fragment_mask = io_input_payload_fragment_mask;
  assign io_outputs_1_payload_fragment_context = io_input_payload_fragment_context;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge clk) begin
    if(reset) begin
      _zz_io_outputs_0_valid <= 1'b1;
      _zz_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        _zz_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        _zz_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        _zz_io_outputs_0_valid <= 1'b1;
        _zz_io_outputs_1_valid <= 1'b1;
      end
    end
  end


endmodule

module EfxDMA_StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [22:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [22:0]   io_pop_payload,
  input               io_flush,
  output reg [2:0]    io_occupancy,
  output reg [2:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [22:0]   _zz_logic_ram_port0;
  wire       [2:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [2:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [2:0]    _zz_io_occupancy;
  wire       [2:0]    _zz_io_availability;
  wire       [2:0]    _zz_io_availability_1;
  wire       [2:0]    _zz_io_availability_2;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l933;
  wire       [2:0]    logic_ptrDif;
  reg [22:0] logic_ram [0:6];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {2'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {2'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_occupancy = (3'b111 + logic_ptrDif);
  assign _zz_io_availability = (3'b111 + _zz_io_availability_1);
  assign _zz_io_availability_1 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_availability_2 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b110);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    if(logic_pushPtr_willOverflow) begin
      logic_pushPtr_valueNext = 3'b000;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    end
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 3'b000;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b110);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    if(logic_popPtr_willOverflow) begin
      logic_popPtr_valueNext = 3'b000;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    end
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 3'b000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  always @(*) begin
    if(logic_ptrMatch) begin
      io_occupancy = (logic_risingOccupancy ? 3'b111 : 3'b000);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_io_occupancy);
    end
  end

  always @(*) begin
    if(logic_ptrMatch) begin
      io_availability = (logic_risingOccupancy ? 3'b000 : 3'b111);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_io_availability : _zz_io_availability_2);
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module EfxDMA_StreamFork (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_last,
  input      [0:0]    io_input_payload_fragment_opcode,
  input      [31:0]   io_input_payload_fragment_address,
  input      [11:0]   io_input_payload_fragment_length,
  input      [22:0]   io_input_payload_fragment_context,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output              io_outputs_0_payload_last,
  output     [0:0]    io_outputs_0_payload_fragment_opcode,
  output     [31:0]   io_outputs_0_payload_fragment_address,
  output     [11:0]   io_outputs_0_payload_fragment_length,
  output     [22:0]   io_outputs_0_payload_fragment_context,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output              io_outputs_1_payload_last,
  output     [0:0]    io_outputs_1_payload_fragment_opcode,
  output     [31:0]   io_outputs_1_payload_fragment_address,
  output     [11:0]   io_outputs_1_payload_fragment_length,
  output     [22:0]   io_outputs_1_payload_fragment_context,
  input               clk,
  input               reset
);
  reg                 _zz_io_outputs_0_valid;
  reg                 _zz_io_outputs_1_valid;
  wire                when_Stream_l806;
  wire                when_Stream_l806_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l806) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l806_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l806 = ((! io_outputs_0_ready) && _zz_io_outputs_0_valid);
  assign when_Stream_l806_1 = ((! io_outputs_1_ready) && _zz_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && _zz_io_outputs_0_valid);
  assign io_outputs_0_payload_last = io_input_payload_last;
  assign io_outputs_0_payload_fragment_opcode = io_input_payload_fragment_opcode;
  assign io_outputs_0_payload_fragment_address = io_input_payload_fragment_address;
  assign io_outputs_0_payload_fragment_length = io_input_payload_fragment_length;
  assign io_outputs_0_payload_fragment_context = io_input_payload_fragment_context;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && _zz_io_outputs_1_valid);
  assign io_outputs_1_payload_last = io_input_payload_last;
  assign io_outputs_1_payload_fragment_opcode = io_input_payload_fragment_opcode;
  assign io_outputs_1_payload_fragment_address = io_input_payload_fragment_address;
  assign io_outputs_1_payload_fragment_length = io_input_payload_fragment_length;
  assign io_outputs_1_payload_fragment_context = io_input_payload_fragment_context;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge clk) begin
    if(reset) begin
      _zz_io_outputs_0_valid <= 1'b1;
      _zz_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        _zz_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        _zz_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        _zz_io_outputs_0_valid <= 1'b1;
        _zz_io_outputs_1_valid <= 1'b1;
      end
    end
  end


endmodule

//EfxDMA_BufferCC replaced by EfxDMA_BufferCC

module EfxDMA_BufferCC_1 (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk) begin
    if(reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module EfxDMA_BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               ctrl_clk,
  input               ctrl_reset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge ctrl_clk) begin
    if(ctrl_reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule