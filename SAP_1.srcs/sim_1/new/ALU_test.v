`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2024 20:37:05
// Design Name: 
// Module Name: ALU_tb
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


module ALU_test(

    );

    reg [7:0] A; // 8-bit input A
    reg [7:0] B; // 8-bit input B
    reg sub = 1'b0;
    wire [7:0] Sum; // 8-bit output Sum
    
    // Instantiate the two_bit_adder module
    ALU uut (
        .i_a(A),
        .i_b(B),
        .i_sub(sub),
        .o_out(Sum)
    );
    
    initial begin
        // Apply test vectors
        A = 8'b00000000; B = 8'b00000000; #10; // Sum should be 000000000
        A = 8'b00000001; B = 8'b00000001; #10; // Sum should be 000000010
        A = 8'b11111111; B = 8'b00000001; #10; // Sum should be 100000000 (overflow)
        A = 8'b10101010; B = 8'b01010101; #10; // Sum should be 111111111
        A = 8'b01111111; B = 8'b01111111; #10; // Sum should be 111111110
        sub = 1'b1;
        A = 8'b00000000; B = 8'b00000000; #10; // Sum should be 000000000
        A = 8'b00000000; B = 8'b00000001; #10; // Sum should be 000000010
        A = 8'b11111111; B = 8'b00000001; #10; // Sum should be 100000000 (overflow)
        A = 8'b10101010; B = 8'b01010101; #10; // Sum should be 111111111
        A = 8'b01111111; B = 8'b01111111; #10; // Sum should be 111111110
        // Finish simulation
        $stop;
    end
    

    
    endmodule
