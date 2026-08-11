module decoder2to4 (A,
    B,
    clk,
    en,
    Y);
 input A;
 input B;
 input clk;
 input en;
 output [3:0] Y;

 wire net1;
 wire net2;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire _0_;
 wire _1_;
 wire _2_;
 wire _3_;
 wire net3;
 wire clknet_0_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;

 sky130_fd_sc_hd__dfxtp_1 \Y[0]$_SDFF_PN0_  (.D(_2_),
    .Q(net4),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfxtp_1 \Y[1]$_SDFF_PN0_  (.D(_1_),
    .Q(net5),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfxtp_1 \Y[2]$_SDFF_PN0_  (.D(_0_),
    .Q(net6),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfxtp_1 \Y[3]$_SDFF_PN0_  (.D(_3_),
    .Q(net7),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__and3b_1 _4_ (.A_N(net2),
    .B(net1),
    .C(net3),
    .X(_0_));
 sky130_fd_sc_hd__and3b_1 _5_ (.A_N(net1),
    .B(net3),
    .C(net2),
    .X(_1_));
 sky130_fd_sc_hd__nor3b_2 _6_ (.A(net2),
    .B(net1),
    .C_N(net3),
    .Y(_2_));
 sky130_fd_sc_hd__and3_2 _7_ (.A(net2),
    .B(net1),
    .C(net3),
    .X(_3_));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .X(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .X(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input1 (.A(A),
    .X(net1));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input2 (.A(B),
    .X(net2));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input3 (.A(en),
    .X(net3));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output4 (.A(net4),
    .X(Y[0]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output5 (.A(net5),
    .X(Y[1]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output6 (.A(net6),
    .X(Y[2]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output7 (.A(net7),
    .X(Y[3]));
endmodule
