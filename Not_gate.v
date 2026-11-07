module not_gate(
    input a,
    output y
);

assign y = ~a;

endmodule
module tb_not_gate;

reg a;
wire y;

not_gate dut (
    .a(a),
    .y(y)
);

initial begin

    $monitor("a=%b y=%b", a, y);

    a = 0; #10;
    a = 1; #10;

    $finish;
end

endmodule
