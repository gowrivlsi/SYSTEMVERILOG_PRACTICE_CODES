//=====================================DFF DESIGN 8 BIT====================================================================
module dff8b(
                input [7:0]d_in,
                input clk,rst,
                output reg[7:0] q
            );
    //always @(posedge clk or negedge rst)
    always_ff @(posedge clk or negedge rst)
    begin
        if(!rst)
            q<=0;
        else 
            q<=d_in;
    end
endmodule
