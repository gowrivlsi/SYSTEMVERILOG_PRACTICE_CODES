class pack;
    rand bit[7:0]a;

    function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%b",a);
    endfunction

    constraint c1{(a&(a-1))==0;a>0;}
endclass

module top;
    pack p1;
        initial begin
            p1=new;
            repeat(8)begin
                assert(p1.randomize());
                p1.dis("Exactly only 1 bit");
            end
        end
endmodule
