class pack;
    rand byte unsigned a[5];

    function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%p",a);
    endfunction
    
    
    constraint c1{foreach(a[i])
                    if(i==0)
                        a[i] inside{[0:50]};
                   else
                        a[i]!=a[i-1];
                }
                
                
    /*
    constraint c2{a[0]!=a[1];
                  a[1]!=a[2];
                  a[2]!=a[3];
                  a[3]!=a[4];
                  a[4]!=a[3];
                 }
      */
endclass

module top;
    pack p1;
        initial begin
            p1=new;
            repeat(8)begin
                assert(p1.randomize());
                p1.dis("Adjecent Values is Not equal");
            end
        end
endmodule
