class pack;
    rand int a;

    function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%0d",a);
    endfunction
    
    constraint c1{a%4==0;a inside{[0:50]};}
endclass

module top;
    pack p1;
        initial begin
            p1=new;
            repeat(8)begin
                assert(p1.randomize());
                p1.dis("Adderss");
            end
        end
endmodule
