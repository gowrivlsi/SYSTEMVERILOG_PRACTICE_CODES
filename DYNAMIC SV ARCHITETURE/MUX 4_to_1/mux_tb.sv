program mux_tb(mux_intf t);
    mux_env E;

    initial begin
        E = new(t);
        E.env();
    end

    /*
    final 
        E.S.res();
        */
endprogram
