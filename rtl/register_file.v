`timescale 1ns / 1ps

//==============================================================================
// Module      : register_file
// Description : 
//
// Parameters  : WIDTH        - register data width (default 64)
//               ADDR_WIDTH   - register address width (default 5)          
// Notes       :
//
// Author      : Juan Alvarez
// Date        : 2026-07-13
//==============================================================================



module RegisterFile #(
     parameter WIDTH = 64,
     parameter ADDR_WIDTH = 5,
     parameter DEPTH = 32
)(


     input  wire                   clk,   
     input  wire                   reg_wr, // 1 = write enabled
     input  wire [ADDR_WIDTH-1:0]  ra,    // read port A address
     input  wire [ADDR_WIDTH-1:0]  rb,    // read port B address
     input  wire [ADDR_WIDTH-1:0]  rw,    // write address
     input  wire [WIDTH-1:0]       bus_w,  // Data stored in register


     output wire [WIDTH-1:0]       bus_a,  // Register A data
     output wire [WIDTH-1:0]       bus_b  // Register B data

);


reg [WIDTH-1:0] regs [DEPTH-1:0];

initial begin
     for(intger i = 0; i < DEPTH; i = i + 1) begin
          regs[i] = {WIDTH}'b0;

     end
end

initial begin









	