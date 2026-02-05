module test;
    byte unsigned a,b,c;
   // bit a;

    //Declaration of automatic bins in covergroup
        covergroup cov;
            //1]Single Value Transition//"=>"  
                L1 : coverpoint a{bins b1=(114 => 103);}

            //2] Sequence Value Transition 
                L2 : coverpoint b{bins b2 = (70 => 46 => 58 => 180);
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
