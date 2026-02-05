class test;
    rand int a[9];

    constraint c{ foreach(a[i])
                    if(i==1)
                        a[i] == 2;
                    else if(i==2)
                        a[i] == 1;
                    else if(i == 5)
                        a[i] == 6;
                    else if(i==6)
                        a[i] == 5;
                    else a[i] == i;
                
            }
endclass

module top;
    test t1;

        initial begin
            t1 = new;
            assert(t1.randomize());
            $display("a[i]=%p",t1.a);
        end
endmodule
