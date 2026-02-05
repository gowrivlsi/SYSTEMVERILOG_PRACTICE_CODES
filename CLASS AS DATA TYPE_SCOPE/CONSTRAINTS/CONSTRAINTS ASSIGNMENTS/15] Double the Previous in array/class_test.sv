class pack;
    rand byte  a[4];

     function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%p",a);
    endfunction

    constraint c1{a[1]==2*a[0];a[2]==2*a[1];a[3]==2*a[2];}
endclass

module top;
    pack p1;
        initial begin
            p1=new;
            repeat(8)begin
                assert(p1.randomize());
                p1.dis("Duble of pervious one");
            end
        end
endmodule
