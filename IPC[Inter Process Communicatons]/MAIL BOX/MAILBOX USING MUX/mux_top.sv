`include"class_packet.sv"
`include"mux_monitor1.sv"
`include"mux_monitor2.sv"
`include"mux_scoreboard.sv"

module top;
    monitor1 m_1;
    monitor2 m_2;
    scoreboard sc;
    mailbox#(pack) ma1,ma2;

    initial begin
        ma1=new;
        ma2=new;
        m_1=new(ma1,10);
        m_2=new(ma2,10);
        sc=new(ma1,ma2,10);

        fork
            m_1.gen1();
            m_2.gen2();
            sc.comp();
        join
    end
endmodule
