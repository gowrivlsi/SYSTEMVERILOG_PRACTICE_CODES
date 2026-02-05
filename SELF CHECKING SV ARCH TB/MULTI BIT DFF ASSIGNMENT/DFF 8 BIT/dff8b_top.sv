//================================================DFF 8 BIT TOP DESIGN CODE===================================================
`include "dff8b_intf.sv"
`include "dff8b.v"
`include "dff8b_tb.sv"
module dff8b_top(output reg clk,rst);
    //CLK GENERATION
        initial begin
            clk=1;
            forever #5 clk=~clk;
            end

     //RST GENERATION
        initial begin
            rst=0;
            #20 rst=1;
        end
    //interface instantiation
        dff8b_intf R1(.c(clk),
                      .r(rst)
                     );

    //DUT legacy connecting
        dff8b R2(
                  .d_in(R1.d_in),
                  .clk(R1.c),
                  .rst(R1.r),
                  .q(R1.q)
                );
    //TB
        dff8b_tb R3(.t(R1));
endmodule
