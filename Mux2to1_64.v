`timescale 1ns / 1ps
module mux2to1_64 (
    input  wire [63:0] in0,   // Input 0
    input  wire [63:0] in1,   // Input 1
    input  wire       sel,   // Select signal
    output reg  [63:0] out    // Output
);


//when any input changes
always @(*) begin
    if (sel == 1'b0) begin //if sel == 1
        out = in0; //output = input0
    end
    else
        out = in1;  //output = innpu1
    end
endmodule