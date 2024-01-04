`timescale 1ns / 1ps
module maindec (
                input [5:0] op,
                output memtoreg, memwrite,
                output branch, alusrc,
                output regdst, regwrite, jump,
                output [1:0] aluop
                );
    reg [8:0] controls;
    assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg,jump,aluop}=controls;
    
    always @(*)
        case(op)
            6'b000000: controls <= 9'b110000010; // R type
            6'b100011: controls <= 9'b101001000; // Load Word
            6'b101011: controls <= 9'b001010000; // store word
            6'b000100: controls <= 9'b000100001; // branch equal
            6'b001000: controls <= 9'b101000000; // add immediate
            6'b000010: controls <= 9'b000000100; // jump
            default:   controls <= 9'bxxxxxxxxx;
        endcase
            
endmodule