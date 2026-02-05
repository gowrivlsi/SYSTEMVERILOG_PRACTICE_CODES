//------------------------------------------------------DESIGN CODE SYNCHRONOUS FIFO----------------------------------------------------------------//
module fifoc #(parameter width=8,depth=8)(
                                            input clk,rst,wr,rd,
                                            input [width-1:0] d_in,
                                            output reg [width-1:0]d_out,
                                            output full,empty
                                         );
    reg [$clog2(depth):0]wr_ptr,rd_ptr;
    reg [width-1:0] mem[depth-1:0];
    integer count,i;//reg[$clog2(depth):0] count

    assign empty=(count==0);
    assign full=(count==depth);

    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                {d_out,wr_ptr,rd_ptr,count}<=4'b0000;
                for(i=0;i<depth;i=i+1)
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

//--------------------------------------------TEST BENCH CODE---------------------------------------------
`timescale 1ns/1ps

module fifo_tb;

    // Parameters
    parameter WIDTH = 8;
    parameter DEPTH = 8;

    // Signals
    reg clk, rst, wr, rd;
    reg [WIDTH-1:0] d_in;
    wire [WIDTH-1:0] d_out;
    wire full, empty;

    // DUT instantiation
    fifoc #(WIDTH, DEPTH) dut (
        .clk(clk),
        .rst(rst),
        .wr(wr),
        .rd(rd),
        .d_in(d_in),
        .d_out(d_out),
        .full(full),
        .empty(empty)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    integer i;

    // -------------------------------
    // Testbench main logic
    // -------------------------------
    initial begin
        clk = 0;
        rst = 0;
        wr  = 0;
        rd  = 0;
        d_in = 0;

        // Apply reset (active low)
        $display("\n=== Applying Reset ===");
        #10 rst = 1;
        #10 rst = 0; // Active low reset
        #10 rst = 1;
        $display("=== Reset Released ===\n");

        // -------------------------------
        // 1️⃣ Write until FIFO is full
        // -------------------------------
        $display("=== Writing data until FIFO full ===");
        for (i = 0; i < DEPTH + 2; i = i + 1) begin
            @(negedge clk);
            if (!full) begin
                wr = 1; rd = 0;
                d_in = i + 8'hA0;
                $display("Time=%0t | WRITE | Data=%h | Full=%b | Empty=%b", $time, d_in, full, empty);
            end else begin
                $display("Time=%0t | FIFO FULL! Cannot write more.", $time);
            end
        end
        @(negedge clk);
        wr = 0;

        // -------------------------------
        // 2️⃣ Simultaneous Read/Write operation
        // -------------------------------
        $display("\n=== Simultaneous Read/Write operations ===");
        for (i = 0; i < 4; i = i + 1) begin
            @(negedge clk);
            if (!full && !empty) begin
                wr = 1;
                rd = 1;
                d_in = i + 8'hB0;
                $display("Time=%0t | SIMUL R/W | Write=%h | Read=%h | Full=%b | Empty=%b",
                         $time, d_in, d_out, full, empty);
            end
        end
        @(negedge clk);
        wr = 0; rd = 0;

        // -------------------------------
        // 3️⃣ Read all data until empty
        // -------------------------------
        $display("\n=== Reading data until FIFO empty ===");
        for (i = 0; i < DEPTH + 2; i = i + 1) begin
            @(negedge clk);
            if (!empty) begin
                wr = 0; rd = 1;
                $display("Time=%0t | READ | Data=%h | Full=%b | Empty=%b", $time, d_out, full, empty);
            end else begin
                $display("Time=%0t | FIFO EMPTY! No more data to read.", $time);
            end
        end
        @(negedge clk);
        rd = 0;

        // -------------------------------
        // 4️⃣ Final status
        // -------------------------------
        #20;
        $display("\n=== FINAL STATUS ===");
        $display("Time=%0t | Full=%b | Empty=%b", $time, full, empty);
        $display("Simulation completed successfully ✅\n");
        $stop;
    end

endmodule

