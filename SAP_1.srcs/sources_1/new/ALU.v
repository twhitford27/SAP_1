`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2024 20:23:37
// Design Name: 
// Module Name: ALU
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


module ALU(

    //inputs
    input i_clk,
    input i_rst,
    input i_sub, //1'b1 = Subtract, 1'b0 = Addition
    input [7:0]i_a,
    input [7:0]i_b,

    //outputs
    output [7:0]o_ALU_out

    );


    //template
    // ALU(
    //     .i_clk(),
    //     .i_rst(),
    //     .i_sub(),
    //     .i_a(),
    //     .i_b()
    //     .o_ALU_out()
    // )


    assign o_ALU_out = (i_sub) ? i_a - i_b : i_a + i_b;


endmodule
