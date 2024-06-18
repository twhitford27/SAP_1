`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2024 22:42:36
// Design Name: 
// Module Name: memory
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


module memory(
    //inputs
    input i_clk,
    input i_rst,
    input i_load,
    input [7:0] i_bus,
    
    //outputs
    output [7:0] o_bus
    );

    initial begin
        $readmemh("program.mem",r_ram);
    end

    reg [3:0] r_mar;
    reg [7:0] r_ram[0:15];

    always @(posedge i_clk, posedge i_rst) begin
        if (i_rst == 1'b1 )begin
            r_mar <= 4'b0;
        end else if (i_load == 1'b1)begin
            r_mar <= i_bus[3:0];
        end
        
    end


    assign o_bus = r_ram[r_mar];

    //template
    // memory(
    //     .i_clk(),
    //     .i_rst(),
    //     .i_load(),
    //     .i_bus(),
    //     .o_bus()
    // )

endmodule
