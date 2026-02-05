`include "half_adder.sv"
`include "half_intf.sv"
`include "half_packet.sv"
`include "half_gen.sv"
`include "half_driv.sv"
`include "input_moni.sv"
`include "output_moni.sv"
`include "half_sb.sv"
`include "half_env.sv"
`include "half_tb.sv"

module top;
    half_intf i();

    half_adder dut(.a(i.a),
                   .b(i.b),
                   .s(i.sum),
                   .c(i.carry)
                  );

    half_tb t(i.tb);

endmodule

