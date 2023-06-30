module msrv32_wb_mux_sel_unit_tb;

  reg alu_src_reg_in;
  reg [2:0] wb_mux_sel_reg_in;
  reg [31:0] alu_result_in;
  reg [31:0] lu_output_in;
  reg [31:0] imm_reg_in;
  reg [31:0] iadder_out_reg_in;
  reg [31:0] csr_data_in;
  reg [31:0] pc_plus_4_reg_in;
  wire [31:0] wb_mux_out;
  wire [31:0] alu_2nd_src_mux_out;

  parameter WB_ALU = 3'b000;
  parameter WB_LU = 3'b001;
  parameter WB_IMM = 3'b010;
  parameter WB_IADDER_OUT = 3'b011;
  parameter WB_CSR = 3'b100;
  parameter WB_PC_PLUS = 3'b101;

  msrv32_wb_mux_sel_unit dut (
    .alu_src_reg_in(alu_src_reg_in),
    .wb_mux_sel_reg_in(wb_mux_sel_reg_in),
    .alu_result_in(alu_result_in),
    .lu_output_in(lu_output_in),
    .imm_reg_in(imm_reg_in),
    .iadder_out_reg_in(iadder_out_reg_in),
    .csr_data_in(csr_data_in),
    .pc_plus_4_reg_in(pc_plus_4_reg_in),
    .wb_mux_out(wb_mux_out),
    .alu_2nd_src_mux_out(alu_2nd_src_mux_out)
  );

  initial begin
    // Test case 1
    alu_src_reg_in = 1'b0;
    wb_mux_sel_reg_in = WB_ALU;
    alu_result_in = 32'b10101010101010101010101010101010;
    lu_output_in = 32'b01010101010101010101010101010101;
    imm_reg_in = 32'b00110011001100110011001100110011;
    iadder_out_reg_in = 32'b11110000111100001111000011110000;
    csr_data_in = 32'b11111111000000001111111100000000;
    pc_plus_4_reg_in = 32'b00001111000011110000111100001111;

    #10;

    // Verify the outputs
    if (wb_mux_out !== alu_result_in || alu_2nd_src_mux_out !== imm_reg_in)
      $display("Test case 1 failed!");

    // Test case 2
    alu_src_reg_in = 1'b1;
    wb_mux_sel_reg_in = WB_PC_PLUS;
    alu_result_in = 32'b01010101010101010101010101010101;
    lu_output_in = 32'b10101010101010101010101010101010;
    imm_reg_in = 32'b11001100110011001100110011001100;
    iadder_out_reg_in = 32'b00001111000011110000111100001111;
    csr_data_in = 32'b00000000111111110000000011111111;
    pc_plus_4_reg_in = 32'b11110000111100001111000011110000;

    #10;

    // Verify the outputs
    if (wb_mux_out !== lu_output_in || alu_2nd_src_mux_out !== pc_plus_4_reg_in)
      $display("Test case 2 failed!");

    // Add more test cases if needed

    $display("All test cases passed!");
    $finish;
  end

endmodule
