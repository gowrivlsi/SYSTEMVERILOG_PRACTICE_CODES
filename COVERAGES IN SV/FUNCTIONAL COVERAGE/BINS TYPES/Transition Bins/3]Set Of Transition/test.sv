module test;
    byte unsigned a,b,c;
   // bit a;

    //Declaration of automatic bins in covergroup
        covergroup cov;
            //3]Set of Transition  
                L1 : coverpoint a{bins b1=(198,114 => 103,106);}

           
                L2 : coverpoint b{bins b2 = (46,58 => 180,86);
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
