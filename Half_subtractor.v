module half_subtractor(
    input a,
    input b,
    output diff,
    output borrow
);

assign diff = a ^ b;
assign borrow = (~a) & b;

endmodule
module half_subtractor_tb;

reg a, b;
wire diff, borrow;

half_subtractor dut(
    .a(a),
    .b(b),
    .diff(diff),
    .borrow(borrow)
);

initial begin
    $dumpfile("half_subtractor.vcd");
    $dumpvars(0, half_subtractor_tb);

    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;

    $finish;
end

initial
    $monitor("time=%0t a=%b b=%b diff=%b borrow=%b",
              $time, a, b, diff, borrow);

endmodule
