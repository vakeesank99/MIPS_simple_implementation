`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2023 11:24:45 PM
// Design Name: 
// Module Name: alu
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


//module alu(
//            input [31:0] srca,srcb,
//            input [2:0] alucontrol,
//            output reg [31:0]aluout,
//            output zero

//    );
//    always@(*)
//        case(alucontrol)
//            3'b000: aluout <= srca & srcb;
//            3'b001: aluout <= srca | srcb;
//            3'b010: aluout <= srca + srcb;
//            3'b100: aluout <= srca & ~srcb;
//            3'b101: aluout <= srca | ~srcb;
//            3'b110: aluout <= srca - srcb;
//            3'b111: begin // SLT
//				if (srca[31] != srcb[31]) begin
//					if (srca[31] > srcb[31]) begin
//						aluout <= 32'b1;
//					end else begin
//						aluout <= 32'b0;
//					end
//				end else begin
//					if (srca < srcb)
//					begin
//						aluout <= 32'b1;
//					end
//					else
//					begin
//						aluout <= 32'b0;
//					end
//				end
//			end
////                    begin
////                        if((srca - srcb) < 32'b0)
////                            aluout<=32'b1;
////                        else
////                           aluout<=32'b0;
////                    end 
//            default: aluout<=32'b0;
//        endcase
//   assign zero = (aluout==32'b0)? 1'b1:1'b0;
//endmodule
module alu(
            input [31:0] srca,srcb,
            input [2:0] alucontrol,
            output reg [31:0]aluout,
            output zero
);

wire [31:0] S, Bout;
assign Bout = alucontrol[2] ? ~srcb : srcb;
assign S = srca + Bout + alucontrol[2];
always@(*)
case (alucontrol[1:0])
	2'b00: aluout <= srca & Bout;
	2'b01: aluout <= srca | Bout;
	2'b10: aluout <= S;
	2'b11: aluout <= S[31];
    default: aluout <= 32'b0;
endcase
assign zero = (aluout == 32'b0);
endmodule