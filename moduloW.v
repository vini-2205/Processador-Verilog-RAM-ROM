module moduloW (
	input W_D,
	input Clock,
	output wire W_out
);

	reg w;
	
	initial begin
		w = 1'b0;
	end

	always @(posedge Clock) begin
		if(W_D == 1'b1) begin
			w = 1'b1;
		end
		else begin
			w = 1'b0;
		end
	end
	
	assign W_out = w;
endmodule
