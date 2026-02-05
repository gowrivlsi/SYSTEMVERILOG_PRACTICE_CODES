`include "enco_dut.sv"
`include "deco_dut.sv"
`include "enco_intf.sv"
`include "enco_packet.sv"
`include "enco_gen.sv"
`include "enco_driv.sv"
`include "enco_iomoni.sv"
`include "enco_sb.sv"
`include "enco_env.sv"
`include "enco_tb.sv"
module top;
    enco_intf I();

    enco_dut D(.i(I.i),
               .y(I.y)
              );

    deco_dut F(.y(D.y),
               .i(I.d_o)
                );

    enco_tb T(I);

endmodule
