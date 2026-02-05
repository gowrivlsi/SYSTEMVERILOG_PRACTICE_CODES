module sram_dut(
                  input clk,rst,
                  input wren,
                  input [2:0] addr,
                  input [7:0] d_in,
                  output reg [7:0] d_out
                );

    //8 locations, each 8-bit wide
    reg [7:0] mem [7:0];


    always @(posedge clk or negedge rst)
        begin
            if(!rst)
                begin
                    d_out <= 8'd0;
                    for(int i = 0; i<8; i++)
                        mem[i] <= 8'd0;
                end
            else begin
                    // WRITE operation
                    if (wren) begin
                        mem[addr] <= d_in;
                        end

                    // READ operation
                     else 
                        d_out <= mem[addr];
                        
                 end
       end
endmodule
