//===================================================1st and 2nd Questions==========================================
class class_test;
    
    randc int a;
    rand int c,d;

    function void dis(string n="");
        $display("Name=%0s",n);
        //$display("a=%0d b=%0b",a,b);
        $display("a=%0d",a);
        $display("c=%0d d=%0d",c,d);
    endfunction

    constraint c1{a inside{[5:15]};}
    constraint c2{c<d; c inside{[0:50]};d inside{[0:50]};}
endclass

module top;
    
    class_test p1;

    initial begin
        p1=new;
        repeat(8) begin
            assert(p1.randomize());
            p1.dis("Generating 5 to 15");
       end
    end
endmodule
