module karatsuba_mul_2(
    A, B, C
);

parameter m=2;
parameter n=4;
input [m-1:0]A;
input [m-1:0]B;
output [n-1:0]C;

wire T;

assign C[0] =A[0]&B[0];                                 
assign T =(C[0]&(A[1]&B[1])) ? 1 : 0;                   
assign C[2] = (T) ? 0 : A[1]&B[1];                      
assign C[1] = (T) ? 0 : ((A[0]&B[1])||(A[1]&B[0]));
assign C[3]=(T) ? 1 : 0;	
endmodule