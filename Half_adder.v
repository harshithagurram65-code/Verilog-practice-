module half_adder(
    input a,
    input b,
    output sum,
    output carry
);

assign sum = a ^ b;
assign carry = a & b;

endmodule
module half_adder_tb;

reg a, b;
wire sum, carry;

half_adder dut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

initial begin

    $dumpfile("half_adder.vcd");
    $dumpvars(0, half_adder_tb);

    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;

    $finish;
end

initial begin
    $monitor("time=%0t a=%b b=%b sum=%b carry=%b",
             $time, a, b, sum, carry);
end

endmodule
