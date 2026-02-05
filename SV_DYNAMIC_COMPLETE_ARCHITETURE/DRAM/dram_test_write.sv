`include"dram_env.sv"

class dram_test_write;
    dram_env E;
    virtual dram_intf I;

    string ope = "write";

    //string typ = "increment";
    string typ = "decrement";
    //string typ = "randomxie";
    //string typ = "constant";

        function new(virtual dram_intf I);
            this.I = I;
        endfunction

        task write_test();
            E = new(I,ope,typ);
            E.env();
        endtask
endclass
