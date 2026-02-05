class sram_sb;
    sram_pkt bfm_p,mo_p;
    mailbox #(sram_pkt) bfm_m,mo_m;

        function new(mailbox #(sram_pkt) bfm_m,mo_m);
                this.bfm_m = bfm_m;
                this.mo_m  = mo_m;
        endfunction


        task sb();
            bfm_p = new;
            mo_p  = new;

                forever begin
                    bfm_m.get(bfm_p);
                    mo_m.get(mo_p);

                    @(mo_p.d_out)

                    if(mo_p.d_out == bfm_p.d_out)
                        begin
                            bfm_p.print("EXPECTED BFM OUTPUT");
                            mo_p.print("ACTUAL DUT OUTPUT");
                            $info("=========================================TEST PASSED===============================");
                        end
                    else begin
                            bfm_p.print("EXPECTED BFM OUTPUT");
                            mo_p.print("ACTUAL DUT OUTPUT");
                            $info("=========================================TEST FAILED===============================");
                         end
                end
        endtask
endclass
