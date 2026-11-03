`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2026 13:37:12
// Design Name: 
// Module Name: testbed
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


module testbed(
    input clk,
    output[3:0] pix_r,
    output[3:0] pix_g,
    output[3:0] pix_b,
    output reg hsync,
    output reg vsync    
    );   
    
    vga_out inst(.clk(clk), .pix_r(pix_r), .pix_g(pix_g), .pix_b(pix_b),
    .hsync(hsync), .vsync(vsync));
    
    always @(posedge clk) begin 
endmodule
