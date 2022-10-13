module display(
	input[3:0]entrada,
	output reg[6:0] LED_out
);

// Cathode patterns of the 7-segment LED display 
	always @(*) begin
	 case(entrada) //7'babcdefg
			  4'b0000: LED_out <= 7'b1000000; // 0
			  4'b0001: LED_out <= 7'b1111001; // 1
			  4'b0010: LED_out <= 7'b0100100; // 2
			  4'b0011: LED_out <= 7'b0110000; // 3
			  4'b0100: LED_out <= 7'b0011001; // 4
			  4'b0101: LED_out <= 7'b0010010; // 5
			  4'b0110: LED_out <= 7'b0000010; // 6
			  4'b0111: LED_out <= 7'b1111000; // 7
			  4'b1000: LED_out <= 7'b0000000; // 8
			  4'b1001: LED_out <= 7'b0010000; // 9
			  4'b1010: LED_out <= 7'b0001000; // A
			  4'b1011: LED_out <= 7'b0000011; // B
			  4'b1100: LED_out <= 7'b1000110; // C
			  4'b1101: LED_out <= 7'b0100001; // D
			  4'b1110: LED_out <= 7'b0000110; // E
			  4'b1111: LED_out <= 7'b0001110; // F
		default: LED_out = 7'b0000001; // "0"
	 endcase
	end
endmodule
