class dram_pkt;

    rand bit[7:0] d_in;
    rand bit[2:0]addr;
         bit[7:0] d_out;
         bit wren,refresh;
         bit clk,rst;

            extern function void print(string n = "");

            
endclass

            function void dram_pkt::print(string n = "");
                    $display("Name : %0s",n);
                    $display("Data_in = %0d | Addr = %0d",d_in,addr);
                    $display("clk = %0d | Rst = %0d",clk,rst);
                    $display("wren = %0d | Refresh = %0d",wren,refresh);
                    $display("Data_out = %0d | Time = %0t",d_out,$time);
            endfunction
