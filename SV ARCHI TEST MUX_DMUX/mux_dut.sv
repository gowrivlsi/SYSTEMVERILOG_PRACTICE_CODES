module mux_dut(input [3:0]i,
               input [1:0]s,
               output reg y
              );

    always_comb 
        begin
            if(~s[1] && ~s[0])
                y = i[0];
            
            else if(~s[1] && s[0])
                y = i[1];

             else if(s[1] && ~s[0])
                y = i[2];

             else if(s[1] && s[0])
                y = i[3];
        end
endmodule
