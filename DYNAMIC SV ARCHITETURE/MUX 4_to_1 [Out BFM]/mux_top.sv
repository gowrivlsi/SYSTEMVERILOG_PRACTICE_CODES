`include "mux_dut.sv"
`include "mux_intf.sv"
`include "mux_packet.sv"
`include "mux_gen.sv"
`include "mux_driv.sv"
`include "mux_bfm.sv"
`include "mux_io_moni.sv"
`include "mux_sb.sv"
`include "mux_env.sv"
`include "mux_tb.sv"


module top;
    mux_intf I();

    mux_dut D(
                .i(I.i),
                .s(I.s),
                .y(I.y)
             );

    mux_tb T(I.tb);
    
    final 
        $info("TRANS = %0d | PASS = %0d | FAIL =%0d",mux_sb::trans,mux_sb::pass,mux_sb::fail);
endmodule
