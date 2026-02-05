//===========================================Packet CLass===========================================
class pack;
    rand byte unsigned a,b;
    byte sum,carry;

    extern function void dis(string n="");
endclass

    function void pack::dis(string n="");
        $display("Name : %0s",n);
        $display("a=%0d",a);
        $display("b=%0d",b);
        $display("sum=%0d carry=%0d",sum,carry);
    endfunction
