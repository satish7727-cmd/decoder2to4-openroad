`timescale 1ns/1ps

module decoder2to4_tb;

    reg clk;
    reg en;
    reg A;
    reg B;

    wire [3:0] Y;

    decoder2to4 dut (
        .clk(clk),
        .en(en),
        .A(A),
        .B(B),
        .Y(Y)
    );

    // 10 ns clock period = 100 MHz
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        $dumpfile("decoder2to4.vcd");
        $dumpvars(0, decoder2to4_tb);

        // Initial condition
        en = 0;
        A  = 0;
        B  = 0;

        #12;

        // 00 -> Y = 0001
        en = 1;
        A  = 0;
        B  = 0;
        #10;

        // 01 -> Y = 0010
        A = 0;
        B = 1;
        #10;

        // 10 -> Y = 0100
        A = 1;
        B = 0;
        #10;

        // 11 -> Y = 1000
        A = 1;
        B = 1;
        #10;

        // Disable
        en = 0;
        #10;

        // Finish
        $finish;
    end

endmodule
