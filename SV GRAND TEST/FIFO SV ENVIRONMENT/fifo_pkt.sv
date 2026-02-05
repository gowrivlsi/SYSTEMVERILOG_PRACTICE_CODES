class fifo_pkt;
    rand bit[7:0]d_in;
         bit clk,rst;
         bit wr,rd,full,empty;
         bit [7:0]d_out;

         extern function void print(string n = "");
endclass

        function void fifo_pkt::print(string n = "");
                $display("NAME : [%0s]",n);
                $display("Data_in=%0d",d_in);
                $display("clk=%0d | Rst=%0d",clk,rst);
                $display("wr=%0d | rd=%0d | Full=%0d | Empty=%0d",wr,rd,full,empty);
                $display("Data_out=%0d | Time=%0t",d_out,$time);
        endfunction
