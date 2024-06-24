`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2024 20:06:55
// Design Name: 
// Module Name: Controller
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


module Controller(
    input i_clk,
    input i_rst,
    input [3:0] i_opcode,
    output [11:0] o_out
    );

    localparam SIG_HALT     =      11;
    localparam SIG_PC_INC   =      10;
    localparam SIG_PC_EN    =       9;
    localparam SIG_MEM_LOAD =       8;
    localparam SIG_MEM_EN   =       7;
    localparam SIG_IR_LOAD  =       6;
    localparam SIG_IR_EN    =       5;
    localparam SIG_A_LOAD   =       4;
    localparam SIG_A_EN     =       3;
    localparam SIG_B_LOAD   =       2;
    localparam SIG_ALU_SUB  =       1;
    localparam SIG_ALU_EN   =       0;

    localparam OP_LDA = 4'b0000;
    localparam OP_ADD = 4'b0001;
    localparam OP_SUB = 4'b0010;
    localparam OP_HALT = 4'b1111;

    reg[2:0] stage;
    reg[11:0] ctrl_word;


    //stage counter on neg edge
    always @(negedge i_clk or posedge i_rst) begin
        if (i_rst == 1'b1)begin
            stage <= 0;
        end else begin
            if (stage == 5)begin
                stage <= 0;
            end else begin
                stage <= stage + 1;
            end
        end
        
    end

    //always block case statement based on the stage, * should mean sythesis works it out to be stage
    always @(*) begin
        ctrl_word = 12'b0;

        case (stage)

            0:begin
                ctrl_word[SIG_PC_EN] = 1;
                ctrl_word[SIG_MEM_LOAD] = 1;
            end
            1:begin
                ctrl_word[SIG_PC_INC] = 1;
                
            end
            2:begin
                ctrl_word[SIG_MEM_EN] = 1;
                ctrl_word[SIG_IR_LOAD] = 1;
            end
            3:begin
                case (i_opcode)
                    OP_LDA:begin
                        ctrl_word[SIG_IR_EN] = 1;
                        ctrl_word[SIG_MEM_LOAD] =1;
                    end 
                    OP_ADD:begin
                        ctrl_word[SIG_IR_EN] = 1;
                        ctrl_word[SIG_MEM_LOAD] =1;
                    end
                    OP_SUB:begin
                        ctrl_word[SIG_IR_EN] = 1;
                        ctrl_word[SIG_MEM_LOAD] =1;
                    end
                    OP_HALT:begin
                        ctrl_word[SIG_HALT] = 1;
                    end
                    default : ctrl_word = 11'b0;
                endcase
            end
            4:begin
                case(i_opcode)
                    OP_LDA:begin
                        ctrl_word[SIG_MEM_EN] = 1;
                        ctrl_word[SIG_A_LOAD] = 1;
                    end
                    OP_ADD:begin
                        ctrl_word[SIG_MEM_EN] = 1;
                        ctrl_word[SIG_B_LOAD] = 1;
                    end
                    OP_SUB:begin
                        ctrl_word[SIG_MEM_EN] = 1;
                        ctrl_word[SIG_B_LOAD] = 1;
                    end
                    OP_HALT:begin
                        //do nothing
                    end
                    default : ctrl_word = 11'b0;
                endcase
            end
            5:begin
                case(i_opcode)
                    OP_LDA:begin
                    //do nothing
                    end
                    OP_ADD:begin
                        ctrl_word[SIG_ALU_EN] = 1;
                        ctrl_word[SIG_A_LOAD] = 1;
                    end
                    OP_SUB:begin
                        ctrl_word[SIG_ALU_SUB] = 1;
                        ctrl_word[SIG_ALU_EN] = 1;
                        ctrl_word[SIG_A_LOAD] = 1; 
                    end
                    OP_HALT:begin
                        //do nothing
                    end
                    default : ctrl_word = 11'b0;
                endcase
            end
            default : ctrl_word = 11'b0;


        endcase
        
    end
    assign o_out = ctrl_word;

    //template

    // Controller (
    //     .i_clk(),
    //     .i_rst(),
    //     .i_opcode(),
    //     .o_out({

    //     })
    // );

    
endmodule
