
//`timescale 1ns/1ps

module ALU(A,B,c_in,b_in,control,C,c_out,b_out,compare_out);
// 4 bit inputs A and B, 3 bit control, 1 bit cin and bin 
  input [3:0] A;
  input [3:0] B;
	input [2:0] control;
  input c_in;
  input b_in;
  // 4 bit output C 1 bit c_output and bout, 2 bit compare 
  output reg [3:0] C;
  output reg c_out;
  output reg b_out;
  output reg[1:0] compare_out;
   
  always@(*)
  begin
    // 4 bit output C 1 bit c_output and bout, 2 bit compare 
  c_out = 1'b0;
	b_out = 1'b0;
	C = 4'b0000;
	compare_out = 2'b00;
 case(control)
  3'b000: begin
         	 C=A;
	         c_out=c_in;//assigning values to other variables
			end
			 //case(control)
	 3'b001: {c_out,C}=A+B+c_in;  //addition
	 
    3'b010: {b_out,C}=A-B-b_in;  //subtraction
    
    3'b011: compare_out =(A>B)?2'b01:2'b00; //greater than 
    
    3'b100: compare_out =(A<B)?2'b01:2'b00; // less than
    
    3'b101:  compare_out =(A==B)?2'b01:2'b00; //equal to
    
    3'b110: C = A>>B[1:0]; // right shift A by 2 bit B[1:0]
    
    3'b111:  C = A<<B[1:0]; // left shift B by 2 bit B[1:0]
    
    default: C= 4'b0000;
 
  endcase
  end
endmodule
