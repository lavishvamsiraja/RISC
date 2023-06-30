module msrv32_alu_tb;

  reg [31:0] op_1_in, op_2_in;
  reg [3:0] opcode_in;
  wire [31:0] result_out;

  msrv32_alu DUT (
    .op_1_in(op_1_in),
    .op_2_in(op_2_in),
    .opcode_in(opcode_in),
    .result_out(result_out)
  );

  initial 
  begin
    // Initialize inputs
    op_1_in = 32'h00000001;
    op_2_in = 32'h00000002;
    opcode_in = 4'b0000;

    // Test case 1: Addition
    #10;
    opcode_in = 4'b0000;
    #10;

    // Test case 2: Subtraction
    #10;
    opcode_in = 4'b1000;
    #10;

    // Test case 3: Set Less Than
    #10;
    opcode_in = 4'b0011;
    #10;

    // Test case 4: Bitwise AND
    #10;
    opcode_in = 4'b0111;
    #10;

    // Test case 5: Bitwise OR
    #10;
    opcode_in = 4'b0110;
    #10;

    // Test case 6: Bitwise XOR
    #10;
    opcode_in = 4'b0100;
    #10;

    // Test case 7: Left Shift
    #10;
    opcode_in = 4'b0001;
    #10;

    // Test case 8: Right Shift
    #10;
    opcode_in = 4'b0101;
    #10;

    // Test case 9: Unsigned Right Shift
    #10;
    opcode_in = 4'b1101;
    #10;

    // End simulation
    $finish;
  end

endmodule

