`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2023 09:56:49 PM
// Design Name: 
// Module Name: regfile
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


module regfile(
                input clk,
                input we3,
                input [4:0] ra1,ra2,wa3,
                input [31:0] wd3,
                output [31:0] rd1,rd2

    );
    reg [31:0] rf[31:0];
    //3 port register file
    //read 2 ports combnationaly
    //write thried port on rising edge
    //register 0 is always zero
    always@(posedge clk)
        if(we3) rf[wa3]<=wd3;
    assign rd1=(ra1 !=0)? rf[ra1]:0;
    assign rd2=(ra2 !=0)? rf[ra2]:0;
endmodule
