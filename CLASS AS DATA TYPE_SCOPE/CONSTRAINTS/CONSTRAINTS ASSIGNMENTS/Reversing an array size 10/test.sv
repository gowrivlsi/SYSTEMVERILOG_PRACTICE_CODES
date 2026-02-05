class pkt;
    rand int a[10];
    rand int b[10];

        function void print(string name="");
            $display("NAME: %0s",name);
            $display("a=%0p",a);
            $display("b=%0p",b);
        endfunction

        constraint c2{foreach(a[i])
                          if(i%2==0)
                              a[i] inside{[10:50]};
                          else
                              a[i] inside{[51:100]};

                     }
        constraint c1{foreach(a[i])
                        b[i] == a[9 - i];
                     }
endclass

module top;
    pkt p;
        
        initial begin
            p = new;
            p.randomize();
            p.print("pkt");
        end
endmodule
