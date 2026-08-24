`timescale 1ns / 1ps

//==============================================================================
// Module      : next_pc_logic
// Description : 
//      
// Notes       :
//
// Author      : Juan Alvarez
// Date        : 2026-07-21
//==============================================================================

module NextPClogic(

    input             branch,
    input             alu_zero,
    input             uncondbranch,
    input  [63:0]     current_pc,
    input  [63:0]     sign_ext_imm,


    output reg [63:0] next_pc

);

always @(*) begin

    next_pc = ((branch && alu_zero) || uncondbranch) ? (sign_ext_imm + current_pc) : (current_pc + 64'd4);

end
endmodule