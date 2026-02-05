program enco_tb(enco_intf I);
    enco_env E;

    initial begin
        E = new(I);
        E.env();
    end
endprogram
