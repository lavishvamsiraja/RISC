module msrv32_decoder_tb;

  // Inputs
  reg trap_taken_in;
  reg funct7_5_in;
  reg [6:0] opcode_in;
  reg [2:0] funct3_in;
  reg [1:0] iadder_out_1_to_0_in;

  // Outputs
  wire [2:0] wb_mux_sel_out;
  wire imm_type_out;
  wire csr_op_out;
  wire mem_wr_req_out;
  wire load_unsigned_out;
  wire alu_src_out;
  wire iadder_src_out;
  wire csr_wr_en_out;
  wire rf_wr_en_out;
  wire illegal_instr_out;
  wire misaligned_load_out;
  wire misaligned_store_out;
  wire [3:0] alu_opcode_out;
  wire [1:0] load_size_out;

  // Instantiate the msrv32_decoder module
  msrv32_decoder dut (
    .trap_taken_in(trap_taken_in),
    .funct7_5_in(funct7_5_in),
    .opcode_in(opcode_in),
    .funct3_in(funct3_in),
    .iadder_out_1_to_0_in(iadder_out_1_to_0_in),
    .wb_mux_sel_out(wb_mux_sel_out),
    .imm_type_out(imm_type_out),
    .csr_op_out(csr_op_out),
    .mem_wr_req_out(mem_wr_req_out),
    .load_unsigned_out(load_unsigned_out),
    .alu_src_out(alu_src_out),
    .iadder_src_out(iadder_src_out),
    .csr_wr_en_out(csr_wr_en_out),
    .rf_wr_en_out(rf_wr_en_out),
    .illegal_instr_out(illegal_instr_out),
    .misaligned_load_out(misaligned_load_out),
    .misaligned_store_out(misaligned_store_out),
    .alu_opcode_out(alu_opcode_out),
    .load_size_out(load_size_out)
  );

  // Testbench code
  initial begin
    // Test case 1
    trap_taken_in = 0;
    funct7_5_in = 0;
    opcode_in = 7'b0000000;
    funct3_in = 3'b000;
    iadder_out_1_to_0_in = 2'b00;
    #10;

    // Test case 2
    trap_taken_in = 1;
    funct7_5_in = 1;
    opcode_in = 7'b0010011;
    funct3_in = 3'b000;
    iadder_out_1_to_0_in = 2'b10;
    #10;

    // Test case 3
    trap_taken_in = 0;
    funct7_5_in = 1;
    opcode_in = 7'b0010011;
    funct3_in = 3'b001;
    iadder_out_1_to_0_in = 2'b00;
    #10;

    // Test case 4
    trap_taken_in = 0;
    funct7_5_in = 0;
    opcode_in = 7'b0110011;
    funct3_in = 3'b100;
    iadder_out_1_to_0_in = 2'b11;
    #10;

  // Test case 5
    trap_taken_in = 1;
    funct7_5_in = 0;
    opcode_in = 7'b0110011;
    funct3_in = 3'b101;
    iadder_out_1_to_0_in = 2'b01;
    #10;


  // Test case 6
    trap_taken_in = 1;
    funct7_5_in = 0;
    opcode_in = 7'b0000011;
    funct3_in = 3'b101;
    iadder_out_1_to_0_in = 2'b01;
    #10;

  // Test case 7
    trap_taken_in = 0;
    funct7_5_in = 0;
    opcode_in = 7'b0110011;
    funct3_in = 3'b100;
    iadder_out_1_to_0_in = 2'b01;
    #10;

  // Test case 8
    trap_taken_in = 0;
    funct7_5_in = 1;
    opcode_in = 7'b0110011;
    funct3_in = 3'b010;
    iadder_out_1_to_0_in = 2'b11;
    #10;

  // Test case 9
    trap_taken_in = 1;
    funct7_5_in = 0;
    opcode_in = 7'b0100011;
    funct3_in = 3'b000;
    iadder_out_1_to_0_in = 2'b00;
    #10;

  // Test case 10
    trap_taken_in = 0;
    funct7_5_in = 1;
    opcode_in = 7'b1100011;
    funct3_in = 3'b000;
    iadder_out_1_to_0_in = 2'b01;
    #10;

  // Test case 11
    trap_taken_in = 1;
    funct7_5_in = 1;
    opcode_in = 7'b1100011;
    funct3_in = 3'b100;
    iadder_out_1_to_0_in = 2'b00;
    #10;

  // Test case 12
    trap_taken_in = 1;
    funct7_5_in = 0;
    opcode_in = 7'b1101111;
    funct3_in = 3'b100;
    iadder_out_1_to_0_in = 2'b01;
    #10;

  // Test case 13
    trap_taken_in = 0;
    funct7_5_in = 0;
    opcode_in = 7'b1100111;
    funct3_in = 3'b000;
    iadder_out_1_to_0_in = 2'b11;
    #10;

  // Test case 13
    trap_taken_in = 1;
    funct7_5_in = 1;
    opcode_in = 7'b0110111;
    funct3_in = 3'b100;
    iadder_out_1_to_0_in = 2'b01;
    #10;

  // Test case 14
    trap_taken_in = 0;
    funct7_5_in = 1;
    opcode_in = 7'b0010111;
    funct3_in = 3'b100;
    iadder_out_1_to_0_in = 2'b10;
    #10;

  // Test case 14
    trap_taken_in = 0;
    funct7_5_in = 1;
    opcode_in = 7'b1110011;
    funct3_in = 3'b100;
    iadder_out_1_to_0_in = 2'b00;
    #10;
    // Add more test cases as needed

    $finish;
  end

endmodule

