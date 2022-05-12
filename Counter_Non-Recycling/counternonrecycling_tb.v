`timescale 1ns/1ps
module counternonrecycling_tb;
	reg clock, reset;
	wire [3:0] data;
	
	counternonrecycling dut( clock, reset, data);
	
    initial begin 
		$dumpfile("counternonrecycling_tb.vcd");
        $dumpvars(0, counternonrecycling_tb);

		clock = 1'b0; 

		repeat(30) 
			#3 clock= ~clock; 
		end

		initial begin 
			reset=1'b1;
			#7 reset=1'b0; 
			#35 reset=1'b1; 
		end

		initial begin 
			data=4'b1000;
			#14 data=4'b1101;
			#2 data=4'b1111;
		end
	end
endmodule