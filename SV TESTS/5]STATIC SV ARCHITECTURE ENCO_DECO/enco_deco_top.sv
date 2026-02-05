//========================================================TOP MODULE=================================
`include "intf.sv"
`include "enco4b.sv"
`include "deco4b.sv"
`include "enco_deco_tb.sv"
module enco_deco_top();
    
     //interface
        intf R1();

    //enco
        enco4b R2(.y(R1.y),.i(R1.i));

    //deco
        deco4b R3(.d_i(R1.i),.d_o(R1.d_o));

    //TB
        enco_deco_tb R4(.t(R1),.n(R1));

endmodule
