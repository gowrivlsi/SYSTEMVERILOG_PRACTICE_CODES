`include "half_adder.sv"
`include "half_intf.sv"
`include "half_packet.sv"
`include "half_generator.sv"
`include "half_driver.sv"
`include "half_bfm.sv"
`include "half_moni.sv"
`include "half_sb.sv"
`include "half_env.sv"
`include "half_tb.sv"


module top;

   half_intf i();
   half_adder dut(.a(i.a),
                  .b(i.b),
                  .sum(i.sum),
                  .carry(i.carry)
                  );
   half_tb   t(i.tb);


endmodule
