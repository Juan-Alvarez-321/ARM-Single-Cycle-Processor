`timescale 1ns / 1ps

//==============================================================================
// Module      : register_file
// Description : 32 x 64 register file with read (2 ports) and write (1 port)
//               Zero register can only read 0  
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
     parameter ADDR_WIDTH = 5

)(


     input  wire                   clk,   
     input  wire                   reg_wr, // 1 = write enabled
     input  wire [ADDR_WIDTH-1:0]  ra,    // read port A address
     input  wire [ADDR_WIDTH-1:0]  rb,    // read port B address
     input  wire [ADDR_WIDTH-1:0]  rw,    // write address
     input  wire [WIDTH-1:0]       bus_w,  // Data stored in register


     output reg [WIDTH-1:0]       bus_a,  // Register A data
     output reg [WIDTH-1:0]       bus_b  // Register B data

);

localparam [ADDR_WIDTH-1:0] ZR = 31;
localparam DEPTH = 1 << ADDR_WIDTH;



reg [WIDTH-1:0] regs [DEPTH-1:0];

initial begin
     for(integer i = 0; i < DEPTH; i = i + 1) begin
          regs[i] = 0;

     end
end


always @(*) begin

     bus_a = (ra == ZR) ? {WIDTH{1'b0}} : regs[ra];

     bus_b = (rb == ZR) ? {WIDTH{1'b0}} : regs[rb];

     
end

always @(posedge clk) begin
     if(reg_wr && rw != ZR)
          regs[rw] <= bus_w;
end


endmodule