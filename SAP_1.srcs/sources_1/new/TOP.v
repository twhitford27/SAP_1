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
        end else if (alu_en) begin
            bus = alu_out;
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
    wire rst; 
    assign rst = RST_btn; // assigns the reset, can be changed to active high/low depending on hardware

    wire hlt;
    wire clk;
    Clock clock(
        .clk_in(CLK),
        .halt(hlt),
        .clk_out(clk)
    );


    wire pc_inc;
    wire pc_en;
    wire [7:0] pc_out;

    pc pc(
        .clk(clk),
        .rst(rst),
        .i_inc(pc_inc),
        .o_out(pc_out)
    );



    wire mar_load;
    wire mem_en;
    wire [7:0] mem_out;

    memory mem(
        .i_clk(clk),
        .i_rst(rst),
        .i_load(mar_load),
        .i_bus(bus),
        .o_bus(mem_out)
    );


    wire a_en;
    wire a_load;
    wire [7:0] a_out;

    a_Register reg_a(
        .i_clk(clk),
        .i_rst(rst),
        .i_load(a_load),
        .i_bus(bus),
        .o_Reg_out(a_out)
    );


    wire b_load;
    wire [7:0] b_out;

    b_Register reg_b(
        .i_clk(clk),
        .i_rst(rst),
        .i_load(b_load),
        .i_bus(bus),
        .o_Reg_out(b_out)
    );


    wire alu_sub;
    wire alu_en;
    wire [7:0] alu_out;
    ALU alu(
        .i_sub(alu_sub),
        .i_a(a_out),
        .i_b(b_out),
        .o_out(alu_out)
    );

    wire ir_en;
    wire ir_load;
    wire [7:0] ir_out;
    inst_Register reg_ir(
        .i_clk(clk),
        .i_rst(rst),
        .i_load(ir_load),
        .i_bus(bus),
        .o_bus(ir_out)
    );
    
    Controller controller(
        .i_clk(clk),
        .i_rst(rst),
        .i_opcode(ir_out[7:4]),
        .o_out(
        { 
            hlt,
            pc_inc,
            pc_en,
            mar_load,
            mem_en,
            ir_load,
            ir_en,
            a_load,
            a_en,
            b_load,
            alu_sub,
            alu_en
        })
    );


    
endmodule
