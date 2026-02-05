`include"mux_dut.sv"
`include"mux_intf.sv"
`include"mux_packet.sv"
`include"mux_gen.sv"
`include"mux_driv.sv"
`include"mux_inmoni.sv"
`include"mux_oumoni.sv"
`include"mux_sb.sv"
`include"mux_env.sv"
`include"mux_tb.sv"

module top;
    mux_intf i();

    mux_dut D(.i0(i.i0),
              .i1(i.i1),
              .i2(i.i2),
              .i3(i.i3),
              .s0(i.s0),
              .s1(i.s1),
              .y(i.y)  
            );

    mux_tb t1(i.tb);
        
        final 
             $info("TRANS : %0d  | PASS : %0d | FAIL : %0d",mux_sb::trans,mux_sb::pass,mux_sb::fail);
endmodule
