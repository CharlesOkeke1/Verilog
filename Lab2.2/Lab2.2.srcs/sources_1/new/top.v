`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2026 20:46:02
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    input sh_en,
    output a,b,c,d,e,f,g,
    output [7:0] an
    );
    
    wire div_clk;
    wire [3:0] dig0, dig1, dig2, dig3;
    wire [3:0] dig4, dig5, dig6, dig7;
    
    seginterface inst (.an(an),
    .dig7(dig7), .dig6(dig6), .dig5(dig5), .dig4(dig4),
    .dig3(dig3), .dig2(dig2), .dig1(dig1), .dig0(dig0),
    .clk(clk), .rst(rst),
    .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g),
    .div_clk(div_clk));
    
    reg [3:0] digits [7:0];
    assign dig0 = digits[0];
    assign dig1 = digits[1];
    assign dig2 = digits[2];
    assign dig3 = digits[3];
    assign dig4 = digits[4];
    assign dig5 = digits[5];
    assign dig6 = digits[6];
    assign dig7 = digits[7];
    
    integer i;
    always @(posedge div_clk) begin
        if (!rst) begin
            digits[0] <= 4'd9;
            digits[1] <= 4'd4;
            digits[2] <= 4'd7;
            digits[3] <= 4'd3;
            digits[4] <= 4'd7;
            digits[5] <= 4'd6;
            digits[6] <= 4'd5;
            digits[7] <= 4'd0;
        end
        else begin
            digits[0] <= digits[7];
            for (i = 1; i < 8; i = i + 1)
                digits[i] <= digits[i-1];
        end
    end
    
    
endmodule
