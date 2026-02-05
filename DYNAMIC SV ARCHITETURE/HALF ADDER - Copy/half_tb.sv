program half_tb(half_intf i);
    half_env E;

    initial begin
        E = new(i);
        E.env();
    end
endprogram
