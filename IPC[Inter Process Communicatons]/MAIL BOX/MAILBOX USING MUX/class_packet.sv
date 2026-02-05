class pack;
    rand byte unsigned i0,i1,i2,i3;
    rand byte unsigned s0,s1;
    
    extern function void dis(string n="");    
endclass

    function void pack::dis(string n="");
        $display("Name : %0s",n);
        $display("i0=%0d i1=%0d i2=%0d i3=%0d",i0,i1,i2,i3);
        $display("s0=%0d s1=%0d",s0,s1);
    endfunction
