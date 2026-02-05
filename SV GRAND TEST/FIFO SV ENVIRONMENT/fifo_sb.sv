class fifo_sb;
    fifo_pkt bfm_p,mo_p;
    mailbox #(fifo_pkt) bfm_m,mo_m;

        function new(mailbox #(fifo_pkt) m1,m2);
                bfm_m = m1;
                mo_m  = m2;
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
