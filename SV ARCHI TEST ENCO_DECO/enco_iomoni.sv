class enco_iomoni;
        enco_pack p3;
        mailbox #(enco_pack) m4;
        virtual enco_intf I;

            function new(mailbox #(enco_pack) m4 , virtual enco_intf I);
                    this.m4  = m4;
                    this.I   =  I;
            endfunction


            task moni();
                p3 = new;
                    forever begin
                        @(I.i or I.y)
                            p3.i = I.i;
                            p3.y = I.y;
                            p3.d_o = I.d_o;

                         m4.put(p3);
                         p3.print("=======FROM INPUT_OUTPUT MONITOR========");
                    end
            endtask
endclass
