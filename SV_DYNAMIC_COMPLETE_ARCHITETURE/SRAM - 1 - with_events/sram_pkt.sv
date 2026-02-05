class sram_pkt;
    rand bit[7:0]d_in;
    rand bit[2:0]addr;
         bit wren;
         bit[7:0]d_out;
         bit clk,rst;
            
         bit a;
         extern function void print(string n = "");
         
        // extern function void post_randomize();

         //extern constraint c1;
              /*  constraint c2{if(addr%2==1)
                                    d_in%2==0;
                               else
                                   d_in%2==1;
                                }*/
endclass

        function void sram_pkt::print(string n="");
                $display("NAME:[%s]",n);
                $display("data_in=%0d",d_in);
                $display("data_out=%0d",d_out);
                $display("addr=%0d",addr);
                $display("wren=%0d Time=%0t",wren,$time);
        endfunction

        /*
        function void sram_pkt::post_randomize();
            a = wren;
        endfunction */

       // constraint sram_pkt::c1{ wren != a;}
/*====================================================TESTCASE====================================================*/
    
