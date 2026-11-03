`timescale 1ns / 1ps

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
    
    reg [3:0] digitsHex [7:0];
//    assign dig0 = digitsHex[0];
//    assign dig1 = digitsHex[1];
    assign dig2 = digitsHex[2];
    assign dig3 = digitsHex[3];
    assign dig4 = digitsHex[4];
    assign dig5 = digitsHex[5];
//    assign dig6 = digitsHex[6];
//    assign dig7 = digitsHex[7];
    reg ticking = 1;
    integer i;
    
    always @(posedge div_clk) begin
        if (rst) begin
//            digitsHex[0] <= 4'hF;
//            digitsHex[1] <= 4'hF;
            digitsHex[2] <= 4'd9;
            digitsHex[3] <= 4'd5;
            digitsHex[4] <= 4'd3;
            digitsHex[5] <= 4'd0;
//            digits[6] <= 4'd5;
//            digits[7] <= 4'd0;
        end
        else if (!rst && sh_en && ticking == 1) begin
//            digits[0] <= digits[7];
//            for (i = 1; i < 8; i = i + 1)
//                digits[i] <= digits[i-1]; 

            if (digitsHex[5] == 4'd0 && digitsHex[4] == 4'd0 && digitsHex[3] == 4'd0 && digitsHex[2] == 4'd0) begin
                ticking = 0;
            end  

            // Checking seconds digit. Mutating tens of seconds if seconds digit is 0
            if (digitsHex[2] == 4'd0) begin
                digitsHex[2] <= 4'd9;
                digitsHex[3] <= digitsHex[3] - 4'd1;
            end
            else begin
                digitsHex[2] <= digitsHex[2] - 4'd1;
            end
            
                                
            if (digitsHex[3] == 4'd0 && digitsHex[2] == 4'd0) begin
                digitsHex[3] <= 4'd5;
                digitsHex[4] <= digitsHex[4] - 4'd1;      
            end
            else begin
                if (digitsHex[2] == 4'd0) begin
                    digitsHex[3] <= digitsHex[3] - 4'd1;
                end
            end         
            
            if (digitsHex[4] == 4'd0 && digitsHex[5] != 4'd0) begin
                digitsHex[4] <= 4'd9;
                digitsHex[5] <= digitsHex[5] - 4'd1;      
            end
            else begin
                if (digitsHex[3] == 4'd0 && digitsHex[2] == 4'd0) begin
                    digitsHex[4] <= digitsHex[4] - 4'd1;
                end
            end         
        end
    end        
endmodule
