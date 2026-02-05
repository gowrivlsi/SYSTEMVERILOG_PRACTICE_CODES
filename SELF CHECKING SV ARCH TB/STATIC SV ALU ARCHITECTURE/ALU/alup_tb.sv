//=======================================================TB DSIGN CODE==========================================
program alup_tb #(parameter w=8) (alu_intf t);
   reg [w-1:0]Y;
    //GENERATION OF STIMULUS
        task gen();
            begin
                {t.a,t.b} = $random;
                t.opc = $urandom_range(0,8); 
            end
        endtask

    //BFM 
        task bfm();
            begin
                if(t.opc==0)
                    Y = t.a + t.b;
                else if (t.opc==1)
                    Y = t.a - t.b;
                else if (t.opc==2)
                    Y = t.a * t.b; 
                else if (t.opc==3)
                    Y = t.a / t.b;
                else if (t.opc==4)
                    Y = t.a % t.b;
                else if (t.opc==5)
                    Y = t.a ** t.b;
                else if (t.opc==6)
                    Y = t.a | t.b;
                else if (t.opc==7)
                    Y = t.a & t.b;
                else if (t.opc==8)
                    Y = t.a ^ t.b;
                else
                  Y = ~(t.a & t.b);
            end
        endtask

    //SCORE BOADR
        task sc();
            begin
                if(Y == t.y)
                    begin
                        $info("====================================ALU PASSED===============================================");
                        $display("OPCODE = %d OUPUT y=%0b | Y=%0b",t.opc,t.y,Y);
                    end
                else 
                    begin
                        $info("====================================ALU FAILED===============================================");
                        $display("OPCODE = %d OUPUT y=%0b | Y=%0b",t.opc,t.y,Y);
                    end

            end
        endtask

        initial begin
            repeat(10) begin
            gen();
        #10 bfm();
            sc();
            end
        end

endprogram
