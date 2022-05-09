
 
module div (divs, clk, reset, count);
 
    input clk, reset;
    output [6:0] count;
    output wire divs;

    wire reset_comb;
    reg [6:0] reg_count;
    
    assign count = reg_count;
    assign reset_comb = (reset & ((reg_count == 7'b1100011) ? 1'b0 : 1'b1));
    
    always @ (posedge clk) begin
        
        if (!reset_comb) reg_count <= 6'b000000;
        else reg_count <= reg_count + 1'b1;
        
        if (reg_count == 7'b1100011)
            divs = 1'b1;
        else 
            divs = 1'b0;
        
    end
 
endmodule
