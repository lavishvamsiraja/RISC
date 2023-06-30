module msrv32_alu(input[31:0] op_1_in,op_2_in,input[3:0] opcode_in,output reg[31:0] result_out);
wire w;
assign w=(op_1_in[31]^op_2_in[31])? (op_1_in[31]):(op_1_in<op_2_in);
always @(*)
begin
	case(opcode_in)
		4'b0000:result_out=op_1_in+op_2_in;
		4'b1000:result_out=op_1_in-op_2_in;
		4'b0010:result_out={{31{1'b0}},w};
		4'b0011:result_out=(op_1_in<op_2_in)?1'b1:1'b0;
		4'b0111:result_out=op_1_in&op_2_in;
		4'b0110:result_out=op_1_in|op_2_in;
		4'b0100:result_out=op_1_in^op_2_in;
		4'b0001:result_out=op_1_in<<op_2_in;
		4'b0101:result_out=op_1_in>>op_2_in;
		4'b1101:result_out=op_1_in>>>op_2_in;
	endcase
end

endmodule
