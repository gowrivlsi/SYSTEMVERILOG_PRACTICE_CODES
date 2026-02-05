program mux_tb(mux_intf I);
    mux_env E;

    initial begin
        E = new(I);
        E.env();
    end
endprogram
