`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2024 00:46:55
// Design Name: 
// Module Name: TOP
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


module TOP(
        input CLK,
        input RST_btn
    );

    reg [7:0] bus;

    always @(*) begin
        if (ir_en)begin
          bus = ir_out;  
        end else if (ALU_en) begin
            bus = ALU_out;
        end else if (a_en) begin
            bus = a_out;
        end else if (mem_en) begin
            bus = mem_out;
        end else if (pc_en) begin
            bus = pc_out;
        end else begin
            bus = 8'b0;
        end
    end


    
endmodule
