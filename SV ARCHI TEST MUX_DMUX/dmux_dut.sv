module dmux_dut(
                    input y,
                    input [1:0] s,
                    output reg[3:0]i
                );
   
always_comb
        begin
            //i[0]=0;i[1]=0;i[2]=0;i[3]=0;//default
             if(~s[1] && ~s[0])
                i[0]=y;
             else if(~s[1] && s[0])
                i[1]=y;
             else if(s[1] && ~s[0])
                i[2]=y;
             else if(s[1] && s[0])
                 i[3]=y;
        end
endmodule
