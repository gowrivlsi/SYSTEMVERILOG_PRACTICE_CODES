module mux_dut(
                input i0,i1,i2,i3,
                input s0,s1,
                output reg y
            );

    always_comb
        begin
            if(~s0 && ~s1)
                y=i0;
            else if(~s0 && s1)
                y=i1;
            else if(s0 && ~s1)
                y=i2;
            else if(s0 && s1)
                y=i3;
        end
endmodule
