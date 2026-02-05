//=====================================TOP DESIGN CODE=====================
`include "comp4b.sv"
`include "comp4b_intf.sv"
module top();
//instantiation 
 //for interface
    comp4b_intf rtl1();
   
    

    //for dut
        comp4b rtl2(.a(rtl1.a),
                    .b(rtl1.b),
                    .g(rtl1.g),
                    .e(rtl1.e),
                    .l(rtl1.l)
                   ); //legacy style connecting

    //for tb
        comp4b_tb rtl3(.t(rtl1));

   endmodule
