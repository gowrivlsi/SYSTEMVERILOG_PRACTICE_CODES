class pack;
    
    rand byte unsigned i0,i1,i2,i3;
    rand byte unsigned s0,s1;
    byte y;

    extern function void dis(string n="");

endclass

function void pack::dis(string n="");
        $display("Name : %0s",n);
        $display("Mux_Inputs : i0=%0d | i1=%0d | i2=%0d | i3=%0d",i0,i1,i2,i3);
        $display("Mux_Outputs : y=%0d",y);
endfunction
