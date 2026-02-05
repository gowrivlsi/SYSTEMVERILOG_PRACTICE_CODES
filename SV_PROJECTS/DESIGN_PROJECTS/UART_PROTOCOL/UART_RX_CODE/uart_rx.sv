//==============================================================================
// UART Receiver (Baud-Tick Based, Non-Oversampling)
//------------------------------------------------------------------------------
// Description:
//   - Synchronous UART RX implementation using an external baud generator
//   - Uses half-bit alignment for accurate start-bit validation
//   - Samples each data bit once at the bit center (no oversampling)
//   - Implements 8-N-1 UART frame format (configurable DATA_BITS)
//   - Includes RX synchronizer, FSM-based control, and framing error detection
//
// Architecture:
//   - RX Synchronizer (2-FF metastability protection)
//   - FSM: IDLE → START → DATA → STOP → DONE
//   - External Baud Generator interface:
//       * rx_start_align : initiates half-baud alignment
//       * rx_half_baud_tick : center sampling of start bit
//       * rx_en : enables full-baud sampling
//       * rx_baud_tick : samples data & stop bits
//
// Suitable for:
//   - FPGA / SoC UART designs
//   - RTL & DV interview demonstrations
//   - Modular UART TX/RX architectures
//==============================================================================

/******************************* UART RX DESIGN CODE *************************************/
module uart_rx #(parameter DATA_BITS = 8)
            (
                input                       clk,
                input                       rst_n,
                input                       rx,

                input                       rx_baud_tick,
                input                       rx_half_baud_tick,

                output reg  [DATA_BITS-1:0] rx_data,
                output reg                  rx_done,
                output reg                  rx_busy,
                output reg                  framing_error,

                output reg                  rx_en,
                output reg                  rx_start_align
            );

//********************************RX Synchronizer*************************************
    reg rx_ff1, rx_ff2;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_ff1 <= 1'b1;
            rx_ff2 <= 1'b1;
        end else begin
            rx_ff1 <= rx;
            rx_ff2 <= rx_ff1;
        end
    end
    
    wire rx_sync = rx_ff2;

//****************************FSM States****************************************

    typedef enum logic [2:0] {IDLE, START, DATA, STOP, DONE} rx_state_t;
    rx_state_t cs, ns;

    reg [$clog2(DATA_BITS)-1:0] bit_cnt;
    reg [DATA_BITS-1:0]         shift_reg;

//*************************State Register*****************************************
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            cs <= IDLE;
        else
            cs <= ns;
    end

//*************************************Next State Logic**********************************
    always @(*) begin
        ns = cs;
        case (cs)
            IDLE  : if (rx_sync == 1'b0) ns = START;

            START : if (rx_half_baud_tick)
                        ns = (rx_sync == 1'b0) ? DATA : IDLE;

            DATA  : if (rx_baud_tick && bit_cnt == DATA_BITS-1)
                        ns = STOP;

            STOP  : if (rx_baud_tick)
                        ns = DONE;

            DONE  : if (rx_sync == 1'b1)
                        ns = IDLE;
        endcase
    end

//****************************Output  Data Logic************************************
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_data        <=    '0;
            shift_reg      <=    '0;
            bit_cnt        <=    '0;
            rx_done        <= 1'b0;
            rx_busy        <= 1'b0;
            rx_en          <= 1'b0;
            rx_start_align <= 1'b0;
            framing_error  <= 1'b0;
        end else begin
            rx_done <= 1'b0; 
            case (cs) 
                IDLE: begin
                        rx_busy        <= 1'b0;
                        rx_en          <= 1'b0;
                        rx_start_align <= 1'b0;
                        bit_cnt        <=   '0;
                        framing_error  <= 1'b0;

                        if (rx_sync == 1'b0) begin
                            rx_busy        <= 1'b1;
                            rx_start_align <= 1'b1; // one-cycle request
                        end
                     end

                
                START: begin
                        if (rx_half_baud_tick && rx_sync == 1'b0) begin
                            rx_start_align <= 1'b0;
                            rx_en          <= 1'b1;
                            bit_cnt        <= '0;
                        end
                      end

                
                DATA: begin
                        if (rx_baud_tick) begin
                            shift_reg <= {rx_sync, shift_reg[DATA_BITS-1:1]};
                            bit_cnt   <= bit_cnt + 1'b1;
                        end
                      end

                
                STOP: begin
                        if (rx_baud_tick) begin
                            if (rx_sync != 1'b1)
                                framing_error <= 1'b1;
                            rx_data <= shift_reg;
                        end
                      end

                
                DONE: begin
                        rx_done <= 1'b1; // one-cycle pulse
                        rx_en   <= 1'b0;
                        rx_busy <= 1'b0;
                     end
            endcase
        end
    end

endmodule

