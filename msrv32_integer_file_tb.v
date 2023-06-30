module msrv32_integer_file_tb();

reg [4:0] rs_1_addr_in, rs_2_addr_in, rd_addr_in;
reg [31:0] rd_in;
reg ms_riscv32_mp_clk_in, ms_riscv32_mp_rst_in, wr_en_in;
wire [31:0] rs_1_out, rs_2_out;

msrv32_integer_file DUT (.ms_riscv32_mp_clk_in(ms_riscv32_mp_clk_in), .ms_riscv32_mp_rst_in(ms_riscv32_mp_rst_in), 
                         .rs_1_addr_in(rs_1_addr_in), .rs_2_addr_in(rs_2_addr_in), .rd_in(rd_in), .rd_addr_in(rd_addr_in), 
                         .wr_en_in(wr_en_in), .rs_1_out(rs_1_out), .rs_2_out(rs_2_out));

initial
begin
  wr_en_in = 1'b1;
  rd_in = 32'h48484848;
end


initial
begin
  ms_riscv32_mp_clk_in = 1'b0;
  forever #10 ms_riscv32_mp_clk_in = ~ms_riscv32_mp_clk_in;
end

task reset();
begin
   ms_riscv32_mp_rst_in = 1'b1;
   #10;
   ms_riscv32_mp_rst_in = 1'b0;
end
endtask

task do (input [4:0] a,b,c);
begin
  rs_1_addr_in = a;
  rs_2_addr_in = b;
  rd_addr_in  = c;
  @(negedge ms_riscv32_mp_clk_in or negedge ms_riscv32_mp_rst_in)
     rd_addr_in = c;
end
endtask

initial
begin
  reset();
  #10;
  do(5'b00001,5'b00010,5'b00010);   //a = rs1 , b= rs2, c=rd
  #10;
  rd_in = 32'h 40404040;
  do(5'b00011,5'b00100,5'b00011);
  #10;
  rd_in = 32'h 00004444;
  do(5'b00111,5'b00111,5'b00111);
  #10;
  rd_in = 32'h 44440000;
  do(5'b00001,5'b00101,5'b00011);
  #10;
  $finish;
end

initial
  $monitor("The rs1 out is = %b, The rs2 out is = %b",rs_1_out,rs_2_out);

endmodule

