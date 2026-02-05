class mux_pack;
    rand bit[3:0] i;
    rand bit[1:0] s;
         bit y;
         bit bf_y;//for bfm 
         int a,b;

          function void print(string n = "");
                $display("NAME : %0s",n);
                $display("MUX_INPUTS : i = %0d | s = %0d",i,s);
                $display("MUX_OUTPUT : y = %0d",y);
          endfunction

          extern function void post_randomize();
          
          extern constraint c1;

endclass

function void mux_pack::post_randomize();
        a = i;
        b = s;
endfunction

constraint mux_pack::c1{i != a || s != b ;}
