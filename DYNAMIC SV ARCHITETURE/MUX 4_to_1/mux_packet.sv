class mux_pack;
    
      rand bit i0,i1,i2,i3,s0,s1;
           bit y;
           int a,b,c,d,e,f;

           extern function void print(string n = "");

           extern function void post_randomize();

           extern constraint c1;
endclass

function void mux_pack::print(string n = "");
            $display("Name : %0s",n);
            $display("i0 = %0d | i1 = %0d | i2 = %0d | i3 = %0d",i0,i1,i2,i3);
            $display("s0 = %0d | s1 = %0d",s0,s1);
            $display("MUX_OUTPUT Y : [%0d]",y);
endfunction

function void mux_pack::post_randomize();
        a = i0;
        b = i1;
        c = i2;
        d = i3;
        e = s0;
        f = s1;
endfunction

constraint mux_pack::c1{i0!= a || i1!= b || i2!= c || i3!= d || s0!= e || s1!= f;}
