module carry_select_adder (input [3:0] a, b,input cin,output [3:0] sum,output cout);
    wire [3:0] sum0, sum1; 
    wire cout0, cout1;     
    ripple_carry_adder rca0 (.a(a), .b(b), .cin(1'b0), .sum(sum0), .cout(cout0));
    ripple_carry_adder rca1 (.a(a), .b(b), .cin(1'b1), .sum(sum1), .cout(cout1));
    assign {cout, sum} = (cin == 1'b0) ? {cout0, sum0} : {cout1, sum1};
endmodule
module ripple_carry_adder (input [3:0] a, b,input cin,output [3:0] sum,output cout);
    wire [3:1] carry; 
    full_adder fa0 ( .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(carry[1]));
    full_adder fa1 (.a(a[1]), .b(b[1]), .cin(carry[1]), .sum(sum[1]), .cout(carry[2]));
    full_adder fa2 ( .a(a[2]), .b(b[2]), .cin(carry[2]), .sum(sum[2]), .cout(carry[3]));
    full_adder fa3 ( .a(a[3]), .b(b[3]), .cin(carry[3]), .sum(sum[3]), .cout(cout));
endmodule
module full_adder (input a, b, cin,output sum, cout);
    assign sum = a ^ b ^ cin;  
    assign cout = (a & b) | (b & cin) | (a & cin);  
endmodule
