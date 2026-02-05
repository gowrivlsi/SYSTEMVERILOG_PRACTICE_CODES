//=====================================TOP DESIGN CODE=====================
`include "comp4b.sv"
`include "comp4b_intf.sv"
module top();
//instantiation 
 //for interface
    comp4b_intf rtl1();
   
    

    //for dut
        comp4b rtl2(.d(rtl1));

    //for tb
        comp4b_tb rtl3(.t(rtl1));

   endmodule
