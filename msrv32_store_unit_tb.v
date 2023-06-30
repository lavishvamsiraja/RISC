module msrv32_store_unit_tb;

  reg [1:0] funct3_in;
  reg [31:0] iadder_in, rs2_in;
  reg mem_wr_req_in, ahb_ready_in;
  wire [31:0] ms_riscv32_mp_dmaddr_out, ms_riscv32_mp_dmdata_out;
  wire [3:0] ms_riscv32_mp_dmwr_mask_out;
  wire ms_riscv32_mp_dmwr_req_out;
  wire[1:0] ahb_htrans_out;

  msrv32_store_unit dut (
    .funct3_in(funct3_in),
    .iadder_in(iadder_in),
    .rs2_in(rs2_in),
    .mem_wr_req_in(mem_wr_req_in),
    .ahb_ready_in(ahb_ready_in),
    .ms_riscv32_mp_dmaddr_out(ms_riscv32_mp_dmaddr_out),
    .ms_riscv32_mp_dmdata_out(ms_riscv32_mp_dmdata_out),
    .ms_riscv32_mp_dmwr_mask_out(ms_riscv32_mp_dmwr_mask_out),
    .ms_riscv32_mp_dmwr_req_out(ms_riscv32_mp_dmwr_req_out),
    .ahb_htrans_out(ahb_htrans_out)
  );

  // Stimulus
  initial begin
    funct3_in = 2'b00;
    iadder_in = 32'h12345678;
    rs2_in = 32'hAABBCCDD;
    mem_wr_req_in = 1'b1;
    ahb_ready_in = 1'b1;

    #10;

    // Change inputs
    funct3_in = 2'b01;
    iadder_in = 32'h87654321;
    rs2_in = 32'h11223344;
    mem_wr_req_in = 1'b0;
    ahb_ready_in = 1'b0;

    #10;
   // Change inputs
    funct3_in = 2'b01;
    iadder_in = 32'h87654321;
    rs2_in = 32'h11223344;
    mem_wr_req_in = 1'b1;
    ahb_ready_in = 1'b1;
    #10;
   // Change inputs
    funct3_in = 2'b10;
    iadder_in = 32'h87654321;
    rs2_in = 32'h11223344;
    mem_wr_req_in = 1'b1;
    ahb_ready_in = 1'b1;
    #10;
   // Change inputs
    funct3_in = 2'b11;
    iadder_in = 32'h87654321;
    rs2_in = 32'h11223344;
    mem_wr_req_in = 1'b1;
    ahb_ready_in = 1'b1;

    #10;

    // Add more test cases here

    $finish;
  end

endmodule

