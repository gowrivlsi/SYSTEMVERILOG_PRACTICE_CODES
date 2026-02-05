class pack;
    rand byte unsigned a[5];

    function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%p",a);
    endfunction
    
    constraint c1{foreach(a[i])
                    if(i%2==0)
                        a[i]%2==0;
                   else
                        a[i]%2==1;
                }
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
