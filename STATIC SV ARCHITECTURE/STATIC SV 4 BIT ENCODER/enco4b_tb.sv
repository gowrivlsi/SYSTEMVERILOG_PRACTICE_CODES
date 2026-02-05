//========================================TEST BENCH=======================
program enco4b_tb(enco4b_intf T);
    
    reg [1:0]Y;
    //GENERATING STIMULUS
        task gen();
            begin
                T.e_i = T.e_i<<1;
                           end
        endtask

    //BFM
        task bfm();
             begin
                Y={T.e_i[1] | T.e_i[3],T.e_i[2] | T.e_i[3]};
            end
        endtask

    //SCORE BOADR
        task sc();
             begin
                if(Y == T.e_y)
                    begin
                        $info("=========================TEST PASED=========================");
                        $display("ENCODER_INPUTS = %b ENCODER_OUTPUT=%b BFM_Y=%b",T.e_i,T.e_y,Y);
                    end
                else begin
                        $info("=========================TEST FALIED=========================");
                        $display("ENCODER_INPUTS = %b ENCODER_OUTPUT=%b BFM_Y=%b",T.e_i,T.e_y,Y);
 
                    end
            end
        endtask

       initial begin
            T.e_i = 4'b0001;#10;
            bfm();
            sc();
        repeat(3) begin
            gen();
            #5 bfm();
            sc();
            end
       end
endprogram
