module fifo_dut (
                  input clk,rst,wr,rd,
                  input [7:0] d_in,
                  output reg [7:0]d_out,
                  output full,empty
             );
    reg [$clog2(8):0]wr_ptr,rd_ptr;
    reg [7:0] mem[7:0];
    integer count,i;//reg[$clog2(depth):0] count

    assign empty=(count==0);
    assign full=(count==8);

    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                {d_out,wr_ptr,rd_ptr,count}<=4'b0000;
                for(i=0;i<8;i=i+1)
                    mem[i]<=0;
            end
        else
            if(wr && !rd && !full)
                begin
                    mem[wr_ptr]<=d_in;
                    wr_ptr<=wr_ptr+1;
                    count<=count+1;
                end
            else
                if(!wr && rd && !empty)
                    begin
                        d_out<=mem[rd_ptr];
                        rd_ptr<=rd_ptr+1;
                        count<=count-1;
                    end
                else
                    if(wr && rd && !full && !empty)
                        begin
                            mem[wr_ptr]<=d_in;
                            wr_ptr<=wr_ptr+1;
                            count<=count+1;
                            d_out<=mem[rd_ptr];
                            rd_ptr<=rd_ptr+1;
                            count<=count-1;
                        end
    end
endmodule

