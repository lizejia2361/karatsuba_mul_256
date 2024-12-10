module karatsuba_mul_256(
    A, B, C
);

parameter m=256;
parameter n=512;
input [m-1:0] A;
input [m-1:0] B;
output[n-1:0] C;

wire [m/2-1:0] A0, A1;      //2b
wire [m/2-1:0] B0, B1;      //2b
wire [m-1:0] P0, P1, P2, P3;//4b

assign A0 = A[m/2-1:0];
assign A1 = A[m-1:m/2];
assign B0 = B[m/2-1:0];
assign B1 = B[m-1:m/2];

karatsuba_mul_128  M1 (.A(A0), .B(B0), .C(P0));
karatsuba_mul_128  M2 (.A(A1), .B(B0), .C(P1));
karatsuba_mul_128  M3 (.A(A0), .B(B1), .C(P2));
karatsuba_mul_128  M4 (.A(A1), .B(B1), .C(P3));

wire [n-1:0] t0,t1,t2;
assign t0=P0;
assign t1=P0+P1+P2+P3;//(A0+B1)*(A1+B0)
assign t2=P3;
assign C=t0+((t1-t0-t2)<<128)+(t2<<256);
endmodule

