//========================================================FIFO_QUEUES===========================================
module fifo_queue #(parameter w=8,d=8)(
                                       input [w-1:0]d_in,
                                       input clk,rst,wr,rd,
                                       output reg[w-1:0]d_out,
                                       output full,empty
                                       );

    reg[w-1:0]q[$];

    assign empty=(q.size()==0);
    assign full=(q.size()==d);

    always @(posedge clk or negedge rst) 
    begin
        if(!rst) begin
            d_out<=0;
            q.delete();
        end

        else begin
                if(wr && !rd && !full)
                    q.push_front(d_in);
                else
                    if(!wr && rd && !empty)
                       d_out=q.pop_back();
             end
    end
endmodule
