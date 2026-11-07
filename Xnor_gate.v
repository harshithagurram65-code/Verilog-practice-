module xnor_gate(
    input a,
    input b,
    output y
);

assign y = ~(a ^ b);

endmodule
module tb_xnor_gate;

reg a, b;
wire y;

xnor_gate dut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $dumpfile("xnor_gate.vcd");
    $dumpvars(0, tb_xnor_gate);

    $monitor("a=%b b=%b y=%b", a, b, y);

    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;

    $finish;
end

endmodule
