module fifo_dut(
                    input            clk,rst,wr,rd,
                    input [7:0]      d_in,
                    output reg [7:0] d_out,
                    output           full,empty
                );
    reg[3:0]wr_ptr;
    reg[3:0]rd_ptr;
    reg[7:0] mem[7:0];

    assign empty = (wr_ptr==rd_ptr);
    assign full=({!wr_ptr[3],wr_ptr[2:0]}==rd_ptr);

    always_ff @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                wr_ptr <= 0;
                rd_ptr <= 0;
                d_out  <= 0;

                foreach(mem[i]) begin
                    mem[i] = 0;
                end
            end

        else if(wr && !rd && !full)
            begin
                mem[wr_ptr] = d_in;
                wr_ptr = wr_ptr+1;
            end

        else if(!wr && rd && !empty)
            begin
                d_out = mem[rd_ptr];
                rd_ptr = rd_ptr+1;
            end
            
       /* 
        else if(wr && rd && !full && !empty) 
           begin
                mem[wr_ptr] <= d_in;
                d_out <= mem[rd_ptr];
                wr_ptr <= wr_ptr+1;
                rd_ptr <= rd_ptr+1; 
           end
          */

    end
endmodule
