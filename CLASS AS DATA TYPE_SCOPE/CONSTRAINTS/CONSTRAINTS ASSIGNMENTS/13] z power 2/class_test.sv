class pack;
    rand int x,y,z;

     function void dis(string n="");
        $display("Name : %0s",n);
        $display("x=%0d y=%0d z=%0d",x,y,z);
    endfunction

   constraint c1{z==(x+y)**2;x inside{[0:50]};y inside{[0:50]};}
    
    endclass

module top;
    pack p1;
        initial begin
            p1=new;
            repeat(8)begin
                assert(p1.randomize());
                p1.dis("Storing ODD Numbers");
            end
        end
endmodule
