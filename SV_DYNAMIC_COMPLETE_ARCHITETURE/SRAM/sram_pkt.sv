class sram_pkt;
    rand bit[7:0]d_in;
    rand bit[2:0]addr;
         bit wren,rden;
         bit[7:0]d_out;
         bit clk,rst;

         bit [7:0] a,b;

         extern function void print(string n = "");
         
         extern function void post_randomize();

         extern constraint c1;
endclass

        function void sram_pkt::print(string n = "");
                $display("NAME : [%0s] SRAM_INPUTS 1: clk=%0d | rst=%0d | wren=%0d - rden=%0d | D_IN =%0d ADDR=%0d D_OUT=%0d Time=%0t",n,clk,rst,wren,rden,d_in,addr,d_out,$time);
                //$display("NAME : [%0s] SRAM_INPUTS 2: | d_in=%0d - addr=%0d | d_out=%0d ",n,d_in,addr,d_out);
        endfunction

        function void sram_pkt::post_randomize();
           // a = d_in;
            b = addr;
        endfunction

        constraint sram_pkt::c1{ addr != b;}
