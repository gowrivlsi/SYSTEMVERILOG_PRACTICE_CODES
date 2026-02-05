`include"logic_test.sv"
`include"logic_intf.sv"
`include"logic_tb.sv"

module top;
    reg clk,rst;

        initial begin
            clk=0;
            forever #5 clk=~clk;
        end

        initial begin 
            rst = 0;
        #20 rst = 1;
        end

        logic_intf I(clk,rst);

        logic_test D(
                      .clk(I.clk),
                      .rst(I.rst),
                      .a(I.a),
                      .b(I.b),
                      .not1(I.not1),
                      .and1(I.and1),
                      .or1(I.or1),
                      .nand1(I.nand1),
                      .nor1(I.nor1),
                      .xor1(I.xor1),
                      .xnor1(I.xnor1)
                       );

        logic_tb T(I);

endmodule
