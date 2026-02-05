class pack;
    rand bit[3:0]a;

    function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%0d",a);
    endfunction
    
    constraint c1{a%2==1; a inside{[0:20]};}
endclass

module top;
    pack p1;
        initial begin
            p1=new;
            repeat(8)begin
                assert(p1.randomize());
                p1.dis("Storing ODD Numbers");
            end
        end
endmodule
