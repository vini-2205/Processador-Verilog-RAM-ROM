module Processador(
	input Resetn,
	input Clock, 
	input Run,
	output reg Done,
	output wire[15:0] r0_out,
	output wire[15:0] r1_out,
	output wire[15:0] r2_out,
	output wire[15:0] r3_out,
	output wire[15:0] r4_out,
	output wire[15:0] PC_out
	);
	
	//fios usados durante a execucao do processador
	wire W; //habilitar escrita na memoria
   wire [6:0] R_in; //habilitar escrita nos registradores
	wire [15:0] DIN; //saida da instrucao a ser realizada
	wire z_flag,f; //usados durante o codigo para habilitacao do b(cond)
	wire [15:0]r0,r1,r2,r3,r4,r5,r6,PC,A,G,IR,Saida_ULA,addr,data,dado_retorno,shift_out; //declaracoes de saida dos modulos
	
	reg [1:0] ALU; //operacao da ULA
	reg [2:0] Tstep_Q, Tstep_D; //passo do processador
	reg  A_in, G_in, IR_in, rX_in,F_in,shift_in; //habilitar modulos
	reg ADDR_in, DOUT_in, pc_in, pc_incr, W_D;
	reg [3:0] Select; //selecionar mux
   reg [15:0] BusWires; //saida do mux

	wire [1:0]op2 = IR[8:7]; //operacao do barrel se é imediato ou reg
	wire [2:0]III = IR[15:13]; //opcode
	wire Imm = IR[12]; //habilitar se é feito com registrador ou imediato
	wire [1:0]Shift = IR[6:5]; //opcode do barrel
	wire [2:0]rX = IR[11:9]; //reg rX
	wire [2:0]rY = IR[2:0]; //reg rY
	
	
	//saida dos registradores
	assign r0_out = r0;
	assign r1_out = r1;
	assign r2_out = r2;
	assign r3_out = r3;
	assign r4_out = r4;
	assign PC_out = PC;
	
	//declarecoes da RAM,ROM
	ROM instrucoes(addr,Clock,DIN);
	RAM inst_ram(addr,Clock,data,W,dado_retorno);
	dec3to8 decX (rX_in, rX, R_in); 
	
	parameter T0 = 3'b000, T1 = 3'b001, T2 = 3'b010, T3 = 3'b011,T4=3'b100,T5=3'b101;
	
	initial begin
		A_in = 0;
		F_in = 0;
      G_in = 0;
		ADDR_in = 0;
		DOUT_in = 0;
		pc_in = 0;
		pc_incr = 0;
		W_D=0;
      IR_in = 0;
      rX_in = 0;
		Done=0;
		ALU = 2'b00;
		shift_in=1'b0;
		Tstep_D = T0;
		Tstep_Q = T0;
    end
	
	always @(Tstep_Q, Run, Done)
		case (Tstep_Q)
		T0: begin
		    if (~Run) Tstep_D = T0;
		    else Tstep_D = T1;
		end
		T1: begin
            if (~Done) Tstep_D = T2;
		    else Tstep_D = T0;

		end
        T2: begin
            if (~Done) Tstep_D = T3;
		    else Tstep_D = T0;
		end
        T3:begin
			if (~Done) Tstep_D = T4;
		    else Tstep_D = T0;
		end
		T4: begin
            if (~Done) Tstep_D = T5;
		    else Tstep_D = T0;
		end
        T5:begin
			Tstep_D = T0;
		end
	  endcase
	  
	  	parameter b = 3'b000, beq = 3'b001, bne = 3'b010; 
		
		parameter mv = 3'b000, mvt = 3'b001, add = 3'b010, sub = 3'b011, And = 3'b110, ld = 3'b100, st = 3'b101,bs=3'b111;

		parameter _R0 = 4'b0000, _R1 = 4'b0001, _R2 = 4'b0010,
			_R3 = 4'b0011, _R4 = 4'b0100, _R5 = 4'b0101, _R6 = 4'b0110, _PC = 4'b0111, _G = 4'b1000,
			_IR8_IR8_0 = 4'b1001,
			_IR7_0_0 = 4'b1010,
			_DIN = 4'b1011;
		
		always @(*) begin
			rX_in = 1'b0; G_in = 1'b0;A_in = 1'b0;Done =1'b0;ADDR_in=1'b0;pc_incr=1'b0;IR_in=1'b0;DOUT_in = 1'b0;W_D=1'b0;pc_in=1'b0;ALU = 2'b11; F_in=0; shift_in=0;
			case (Tstep_Q)
				T0: begin 
						Select = _PC;
						ADDR_in = 1'b1;
						pc_incr = 1'b1;
					end
					
				T1: begin// define signals in time step T1
                    
					end
					
				T2: begin// define signals in time step T2
						IR_in = 1'b1;
					end
					
				T3: begin // define signals in time step T3
					case (III)
                        mv: begin
                            if (!Imm) Select = rY; // mv rX, rY
                            else Select = _IR8_IR8_0; // mv rX, #D
                            rX_in = 1'b1; // enable rX
                            Done = 1'b1;
                        end
                        
                        mvt: begin// mvt rX, #D
								
									if(Imm == 1'b1)begin
										Select = _IR7_0_0;
										rX_in = 1'b1;
										Done = 1'b1;
									end
									
									else begin
										Select = _PC;
										A_in = 1'b1;
										case(rX)
											b: begin
												
											end

											beq: begin
												if(f == 1'b0)begin
													Done = 1'b1;
												end
											end

											bne: begin
												if(f != 1'b0)begin
													Done = 1'b1;
												end
											end
										endcase
									end
								end
                        
                        add: begin
                            Select = rX;
                            A_in = 1'b1;
                        end
                        
                        sub: begin
                            Select = rX;
                            A_in = 1'b1;
                        end	

								And: begin
									Select = rX;
									A_in = 1'b1;
								end	

								ld: begin
									Select = rY;
									ADDR_in = 1'b1;
								end	

								st: begin
									Select = rY;
									ADDR_in = 1'b1;
								end
								
								bs: begin
									Select = rX;
									A_in = 1'b1;
								end
						
						endcase
				end
                    
				T4: begin
					case(III)

							mvt: begin
								if(Imm == 1'b0) begin
									ALU = 2'b00;
									Select = _IR8_IR8_0;
									G_in = 1'b1; 
								end
							end
											
							add: begin
								 if (!Imm) Select = rY;
								 else Select = _IR8_IR8_0;
								 G_in = 1'b1;
								 F_in =1;
								 ALU = 2'b00;                                     
							end
							
							sub: begin
								if (!Imm) Select = rY;
								 else Select = _IR8_IR8_0;
								 ALU = 2'b01;
								 F_in=1;
								 G_in = 1'b1;
							end	

							And: begin
								 if (!Imm) Select = rY;
								 else Select = _IR8_IR8_0;
								 ALU = 2'b10;
								 F_in=1;
								 G_in = 1'b1;
                        	end	

							st: begin
								Select = rX;
								DOUT_in = 1'b1;
								W_D = 1'b1;
								Done = 1'b1;
                      end
							 
							bs: begin
								if(op2 == 2'b10) Select = rY;
								else Select = _IR8_IR8_0;
								shift_in=1;
								G_in=1;
								F_in = 1'b1;
							end 
							
					endcase
				end
				
				T5: begin
					case(III)
										
							mvt: begin
								if(Imm == 1'b0) begin
									Select = _G;
									pc_in = 1'b1;
									Done = 1'b1;
								end
							end

							add: begin
								 Select = _G;
								 rX_in = 1'b1;
								 Done = 1'b1;
							end
							
							sub: begin
								 Select = _G;
								 rX_in = 1'b1;
								 Done = 1'b1;
							end	

							And: begin
                            	Select = _G;
										rX_in = 1'b1;
                            	Done = 1'b1;
                        	end	

							ld: begin
								Select = _DIN;
								rX_in = 1'b1;
								Done = 1'b1;
							end
							
							bs: begin
								Select = _G;
								rX_in = 1'b1;
								Done = 1'b1;
							end
							
						endcase
					end
				default: ;
			endcase
		end


		always @(posedge Clock, negedge Resetn) 
			if (!Resetn)
				Tstep_Q = T0;
			else
				Tstep_Q = Tstep_D;


		//Declaracoes dos registradores
		regn reg_0 (BusWires,R_in[0], Clock, r0);
		regn reg_1 (BusWires,R_in[1], Clock, r1);
		regn reg_2 (BusWires,R_in[2], Clock, r2);
		regn reg_3 (BusWires,R_in[3], Clock, r3);
		regn reg_4 (BusWires,R_in[4], Clock, r4);
		regn reg_5 (BusWires,R_in[5], Clock, r5);
		regn reg_6 (BusWires,R_in[6], Clock, r6);
		regn reg_A (BusWires,A_in , Clock, A);
		regn reg_IR (DIN,IR_in , Clock, IR);
		regn reg_G(Saida_ULA,G_in, Clock, G);
		regn endereco(BusWires, ADDR_in, Clock,addr);
		regn dados(BusWires, DOUT_in, Clock,data);
		
		//Declaracao de W
		moduloW habilitador (W_D, Clock, W);
	
		//Declaracao da ULA
		ULA ula(BusWires, A,shift_out,shift_in, ALU,Saida_ULA,z_flag);
		
		//Declaracao do F
		F moduloF(z_flag,Clock,F_in,f);
		
		//Declaracao PC
		PC reg_7(BusWires,pc_in,pc_incr, Clock, PC);
		
		//declaracao do barrel
		barrel shift(Shift,BusWires[3:0],A,shift_out);

		always @(*)
			case (Select)
				_R0: BusWires = r0;
				_R1: BusWires = r1;
				_R2: BusWires = r2;
				_R3: BusWires = r3;
				_R4: BusWires = r4;
				_R5: BusWires = r5;
				_R6: BusWires = r6;
				_PC: BusWires = PC;
				_G: BusWires = G;
				_IR8_IR8_0: BusWires = {{7{IR[8]}}, IR[8:0]};
				_IR7_0_0: BusWires = {IR[7:0], 8'b00000000};
				_DIN: BusWires = dado_retorno;
				default: BusWires = 16'b0000000000000000;
			endcase
	endmodule
	
