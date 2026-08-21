`timescale 1ns / 1ps

//==============================================================================
// Module      : mux2to1
// Description : Parametrized 2 to 1 multiplexer. Only combinational
//               select = 0 -> output = in0
//               select = 1 -> output = in1
//
// Parameters  : WIDTH  - mux input bit width (default 64)
//
//
// Author      : Juan Alvarez
// Date        : 2026-07-13
//==============================================================================


module mux2to1 #(
    parameter WIDTH = 64
)(
    input  wire [WIDTH-1:0] in0,   // Input 0
    input  wire [WIDTH-1:0] in1,   // Input 1
    input  wire       sel,         // Select signal
    output reg  [WIDTH-1:0] out    // Output
);

assign out = sel ? in1 : in0;


endmodule