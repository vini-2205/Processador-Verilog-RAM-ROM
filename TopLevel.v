module TopLevel(
    input wire [17:0] SW,
	 input wire CLOCK_50,

    output wire [6:0] HEX7,
    output wire [6:0] HEX6,
    output wire [6:0] HEX5,
    output wire [6:0] HEX4,
    output wire [6:0] HEX3,
    output wire [6:0] HEX2,
    output wire [6:0] HEX1,
    output wire [6:0] HEX0,
    output wire [7:0] LEDG
);

  wire Clock;
  Clock_divider #(50000000) divider (CLOCK_50, Clock);

  wire [15:0] R0, R1, R2, R3, R4, PC;
  reg [15:0] registrador;
	
	display D0(registrador[15:12],HEX3);
	display D1(registrador[11:8],HEX2);
	display D2(registrador[7:4],HEX1);
	display D3(registrador[3:0],HEX0);
	display D4(PC,HEX4);
  
  Processador proc(
       1,
       Clock,
       1,
		LEDG[0],
		R0,
      R1,
      R2,
      R3,
		R4,
		PC
  );

  always @(*) begin
		case(SW[2:0])
			3'b000: begin
				registrador = R0;
			end
			
			3'b001: begin
				registrador = R1;
			end
			
			3'b010: begin
				registrador = R2;
			end
			
			3'b011: begin
				registrador = R3;
			end
			
			3'b100: begin
				registrador = R4;
			end
			
		endcase
		
  end
 

  
  assign HEX7 = 7'b1111111;
  assign HEX6 = 7'b1111111;
  assign HEX5 = 7'b1111111;

endmodule
