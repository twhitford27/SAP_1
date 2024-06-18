`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2024 22:34:23
// Design Name: 
// Module Name: programCounter
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


module programCounter(
        input clk,
        input rst,
        input i_inc,
        
        output [7:0] o_out
    );

    reg [3:0] pc;

    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1)begin
            pc <= 4'b0;
        end else if (i_inc == 1'b1)begin
            pc <= pc + 1;
        end
        
    end

    assign o_out = pc;

    //template
    // programCounter(
    //     .clk(),
    //     .rst(),
    //     .i_inc(),
    //     .o_out()
    // )

    
endmodule
