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


module vga(
    input clk,
    input rst,
    input [2:0] sw,
    output[3:0] pix_r,
    output[3:0] pix_g,
    output[3:0] pix_b,
    output hsync,
    output vsync    
    );
        
    reg[10:0] hcount;
    reg[9:0] vcount;
    
    wire display_region;
    wire pix_clk;

    assign vsync = ((vcount >= 10'd0) && (vcount <= 10'd2));
    assign hsync = ((hcount >= 11'd0) && (hcount <= 11'd151));
    assign display_region = ((hcount >= 11'd384) && (hcount <= 11'd1823) && (vcount >= 10'd31) && (vcount <= 10'd930));
        
    assign pix_r = (display_region && sw[0]) ? 4'b0100 : 4'b0000;
    assign pix_g = (display_region && sw[1]) ? 4'b0100 : 4'b0000;
    assign pix_b = (display_region && sw[2]) ? 4'b0100 : 4'b0000;
    
    // Clock gen
     clk_wiz_0 inst
      (
      // Clock out ports  
      .clk_out1(pix_clk),
     // Clock in ports
      .clk_in1(clk)
      );


    always @(posedge pix_clk) begin
        // Clamp hcount   
        if (!rst) begin
            hcount <= 11'd0;
            vcount <= 10'd0;
        end
        else begin
            if (hcount == 11'd1903) begin
                hcount <= 11'd0;
                // Clamp vcount
                if (vcount == 10'd931) begin
                    vcount <= 10'd0;
                end
                else                 
                    // Increment vcount
                    vcount <= vcount + 10'b1;
            end
            else             
                // Increment hcount
                hcount <= hcount + 11'b1;
        end
    end
    
endmodule
