module assertion(
                input clk,rst,rd,wr,
                input[7:0]din,
                output full,empty,
                input[7:0]dout
                );

property p1;
   rst |-> !$isunknown(din);
endproperty

property p2;
    if(rst)
        $stable(empty);
endproperty

always @(posedge clk)
 begin
  a1:assert property(p1);
  a2:assert property(p2);
 end

endmodule
