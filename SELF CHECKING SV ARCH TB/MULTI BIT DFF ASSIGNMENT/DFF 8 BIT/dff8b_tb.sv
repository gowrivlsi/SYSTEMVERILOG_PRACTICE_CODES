//======================================DFF TB CODE=================================
program dff8b_tb(dff8b_intf t);
   reg [7:0]outq; 
    //GENERATING STIMULUS
        task gen();
            begin
                t.d_in=$random;
            end
        endtask

    //BFM
        task bfm();
            begin
                case(t.c)
                    1'b0 : outq=outq;
                    1'b1 : outq=t.d_in;
                endcase
            end
        endtask

    //SCORE BOARD
        task sc();
            begin
                if(outq==t.q)
                    begin
                        $info("==============================TEST PASED==========================");
                        $display("CLK = %b RST = %b DFFIN = %b QDFF = %b|OUTQBFM = %b",t.c,t.r,t.d_in,t.q,outq);
                    end
                else
                     begin
                        $info("==============================TEST FALIED==========================");
                        $display("CLK = %b RST = %b DFFIN = %b QDFF = %b|OUTQBFM = %b",t.c,t.r,t.d_in,t.q,outq);
                    end

            end
        endtask

        initial begin
            repeat(8)begin
            gen();
        @(posedge t.c) bfm();
            sc();
            end
        end
endprogram
