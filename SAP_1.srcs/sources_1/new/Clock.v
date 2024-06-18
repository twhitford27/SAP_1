`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2024 22:33:27
// Design Name: 
// Module Name: Clock
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


module Clock(
    input clk_in,
    input halt,
    output clk_out
    );

    assign clk_out = (halt)? 1'b0:clk_in;


    // template
    // Clock(
    //     .clk_in(),
    //     .halt(),
    //     .clk_out()
    // )
endmodule
