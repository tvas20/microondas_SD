module counternonrecycling (clk, rst, q);
    input clk, rst;
    output [3:0] q;
    reg [3:0] count;

    always @(posedge clk or negedge rst)
    begin
      if (rst == 1’b0)
      count <= 4’b0000;
      else if (count == 4’b0111)
      count <= 4’b0000;
      else
      count <= count + 1;
    end

    assign q = count;
endmodule