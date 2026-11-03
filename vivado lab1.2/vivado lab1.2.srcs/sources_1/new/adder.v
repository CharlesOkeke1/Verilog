`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2026 16:57:50
// Design Name: 
// Module Name: adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder(
    input [3:0] x,
    input [3:0] y,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output oflow
    );
    
    wire [4:0] sum;
    
    assign sum = x + y;
    assign oflow = sum[4];
    
    
    seven_seg inst (.sw(sum), .a(a), .b(b), .c(c), .d(d), .e(e),
    .f(f), .g(g));
endmodule
