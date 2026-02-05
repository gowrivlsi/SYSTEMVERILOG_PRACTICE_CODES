class fifo_sb;
    fifo_pkt p_bfm,p_mo;
    mailbox #(fifo_pkt) m_bfm,m_mo;
    event s;
        function new(mailbox#(fifo_pkt)m1,m2,event s);
                m_bfm = m1;
                m_mo  = m2;
                this.s = s;
        endfunction

        task sb();
            p_bfm = new;
            p_mo  = new;
                
                forever begin
                    
                    m_bfm.get(p_bfm);
                    m_mo.get(p_mo);
                     
                     //@(s)
                     //@(p_mo.d_out or p_bfm.d_out)
                    //if(p_mo.rd && !p_mo.empty) begin
                    if(p_bfm.d_out == p_mo.d_out)
                        begin
                            p_bfm.print("EXPECTED (BFM) OUTPUT");
                            p_mo.print("ACTUAL (DUT) OUTPUT");
                            $info("*******************************TEST PASSED**********************************");
                        end
                    else begin
                            p_bfm.print("EXPECTED (BFM) OUTPUT");
                            p_mo.print("ACTUAL (DUT) OUTPUT");
                            $info("*******************************TEST FALID**********************************");
                         end
                    end
              // end
        endtask
endclass
