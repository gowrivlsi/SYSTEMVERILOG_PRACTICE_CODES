class pack;
   rand int a,b;

    function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%0d b=%0d",a,b);
    endfunction
    
    constraint c1{a%4==0;b%4==0;a inside{[0:50]};b inside{[0:60]};}
endclass

module top;
    pack p1;
        initial begin
            p1=new;
            repeat(8)begin
                assert(p1.randomize());
                p1.dis("Multiples Of 4");
            end
        end
endmodule
