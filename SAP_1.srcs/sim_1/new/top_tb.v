`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2024 21:06:47
// Design Name: 
// Module Name: top_tb
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


module top_tb(

    );
    
    reg sim_clk = 0;
    reg sim_RST = 0;
    always begin
        #10
        sim_clk = ~sim_clk;
    end

    TOP uut(
        .CLK(sim_clk),
        .RST_btn(sim_RST)
    );

    initial begin
        sim_RST = 1'b1;
        #20
        sim_RST = 1'b0;
    end

    
endmodule
