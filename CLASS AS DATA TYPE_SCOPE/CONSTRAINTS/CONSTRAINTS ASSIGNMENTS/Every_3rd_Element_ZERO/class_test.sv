class pack;
    rand byte unsigned a[6];

    function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%p",a);
    endfunction
    
    extern constraint c2;

    /*
    constraint c1{foreach(a[i])
                    if(i==2)
                        a[i] == 0;
                   else
                        a[i] inside{[0:50]};
               };*/
endclass

    constraint pack::c2{a[2]==0;}

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

