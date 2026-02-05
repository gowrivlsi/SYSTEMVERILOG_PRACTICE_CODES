//=====================================================3] GENERATING EVEN NUMBERS IN BYTE TYPE============================================
class pack;

    randc byte a;
    function void dis(string n="");
        $display("Name=%0s",n);
        $display("a=%0d",a);
    endfunction

    constraint c1{a%2==0;a>0;}
endclass

module top;
    pack p1;

    initial begin
        p1=new;
        repeat(8)begin
            assert(p1.randomize());
            p1.dis("Even Numbers In Bytes");
        end
    end
endmodule
