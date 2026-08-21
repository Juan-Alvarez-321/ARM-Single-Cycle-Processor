`timescale 1ns / 1ps

//---------------------------------------------
// mux2to1
// select = 0 -> ouptut = in0
// select = 1 -> output = in1
//---------------------------------------------


module mux2to1 #(
    parameter WIDTH = 64
)()
    input  wire [WIDTH-1:0] in0,   // Input 0
    input  wire [WIDTH-1:0] in1,   // Input 1
    input  wire       sel,         // Select signal
    output reg  [WIDTH-1:0] out    // Output
);

assign out = sel ? in1 : in0;


endmodule