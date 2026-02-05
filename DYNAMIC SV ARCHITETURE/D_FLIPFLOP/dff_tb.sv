program dff_tb(dff_intf I);
    dff_env E;

    initial begin
        E = new(I);
        E.env();
    end
endprogram
