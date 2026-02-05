`include "dff_dut.sv"
`include "dff_intf.sv"
`include "dff_packet.sv"
`include "dff_gen.sv"
`include "dff_driv.sv"
`include "dff_bfm.sv"
`include "dff_iomoni.sv"
`include "dff_sb.sv"
`include "dff_env.sv"
`include "dff_tb.sv"


module top;
    
    reg clk,rst;

    
    initial begin
        clk = 0;
        forever #5 clk =~clk;
    end

    initial begin
        rst = 0;
   #20   rst = 1;
    end

    
    dff_intf I(.clk(clk),
               .rst(rst)
                );

    dff_dut D(.clk(I.clk),
              .rst(I.rst),
              .din(I.din),
              .q(I.q)
              );

    dff_tb T(I);
        

        final
            $info("TRANS = %0d | PASS = %0d | FAIL = %0d",dff_sb::trans,dff_sb::pass,dff_sb::fail);
   endmodule
