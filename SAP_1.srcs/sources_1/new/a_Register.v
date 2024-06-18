`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2024 18:25:42
// Design Name: 
// Module Name: Register
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


module a_Register(
    //inputs
    input i_clk,
    input i_rst,
    input i_en,
    input i_load,
    input [7:0]i_w_bus,

    //output
    output [7:0]o_w_bus,
    output [7:0]o_Reg_out

    );
endmodule
