module sram(input clk,rst,
            input wr_en,
            input [7:0]data,
            input [2:0]addr,
            output reg [7:0]data_out);

  reg [7:0]mem[7:0];

     always@(posedge clk)
        begin
          if(!rst)
              begin
              data_out<=0;
              for(int i=0;i<8;i++)
                 mem[i]<=0;
              end

           //write operation
           else if(wr_en)
              mem[addr]<=data;

           //read operation
           else
              data_out<=mem[addr];
         end
endmodule
