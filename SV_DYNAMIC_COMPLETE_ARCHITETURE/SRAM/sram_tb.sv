`include"sram_env.sv"

program sram_tb(sram_intf I);
    sram_env E;

    initial begin
        E = new(I);
        E.env();
    end
endprogram
