//=====================================================TEST BENCH FOR BOT ENCODER_DECODER==============================
program enco_deco_tb(intf.e t ,intf.d n);
    
   //reg[1:0]I;//for encoder output
   //reg[3:0]Y;//decoder output
    //GENERATING STIMULUS
        task gen_enco();//for encoder
            begin
                t.y=t.y << 1;//Left Shifting
            end
        endtask

        /*
        task gen_deco();//for Decoder
            t.d_i=t.d_i << 1;//Left shift
        endtask
        */
        
   //BFM
       
      /* task bfm_enco();//FOr enco
            begin
                {I[1],I[0]}={t.y[2] | t.y[3],t.y[1] | t.y[3]};
            end
        endtask

        task bfm_deco();//For Deco
            begin
                {Y}={ t.d_i[1] & t.d_i[0], t.d_i[1] & ~t.d_i[0],~t.d_i[1] & t.d_i[0],~t.d_i[1] & ~t.d_i[0]};
                
            end
        endtask */
    //SCORE BOARD
        task sc();
            begin
                if(t.y == n.d_o)
                    begin
                        $display("========================TEST PASED======================");
                        $display("ENCODER INPUTS=%b  DECODER OUTPUT=%b Time=%0t",t.y,n.d_o,$time);
                    end
                else begin
                        $display("========================TEST FAILED======================");
                        $display("ENCODER INPUTS=%b  DECODER OUTPUT=%b Time=%0t",t.y,n.d_o,$time);

                     end
            end
        endtask
    initial begin
          t.y=4'b0001;//t.d_i=2'b00;
        gen_enco();#5;
                sc();
        repeat(3) begin
        gen_enco();#5;
        sc();
        end
    end
endprogram
