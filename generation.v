module generation(input a,b,c,output out);
assign out=a |(b & c);
endmodule