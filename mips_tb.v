`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2023 10:54:28 PM
// Design Name: 
// Module Name: mips_tb
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


module mips_tb();
    reg clk;
    reg reset;
    wire [31:0] writedata, dataadr;
    wire memwrite;
    //unit under test
    top dut(clk,reset, writedata, dataadr, memwrite);
    
    //intilaize test
    initial
    begin
        reset <=1; #22 reset<=0;
        
    end
    //generate clock
    always
    begin
        clk<=1; #5 clk<=0; #5;
    end
    
    //check result
    always@(negedge clk)
    begin
        if (memwrite) begin
            if(dataadr==84 & writedata==7) begin
                $display ("Simulation succed!");
                $stop;
            end else if(dataadr !=80)begin
                $display("Simulation failed");
                $stop;
            end
        end
    end
endmodule
