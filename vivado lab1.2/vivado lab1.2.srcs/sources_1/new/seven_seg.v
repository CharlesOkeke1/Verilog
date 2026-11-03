`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2026 13:43:14
// Design Name: 
// Module Name: seven_seg
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


module seven_seg(
    input [3:0] sw,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g
    );
    
    wire A = sw[3]; wire B = sw[2]; wire C = sw[1]; wire D = sw[0];

    assign a = (A & D & ( B ^ C)) | (!A & !C & ( B ^ D));
    assign b = (C & ((!D & B) | (D & A))) | (B & !C & (A ^ D));
    assign c = (A & B & C) | (!D & ((!A & !B & C) | (A & B & !C))); 
    assign d = (C & ((D & B) | (A & !B & !D))) | (!A & !C & (B ^ D));
    assign e = (!A & D) | (!C & ((!A & B & !D) | (A & !B & D)));
    assign f = (!A & !B & (C | D)) | (B & D & (A ^ C)); 
    assign g = (!A & !B & !C) | (B & ((!A & C & D) | (A & !C & !D)));
endmodule
