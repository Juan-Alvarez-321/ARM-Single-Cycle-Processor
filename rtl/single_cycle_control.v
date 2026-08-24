`timescale 1ns / 1ps
`define OPCODE_ANDREG 11'b10001010000
`define OPCODE_ORRREG 11'b10101010000
`define OPCODE_ADDREG 11'b10001011000
`define OPCODE_SUBREG 11'b11001011000

`define OPCODE_ADDIMM 11'b1001000100?
`define OPCODE_SUBIMM 11'b1101000100?

`define OPCODE_B      11'b000101?????
`define OPCODE_CBZ    11'b10110100???

`define OPCODE_LDUR   11'b11111000010
`define OPCODE_STUR   11'b11111000000

module SC_Control(

    input [10:0]     opcode,

    output reg       reg_2_loc,
    output reg       alu_src,
    output reg       mem_to_reg,
    output reg       reg_write,
    output reg       mem_read,
    output reg       mem_write,
    output reg       branch,
    output reg       uncondbranch,
    output reg [3:0] alu_op,
    output reg [1:0] sign_op

    );

always @(*) begin
    casez (opcode)

        `OPCODE_ANDREG: begin
            reg_2_loc = 1'b0;
            alu_src = 1'b0;
            mem_to_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            uncondbranch = 1'b0;
            ALUOp = 4'b0000;
            SignOp = 2'bxx;

        end

        `OPCODE_ORRREG: begin
            reg_2_loc = 1'b0;
            alu_src = 1'b0;
            mem_to_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            uncondbranch = 1'b0;
            ALUOp = 4'b0001;
            SignOp = 2'bxx;
        end

        `OPCODE_ADDREG: begin
            reg_2_loc = 1'b0;
            alu_src = 1'b0;
            mem_to_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            uncondbranch = 1'b0;
            ALUOp = 4'b0010;
            SignOp = 2'bxx;
        end

        `OPCODE_SUBREG: begin
            reg_2_loc = 1'b0;
            alu_src = 1'b0;
            mem_to_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            uncondbranch = 1'b0;
            ALUOp = 4'b0110;
            SignOp = 2'bxx;
        end

        `OPCODE_ADDIMM: begin
            reg_2_loc = 1'bx;
            alu_src = 1'b1;
            mem_to_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            uncondbranch = 1'b0;
            ALUOp = 4'b0010;
            SignOp = 2'b00;
        end

        `OPCODE_SUBIMM: begin
            reg_2_loc = 1'bx;
            alu_src = 1'b1;
            mem_to_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            uncondbranch = 1'b0;
            ALUOp = 4'b0110;
            SignOp = 2'b00;
        end

        `OPCODE_B: begin
            reg_2_loc = 1'bx;
            alu_src = 1'bx;
            mem_to_reg = 1'bx;
            reg_write = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            uncondbranch = 1'b1;
            ALUOp = 4'bxxxx;
            SignOp = 2'b11;
        end

        `OPCODE_CBZ: begin
            reg_2_loc = 1'b1;
            alu_src = 1'b0;
            mem_to_reg = 1'bx;
            reg_write = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b1;
            uncondbranch = 1'b0;
            ALUOp = 4'b0111;
            SignOp = 2'b10;

        end

        `OPCODE_LDUR: begin
            reg_2_loc = 1'bx;
            alu_src = 1'b1;
            mem_to_reg = 1'b1;
            reg_write = 1'b1;
            mem_read = 1'b1;
            mem_write = 1'b0;
            branch = 1'b0;
            uncondbranch = 1'b0;
            ALUOp = 4'b0010;
            SignOp = 2'b01;
        end

        `OPCODE_STUR: begin
            reg_2_loc = 1'b1;
            alu_src = 1'b1;
            mem_to_reg = 1'bx;
            reg_write = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b1;
            branch = 1'b0;
            uncondbranch = 1'b0;
            ALUOp = 4'b0010;
            SignOp = 2'b01;
        end

        default: begin
            reg_2_loc = 1'b0;
            alu_src = 1'b0;
            mem_to_reg = 1'b0;
            reg_write = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            uncondbranch = 1'b0;
            ALUOp = 4'b0000;
            SignOp = 2'b00;
        end
    endcase
    
end



endmodule