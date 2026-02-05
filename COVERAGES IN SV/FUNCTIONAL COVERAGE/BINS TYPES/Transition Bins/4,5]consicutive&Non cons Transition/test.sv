module test;
    //byte unsigned a,b,c;
    bit [2:0]a;
    bit [2:0]b;

    //Declaration of automatic bins in covergroup
        covergroup cov;
            //4]Non Consicutove of Transition  
                L1 : coverpoint a{bins b1=(6[=3]);}

           //5] consicutive
                L2 : coverpoint b{bins b2 = (6[*4]);
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
