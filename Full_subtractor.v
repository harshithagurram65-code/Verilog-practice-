// Full Subtractor Design
module full_subtractor(
    input a,
    input b,
    input bin,
    output diff,
    output bout
);

assign diff = a ^ b ^ bin;

assign bout = (~a & b) | (~(a ^ b) & bin);

endmodule

module full_subtractor_tb;

reg a,b,bin;
wire diff,bout;

full_subtractor dut(
    .a(a),
    .b(b),
    .bin(bin),
    .diff(diff),
    .bout(bout)
);

initial begin
    $dumpfile("full_subtractor.vcd");
    $dumpvars(0, full_subtractor_tb);

    a=0;b=0;bin=0;#10;
    a=0;b=0;bin=1;#10;
    a=0;b=1;bin=0;#10;
    a=0;b=1;bin=1;#10;
    a=1;b=0;bin=0;#10;
    a=1;b=0;bin=1;#10;
    a=1;b=1;bin=0;#10;
    a=1;b=1;bin=1;#10;

    $finish;
end

initial
    $monitor("time=%0t a=%b b=%b bin=%b diff=%b bout=%b",
             $time, a, b, bin, diff, bout);

endmodule
