`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2026 21:44:39
// Design Name: 
// Module Name: seven_seg_behave
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

module seven_seg_behave(
    input [3:0] sw,
    output a,output b, output c,
    output d,output e, output f,
    output g);
    
    reg[6:0] output_seven_seg;
    
    assign {a,b,c,d,e,f,g} = output_seven_seg;
    
    always @*
    begin
        case(sw)
            4'h0: output_seven_seg = 7'b0000001;
            4'h1: output_seven_seg = 7'b1001111;
            4'h2: output_seven_seg = 7'b0010010;
            4'h3: output_seven_seg = 7'b0000110;
            4'h4: output_seven_seg = 7'b1001100;
            4'h5: output_seven_seg = 7'b0100100;
            4'h6: output_seven_seg = 7'b0100000;
            4'h7: output_seven_seg = 7'b0001111;
            4'h8: output_seven_seg = 7'b0000000;
            4'h9: output_seven_seg = 7'b0000100;
            4'hA: output_seven_seg = 7'b0001000;
            4'hB: output_seven_seg = 7'b1100000;
            4'hC: output_seven_seg = 7'b0110001;
            4'hD: output_seven_seg = 7'b1000010;
            4'hE: output_seven_seg = 7'b0110000;
            4'hF: output_seven_seg = 7'b0111000;

            default: output_seven_seg = 7'b1111111;
        endcase           
    end
   
endmodule
