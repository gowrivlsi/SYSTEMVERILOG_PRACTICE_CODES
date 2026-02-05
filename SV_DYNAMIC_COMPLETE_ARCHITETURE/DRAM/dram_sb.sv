class dram_sb;
    dram_pkt bfm_p,mo_p;
    mailbox #(dram_pkt) bfm_m,mo_m;

        function new(mailbox #(dram_pkt) bfm_m,mo_m);
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
                                 $display("*************************************TEST PASSED***********************************");
                                 $display("BFM_PKT=%0d,MONI_PKT=%0d",bfm_p.d_out,mo_p.d_out);
                            end
                        else 
                            begin
                                 $display("*************************************TEST FAILED***********************************");
                                 $display("BFM_PKT=%0d,MONI_PKT=%0d",bfm_p.d_out,mo_p.d_out);
                            end
                end
        endtask
endclass
