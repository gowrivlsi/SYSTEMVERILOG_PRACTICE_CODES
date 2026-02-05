//=======================================4 BIT COMPARATOR==============================

module comp4b( input [3:0]a,b,
               output reg g,e,l
                );
    always @(*)
    begin
        g=0;e=0;l=0;//default
            if(a > b)
                g=1;
            else if(a == b)
                e=1;
            else 
                l=1;
    end
endmodule

//==================================Test Bench=========================
program comp4b_tb(
                    comp4b_intf t
                );
reg g,e,l;
//Geneating Stimulus
    task gen();
        begin
            {t.a,t.b}=$random;
        end
    endtask
//BFM
    task bfm();
        begin
            {g,e,l}={t.a>t.b,t.a==t.b,t.a<t.b};
        end
    endtask

//SCORE BOARD COMPARING
    task sc();
        begin
            if(g==t.g && e==t.e && l==t.l)
                begin
                    $info("=============================TEST PASED==============================");
                    $display("A in = %0d B in = %0d GRATER = %0d|g=%0d EQUAL = %0D|e=%0d LESSTHAN = %0D|l=%0d",t.a,t.b,t.g,g,t.e,e,t.l,l);
                end
            else
                begin
                    $info("=============================TEST FALIED==============================");
                    $display("A in = %0d B in = %0d GRATER = %0d|g=%0d EQUAL = %0D|e=%0d LESSTHAN = %0D|l=%0d",t.a,t.b,t.g,g,t.e,e,t.l,l);
                end

        end
    endtask

    //calling task
        initial begin
            repeat(15) begin
            gen();
            #10 bfm();
            sc();
            end
        end
endprogram
