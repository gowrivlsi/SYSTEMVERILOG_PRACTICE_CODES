class mux_pack;
    rand bit[3:0] i;
    randc bit[1:0] s;
         bit y;
         int a,b;
         bit [3:0]d_o;//output of dmux

          function void print(string n = "");
                $display("NAME : %0s",n);
                $display("MUX_INPUTS : i = %b | s = %b",i,s);
                $display("MUX_OUTPUT : y = %b",y);
                $display("DMUX_INPUTS : Y = %b ",y);
                $display("DMUX_OUTPUT : d_o = %0b | s = %b",d_o,s);
          endfunction

          extern function void post_randomize();
          
          extern constraint c1;

endclass

function void mux_pack::post_randomize();
        a = i;
        b = s;
endfunction

constraint mux_pack::c1{i != a && s != b ;}
