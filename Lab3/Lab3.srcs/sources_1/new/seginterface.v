`timescale 1ns / 1ps

module seginterface(
    input clk,           // Clock input
    input rst,           // Reset input
    input [3:0] dig7,    // Digit 7 (MSB)
    input [3:0] dig6,    // Digit 6
    input [3:0] dig5,    // Digit 5
    input [3:0] dig4,    // Digit 4
    input [3:0] dig3,    // Digit 3
    input [3:0] dig2,    // Digit 2
    input [3:0] dig1,    // Digit 1
    input [3:0] dig0,    // Digit 0 (LSB)
    output div_clk,      // Slowed-down clock for external use
    output a, b, c, d, e, f, g, // Segments of the seven-segment display
    output [7:0] an      // Anode signals for the seven-segment displays
);

    // Clock division logic
    reg [28:0] clk_count;
    always @(posedge clk) begin
        if (rst == 1'b0)        
            clk_count <= 0;
        else
            clk_count <= clk_count + 1'b1; // Increment clock count
    end
    
    // Generate LED clock by dividing main clock
    assign led_clk = clk_count[16];   // Slower clock for driving LED multiplexing
    assign div_clk = clk_count[25];   // Further divided clock for external use
    
    // LED strobe to activate the anodes of the 7-segment displays
    reg [7:0] led_strobe;
    always @(posedge led_clk) begin
        if (rst == 1'b0)
            led_strobe <= 8'b11111110;
        else
            led_strobe <= {led_strobe[6:0], led_strobe[7]}; // Rotate strobe bit
    end
    assign an = led_strobe; // Output to the anodes of the 7-segment displays

    // LED index to select which digit is displayed
    reg [2:0] led_index;
    always @(posedge led_clk) begin
        if (rst == 1'b0)
            led_index <= 3'd0;
        else
            led_index <= led_index + 1'b1; // Cycle through the 8 digits
    end

    // Select the corresponding digit to display
    reg [3:0] dig_sel;
    always @* begin
        case (led_index)
            3'd0: dig_sel = dig0;
            3'd1: dig_sel = dig1;
            3'd2: dig_sel = dig2;
            3'd3: dig_sel = dig3;
            3'd4: dig_sel = dig4;
            3'd5: dig_sel = dig5;
            3'd6: dig_sel = dig6;
            3'd7: dig_sel = dig7;
            default: dig_sel = 4'd0; // Default case to avoid latches
        endcase
    end

    //////////////////////////////////////////
    // YOU NEED TO COMPLETE THIS PART       //
    //////////////////////////////////////////
    // Instantiate the seven-segment decoder to drive the display segments
    seven_seg_behave inst (.sw(dig_sel), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));
    
endmodule
