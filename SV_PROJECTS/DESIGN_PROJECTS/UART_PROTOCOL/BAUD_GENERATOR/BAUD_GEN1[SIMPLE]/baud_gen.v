//1]BAUD GENERATOR  9600 AT 50MHZ

/*Clock cycles per bit = System clock / Baud rate
  Clock cycles per bit = 50,000,000 / 9600 ≈ 5208 cycles per bit
 
Why did I use 50 MHz in the example then?
Because:
"Many FPGAs / SoCs run at 50 MHz"
Easy round number for learning
Common in labs & boards
# Could also be:
100 MHz
25 MHz
12 MHz
16 MHz (very common in MCUs)
  
*/

module baud_gen #(parameter clk_frq = 25_000_000,
                  parameter baud    = 9600
                 )(
                    input      clk,rst,
                    output reg baud_tick
                  );

  localparam divisor = clk_frq / baud;
     //integer count;
     reg   [$clog2(divisor)-1:0] count;
     
        always @(posedge clk or negedge rst)
            begin
                if(!rst)
                    begin
                        count     <= 0;
                        baud_tick <= 0;
                    end
                 else begin
                       if(count == divisor - 1)
                          begin
                            count     <= 0;
                            baud_tick <= 1;//one clk cycle pulse
                          end
                       else begin
                             count     <= count + 1;
                             baud_tick <= 0;
                            end
                    end
            end

endmodule

//**********************************************TB***************************************
//`timescale 1ns/1ps
module baud_tb;
    reg  clk,rst;
    wire baud_tick;

//instantiation
    baud_gen D(.clk(clk),
               .rst(rst),
               .baud_tick(baud_tick)
                );

//clk gen
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
//rst gen
    initial begin
        rst = 0;
    #20 rst = 1;
    end
    
// MONITOR
    initial begin
        //$monitor("Time=%0t | clk=%b | rst=%b | baud_tick=%b | count =%0d",
                  //$time, clk, rst, baud_tick,D.count);

               #200_000 $stop;
    end
    
    always @(posedge baud_tick) begin
                    $display("BAUD_TICK EVENT @ Time=%0t | count=%0d | BAUD_TICK=%0d",
                                $time, D.count,baud_tick);
                      end

endmodule
