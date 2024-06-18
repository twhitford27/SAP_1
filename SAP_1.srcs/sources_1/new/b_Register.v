`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2024 20:13:11
// Design Name: 
// Module Name: b_Register
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


module b_Register(
    //inputs
    input i_clk,
    input i_rst,
    input i_load,
    input [7:0] i_bus,
    //outputs
    output [7:0] o_Reg_out
    );

    reg [7:0] reg_b;

    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst == 1'b1)begin
            reg_b <= 8'b0;
        end else if (i_load == 1'b1)begin
            reg_b <= i_bus;
        end
        
    end

    assign o_Reg_out = reg_b;
endmodule
