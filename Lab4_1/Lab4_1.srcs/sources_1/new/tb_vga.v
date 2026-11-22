`timescale 1ns / 1ps

module tb_vga();

reg clk;
reg rst;
reg [2:0] sw;

wire [3:0] pix_r, pix_g, pix_b;
wire hsync, vsync;

initial begin
    #1
    clk = 0;
    rst = 0;
    sw = 3'b000;
    
    #10
    rst = 1;
end

always begin
    #1 clk = ~clk;
end

vga vga_inst(
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .pix_r(pix_r),
    .pix_g(pix_g),
    .pix_b(pix_b),
    .hsync(hsync),
    .vsync(vsync)    
    );
endmodule
