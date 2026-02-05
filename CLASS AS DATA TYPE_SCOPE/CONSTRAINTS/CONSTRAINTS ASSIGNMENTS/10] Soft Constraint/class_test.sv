class pack;
   rand int a;

     function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%0d",a);
    endfunction
    
    constraint c1{soft a inside{[10:20]};}
endclass

module top;
    pack p1;
        initial begin
            p1=new;
            repeat(8)begin
                assert(p1.randomize() with{a inside{[21:30]};});
                p1.dis("0 to 30 Using soft");
            end
        end
endmodule
