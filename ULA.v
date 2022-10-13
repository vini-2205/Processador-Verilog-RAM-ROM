module ULA(
	input [15:0]BusWires,
	input [15:0]A,
	input [15:0]shift_out,
	input shift_in,
	input [1:0]ALU,
	output wire [15:0]Saida_ALU,
	output wire z_flag
);

	reg [15:0]dado;
	reg aux_z;
	
	initial begin
		dado = 16'b0000000000000000;
		aux_z = 0;
	end
	
	always @(*) begin
		if(ALU == 2'b00) begin
			dado = (A + BusWires); 
		end
		else if(ALU == 2'b01) begin
			dado = (A - BusWires);
		end
		else if(ALU == 2'b10) begin
			dado = (BusWires && A);
		end
		if(dado == 0) begin
			aux_z = 1;
		end
		else begin
			aux_z = 0;
		end
		if(shift_in == 1) begin
			dado = shift_out;
		end
	end
	
	assign Saida_ALU = dado;
	assign z_flag = aux_z;
endmodule
