//`timescale 1ns/1ps

module ALU(
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] control,
    input  c_in,
    input  b_in,
    output reg [3:0] C,
    output reg c_out,
    output reg b_out,
    output reg [1:0] compare_out
);

always @(*) begin
    // Default assignments for clarity
    C = 4'b0000;
    c_out = 1'b0;
    b_out = 1'b0;
    compare_out = 2'b00;

    case (control)
        3'b000: begin
            C = A;
            c_out = c_in;
        end
        3'b001: {c_out, C} = A + B + c_in;  // Addition
        3'b010: {b_out, C} = A - B - b_in;  // Subtraction
        3'b011: compare_out = A > B;        // Greater than
        3'b100: compare_out = A < B;        // Less than
        3'b101: compare_out = A == B;       // Equal to
        3'b110: C = A >> B[1:0];           // Right shift
        3'b111: C = A << B[1:0];           // Left shift
        default: C = 4'b0000;
    endcase
end

endmodule
