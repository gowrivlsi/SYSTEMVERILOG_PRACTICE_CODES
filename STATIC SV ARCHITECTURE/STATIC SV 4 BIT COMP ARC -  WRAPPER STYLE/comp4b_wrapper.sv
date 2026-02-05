//===============================WRAPPER STYLE MODELLING======================
`include "comp4b.sv"
module comp4b_wrapper(comp4b_intf w);
    
    //instantiation of dut
        comp4b RTL(.a(w.a),
                   .b(w.b),
                   .g(w.g),
                   .e(w.e),
                   .l(w.l)
                  );
endmodule
