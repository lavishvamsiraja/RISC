module msrv32_wr_en_generator_tb();
	
	reg flush_in;
	reg rf_wr_en_reg_in;
	reg csr_wr_en_reg_in;
	wire wr_en_integer_file_out;
	wire wr_en_csr_file_out;
	
	msrv32_wr_en_generator dut (
		.flush_in(flush_in),
		.rf_wr_en_reg_in(rf_wr_en_reg_in),
		.csr_wr_en_reg_in(csr_wr_en_reg_in),
		.wr_en_integer_file_out(wr_en_integer_file_out),
		.wr_en_csr_file_out(wr_en_csr_file_out)
	);
	
	initial begin
		// Test case 1
		flush_in = 0;
		rf_wr_en_reg_in = 1;
		csr_wr_en_reg_in = 0;
		#10;
		
		// Test case 2
		flush_in = 1;
		rf_wr_en_reg_in = 0;
		csr_wr_en_reg_in = 1;
		#10;
		
		// Test case 3
		flush_in = 0;
		rf_wr_en_reg_in = 0;
		csr_wr_en_reg_in = 1;
		#10;
		//test case 4
		flush_in = 0;
		rf_wr_en_reg_in = 1;
		csr_wr_en_reg_in = 0;
		#10;

		
		// Add more test cases as needed
		
		$finish;
	end
	
endmodule

