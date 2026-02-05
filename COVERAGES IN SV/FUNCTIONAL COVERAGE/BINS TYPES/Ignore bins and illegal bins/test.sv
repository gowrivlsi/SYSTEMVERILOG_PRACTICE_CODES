module test;
    //byte unsigned a,b,c;
   bit [2:0]a;
   bit [2:0]b;

    //Declaration of automatic bins in covergroup
        covergroup cov;
            //1]Illegal   
                L1 : coverpoint a{illegal_bins b1={6,5};}

           //2] Ignore
                L2 : coverpoint b{ignore_bins b2 = {6,4};
                                 }
        endgroup

        cov c1;
        initial begin
            c1 = new;
            repeat(10) begin
                std::randomize(a,b);
                c1.sample;
                $display("a = %0d | b=%0d",a,b);
            end
        end
endmodule
