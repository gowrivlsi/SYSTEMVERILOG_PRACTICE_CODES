`include"baud_gen.sv"

//`timescale 1ns/1ps

module baud_gen_tb;

    // DUT signals
    reg  clk;
    reg  rst_n;
    reg  tx_en;
    reg  rx_en;
    reg  rx_start_align;

    wire tx_baud_tick;
    wire rx_baud_tick;
    wire rx_half_baud_tick;

    // Instantiate DUT
    baud_gen #(
        .CLK_FREQ(50_000_000),
        .BAUD(115200)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .tx_en(tx_en),
        .rx_en(rx_en),
        .rx_start_align(rx_start_align),
        .tx_baud_tick(tx_baud_tick),
        .rx_baud_tick(rx_baud_tick),
        .rx_half_baud_tick(rx_half_baud_tick)
    );

    // ---------------- CLOCK ----------------
    initial begin
        clk = 0;
        forever #10 clk = ~clk;   // 50 MHz clock (20 ns period)
    end

    // ---------------- RESET ----------------
    initial begin
        rst_n = 0;
        tx_en = 0;
        rx_en = 0;
        rx_start_align = 0;

        #100;
        rst_n = 1;
    end

    // ---------------- STIMULUS ----------------
    initial begin
        // Wait for reset release
        @(posedge rst_n);
        #50;

        // ---------- TX TEST ----------
        $display("\n--- TX baud test start ---");
        tx_en = 1;
        #200_000;
        tx_en = 0;
        $display("--- TX baud test end ---\n");

        #50;

        // ---------- RX ALIGN TEST ----------
        $display("\n--- RX half-baud alignment test start ---");
        rx_start_align = 1;
        #50_000;
        rx_start_align = 0;
        $display("--- RX half-baud alignment test end ---\n");

        #50;

        // ---------- RX FULL BAUD TEST ----------
        $display("\n--- RX full baud test start ---");
        rx_en = 1;
        #200_000;
        rx_en = 0;
        $display("--- RX full baud test end ---\n");

        #100_000;
        $stop;
    end

    // ---------------- MONITORS ----------------
    always @(posedge tx_baud_tick)
        $display("TX_BAUD_TICK  @ -> %0t ns", $time);

    always @(posedge rx_half_baud_tick)
        $display("RX_HALF_TICK  @ -> %0t ns", $time);

    always @(posedge rx_baud_tick) begin
        $display("RX_BAUD_TICK  @ -> %0t ns", $time);
    end

    
endmodule

