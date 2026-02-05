module dram_dut(
                    input clk,rst,wren,refresh,
                    input [7:0] d_in,
                    input [2:0] addr,
                    output reg [7:0] d_out
                );
    
    //8bit mem 8 location
    reg [7:0] mem[7:0];

    always@(posedge clk or negedge rst)
        begin
            if(!rst)
                begin
                    d_out<=0;
                    
                    for(int i=0; i<8; i++)
                        mem[i]<=0;
                end

            else begin
                    //for refresh
                    if(refresh)begin
                                for(int i=0; i<8; i++)
                                        mem[i]<=mem[i];
                                end
                    //Write operation
                        else if(wren) begin
                               mem[addr]<=d_in;
                            end
                            
                    //read operation
                        else if(!wren) begin
                                d_out<=mem[addr];
                            end
                 end
        end
endmodule
