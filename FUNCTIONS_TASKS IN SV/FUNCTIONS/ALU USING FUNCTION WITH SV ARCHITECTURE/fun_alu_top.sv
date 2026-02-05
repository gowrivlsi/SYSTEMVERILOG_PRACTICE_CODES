//===============================================TOP MODULE=================================
`include "intf.sv"
`include "func_alu.sv"
`include "fun_alu_tb.sv"
module fun_alu_top();
    
    //Interface 
    intf R1();

    //dut
    func_alu R2(.a(R1.a),
                .b(R1.b),
                .sel(R1.sel),
                .y(R1.y),
                .A(R1.A),
                .B(R1.B),
                .C(R1.C),
                .D(R1.D),
                .G(R1.G),
                .R(R1.R),
                .T(R1.T));

    //tb
    fun_alu_tb R3(.t(R1));
endmodule
