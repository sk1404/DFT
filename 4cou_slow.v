`timescale 1ns / 1ps
module NOR2XL(input A, input B, output Y);
  assign Y = ~(A | B);
endmodule

module XNOR2X1(input A, input B, output Y);
  assign Y = ~(A ^ B);
endmodule

module AOI211XL(input A0, A1, B0, C0, output Y);
  assign Y = ~((A0 & A1) | B0 | C0);
endmodule

module NAND2XL(input A, input B, output Y);
  assign Y = ~(A & B);
endmodule

module OAI21XL(input A0, A1, B0, output Y);
  assign Y = ~((A0 | A1) & B0);
endmodule

module INVXL(input A, output Y);
  assign Y = ~A;
endmodule


