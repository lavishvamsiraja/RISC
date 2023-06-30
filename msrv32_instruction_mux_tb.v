module msrv32_instruction_mux_tb;

  // Inputs
  reg flush_in;
  reg [31:0] ms_riscv32_mp_instr_in;

  // Outputs
  wire [6:0] opcode_out;
  wire [2:0] funct3_out;
  wire [6:0] funct7_out;
  wire [4:0] rs1addr_out, rs2addr_out, rdaddr_out;
  wire [11:0] csr_addr_out;
  wire [24:0] instr_out;

  // Instantiate the unit under test (UUT)
  msrv32_instruction_mux uut (
    .flush_in(flush_in),
    .ms_riscv32_mp_instr_in(ms_riscv32_mp_instr_in),
    .opcode_out(opcode_out),
    .funct3_out(funct3_out),
    .funct7_out(funct7_out),
    .rs1addr_out(rs1addr_out),
    .rs2addr_out(rs2addr_out),
    .rdaddr_out(rdaddr_out),
    .csr_addr_out(csr_addr_out),
    .instr_out(instr_out)
  );

  // Test stimulus
  initial begin
    // Set initial values
    flush_in = 0;
    ms_riscv32_mp_instr_in = 32'h00000013;

    // Wait for a few clock cycles
    #10;

    // Test case 1
    flush_in = 1;
    ms_riscv32_mp_instr_in = 32'h12345678;

    #10;
    // Verify the outputs
    $display("opcode_out = %h", opcode_out);
    $display("funct3_out = %h", funct3_out);
    $display("funct7_out = %h", funct7_out);
    $display("rs1addr_out = %h", rs1addr_out);
    $display("rs2addr_out = %h", rs2addr_out);
    $display("rdaddr_out = %h", rdaddr_out);
    $display("csr_addr_out = %h", csr_addr_out);
    $display("instr_out = %h", instr_out);

    // Test case 2
    flush_in = 0;
    ms_riscv32_mp_instr_in = 32'h87654321;

    #10;
    // Verify the outputs
    $display("opcode_out = %h", opcode_out);
    $display("funct3_out = %h", funct3_out);
    $display("funct7_out = %h", funct7_out);
    $display("rs1addr_out = %h", rs1addr_out);
    $display("rs2addr_out = %h", rs2addr_out);
    $display("rdaddr_out = %h", rdaddr_out);
    $display("csr_addr_out = %h", csr_addr_out);
    $display("instr_out = %h", instr_out);

    // Add more test cases if needed

    // End the simulation
    $finish;
  end

endmodule

