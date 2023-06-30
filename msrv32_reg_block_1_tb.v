module msrv32_reg_block_1_tb();
reg[31:0] pc_mux_in;
reg ms_riscv32_mp_clk_in,ms_riscv32_mp_rst_in;
wire[31:0] pc_out;
msrv32_reg_block_1 DUT(.pc_mux_in(pc_mux_in),.ms_riscv32_mp_clk_in(ms_riscv32_mp_clk_in),
.ms_riscv32_mp_rst_in(ms_riscv32_mp_rst_in),.pc_out(pc_out));

initial
begin
 	ms_riscv32_mp_clk_in= 1'b0;
	forever
	#5 ms_riscv32_mp_clk_in=~ms_riscv32_mp_clk_in;
end

task rst;
begin
@(negedge ms_riscv32_mp_clk_in)
	ms_riscv32_mp_rst_in=1'b1;
@(negedge ms_riscv32_mp_clk_in)
	ms_riscv32_mp_rst_in=1'b0;
end
endtask
initial
begin
	rst;
	@(negedge ms_riscv32_mp_clk_in)
	pc_mux_in=32'd10;
end

initial $monitor("pc_in=%d,pc_out=%d",pc_mux_in,pc_out);

endmodule
	
