//===================================TOP DESIGN CODE======================================
`include "alu_intf.sv"
`include "alup.v"
`include "alup_tb.sv"
module alup_top #(parameter w=8)();
    //Instantiation
        alu_intf #(.w(w)) R1();

   //DUT LEGACY CONNECTING
        alup #(.w(w)) R2(
                .a(R1.a),
                .b(R1.b),
                .opc(R1.opc),
                .y(R1.y)
               );

    //TB 
        alup_tb #(.w(w))R3(.t(R1));

        defparam R3.w=w;
endmodule
