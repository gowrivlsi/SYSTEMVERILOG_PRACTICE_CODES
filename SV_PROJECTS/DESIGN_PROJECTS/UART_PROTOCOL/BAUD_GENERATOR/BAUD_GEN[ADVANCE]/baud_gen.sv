/*************************BAUD GENERATOR DESIGN CODE**********************************/
module baud_gen #(
    parameter integer CLK_FREQ = 50_000_000,//Hz
    parameter integer BAUD     = 115200
)(
    input wire clk,
    input wire rst_n,
    
    //control from FSM OF TX & RX
    input wire tx_en,
    input wire rx_en,
    input wire rx_start_align,

    //Timing Pulses
    output reg tx_baud_tick,
    output reg rx_baud_tick,
    output reg rx_half_baud_tick
  );

    localparam integer BAUD_DIVISOR       = (CLK_FREQ + (BAUD/2)) / BAUD;
    localparam integer HALF_BAUD_DIVISOR  = BAUD_DIVISOR / 2;

    reg [$clog2(BAUD_DIVISOR)-1:0] tx_cnt;
    reg [$clog2(BAUD_DIVISOR)-1:0] rx_cnt;
    reg [$clog2(HALF_BAUD_DIVISOR)-1:0] rx_half_cnt;

    reg rx_half_done;

    /*------------------TX BAUD--------------------*/
        always @(posedge clk or negedge rst_n)begin
            if(!rst_n) begin
                   tx_cnt       <= 0;
                   tx_baud_tick <= 0;
            end
            
            else if(tx_en) begin
                    if(tx_cnt == BAUD_DIVISOR - 1) begin
                         tx_cnt       <= 0;
                         tx_baud_tick <= 1;
                    end

                    else begin
                         tx_cnt       <= tx_cnt + 1;
                         tx_baud_tick <= 0;
                    end 
                 end 
           else begin
                  tx_cnt       <= 0;
                  tx_baud_tick <= 0;
                 end
        end

    /*-------------------RX BAUD----------------------*/
       always @(posedge clk or negedge rst_n)begin
            if(!rst_n) begin
                   rx_cnt       <= 0;
                   rx_baud_tick <= 0;
            end
            
            else if(rx_en) begin
                    if(rx_cnt == BAUD_DIVISOR - 1) begin
                         rx_cnt       <= 0;
                         rx_baud_tick <= 1;
                    end

                    else begin
                         rx_cnt       <= rx_cnt + 1;
                         rx_baud_tick <= 0;
                    end 
                 end 
           else begin
                  rx_cnt       <= 0;
                  rx_baud_tick <= 0;
                 end
        end 

   /*-------------RX HALF BAUD ONLY ONCE---------------*/
        always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_half_cnt <= 0;
            rx_half_baud_tick <= 0;
            rx_half_done <= 0;
        end
        
        else if (rx_start_align && !rx_half_done) begin
            if (rx_half_cnt == HALF_BAUD_DIVISOR - 1) begin
                rx_half_cnt <= 0;
                rx_half_baud_tick <= 1;
                rx_half_done <= 1;
            end 

            else begin
                rx_half_cnt <= rx_half_cnt + 1;
                rx_half_baud_tick <= 0;
            end
        end 

        else begin
            rx_half_cnt <= 0;
            rx_half_baud_tick <= 0;
            if(!rx_start_align)
                 rx_half_done <= 0;
        end
    end
endmodule
