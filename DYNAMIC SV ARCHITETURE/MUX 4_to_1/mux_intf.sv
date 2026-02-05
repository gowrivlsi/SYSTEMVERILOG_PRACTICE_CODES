interface mux_intf;
    
        logic i0,i1,i2,i3;
        logic s0,s1;
        logic y;

        modport tb(input y,output i0,i1,i2,i3,s0,s1);
        
endinterface
