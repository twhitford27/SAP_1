`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2024 23:39:46
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,
    input rst,
    input i_inc,
    
    output [7:0] o_out
);

reg [3:0] PC;

always @(posedge clk or posedge rst) begin
    if (rst == 1'b1)begin
        PC <= 4'b0;
    end else if (i_inc == 1'b1)begin
        PC <= PC + 1;
    end
    
end

assign o_out = PC;

//template
// pc(
//     .clk(),
//     .rst(),
//     .i_inc(),
//     .o_out()
// )


endmodule
