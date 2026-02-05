class pack;
    rand bit[4:0]a[5];

    function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%p",a);

    endfunction

    constraint c1{foreach(a[i])
                a[i] inside{5};}
endclass

module top;
    pack p1;
        initial begin
            p1=new;
            repeat(8)begin
                assert(p1.randomize());
                p1.dis("All Storing Same Value");
            end
        end
endmodule
