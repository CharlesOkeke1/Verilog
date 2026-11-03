`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2026 13:07:52
// Design Name: 
// Module Name: vga_out
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


module vga_out(
    input clk,
    output[3:0] pix_r,
    output[3:0] pix_g,
    output[3:0] pix_b,
    output reg hsync,
    output reg vsync    
    );
    
    assign true = 1;
    
    reg[10:0] hcount;
    reg[9:0] vcount;
    
    assign pix_r = 4'd10;
    assign pix_g = 4'd2;
    assign pix_b = 4'd15;
    
    
    always @(hcount <= 1903) begin
        // Determine hysnc
        if (hcount >= 0 && hcount <= 151) begin
           hsync = 1'b1;
        end
        else begin
            hsync = 1'b0;
        end
        
        // Clamp hcount    
        if (hcount == 1903) begin
            hcount = 0;
            // Clamp vcount
            if (vcount == 931) begin
                vcount = 0;
            end
            
            // Determine vsync
            if (vcount >= 0 &&vcount <= 2) begin
                vsync = 1'b1;
            end 
            else begin
                vsync = 1'b0;
            end
            
            // Increment vcount
            vcount = vcount + 4'b1;
        end
        
        // Increment hcount
        hcount = hcount + 4'b1;
    end
    
endmodule
