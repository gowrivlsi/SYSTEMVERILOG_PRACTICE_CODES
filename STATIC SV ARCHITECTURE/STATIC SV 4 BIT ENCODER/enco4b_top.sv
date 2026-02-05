//==================================ENCODER TOP DESIGN CODE=======================

`include "enco4b_intf.sv"
`include "enco4b.v" 
`include "enco4b_tb.sv"

module enco4b_top();

    //INSTANTIATION

        //FOR INTERFACE
            enco4b_intf I();

        //FOR DUT
            enco4b E1(.E(I));

        //FOR TB
            enco4b_tb E2(.T(I));
endmodule

