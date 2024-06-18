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
    input [7:0]i_bus,

    //output
    output reg [7:0]o_bus,
    output [7:0]o_Reg_out

    );
    reg [7:0] reg_a = 8'hFF;
        
    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst == 1'b1)begin
            reg_a <= 8'b0;
        end else begin
            if (i_load == 1'b1)begin
                reg_a <= i_bus;
            end
            if (i_en == 1'b1)begin
                o_bus <= reg_a;
            end
        end 
        
    end

    assign o_Reg_out = reg_a;
    
endmodule
