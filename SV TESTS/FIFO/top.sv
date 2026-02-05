`include"inter.sv"
`include"dut.sv"
`include"tb.sv"
//`include"assertion.sv"

module top();

reg clk,rst;

initial clk=1;
always #5 clk=~clk;

initial 
 begin
  rst=0;#20;
  rst=1;
 end

 inter i(
         .clk(clk),
         .rst(rst)
        );

 dut DUT(
         .clk(i.clk),
         .rst(i.rst),
         .wr(i.wr),
         .rd(i.rd),
         .din(i.din),
         .full(i.full),
         .empty(i.empty),
         .dout(i.dout)
        );

/*
bind DUT assertion a (
                    .clk(clk),
                    .rst(rst),
                    .wr(wr),
                    .rd(rd),
                    .din(din),
                    .full(full),
                    .empty(empty),
                    .dout(dout)
                    ); */



 tb TB(.i(i));

 initial
   begin
   #220 $stop;
   end

endmodule
