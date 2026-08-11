module decoder2to4 (
    input  wire       clk,
    input  wire       en,
    input  wire       A,
    input  wire       B,
    output reg  [3:0] Y
);

always @(posedge clk) begin
    if (en) begin
        case ({A,B})
            2'b00: Y <= 4'b0001;
            2'b01: Y <= 4'b0010;
            2'b10: Y <= 4'b0100;
            2'b11: Y <= 4'b1000;
            default: Y <= 4'b0000;
        endcase
    end
    else begin
        Y <= 4'b0000;
    end
end

endmodule
