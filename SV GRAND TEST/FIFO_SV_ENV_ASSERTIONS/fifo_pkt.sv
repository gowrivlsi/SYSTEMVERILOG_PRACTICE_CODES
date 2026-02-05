class fifo_pkt;
    rand bit [7:0]   d_in;
         bit         wr,rd,clk,rst;
         bit         full,empty;
         bit [7:0]   d_out;

         bit [7:0]   temp;

         extern function void print(string n = "");

                constraint c1{d_in inside{[1:100]};}
                constraint c2;
                
                function void post_randomize;
                    temp=d_in;
                endfunction
         
endclass

constraint fifo_pkt::c2{d_in!=temp;}

function void fifo_pkt::print(string n = "");
    $display("NAME: [%0s] clk=%0d | rst=%0d",n,clk,rst);
    $display("DATA_IN = %0d | wr=%0d | rd=%0d",d_in,wr,rd);
    $display("DATA_OUT = %0d | full=%0d | empty=%0d",d_out,full,empty);
endfunction
