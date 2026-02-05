program full_adder_tb(full_adder_intf i);
    
    full_adder_env  E;

    initial begin
        E = new(i);
        E.env();
    end
endprogram
