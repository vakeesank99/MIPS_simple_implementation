`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2023 11:01:59 PM
// Design Name: 
// Module Name: top
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


module top(
            input clk,reset,
            output [31:0] writedata, dataadr,
            output memwrite

    );
    wire [31:0] pc,instr, readdata;
    //instaniate processor and memeory
    mips mips(clk,reset,pc,instr,memwrite,dataadr,writedata,readdata);
    imem imem(pc[7:2],instr);
    dmem dmem(clk,memwrite,dataadr,writedata,readdata);
    
endmodule
