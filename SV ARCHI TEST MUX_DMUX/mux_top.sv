`include  "mux_dut.sv"
`include  "dmux_dut.sv"
`include  "mux_intf.sv"
`include  "mux_packet.sv"
`include  "mux_gen.sv"
`include  "mux_driv.sv"
`include  "mux_imoni.sv"
`include  "mux_omoni.sv"
`include  "mux_sb.sv"
`include  "mux_env.sv"
`include  "mux_tb.sv"

module top;
    mux_intf I();

    mux_dut M(.i(I.i),
              .s(I.s),
              .y(I.y)
                );

    dmux_dut D(.y(I.y),
               .s(I.s),
               .i(I.d_o));

    mux_tb T(I.m_tb);

    final 
        $info("TRANS = %0d | PASS = %0d | FAIl = %0d",mux_sb::trans,mux_sb::pass,mux_sb::fail);
endmodule
