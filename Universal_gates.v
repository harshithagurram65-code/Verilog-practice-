module universal_gates(
    input a,
    input b,
    output nand_y,
    output nor_y
);

assign nand_y = ~(a & b);
assign nor_y  = ~(a | b);

endmodule
module universal_gates_tb;

reg a, b;
wire nand_y, nor_y;

universal_gates dut (
    .a(a),
    .b(b),
    .nand_y(nand_y),
    .nor_y(nor_y)
);

initial begin

    $dumpfile("universal_gates.vcd");
    $dumpvars(0, universal_gates_tb);

    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;

    $finish;
end

initial begin
    $monitor("time=%0t a=%b b=%b NAND=%b NOR=%b",
              $time, a, b, nand_y, nor_y);
end

endmodule
