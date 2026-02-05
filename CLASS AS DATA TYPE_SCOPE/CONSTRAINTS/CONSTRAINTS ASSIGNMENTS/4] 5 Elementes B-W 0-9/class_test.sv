//=============================================0-9 Number Generating====================================
class pack;
   rand byte a[5];

    function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%p",a);
    endfunction

    constraint c1{foreach(a[i])
                    a[i] inside{[0:9]};}
endclass

module top;
    pack p1;

    initial begin
        p1=new;
        repeat(8) begin
            assert(p1.randomize());
            p1.dis("0 to 9 Numbers in a Packet");
        end
    end
endmodule
