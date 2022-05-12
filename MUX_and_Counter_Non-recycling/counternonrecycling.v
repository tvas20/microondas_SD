module counternonrecycling (input clock, output reg [7:0] q);
    initial begin
      q = 8'b00000000;
    end

    always @(posedge clock) begin
        q = q + 8'b00000001;
    end
endmodule