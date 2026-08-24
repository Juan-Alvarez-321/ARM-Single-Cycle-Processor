`timescale 1ns / 1ps

//==============================================================================
// Module      : alu
// Description : 64 bit alu with operations AND, OR, ADD, SUB, and PassB
//               Invalid alu_ctrl gives zero on output
//      
// Notes       :
//
// Author      : Juan Alvarez
// Date        : 2026-07-21
//==============================================================================


`define AND   4'b0000
`define OR    4'b0001
`define ADD   4'b0010
`define SUB   4'b0110
`define PassB 4'b0111

module ALU(

    input      [63:0] bus_a,
    input      [63:0] bus_b,
    input      [3:0]  alu_ctrl,

    output reg [63:0] bus_w,
    output reg        zero
);


always @(*)begin

    case(alu_ctrl)

        `AND:    bus_w = bus_a & bus_b;
        `OR:     bus_w = bus_a | bus_b;
        `ADD:    bus_w = bus_a + bus_b;
        `SUB:    bus_w = bus_a - bus_b;
        `PassB:  bus_w = bus_b;
        default: bus_w = 64'b0;

    endcase
    
    zero = (bus_w == 64'b0); 
end

endmodule