//****************************************UART RX TB************************************

`include"uart_rx.sv"

`timescale 1ns/1ps

//==============================================================================
// UART RX Testbench (Multi-Byte Test)
// - Tests UART RX using baud-tick based timing
// - Displays results in HEX and DECIMAL formats
//==============================================================================

module uart_rx_tb;

    // -------------------------------------------------------------------------
    // Parameters
    // -------------------------------------------------------------------------
    localparam CLK_PERIOD = 20;        // 50 MHz clock
    localparam BIT_TIME   = 8680;      // ~115200 baud (ns)

    // -------------------------------------------------------------------------
    // DUT Signals
    // -------------------------------------------------------------------------
    reg clk;
    reg rst_n;
    reg rx;

    reg rx_baud_tick;
    reg rx_half_baud_tick;

    wire [7:0] rx_data;
    wire       rx_done;
    wire       rx_busy;
    wire       framing_error;
    wire       rx_en;
    wire       rx_start_align;

    // -------------------------------------------------------------------------
    // DUT Instantiation
    // -------------------------------------------------------------------------
    uart_rx #(.DATA_BITS(8)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .rx(rx),
        .rx_baud_tick(rx_baud_tick),
        .rx_half_baud_tick(rx_half_baud_tick),
        .rx_data(rx_data),
        .rx_done(rx_done),
        .rx_busy(rx_busy),
        .framing_error(framing_error),
        .rx_en(rx_en),
        .rx_start_align(rx_start_align)
    );

    // -------------------------------------------------------------------------
    // Clock Generation
    // -------------------------------------------------------------------------
    always #(CLK_PERIOD/2) clk = ~clk;

    // -------------------------------------------------------------------------
    // Half Baud Tick Generator (TB Model)
    // -------------------------------------------------------------------------
    task gen_half_baud;
        begin
            #(BIT_TIME/2);
            rx_half_baud_tick = 1'b1;
            #(CLK_PERIOD);
            rx_half_baud_tick = 1'b0;
        end
    endtask

    // -------------------------------------------------------------------------
    // Full Baud Tick Generator (TB Model)
    // -------------------------------------------------------------------------
    task gen_baud;
        begin
            #(BIT_TIME);
            rx_baud_tick = 1'b1;
            #(CLK_PERIOD);
            rx_baud_tick = 1'b0;
        end
    endtask

    // -------------------------------------------------------------------------
    // UART Transmit Task (Drives RX Line)
    // -------------------------------------------------------------------------
    task uart_send_byte(input [7:0] data);
        integer i;
        begin
            // Start Bit
            rx = 1'b0;
            gen_half_baud();

            // Data Bits (LSB first)
            for (i = 0; i < 8; i = i + 1) begin
                rx = data[i];
                gen_baud();
            end

            // Stop Bit
            rx = 1'b1;
            gen_baud();
        end
    endtask

    // -------------------------------------------------------------------------
    // Test Sequence (Multi-Byte)
    // -------------------------------------------------------------------------
    integer k;
    reg [7:0] test_vec [0:7];

    initial begin
        // Test Vectors
        test_vec[0] = 8'hA5;
        test_vec[1] = 8'h3C;
        test_vec[2] = 8'hF0;
        test_vec[3] = 8'h55;
        test_vec[4] = 8'hA7;
        test_vec[5] = 8'hB5;
        test_vec[6] = 8'hC5;
        test_vec[7] = 8'hA8;

        // Initialization
        clk               = 1'b0;
        rst_n             = 1'b0;
        rx                = 1'b1;   // UART idle
        rx_baud_tick      = 1'b0;
        rx_half_baud_tick = 1'b0;

        #100;
        rst_n = 1'b1;
        #200;

        // ---------------------------------------------------------------------
        // Test Header
        // ---------------------------------------------------------------------
        $display("---------------------------------------------------------");
        $display(" UART RX MULTI-BYTE TEST ");
        $display("---------------------------------------------------------");

        // ---------------------------------------------------------------------
        // Send and Verify Bytes
        // ---------------------------------------------------------------------
        for (k = 0; k < 8; k = k + 1) begin
            $display("[TX] Sending byte %0d : 0x%02h (%0d)",
                      k, test_vec[k], test_vec[k]);

            uart_send_byte(test_vec[k]);

            // Wait for RX completion
            wait (rx_done);
            #10;

            $display("[RX] Received byte  : 0x%02h (%0d) | Framing Error = %0b",
                      rx_data, rx_data, framing_error);

            // Optional self-check
            if (rx_data !== test_vec[k])
                $error("[ERROR] Data mismatch! Expected 0x%02h, Got 0x%02h",
                        test_vec[k], rx_data);

            $display("---------------------------------------------------------");

            // Idle gap between frames
            #(BIT_TIME);
        end

        #200;
        $finish;
    end

endmodule

/*
`timescale 1ns/1ps

module uart_rx_tb;

    localparam CLK_PERIOD = 20;        // 50 MHz
    localparam BIT_TIME   = 8680;       // 115200 baud

    reg clk;
    reg rst_n;
    reg rx;

    reg rx_baud_tick;
    reg rx_half_baud_tick;

    wire [7:0] rx_data;
    wire rx_done;
    wire rx_busy;
    wire framing_error;
    wire rx_en;
    wire rx_start_align;

    // DUT
    uart_rx #(.DATA_BITS(8)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .rx(rx),
        .rx_baud_tick(rx_baud_tick),
        .rx_half_baud_tick(rx_half_baud_tick),
        .rx_data(rx_data),
        .rx_done(rx_done),
        .rx_busy(rx_busy),
        .framing_error(framing_error),
        .rx_en(rx_en),
        .rx_start_align(rx_start_align)
    );

    // Clock
    always #(CLK_PERIOD/2) clk = ~clk;

    // Half baud tick
    task gen_half_baud;
        begin
            #(BIT_TIME/2);
            rx_half_baud_tick = 1;
            #(CLK_PERIOD);
            rx_half_baud_tick = 0;
        end
    endtask

    // Full baud tick
    task gen_baud;
        begin
            #(BIT_TIME);
            rx_baud_tick = 1;
            #(CLK_PERIOD);
            rx_baud_tick = 0;
        end
    endtask

    // UART send byte
    task uart_send_byte(input [7:0] data);
        integer i;
        begin
            // Start bit
            rx = 0;
            gen_half_baud();

            // Data bits (LSB first)
            for (i = 0; i < 8; i = i + 1) begin
                rx = data[i];
                gen_baud();
            end

            // Stop bit
            rx = 1;
            gen_baud();
        end
    endtask

    // ===============================
    // TEST SEQUENCE (MULTI BYTE)
    // ===============================
    integer k;
    reg [7:0] test_vec [0:3];

    initial begin
        // Test data
        test_vec[0] = 8'hA5;
        test_vec[1] = 8'h3C;
        test_vec[2] = 8'hF0;
        test_vec[3] = 8'h55;

        // Init
        clk = 0;
        rst_n = 0;
        rx = 1;
        rx_baud_tick = 0;
        rx_half_baud_tick = 0;

        #100;
        rst_n = 1;

        #200;

        // Send multiple bytes
        for (k = 0; k < 4; k = k + 1) begin
            $display("Sending byte %0d : 0x%0h", k, test_vec[k]);
            uart_send_byte(test_vec[k]);

            // wait for rx_done
            wait (rx_done);
            #10;

            $display("RX DONE: data = 0x%0h, framing_error = %0b",
                      rx_data, framing_error);
            $display("RX DONE: data = 0x%0d, framing_error = %0b",
                      rx_data, framing_error);

            // small idle gap between frames
            #(BIT_TIME);
        end

        #200;
        $finish;
    end

endmodule
*/

/* `timescale 1ns/1ps

module uart_rx_tb;

    // ---------------------------------
    // Parameters
    // ---------------------------------
    localparam CLK_PERIOD = 20;       // 50 MHz clock
    localparam BIT_TIME   = 8680;     // ~115200 baud (ns)

    // ---------------------------------
    // DUT signals
    // ---------------------------------
    reg clk;
    reg rst_n;
    reg rx;

    reg rx_baud_tick;
    reg rx_half_baud_tick;

    wire [7:0] rx_data;
    wire rx_done;
    wire rx_busy;
    wire framing_error;
    wire rx_en;
    wire rx_start_align;

    // ---------------------------------
    // DUT instantiation
    // ---------------------------------
    uart_rx #(.DATA_BITS(8)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .rx(rx),
        .rx_baud_tick(rx_baud_tick),
        .rx_half_baud_tick(rx_half_baud_tick),
        .rx_data(rx_data),
        .rx_done(rx_done),
        .rx_busy(rx_busy),
        .framing_error(framing_error),
        .rx_en(rx_en),
        .rx_start_align(rx_start_align)
    );

    // ---------------------------------
    // Clock generation
    // ---------------------------------
    always #(CLK_PERIOD/2) clk = ~clk;

    // ---------------------------------
    // Baud tick generators (TB MODEL)
    // ---------------------------------
    task gen_half_baud;
        begin
            #(BIT_TIME/2);
            rx_half_baud_tick = 1;
            #(CLK_PERIOD);
            rx_half_baud_tick = 0;
        end
    endtask

    task gen_baud;
        begin
            #(BIT_TIME);
            rx_baud_tick = 1;
            #(CLK_PERIOD);
            rx_baud_tick = 0;
        end
    endtask

    // ---------------------------------
    // UART TX task (drives rx pin)
    // ---------------------------------
    task uart_send_byte(input [7:0] data);
        integer i;
        begin
            // Start bit
            rx = 0;
            gen_half_baud();   // align
            for (i = 0; i < 8; i = i + 1) begin
                rx = data[i]; // LSB first
                gen_baud();
            end

            // Stop bit
            rx = 1;
            gen_baud();
        end
    endtask

    // ---------------------------------
    // Test sequence
    // ---------------------------------
    initial begin
        // init
        clk = 0;
        rst_n = 0;
        rx = 1;
        rx_baud_tick = 0;
        rx_half_baud_tick = 0;

        #100;
        rst_n = 1;

        #200;

        $display("Sending byte 0xA5...");
        uart_send_byte(8'hA5);

        // wait for RX done
        wait (rx_done);

        #20;
        $display("RX DONE: data = 0x%0h, framing_error = %0b",
                  rx_data, framing_error);

        #200;
        $finish;
    end

endmodule
*/
