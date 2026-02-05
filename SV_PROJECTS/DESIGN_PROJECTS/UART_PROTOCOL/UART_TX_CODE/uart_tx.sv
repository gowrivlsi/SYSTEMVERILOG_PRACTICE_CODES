/**********************************UART - TX DESIGN CODE*********************************/

module uart_tx #(parameter DATA_BITS = 8)
                (
                    input wire                 clk,
                    input wire                 rst_n,
                    input wire                 tx_start,
                    input wire [DATA_BITS-1:0] tx_data,
                    input wire                 tx_baud_tick,

                    output reg                 tx,
                    output reg                 tx_busy,
                    output reg                 tx_done
                );

  //FSM STATES FOR UART TX
    typedef enum logic[2:0]{IDLE,START,DATA,STOP,DONE}tx_state;

    tx_state cs, ns;

    reg [DATA_BITS -1:0]        shift_reg; //holds data & shifts right
    reg [$clog2(DATA_BITS)-1:0] bit_cnt;   //counts how many bits sent (0–7)

//FSM LOGIC
    //CURRENT STATE LOGIC
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            cs <= IDLE;
        else if(tx_baud_tick)
            cs <= ns;
    end
    
    //NEXT STATE LOGIC
    always @(*)begin
        ns = cs;
        case(cs)
            IDLE    : if(tx_start)                     ns = START;
            START   :                                  ns = DATA;
            DATA    : if(bit_cnt == DATA_BITS - 1)     ns = STOP;
                      else                             ns = DATA;
            STOP    :                                  ns = DONE;
            DONE    :                                  ns = IDLE;
            default :                                  ns = IDLE;
        endcase
    end

    //FSM LOGIC FOR DATA TRANSFORING IN TX
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n) begin
            tx              <= 1'b1;
            tx_busy         <= 1'b0;
            tx_done         <= 1'b0;
            shift_reg       <= '0;
            bit_cnt         <= '0;
        end 

        else begin
            tx_done <= 1'b0;

            if(tx_baud_tick) begin
                case(cs)
                    IDLE  : begin
                       tx      <= 1'b1;
                       tx_busy <= 1'b0;
                       bit_cnt <=   '0;
                       if(tx_start)begin
                           shift_reg <= tx_data;
                           tx_busy   <= 1'b1;
                       end
                    end

                    START : begin
                        tx <= 1'b0;
                    end

                    DATA  : begin
                        tx        <= shift_reg[0];
                        shift_reg <= shift_reg >> 1;
                        bit_cnt   <= bit_cnt + 1'b1;
                    end

                    STOP  : begin
                        tx <= 1'b1;
                    end

                    DONE  : begin
                        tx_busy <= 1'b0;
                        tx_done <= 1'b1;
                    end
                endcase
            end
        end
    end

endmodule
