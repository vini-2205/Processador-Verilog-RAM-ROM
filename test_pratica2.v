//`include "Pratica2.v"
module test_pratica2;
  reg Resetn;
  reg Clock;
  reg Run;
  wire Done;
  wire [15:0]r0,r1,r2,r3,r4,PC;

  initial begin
    Clock = 0;
    Resetn = 1'b1;
    Run = 1'b1;
	 $monitor("T%d | Done: %b | r0: %h | r1: %h | r2: %d | r3: %d | r4: %h | r5: %d | r6: %d | pc: %d | pc_incr: %b IR: %b\n ", proc.Tstep_Q, Done, proc.r0,proc.r1,proc.r2,proc.r3,proc.r4,proc.r5,proc.r6,proc.PC,proc.pc_incr,proc.IR);
  end

  initial begin
  
	 /*
	 //--------------- CASO 1 ----------------------------
	 //1
	 $display("mv");
     Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //2
	 $display("mv");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //3
	 $display("add");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //4
	 $display("mv");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //5
	 $display("add");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //6
	 $display("sub");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //7
	 $display("mv");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //8
	 $display("add");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //9
	 $display("and");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;

	 
	 //10
	 $display("sll");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //11
	 $display("srl");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //12
	 $display("mv");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;

	 
	 //13
	 $display("and");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //14
	 $display("sll");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //15
	 $display("sub");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //16
	 $display("srl");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //17
	 $display("add");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //18
	 $display("ld");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //19
	 $display("add");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //20
	 $display("sub");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //21
	 $display("sd");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //22
	 $display("ld");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //23
	 $display("sub");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 */
	 
	 /*
	 //--------------- CASO 2 ----------------------------
	 //1
	 $display("mv");
     Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //2
	 $display("mvt");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //3
	 $display("add");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //4
	 $display("sub");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //5
	 $display("add");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 */
	 
	 /*
	 //--------------- CASO 3 ----------------------------
	 //1
	 $display("mv");
     Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //2
	 $display("ld");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //3
	 $display("lsl");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //4
	 $display("lsr");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //5
	 $display("ldl");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //6
	 $display("asr");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //7
	 $display("ror");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 */
	 
	 
	 //--------------- CASO 4 ----------------------------
	 //1
	 $display("mv");
     Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //2
	 $display("sub");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //3
	 $display("bne");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //4
	 $display("sub");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //5
	 $display("bne");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //6
	 $display("beq");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //7
	 $display("mvt");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //8
	 $display("add");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //9
	 $display("B");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;

	 //10
	 $display("mv");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 //11
	 $display("sub");
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 #1 Clock =1;
	 #1 Clock = 0;
	 
	 
	 
  end

  Processador proc(
	  Resetn,
	  Clock,
	  Run,
	  Done,
	  r0,
	  r1,
	  r2,
	  r3,
	  r4,
	  PC
  );
endmodule