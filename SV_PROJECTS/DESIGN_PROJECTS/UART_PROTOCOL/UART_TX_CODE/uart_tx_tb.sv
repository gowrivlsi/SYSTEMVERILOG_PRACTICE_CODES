/******************************UART - TX TEST_BENCH CODE*********************************/

/*
`include"uart_tx.sv"

module uart_tx_tb #(parameter DATA_BITS = 8);
    reg                 clk,rst_n;
    reg                 tx_start;
    reg [DATA_BITS-1:0] tx_data;
    reg                 tx_baud_tick;

    wire                tx;
    wire                tx_busy;
    wire                tx_done;

//DUT INSTANTIATION
    uart_tx #(.DATA_BITS(8)) D (
        .clk          (clk),
        .rst_n        (rst_n),
        .tx_start     (tx_start),
        .tx_data      (tx_data),
        .tx_baud_tick (tx_baud_tick),
        .tx           (tx),
        .tx_busy      (tx_busy),
        .tx_done      (tx_done)
    );  

//CLK GENRATION
    initial begin
        clk = 0;
    forever #10 clk = ~clk; 
    end

//RST GENERATION
    
initial begin
    rst_n         = 0;
    tx_start     = 0;
    tx_data      = 0;
    tx_baud_tick = 0;

    $display("[%0t] Reset applied", $time);

    repeat (3) @(posedge clk);
    rst_n = 1;

    $display("[%0t] Reset removed", $time);
end

//BAUD_GENARATOR TASK 
    task send_baud_tick;
        begin
            tx_baud_tick = 1'b1;
            @(posedge clk);

            $display("[%0t] BAUD_TICK | tx=%0b | busy=%0b | done=%0b",$time, tx, tx_busy, tx_done);

            tx_baud_tick = 1'b0;
            @(posedge clk);
        end
    endtask

    task send_byte(input [7:0] data);
        begin
        // Wait until TX is free
        wait(tx_busy == 0);

        tx_data  = data;
        tx_start = 1'b1;

        // Capture tx_start on baud tick
        send_baud_tick();

        tx_start = 1'b0;

        // Wait for transmission to finish
        wait(tx_done == 1);

        $display("[%0t] BYTE SENT = 0x%0h", $time, data);
        end
    endtask

    initial begin
        // Wait for reset release
        wait(rst_n == 1);
        @(posedge clk);

        // Load data and start TX
        tx_data  = 8'hA5;/*tx_data = 8'hA5 = 1010_0101
                           LSB first → 1 0 1 0 0 1 0 1
        tx_start = 1'b1;

        $display("[%0t] TX_START applied, DATA = %0d", $time, tx_data);

        @(posedge clk);
        tx_start = 1'b0;

        // START bit
        send_baud_tick();

        // 8 DATA bits
        repeat (8) begin
            send_baud_tick();
        end

        // STOP bit
        send_baud_tick();

        // DONE state
        send_baud_tick();

        
      //Finish simulation
        $display(" UART TX UNIT TEST PASSED ");
        #20;
        $finish;
    end

        always @(posedge clk) begin
            if (tx_done) begin
                $display("[%0t] TX_DONE asserted", $time);
            end
        end
        
endmodule

*/



/************************ UART TX MULTI-BYTE TESTBENCH ************************/

`include "uart_tx.sv"

module uart_tx_tb #(parameter DATA_BITS = 8);

    reg                 clk, rst_n;
    reg                 tx_start;
    reg [DATA_BITS-1:0] tx_data;
    reg                 tx_baud_tick;

    wire                tx;
    wire                tx_busy;
    wire                tx_done;

    // DUT
    uart_tx #(.DATA_BITS(DATA_BITS)) D (
        .clk          (clk),
        .rst_n        (rst_n),
        .tx_start     (tx_start),
        .tx_data      (tx_data),
        .tx_baud_tick (tx_baud_tick),
        .tx           (tx),
        .tx_busy      (tx_busy),
        .tx_done      (tx_done)
    );

    // ---------------- CLOCK ----------------
    
    initial begin
        clk = 0;
        while (rst_n !== 1'b1)
            #10 clk = ~clk;

        repeat (2000)
            #10 clk = ~clk;
    end

    // ---------------- RESET ----------------
    initial begin
        rst_n        = 0;
        tx_start     = 0;
        tx_data      = 0;
        tx_baud_tick = 0;

        $display("[%0t] Reset applied", $time);
        repeat (3) @(posedge clk);
        rst_n = 1;
        $display("[%0t] Reset removed", $time);
    end

    // ---------------- BAUD TICK TASK ----------------
    task send_baud_tick;
        begin
            tx_baud_tick = 1'b1;
            @(posedge clk);

            $display("[%0t] BAUD_TICK | tx=%0b | busy=%0b | done=%0b",
                     $time, tx, tx_busy, tx_done);

            tx_baud_tick = 1'b0;
            @(posedge clk);
        end
    endtask

    // ---------------- SEND ONE BYTE TASK ----------------
    
    task send_byte(input [7:0] data);
        begin
            // Wait until TX is free
            wait (tx_busy == 0);

            tx_data  = data;
            tx_start = 1'b1;

            // START bit (captures tx_start in IDLE)
            send_baud_tick();
            tx_start = 1'b0;

            // DATA bits
            repeat (DATA_BITS)
                send_baud_tick();

            // STOP bit
            send_baud_tick();

            // DONE state
            send_baud_tick();

            send_baud_tick();

            $display("[%0t] BYTE SENT = %0d", $time, data);
        end
    endtask

    // ---------------- MULTI-BYTE TEST ----------------
    byte tx_array [0:4] = '{8'h55, 8'hAA, 8'h0F, 8'hF0, 8'hA5};

    initial begin
        wait (rst_n == 1);
        @(posedge clk);

        for (int i = 0; i < 5; i++) begin
            send_byte(tx_array[i]);
        end

        $display("====================================");
        $display(" ALL UART TX BYTES SENT SUCCESSFULLY ");
        $display("====================================");

        #20;
        $finish;
    end

    // ---------------- DONE MONITOR ----------------
    always @(posedge clk) begin
        if (tx_done)
            $display("[%0t] TX_DONE asserted", $time);
    end

endmodule
