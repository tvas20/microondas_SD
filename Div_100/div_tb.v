// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module div_tb ();
reg Clk;
wire Divs;
div DUT(.divs(Divs),.clk(Clk));
assign i = 0;
initial 
begin
    $dumpfile("div_tb.vcd");
    $dumpvars(0, div_tb);
  	Clk = 0;
  for(i=0; i<200; i=i+1) begin
        #10 Clk <= 1;
    	#10 Clk <= 0;
    end
end
    
endmodule