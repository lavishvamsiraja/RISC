module Branch_unit_tb;

  reg [31:0] rs1_in, rs2_in;
  reg [4:0] opcode_6_to_2_in;
  reg [2:0] funct3_in;
  wire branch_taken_out;

  Branch_unit DUT (
    .rs1_in(rs1_in),
    .rs2_in(rs2_in),
    .opcode_6_to_2_in(opcode_6_to_2_in),
    .funct3_in(funct3_in),
    .branch_taken_out(branch_taken_out)
  );

  initial begin
    // Initialize inputs
    rs1_in = 32'h00000001;
    rs2_in = 32'h00000002;
    opcode_6_to_2_in = 5'b11000;
    funct3_in = 3'b000;

    // Test case 1: Branch taken
    #10;
    opcode_6_to_2_in = 5'b11011;
    #10;

    // Test case 2: Branch taken
    #10;
    opcode_6_to_2_in = 5'b11001;
    #10;

    // Test case 3: Branch not taken
    #10;
    opcode_6_to_2_in = 5'b11000;
    funct3_in = 3'b111;
    #10;

    // End simulation
    $finish;
  end
initial $monitor("branch_out=%b",branch_taken_out);
endmodule
