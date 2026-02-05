class pack;
    rand bit[3:0]a[4];

    function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%p",a);
    endfunction
    
    constraint c1{a[0]<a[1];a[1]<a[2];a[2]<a[3];}
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
