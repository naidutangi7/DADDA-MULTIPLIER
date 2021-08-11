
module brentkung(input [31:0] a,b,output [31:0] sum,input cin,output cout);

wire [31:0] G_1,P_1;
wire [15:0] G_2,P_2;
wire [7:0] G_3,P_3;
wire [3:0] G_4,P_4;
wire [1:0] G_5,P_5;
wire  G_6,P_6;
wire [31:0] carry;
assign carry[0]=cin;
genvar i;

generate
for(i=0;i<32;i=i+1) begin:first_order
assign G_1[i]=a[i] & b[i];
assign P_1[i]=a[i] ^ b[i];
end
endgenerate

generate
for(i=0;i<16;i=i+1) begin:second_order
generation G2 (G_1[2*i+1],P_1[2*i+1],G_1[2*i],G_2[i]);
and_gate P2 (P_1[2*i+1],P_1[2*i],P_2[i]);
end
endgenerate

generate
for(i=0;i<8;i=i+1) begin:third_order
generation G3 (G_2[2*i+1],P_2[2*i+1],G_2[2*i],G_3[i]);
and_gate P3 (P_2[2*i+1],P_2[2*i],P_3[i]);
end
endgenerate

generate
for(i=0;i<4;i=i+1) begin:fourth_order
generation G4 (G_3[2*i+1],P_3[2*i+1],G_3[2*i],G_4[i]);
and_gate P4 (P_3[2*i+1],P_3[2*i],P_4[i]);
end
endgenerate

generate
for(i=0;i<2;i=i+1) begin:fifth_order
generation G5 (G_4[2*i+1],P_4[2*i+1],G_4[2*i],G_5[i]);
and_gate P5 (P_4[2*i+1],P_4[2*i],P_5[i]);
end
endgenerate



generate
for(i=0;i<16;i=i+1) begin:carry1
generation G7 (G_1[2*i],P_1[2*i],carry[2*i],carry[2*i+1]);
end
endgenerate

generate
for(i=0;i<8;i=i+1) begin:carry2
generation G8 (G_2[2*i],P_2[2*i],carry[4*i],carry[4*i+2]);
end
endgenerate

generate
for(i=0;i<4;i=i+1) begin:carry3
generation G9 (G_3[2*i],G_3[2*i],carry[8*i],carry[8*i+4]);
end
endgenerate
generate
generation G6 (G_5[1],P_5[1],G_5[0],G_6);
and_gate P6 (P_5[1],P_5[0],P_6);

generation G10 (G_4[0],P_4[0],carry[0],carry[8]);

generation G11 (G_5[0],P_5[0],carry[0],carry[16]);

generation G12 (G_4[2],P_4[2],carry[16],carry[24]);

generation G13 (G_6,P_6,carry[0],cout);
endgenerate
generate
for(i=0;i<32;i=i+1) begin:sum_final
assign sum[i]=P_1[i] ^ carry[i];
end
endgenerate


endmodule
