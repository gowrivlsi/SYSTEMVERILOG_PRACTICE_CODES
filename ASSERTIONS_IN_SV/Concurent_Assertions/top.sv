`include"test.sv"
module top;
    reg clk,rst;

    initial begin
        clk=1;
        forever #5 clk=~clk;
    end

    initial begin
        rst=0;
    #20 rst=1;
    end

    test T(.clk(clk),
           .rst(rst)
            );
    initial
    #100 $finish;
endmodule
