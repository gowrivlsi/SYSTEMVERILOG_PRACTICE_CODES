class full_adder_sb;
    full_adder_pack i_pac;
    full_adder_pack o_pac;
    
    static int trans,pass,fail;

    mailbox #(full_adder_pack) i_mail,o_mail;

    function new(mailbox #(full_adder_pack) i_mail,o_mail);
            this.i_mail = i_mail;
            this.o_mail = o_mail;
    endfunction

    task sb();
        i_pac = new;
        o_pac = new;
        
        
            forever begin
                i_mail.get(i_pac);
                o_mail.get(o_pac);

                if(i_pac.sum == o_pac.sum && i_pac.carry == o_pac.carry)
                    begin
                    pass++;
                    $info("================================SB -> TEST PASSED===============================================");
                    i_pac.print("=====Input Monitor=====");
                    o_pac.print("=====Output Monitor From DUT======");
                    end
                else begin
                    fail++;
                    $info("===============================SB -> TEST FAILED================================");
                   // b1.print("=====BFM LOGIC=====");
                    i_pac.print("=======Input Monitor ========");
                    o_pac.print("=====Output Monitor From DUT=======");
                    end
               trans = pass + fail;
            end
    endtask

endclass
