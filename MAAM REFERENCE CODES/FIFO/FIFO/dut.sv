module dut(
            input clk,rst,rd,wr,
            input[7:0]din,
            output full,empty,
            output reg [7:0]dout
           );

reg[3:0]rd_ptr;
reg[3:0]wr_ptr;
reg[7:0]mem[7:0];

assign empty=(rd_ptr==wr_ptr);
assign full=({!wr_ptr[3],wr_ptr[2:0]}==rd_ptr);

always@(posedge clk  or negedge rst)
begin
  if(!rst)
    begin
      dout=0;
      rd_ptr=0;
      wr_ptr=0;
        for(int i=0;i<8;i++)
          begin
            mem[i]=0;
          end
    end

  else if(wr && !rd && !full)
      begin
         mem[wr_ptr]=din;
         wr_ptr=wr_ptr+1;
      end

  else if(rd && !wr && !empty)
      begin
         dout=mem[rd_ptr];
         rd_ptr=rd_ptr+1;
      end

end

endmodule
