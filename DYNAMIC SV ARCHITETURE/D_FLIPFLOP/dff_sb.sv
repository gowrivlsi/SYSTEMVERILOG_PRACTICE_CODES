class dff_sb;
    dff_pack bfm_p,mo_p;
    mailbox #(dff_pack) bf_m,mo_m;
    static int trans,pass,fail;

        function new(mailbox #(dff_pack) bf_m,mo_m);
            this.bf_m = bf_m;
            this.mo_m = mo_m;
        endfunction


        task sb();
            bfm_p = new;
            mo_p  = new;

                forever begin
                    bf_m.get(bfm_p);
                    mo_m.get(mo_p);

                   @(mo_p.q)

                    
                    if(mo_p.q == bfm_p.q)
                        begin
                            //mo_p.print("ACTUAL DUT OUTPUT");
                            bfm_p.print("EXPECTED BFM OUTPUT");
                            mo_p.print("ACTUAL DUT OUTPUT");
                            $info("=========================================TEST PASSED===============================");
                            pass++;
                        end
                    else
                         begin
                            mo_p.print("ACTUAL DUT OUTPUT");
                            bfm_p.print("EXPECTED BFM OUTPUT");
                            $info("=========================================TEST FAILED===============================");
                            fail++;
                        end

                        trans = pass + fail;
                end
        endtask
endclass
