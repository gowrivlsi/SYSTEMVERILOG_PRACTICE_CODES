class dff_pack;
    rand byte unsigned din;
         bit clk,rst;
         byte unsigned q;

         bit a;

         extern function void print(string n = "");

         extern function void post_randomize();

         extern constraint c1;
endclass

function void dff_pack::print(string n = "");
        $display("NAME [%0s] : DFF INPUTS_OUTPUT ->clk = %b | rst = %b | din = %b | q = %b | Time = %0t ",n,clk,rst,din,q,$time);
endfunction

function void dff_pack::post_randomize();
       a = din;
endfunction

constraint dff_pack::c1{din != a;}
