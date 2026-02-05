class mux_sb;
    mux_pack in_pac,out_pac;
    mailbox #(mux_pack) in_mail,out_mail;
    static int trans,pass,fail;

    function new(mailbox#(mux_pack)in_mail,out_mail);
        this.in_mail = in_mail;
        this.out_mail = out_mail;
    endfunction

    task sb();
        in_pac=new;
        out_pac=new;

            forever begin
                in_mail.get(in_pac);
                out_mail.get(out_pac);

                if(in_pac.y == out_pac.y)
                    begin
                    pass++;
                    $info("================================TEST PASSED===============================================");
                    in_pac.print("Input Monitor BFM");
                    out_pac.print("Output Monitor From DUT");
                    end
                else begin
                    fail++;
                    $info("===============================TEST FAILED================================");
                    in_pac.print("Input Monitor BFM");
                    out_pac.print("Output Monitor From DUT");
                    end
               trans = pass + fail;
            end
    endtask

   /*
   task res();
        $info("TRANS : %0d  | PASS : %0d | FAIL : %0d",trans,pass,fail);
    endtask
    */
endclass
