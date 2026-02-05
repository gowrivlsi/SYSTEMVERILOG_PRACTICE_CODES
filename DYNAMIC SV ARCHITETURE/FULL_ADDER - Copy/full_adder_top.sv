`include "full_adder_dut.sv"
`include "full_adder_intf.sv"
`include "full_adder_packet.sv"
`include "full_adder_gen.sv"
`include "full_adder_driv.sv"
`include "full_adder_bfm.sv"
`include "full_adder_imoni.sv"
`include "full_adder_omoni.sv"
`include "full_adder_sb.sv"
`include "full_adder_env.sv"
`include "full_adder_tb.sv"

module top;
    
     full_adder_intf i();

     full_adder D(.a(i.a),
                  .b(i.b),
                  .cin(i.cin),
                  .sum(i.sum),
                  .carry(i.carry)
                 );

     full_adder_tb T(i.tb);

     final 
        $info("TRANS : %0d  | PASS : %0d | FAIL : %0d",full_adder_sb::trans,full_adder_sb::pass,full_adder_sb::fail);
endmodule
