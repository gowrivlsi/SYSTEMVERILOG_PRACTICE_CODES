class pack;
    rand bit [5:0]a[6];

     function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%p",a);
    endfunction
     
     constraint c1{foreach(a[i])
                        if(i%2==0)
                            a[i]==0;
                        else
                            a[i]==1;
                    }
endclass

module top;
    pack p1;
        initial begin
            p1=new;
            repeat(8)begin
                assert(p1.randomize());
                p1.dis("0 and 1 Storing");
            end
        end
endmodule
