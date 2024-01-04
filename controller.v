`timescale 1ns / 1ps
module controller(
                    input [5:0] op, funct,
                    input zero,
                    output memtoreg, memwrite,pcsrc, alusrc, regdst, regwrite, jump,
                    output [2:0] alucontrol
                    );
    wire [1:0] aluop;
    wire branch;
    maindec md(op,memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
    
    aludec ad(funct, aluop, alucontrol);
    assign pcsrc = branch & zero;
endmodule