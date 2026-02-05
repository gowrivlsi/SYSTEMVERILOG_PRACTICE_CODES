//==============================================Top Module Design=================================================
`include "tlc_intf.sv"
`include"tlc.sv"
`include "tcl_tb.sv"
module tcl_top();
    bit clk,rst;

    initial begin
        clk=0;
        forever #5 clk=~clk;
    end

    initial begin
        rst=0;
        #20 rst=1;
    end

   //Interface 
    tlc_intf R1(.clk(clk),
                .rst(rst)
                );

   //DUT LEGACY CONNECTING
    tlc R2(.clk(R1.clk),
           .rst(R1.rst),
           .Lights(R1.Lights)
           );

    //Tb
        tcl_tb R3(.t(R1));
endmodule
