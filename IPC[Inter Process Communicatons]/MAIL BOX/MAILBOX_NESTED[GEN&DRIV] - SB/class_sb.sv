class scoreboard;
    mailbox #(pack) m3_gen;
    mailbox #(pack) m4_driv;
    pack g_pkt, d_pkt;
    int num;

    function new(mailbox #(pack) g,
                 mailbox #(pack) d,
                 int num);
        m3_gen = g;
        m4_driv = d;
        this.num = num;
    endfunction

    task run();
        repeat(num) begin
            m3_gen.get(g_pkt);
            m4_driv.get(d_pkt);

            if (g_pkt.i0 == d_pkt.i0 &&
                g_pkt.i1 == d_pkt.i1 &&
                g_pkt.i2 == d_pkt.i2 &&
                g_pkt.i3 == d_pkt.i3)
                $display("SCOREBOARD PASS");
            else
                $display("SCOREBOARD FAIL");
        end
    endtask
endclass
