module regn (
	input [15:0]BusWires,
	input validar,
	input Clock,
	output wire [15:0]data_saida
	);
	
	reg [15:0]data;
	initial begin
		data = 0;
	end

	always @(posedge Clock) begin
		if(validar == 1'b1) begin
			data = BusWires;
		end
	end	

	assign data_saida = data;
	
endmodule