module fifo_assert(
                input clk,rst,rd,wr,
                input[7:0]d_in,
                input full,empty,
                input[7:0]d_out
                  );
    //reg[3:0]wr_ptr;
    //reg[3:0]rd_ptr;

//1. “Full flag asserted only when FIFO cannot accept writes”
    property no_write;
        @(posedge clk)
        full |-> !wr;
    endproperty

//2. “Empty flag asserted only when FIFO has no data”
    property no_read;
        @(posedge clk)
        empty |-> !rd;
    endproperty


//3. “Data output matches input order”
    property fifo_order;
        logic [7:0] wdata;
        @(posedge clk) disable iff(!rst)
                //(expression,value)
        (wr && !full ,wdata=d_in) |=>  ##[1:$](rd && d_out == wdata);
    endproperty 

//4. “Writes ignored if full, reads ignored if empty”
    property write_ignored;
        @(posedge clk) disable iff(!rst)
        (wr && full) |-> full;
    endproperty

   property read_ignored;
        @(posedge clk) disable iff(!rst)
        (rd && empty) |-> empty;
   endproperty



    assert property(no_write);
    assert property(no_read);
    assert property(fifo_order);
    assert property(write_ignored);
    assert property(read_ignored);

endmodule
