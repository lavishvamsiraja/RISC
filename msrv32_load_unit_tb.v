module msrv32_load_unit_tb;
  reg ahb_resp_in;
  reg load_unsigned_in;
  reg [1:0] iadder_out_1_to_0_in;
  reg [1:0] load_size_in;
  reg [31:0] ms_riscv32_mp_dmdata_in;
  wire [31:0] lu_output_in;

  msrv32_load_unit dut (
    .ahb_resp_in(ahb_resp_in),
    .load_unsigned_in(load_unsigned_in),
    .iadder_out_1_to_0_in(iadder_out_1_to_0_in),
    .load_size_in(load_size_in),
    .ms_riscv32_mp_dmdata_in(ms_riscv32_mp_dmdata_in),
    .lu_output_in(lu_output_in)
  );

  initial 
  begin
    // Initialize inputs
    ahb_resp_in = 0;
    load_unsigned_in = 0;
    iadder_out_1_to_0_in = 2'b00;
    load_size_in = 2'b00;
    ms_riscv32_mp_dmdata_in = 32'hA5A5A5A5;

    // Wait for a few time units for the outputs to stabilize
    #10;

    // Display initial values
    $display("Initial values:");
    $display("ahb_resp_in = %b", ahb_resp_in);
    $display("load_unsigned_in = %b", load_unsigned_in);
    $display("iadder_out_1_to_0_in = %b", iadder_out_1_to_0_in);
    $display("load_size_in = %b", load_size_in);
    $display("ms_riscv32_mp_dmdata_in = %h", ms_riscv32_mp_dmdata_in);
    $display("lu_output_in = %h", lu_output_in);

    // Toggle inputs
    #5;
    ahb_resp_in = 1;
    load_unsigned_in = 1;
    iadder_out_1_to_0_in = 2'b10;
    load_size_in = 2'b01;
    ms_riscv32_mp_dmdata_in = 32'h00045678;

    // Toggle inputs
    #5;
    ahb_resp_in = 0;
    load_unsigned_in = 0;
    iadder_out_1_to_0_in = 2'b10;
    load_size_in = 2'b01;
    ms_riscv32_mp_dmdata_in = 32'h00000008;

    // Toggle inputs
    #5;
    ahb_resp_in = 1;
    load_unsigned_in = 0;
    iadder_out_1_to_0_in = 2'b10;
    load_size_in = 2'b01;
    ms_riscv32_mp_dmdata_in = 32'h00345678;

    #5;
    ahb_resp_in = 1;
    load_unsigned_in = 0;
    iadder_out_1_to_0_in = 2'b01;
    load_size_in = 2'b01;
    ms_riscv32_mp_dmdata_in = 32'h00345678;
    // Wait for a few time units for the outputs to stabilize
    #10;

    #5;
    ahb_resp_in = 0;
    load_unsigned_in = 0;
    iadder_out_1_to_0_in = 2'b10;
    load_size_in = 2'b00;
    ms_riscv32_mp_dmdata_in = 32'h00345678;
    
    #5;
    ahb_resp_in = 0;
    load_unsigned_in = 1;
    iadder_out_1_to_0_in = 2'b11;
    load_size_in = 2'b01;
    ms_riscv32_mp_dmdata_in = 32'h00345678;

    #5;
    ahb_resp_in = 0;
    load_unsigned_in = 0;
    iadder_out_1_to_0_in = 2'b11;
    load_size_in = 2'b11;
    ms_riscv32_mp_dmdata_in = 32'h00345678;

    #5;
    ahb_resp_in = 0;
    load_unsigned_in = 1;
    iadder_out_1_to_0_in = 2'b11;
    load_size_in = 2'b10;
    ms_riscv32_mp_dmdata_in = 32'h00345678;

    // Display final values
    $monitor("Final values:");
    $monitor("ahb_resp_in = %b", ahb_resp_in);
    $monitor("load_unsigned_in = %b", load_unsigned_in);
    $monitor("iadder_out_1_to_0_in = %b", iadder_out_1_to_0_in);
    $monitor("load_size_in = %b", load_size_in);
    $monitor("ms_riscv32_mp_dmdata_in = %h", ms_riscv32_mp_dmdata_in);
    $monitor("lu_output_in = %h", lu_output_in);

    // End simulation
    $finish;
  end
endmodule

