`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2024 19:26:17
// Design Name: 
// Module Name: a_reg_tb
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


module a_reg_tb(

    );

    reg i_clk = 1'b0;
    reg i_rst = 1'b0;
    reg i_en = 1'b0;
    reg i_load = 1'b0;
    reg [7:0] i_bus;

    wire [7:0] o_Reg_out;
    wire [7:0] o_bus;

    always begin
        #41.667 
        i_clk = ~i_clk;
    end

    a_Register uut(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_en(i_en),
        .i_load(i_load),
        .i_bus(i_bus),
        .o_Reg_out(o_Reg_out),
        .o_bus(o_bus)
    );

    initial begin
        i_rst = 1'b1;
        #41.667
        i_rst = 1'b0;
        #41.667
        i_bus = 8'hAB;
        #41.667
        i_en = 1'b1;
        #41.667
        i_en = 1'b0;
        i_load = 1'b1;
        #(2*41.667)     
        i_load = 1'b0;
        #(2*41.667)
        i_en = 1'b1;
        #(2*41.667);
        i_en = 1'b0;    
    end

    
endmodule
