// Verilog
// 4 inputs
// 1 outputs
// 3 D-type flipflops
// 2 inverters
// 8 gates (1 ANDs + 1 NANDs + 2 ORs + 4 NORs)

/*module dff (CK,Q,D);
input CK,D;
output Q;
reg Q;
always @ (posedge CK)
  Q <= D;
endmodule*/

module dft(d,si,se,clk,q);
input d,si,se,clk;
output reg q;
wire d1;
always @(posedge clk)
q<=d1;

assign d1=se?si:d;
endmodule

module s27(CK,G0,G1,G17,G2,G3,SI,SE);
input CK,G0,G1,G2,G3,SI,SE;
output G17;

  wire G5,G10,G6,G11,G7,G13,G14,G8,G15,G12,G16,G9;

dft d_0(G10,SI,SE,CK,G5);
dft d_1(G11,G5,SE,CK,G6);
dft d_2(G13,G6,SE,CK,G7);

  /*dff DFF_0(CK,G5,G10);
  dff DFF_1(CK,G6,G11);
  dff DFF_2(CK,G7,G13);*/
  not NOT_0(G14,G0);
  not NOT_1(G17,G11);
  and AND2_0(G8,G14,G6);
  or OR2_0(G15,G12,G8);
  or OR2_1(G16,G3,G8);
  nand NAND2_0(G9,G16,G15);
  nor NOR2_0(G10,G14,G11);
  nor NOR2_1(G11,G5,G9);
  nor NOR2_2(G12,G1,G7);
  nor NOR2_3(G13,G2,G12);

endmodule

module tb();
reg CK=1'b0;
reg G0,G1,G2,G3,SI,SE;
wire G17;
s27 uut(CK,G0,G1,G17,G2,G3,SI,SE);
always #5 CK=~CK;
initial
begin
SI=1;
SE=1;
#10;
SI=0;
#10;
SI=1;
#10;
$finish;
end
endmodule

