class mux_driv;
      mux_pack p2;
      mailbox #(mux_pack) m2;
      virtual mux_intf i;

      function new(mailbox #(mux_pack)m2 , virtual mux_intf i);
            this.m2 = m2;
            this.i = i;
      endfunction

      task driv();
            p2 = new;

            forever begin
                m2.get(p2);
                p2.print("======FROM DRIVER=====");

                //pack to pin data
                @(p2.i0,p2.i1,p2.i2,p2.i3,p2.s0,p2.s1);
                i.i0 = p2.i0;
                i.i1 = p2.i1;
                i.i2 = p2.i2;
                i.i3 = p2.i3;
                i.s0 = p2.s0;
                i.s1 = p2.s1;
            end
      endtask
endclass
