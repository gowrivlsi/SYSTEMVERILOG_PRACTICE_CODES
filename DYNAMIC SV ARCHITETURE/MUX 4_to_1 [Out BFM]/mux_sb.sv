class mux_sb;
    mux_pack io_pack;
    mailbox #(mux_pack) io_mail;
    
    static int trans,pass,fail;

    function new(mailbox #(mux_pack) io_mail);
           this.io_mail = io_mail;
    endfunction

    task sb();
        io_pack = new;

            forever begin
                io_mail.get(io_pack);

                if(io_pack.y == io_pack.bf_y)
                     begin
                     pass++;
                    $info("================================SB -> TEST PASSED==============================================="); 
                   io_pack.print("================Input_Output Monitor===============");
                    end
                else begin
                    fail++;
                    $info("===============================SB -> TEST FAILED================================");
                   io_pack.print("===============Input_Output Monitor=======================");
                    end
               trans = pass + fail;
              // io_pack.print("==========================FINAL_SCOREBOARD CHECKED=======================");
            end
    endtask
endclass
