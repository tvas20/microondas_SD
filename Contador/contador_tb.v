`include "contador.v"

module timer_tb();
    reg clock_tb, clearn_tb, loadn_tb, en_tb;
    reg [3:0] data_tb;
  	wire [3:0] sec_ones_tb, sec_tens_tb, mins_tb;
    wire zero_tb;
    
    timer DUT (.sec_ones(sec_ones_tb), .sec_tens(sec_tens_tb), .mins(mins_tb),
               .zero(zero_tb), .data(data_tb), 
               .loadn(loadn_tb), .clock(clock_tb), .en(en_tb), .clearn(clearn_tb));
    
    integer i;
    initial 
        begin

            clock_tb = 0; 
            for (i = 0; i < 200; i = i + 1) 
                #500 clock_tb = ~clock_tb;
                

        end

    initial
        begin
            
          $dumpfile("timer_tb.vcd");
          $dumpvars(0,timer_tb);

            clearn_tb = 1;
            en_tb = 0;

            // carregar digitos 
          
          	//mins
            loadn_tb = 0;
            data_tb = 0;
            #1000 loadn_tb = 1;

			//tens sec
          	loadn_tb = 0;
          	data_tb = 1;
          	#1000 loadn_tb = 1;

          	//ones sec
          	loadn_tb = 0;
          	data_tb = 0;
          	#1000 loadn_tb = 1;
          
            #9000 
            en_tb = 1;

            #15000;

            en_tb = 1;

            #5000;

            clearn_tb = 0;

            #5000;

            clearn_tb = 1;

            en_tb = 1;

            #15000;
    
            en_tb = 0;

        end
        
endmodule