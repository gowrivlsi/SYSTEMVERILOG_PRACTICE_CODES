class pack;
    rand bit[3:0]a;

     function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%b",a);
    endfunction

    constraint c1{a[3]==1;}

endclass

module top;
    pack p1;
        initial begin
            p1=new;
            repeat(8)begin
                assert(p1.randomize());
                p1.dis("MSB ALWAYS 1");
            end
        end
endmodule
