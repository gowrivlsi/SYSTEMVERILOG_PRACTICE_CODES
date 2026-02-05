module test;
    //byte unsigned a,b,c;
   bit [2:0]a;
   bit [3:0]b;

    //Declaration of automatic bins in covergroup
        covergroup cov;
            //1]Wildcard bins   
                L1 : coverpoint a{wildcard bins b1 = {3'b1zz};}

           //2] Ignore
                L2 : coverpoint b{wildcard bins b2 = {4'b10xx};
                                 }
        endgroup

        cov c1;
        initial begin
            c1 = new;
            repeat(10) begin
                std::randomize(a,b);
                c1.sample;
                $display("a = %b | b=%b",a,b);
            end
        end
endmodule
