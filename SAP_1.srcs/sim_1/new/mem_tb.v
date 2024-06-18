`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2024 22:52:51
// Design Name: 
// Module Name: mem_tb
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


module mem_tb(

    );
    reg i_clk =1'b0;
    reg i_rst = 1'b0;
    reg i_load = 1'b0;
    reg [7:0] i_bus = 8'b0;
    
    //outputs
    wire [7:0] o_bus;



    memory uut(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_load(i_load),
        .i_bus(i_bus),
        .o_bus(o_bus)
    );

    always  begin
        #41.667
      i_clk = ~i_clk;  
    end

    initial begin
        #1
        i_rst = 1'b1;
        #10
        i_rst = 1'b0;
    end
endmodule
