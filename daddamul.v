module daddamul(input [15:0] multiplier,multiplicand,output [31:0] product
    );


//for partial products internal wires
wire [15:0] part_prod [15:0];

//for secondond layer internal wires
wire [18:13] second_1;
wire [19:14] second_2;
wire [17:14] second_3;
wire [18:15] second_4;
wire [16:15] second_5;
wire [17:16] second_6;

//for third layer internal wires
wire [22:9] third_1;
wire [23:10] third_2;
wire [21:10] third_3;
wire [22:11] third_4;
wire [20:11] third_5;
wire [21:12] third_6;
wire [19:12] third_7;
wire [20:13] third_8;

//for fourth layer internal wires

wire [25:6] fourth_1;
wire [26:7] fourth_2;
wire [24:7] fourth_3;
wire [25:8] fourth_4;
wire [23:8] fourth_5;
wire [24:9] fourth_6;

//for fifth layer internal wires
wire [27:4] fifth_1;
wire [28:5] fifth_2;
wire [26:5] fifth_3;
wire [27:6] fifth_4;


//for sixth layer internal wires
wire [28:3] sixth_1;
wire [29:4] sixth_2;
//for seventh layer internal wires
wire [31:0] seventh_1,seventh_2;


genvar i;

generate
for(i=0;i<16;i=i+1) begin:partial_products
and_gate p1 (multiplier[i],multiplicand[0],part_prod[0][i]);
and_gate p2(multiplier[i],multiplicand[1],part_prod[1][i]);
and_gate p3(multiplier[i],multiplicand[2],part_prod[2][i]);
and_gate p4(multiplier[i],multiplicand[3],part_prod[3][i]);
and_gate p5(multiplier[i],multiplicand[4],part_prod[4][i]);
and_gate p6(multiplier[i],multiplicand[5],part_prod[5][i]);
and_gate p7(multiplier[i],multiplicand[6],part_prod[6][i]);
and_gate p8(multiplier[i],multiplicand[7],part_prod[7][i]);
and_gate p9(multiplier[i],multiplicand[8],part_prod[8][i]);
and_gate p10(multiplier[i],multiplicand[9],part_prod[9][i]);
and_gate p11(multiplier[i],multiplicand[10],part_prod[10][i]);
and_gate p12(multiplier[i],multiplicand[11],part_prod[11][i]);
and_gate p13(multiplier[i],multiplicand[12],part_prod[12][i]);
and_gate p14(multiplier[i],multiplicand[13],part_prod[13][i]);
and_gate p15(multiplier[i],multiplicand[14],part_prod[14][i]);
and_gate p16(multiplier[i],multiplicand[15],part_prod[15][i]);

end
endgenerate

// first stage reduction
half_adder h1(part_prod[0][13],part_prod[1][12],second_1[13],second_2[14]);
half_adder h2(part_prod[3][11],part_prod[4][10],second_3[14],second_4[15]);
full_adder f1(part_prod[0][14],part_prod[1][13],part_prod[2][12],second_1[14],second_2[15]);
full_adder f2(part_prod[0][15],part_prod[1][14],part_prod[2][13],second_1[15],second_2[16]);
full_adder f3(part_prod[3][12],part_prod[4][11],part_prod[5][10],second_3[15],second_4[16]);
half_adder h3(part_prod[6][9],part_prod[7][8],second_5[15],second_6[16]);
full_adder f4(part_prod[1][15],part_prod[2][14],part_prod[3][13],second_1[16],second_2[17]);
full_adder f5(part_prod[4][12],part_prod[5][11],part_prod[6][10],second_3[16],second_4[17]);
half_adder h4(part_prod[7][9],part_prod[8][8],second_5[16],second_6[17]);
full_adder f8(part_prod[2][15],part_prod[3][14],part_prod[4][13],second_1[17],second_2[18]);
full_adder f6(part_prod[5][12],part_prod[6][11],part_prod[7][10],second_3[17],second_4[18]);
full_adder f7(part_prod[3][15],part_prod[4][14],part_prod[5][13],second_1[18],second_2[19]);

// secondond stage reduction

half_adder h6(part_prod[0][9],part_prod[1][8],third_1[9],third_2[10]);
full_adder f9(part_prod[0][10],part_prod[1][9],part_prod[2][8],third_1[10],third_2[11]);
half_adder h5(part_prod[3][7],part_prod[4][6],third_3[10],third_4[11]);

full_adder f10(part_prod[0][11],part_prod[1][10],part_prod[2][9],third_1[11],third_2[12]);
full_adder f11(part_prod[3][8],part_prod[4][7],part_prod[5][6],third_3[11],third_4[12]);
half_adder h7(part_prod[6][5],part_prod[7][4],third_5[11],third_6[12]);

full_adder f12(part_prod[0][12],part_prod[1][11],part_prod[2][10],third_1[12],third_2[13]);
full_adder f13(part_prod[3][9],part_prod[4][8],part_prod[5][7],third_3[12],third_4[13]);
full_adder f14(part_prod[6][6],part_prod[7][5],part_prod[8][4],third_5[12],third_6[13]);
half_adder h8(part_prod[9][3],part_prod[10][2],third_7[12],third_8[13]);


full_adder f15(part_prod[2][11],part_prod[3][10],part_prod[4][9],third_1[13],third_2[14]);
full_adder f16(part_prod[5][8],part_prod[6][7],part_prod[7][6],third_3[13],third_4[14]);
full_adder f17(part_prod[8][5],part_prod[9][4],part_prod[10][3],third_5[13],third_6[14]);
full_adder f18(part_prod[11][2],part_prod[12][1],part_prod[13][0],third_7[13],third_8[14]);

full_adder f19(part_prod[5][9],second_1[14],second_3[14],third_1[14],third_2[15]);
full_adder f20(part_prod[6][8],part_prod[7][7],part_prod[8][6],third_3[14],third_4[15]);
full_adder f21(part_prod[9][5],part_prod[10][4],part_prod[11][3],third_5[14],third_6[15]);
full_adder f22(part_prod[13][1],part_prod[14][0],part_prod[12][2],third_7[14],third_8[15]);

full_adder f23(second_1[15],second_2[15],second_3[15],third_1[15],third_2[16]);
full_adder f24(part_prod[8][7],part_prod[9][6],second_5[15],third_3[15],third_4[16]);
full_adder f25(part_prod[10][5],part_prod[11][4],part_prod[12][3],third_5[15],third_6[16]);
full_adder f26(part_prod[13][2],part_prod[14][1],part_prod[15][0],third_7[15],third_8[16]);


full_adder f27(second_1[16],second_2[16],second_3[16],third_1[16],third_2[17]);
full_adder f28(part_prod[9][7],second_5[16],second_6[16],third_3[16],third_4[17]);
full_adder f29(part_prod[10][6],part_prod[11][5],part_prod[12][4],third_5[16],third_6[17]);
full_adder f30(part_prod[13][3],part_prod[14][2],part_prod[15][1],third_7[16],third_8[17]);

full_adder f31(second_1[17],second_2[17],second_3[17],third_1[17],third_2[18]);
full_adder f32(part_prod[9][8],part_prod[8][9],second_6[17],third_3[17],third_4[18]);
full_adder f33(part_prod[10][7],part_prod[11][6],part_prod[12][5],third_5[17],third_6[18]);
full_adder f34(part_prod[13][4],part_prod[14][3],part_prod[15][2],third_7[17],third_8[18]);


full_adder f35(second_1[18],second_2[18],part_prod[6][12],third_1[18],third_2[19]);
full_adder f36(part_prod[9][9],part_prod[8][10],part_prod[7][11],third_3[18],third_4[19]);
full_adder f37(part_prod[10][8],part_prod[11][7],part_prod[12][6],third_5[18],third_6[19]);
full_adder f38(part_prod[13][5],part_prod[14][4],part_prod[15][3],third_7[18],third_8[19]);


full_adder f39(part_prod[4][15],part_prod[5][14],part_prod[6][13],third_1[19],third_2[20]);
full_adder f40(part_prod[7][12],part_prod[8][11],part_prod[9][10],third_3[19],third_4[20]);
full_adder f41(part_prod[10][9],part_prod[11][8],part_prod[12][7],third_5[19],third_6[20]);
full_adder f42(part_prod[13][6],part_prod[14][5],part_prod[15][4],third_7[19],third_8[20]);


full_adder f420(part_prod[5][15],part_prod[6][14],part_prod[7][13],third_1[20],third_2[21]);
full_adder f43(part_prod[8][12],part_prod[9][11],part_prod[10][10],third_3[20],third_4[21]);
full_adder f44(part_prod[11][9],part_prod[12][8],part_prod[13][7],third_5[20],third_6[21]);
full_adder f45(part_prod[6][15],part_prod[7][14],part_prod[8][13],third_1[21],third_2[22]);
full_adder f46(part_prod[9][12],part_prod[10][11],part_prod[11][10],third_3[21],third_4[22]);
full_adder f47(part_prod[7][15],part_prod[8][14],part_prod[9][13],third_1[22],third_2[23]);



// third stage reduction
half_adder h9 (part_prod[0][6],part_prod[1][5],fourth_1[6],fourth_2[7]);
full_adder f48 (part_prod[0][7],part_prod[1][6],part_prod[2][5],fourth_1[7],fourth_2[8]);
half_adder h10 (part_prod[3][4],part_prod[4][3],fourth_3[7],fourth_4[8]);
full_adder f49 (part_prod[0][8],part_prod[1][7],part_prod[2][6],fourth_1[8],fourth_2[9]);
full_adder f50 (part_prod[3][5],part_prod[4][4],part_prod[5][3],fourth_3[8],fourth_4[9]);
half_adder h11 (part_prod[6][2],part_prod[7][1],fourth_5[8],fourth_6[9]);



full_adder f51 (part_prod[2][7],part_prod[3][6],third_1[9],fourth_1[9],fourth_2[10]);
full_adder f52 (part_prod[4][5],part_prod[5][4],part_prod[6][3],fourth_3[9],fourth_4[10]);
full_adder f53 (part_prod[7][2],part_prod[8][1],part_prod[9][0],fourth_5[9],fourth_6[10]);


full_adder f54 (third_1[10],third_2[10],third_3[10],fourth_1[10],fourth_2[11]);
full_adder f55 (part_prod[5][5],part_prod[6][4],part_prod[7][3],fourth_3[10],fourth_4[11]);
full_adder f56 (part_prod[8][2],part_prod[9][1],part_prod[10][0],fourth_5[10],fourth_6[11]);


full_adder f57 (third_1[11],third_2[11],third_3[11],fourth_1[11],fourth_2[12]);
full_adder f58 (third_4[11],third_5[11],part_prod[8][3],fourth_3[11],fourth_4[12]);
full_adder f59 (part_prod[11][0],part_prod[9][2],part_prod[10][1],fourth_5[11],fourth_6[12]);


full_adder f60 (third_1[12],third_2[12],third_3[12],fourth_1[12],fourth_2[13]);
full_adder f61 (third_4[12],third_5[12],third_6[12],fourth_3[12],fourth_4[13]);
full_adder f62 (third_7[12],part_prod[11][1],part_prod[12][0],fourth_5[12],fourth_6[13]);
full_adder f63 (third_1[13],third_2[13],third_3[13],fourth_1[13],fourth_2[14]);
full_adder f64 (third_4[13],third_5[13],third_6[13],fourth_3[13],fourth_4[14]);
full_adder f65 (third_7[13],third_8[13],second_1[13],fourth_5[13],fourth_6[14]);



full_adder f66 (third_1[14],third_2[14],third_3[14],fourth_1[14],fourth_2[15]);
full_adder f67 (third_4[14],third_5[14],third_6[14],fourth_3[14],fourth_4[15]);
full_adder f68 (third_7[14],third_8[14],second_2[14],fourth_5[14],fourth_6[15]);
full_adder f69 (third_1[15],third_2[15],third_3[15],fourth_1[15],fourth_2[16]);
full_adder f70 (third_4[15],third_5[15],third_6[15],fourth_3[15],fourth_4[16]);
full_adder f71 (third_7[15],third_8[15],second_4[15],fourth_5[15],fourth_6[16]);



full_adder f72 (third_1[16],third_2[16],third_3[16],fourth_1[16],fourth_2[17]);
full_adder f73 (third_4[16],third_5[16],third_6[16],fourth_3[16],fourth_4[17]);
full_adder f74 (third_7[16],third_8[16],second_4[16],fourth_5[16],fourth_6[17]);
full_adder f75 (third_1[17],third_2[17],third_3[17],fourth_1[17],fourth_2[18]);
full_adder f76 (third_4[17],third_5[17],third_6[17],fourth_3[17],fourth_4[18]);
full_adder f77 (third_7[17],third_8[17],second_4[17],fourth_5[17],fourth_6[18]);

full_adder f78 (third_1[18],third_2[18],third_3[18],fourth_1[18],fourth_2[19]);
full_adder f79 (third_4[18],third_5[18],third_6[18],fourth_3[18],fourth_4[19]);
full_adder f80 (third_7[18],third_8[18],second_4[18],fourth_5[18],fourth_6[19]);
full_adder f81 (third_1[19],third_2[19],third_3[19],fourth_1[19],fourth_2[20]);
full_adder f82 (third_4[19],third_5[19],third_6[19],fourth_3[19],fourth_4[20]);
full_adder f83 (third_7[19],third_8[19],second_2[19],fourth_5[19],fourth_6[20]);


full_adder f84 (third_1[20],third_2[20],third_3[20],fourth_1[20],fourth_2[21]);
full_adder f85 (third_4[20],third_5[20],third_6[20],fourth_3[20],fourth_4[21]);
full_adder f86 (third_8[20],part_prod[15][5],part_prod[14][6],fourth_5[20],fourth_6[21]);
full_adder f87 (third_1[21],third_2[21],third_3[21],fourth_1[21],fourth_2[22]);
full_adder f88 (third_4[21],third_6[21],part_prod[12][9],fourth_3[21],fourth_4[22]);
full_adder f89 (part_prod[13][8],part_prod[15][6],part_prod[14][7],fourth_5[21],fourth_6[22]);




full_adder f90 (third_1[22],third_2[22],part_prod[10][12],fourth_1[22],fourth_2[23]);
full_adder f91 (third_4[22],part_prod[11][11],part_prod[12][10],fourth_3[22],fourth_4[23]);
full_adder f92 (part_prod[13][9],part_prod[14][8],part_prod[15][7],fourth_5[22],fourth_6[23]);
full_adder f93 (third_2[23],part_prod[8][15],part_prod[9][14],fourth_1[23],fourth_2[24]);
full_adder f94 (part_prod[10][13],part_prod[11][12],part_prod[12][11],fourth_3[23],fourth_4[24]);
full_adder f95 (part_prod[13][10],part_prod[14][9],part_prod[15][8],fourth_5[23],fourth_6[24]);



full_adder f96 (part_prod[9][15],part_prod[10][14],part_prod[11][13],fourth_1[24],fourth_2[25]);
full_adder f97 (part_prod[12][12],part_prod[13][11],part_prod[14][10],fourth_3[24],fourth_4[25]);/////doubt
full_adder f98 (part_prod[10][15],part_prod[11][14],part_prod[12][13],fourth_1[25],fourth_2[26]);




// fourth stage reduction

half_adder h50 (part_prod[0][4],part_prod[1][3],fifth_1[4],fifth_2[5]);
full_adder f99(part_prod[0][5],part_prod[1][4],part_prod[2][3],fifth_1[5],fifth_2[6]);
half_adder h51 (part_prod[3][2],part_prod[4][1],fifth_3[5],fifth_4[6]);

full_adder f100(fourth_1[6],part_prod[2][4],part_prod[3][3],fifth_1[6],fifth_2[7]);
full_adder f101(part_prod[4][2],part_prod[5][1],part_prod[6][0],fifth_3[6],fifth_4[7]);

full_adder f102 (fourth_1[7],fourth_2[7],fourth_3[7],fifth_1[7],fifth_2[8]);
full_adder f103(part_prod[5][2],part_prod[6][1],part_prod[7][0],fifth_3[7],fifth_4[8]);




full_adder f104 (fourth_1[8],fourth_2[8],fourth_3[8],fifth_1[8],fifth_2[9]);
full_adder f105 (fourth_4[8],fourth_5[8],part_prod[8][0],fifth_3[8],fifth_4[9]);


generate
for(i=9;i<=23;i=i+1) begin:fourth_stage
full_adder f106 (fourth_1[i],fourth_2[i],fourth_3[i],fifth_1[i],fifth_2[i+1]);
full_adder f107 (fourth_4[i],fourth_5[i],fourth_6[i],fifth_3[i],fifth_4[i+1]);
end
endgenerate


full_adder f108 (fourth_1[24],fourth_2[24],fourth_3[24],fifth_1[24],fifth_2[25]);
full_adder f109 (fourth_4[24],part_prod[15][9],fourth_6[24],fifth_3[24],fifth_4[25]);


full_adder f110 (fourth_1[25],fourth_2[25],part_prod[13][12],fifth_1[25],fifth_2[26]);
full_adder f111 (fourth_4[25],part_prod[14][11],part_prod[15][10],fifth_3[25],fifth_4[26]);



full_adder f112 (fourth_2[26],part_prod[11][15],part_prod[12][14],fifth_1[26],fifth_2[27]);
full_adder f113 (part_prod[13][13],part_prod[14][12],part_prod[15][11],fifth_3[26],fifth_4[27]);
full_adder f114 (part_prod[12][15],part_prod[13][14],part_prod[14][13],fifth_1[27],fifth_2[28]);









//fifth stage reduction

half_adder h60 (part_prod[0][3],part_prod[1][2],sixth_1[3],sixth_2[4]);
full_adder f115 (part_prod[2][2],part_prod[3][1],part_prod[4][0],sixth_1[4],sixth_2[5]);
full_adder f116 (fifth_2[5],fifth_3[5],part_prod[5][0],sixth_1[5],sixth_2[6]);

generate
for(i=6;i<=26;i=i+1) begin:fifth_stage
full_adder f117 (fifth_1[i],fifth_2[i],fifth_3[i],sixth_1[i],sixth_2[i+1]);
end
endgenerate
full_adder f118 (fifth_1[27],fifth_2[27],part_prod[15][12],sixth_1[27],sixth_2[28]);
full_adder f119 (fifth_2[28],part_prod[13][15],part_prod[14][14],sixth_1[28],sixth_2[29]);


//sixth stage reduction


half_adder h61 (part_prod[0][2],part_prod[1][1],seventh_1[2],seventh_2[3]);
full_adder f620 (sixth_1[3],part_prod[2][1],part_prod[3][0],seventh_1[3],seventh_2[4]);
generate
for(i=4;i<=5;i=i+1) begin:last_stage
full_adder f120 (sixth_1[i],sixth_2[i],fifth_1[i],seventh_1[i],seventh_2[i+1]);
end
endgenerate

generate
for(i=6;i<=27;i=i+1) begin:last_stage_2
full_adder f121 (sixth_1[i],sixth_2[i],fifth_4[i],seventh_1[i],seventh_2[i+1]);
end
endgenerate




full_adder f122 (sixth_1[28],sixth_2[28],part_prod[15][13],seventh_1[28],seventh_2[29]);
full_adder f123 (part_prod[14][15],sixth_2[29],part_prod[15][14],seventh_1[29],seventh_2[30]);




assign seventh_1[0]=part_prod[0][0];
assign seventh_2[0]=0;
assign seventh_1[1]=part_prod[0][1];
assign seventh_2[1]=part_prod[1][0];
assign seventh_2[2]=part_prod[2][0];
assign seventh_1[30]=part_prod[15][15];
assign seventh_1[31]=0;
assign seventh_2[31]=0;
wire [0:0] cin;


brentkung b1 (seventh_1,seventh_2,product,0,cin);

endmodule





















