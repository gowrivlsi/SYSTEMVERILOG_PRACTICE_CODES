class sram_packet;
    rand bit [7:0]data;
         bit [2:0]addr;
         bit wr_en;
         bit [7:0]data_out;

     extern function void print(string msg="");
endclass

    function void sram_packet::print(string msg="");
        $display("msg=%s",msg);
        $display("data=%0d",data);
        $display("data_out=%0d",data_out);
        $display("addr=%0d",addr);
        $display("wr_en=%0d",wr_en);
endfunction

class sram_packet1;
   rand bit [7:0]data;
   rand bit [2:0]addr;
         bit wr_en;
         bit [7:0]data_out;

  

  constraint c1{addr%2==1;}

  function void print(string msg="");
        $display("msg=%s",msg);
        $display("data=%0d",data);
        $display("data_out=%0d",data_out);
        $display("addr=%0d",addr);
        $display("wr_en=%0d",wr_en);
endfunction

endclass


