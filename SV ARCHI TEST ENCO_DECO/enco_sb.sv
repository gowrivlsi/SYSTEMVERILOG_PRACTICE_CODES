class enco_sb;
        enco_pack g_p,mo_p;
        mailbox #(enco_pack)g_m,mo_m;

        function new(mailbox #(enco_pack)g_m,mo_m);
            this.g_m = g_m;
            this.mo_m = mo_m;
        endfunction


        task sb();
            g_p = new;
            mo_p = new;

            forever begin
                g_m.get(g_p);
                mo_m.get(mo_p);
                @(mo_p.d_o)
                if(g_p.i == mo_p.d_o)
                    begin
                        //$info("==========================================TEST PASSED===================================");
                        g_p.print("======ACTUAL DUT INPUT=====");
                        mo_p.print("=====DECODER OUTPUT======");
                        $info("==========================================TEST PASSED===================================");
                    end
                else
                      begin
                        //$info("==========================================TEST FAILED===================================");
                        g_p.print("======ACTUAL DUT INPUT=====");
                        mo_p.print("=====DECODER OUTPUT======");
                        $info("==========================================TEST FAILED===================================");
                    end

            end
        endtask
endclass
