module xor_gate(
    input a,
    input b,
    output y
);

assign y = a ^ b;

endmodule
module tb_xor_gate;

reg a, b;
wire y;

xor_gate dut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $dumpfile("xor_gate.vcd");
    $dumpvars(0, tb_xor_gate);

    $monitor("a=%b b=%b y=%b", a, b, y);

    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;

    $finish;
end

endmodule
