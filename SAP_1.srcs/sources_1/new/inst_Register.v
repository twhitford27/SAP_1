`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2024 00:18:15
// Design Name: 
// Module Name: inst_Register
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


module inst_Register(
    //inputs
    input i_clk,
    input i_rst,
    input i_load,

    input [7:0]i_bus,

    //outputs
    output [7:0]o_bus


    );

    reg [7:0] r_ir;

    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst == 1'b1)begin
            r_ir <= 8'b0;
        end else if (i_load == 1'b1)begin
            r_ir <= i_bus;
        end
        
    end

    assign o_bus = r_ir;

    //template
    // inst_Register(
    //     .i_clk(),
    //     .i_rst(),
    //     .i_load(),
    //     .i_bus(),
    //     .o_bus()
    // );
endmodule
