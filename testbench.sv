module carry_select_adder_tb;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;
    carry_select_adder uut ( .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    initial begin
        $dumpfile("dumpfile.vcd");
    	$dumpvars(1);
        // Test case 1
        a = 4'b0001; b = 4'b0010; cin = 1'b0;
        #10;
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);
        // Test case 2
        a = 4'b1010; b = 4'b0110; cin = 1'b0;
        #10;
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);
        // Test case 3
        a = 4'b0111; b = 4'b1101; cin = 1'b1;
        #10;
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);
        // Test case 4
        a = 4'b1111; b = 4'b1111; cin = 1'b1;
        #10;
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);
        $stop; 
    end
endmodule
