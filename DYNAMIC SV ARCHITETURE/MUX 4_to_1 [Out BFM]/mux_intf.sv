interface mux_intf;
    logic [3:0]i;
    logic [1:0]s;
    logic y;

    modport tb(input y, output i, output s);
endinterface
