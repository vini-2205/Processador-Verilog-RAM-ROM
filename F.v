module F(
	input z,
	input Clock,
	input F_in,
	output wire F_out
);

	reg F;
	
	always @(posedge Clock) begin
		if(F_in == 1'b1 && z == 1)begin
			F = 1;
		end
		else if (F_in == 1'b1 && z != 1)begin
			F = 0;
		end
	end
	
	assign F_out = F;
endmodule
