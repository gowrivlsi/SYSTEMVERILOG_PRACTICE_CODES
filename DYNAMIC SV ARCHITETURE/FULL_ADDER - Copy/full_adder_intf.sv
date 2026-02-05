interface full_adder_intf;
        logic a,b,cin;
        logic sum,carry;

        modport tb(input sum,carry, output a,b,cin);
        
endinterface
