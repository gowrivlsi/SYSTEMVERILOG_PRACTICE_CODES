class full_adder_env;
    full_adder_gen      G;
    full_adder_driv     D;
    full_adder_imoni    I;
    full_adder_omoni    O;
    full_adder_sb       S;


    //creating mailbox
        mailbox #(full_adder_pack) G2D;
        mailbox #(full_adder_pack) I2S;
        mailbox #(full_adder_pack) O2S;

        virtual full_adder_intf i;
        int n = 15;

        function new(virtual full_adder_intf i);
                this.i  = i;
        endfunction

        task build();
            G2D = new;
            I2S = new;
            O2S = new;
        endtask

        task env();
            build();
            G = new(G2D,n);
            D = new(G2D,i);
            I = new(I2S,i);
            O = new(O2S,i);
            S = new(I2S,O2S);

            fork
                G.gen();
                D.driv();
                I.imoni();
                O.omoni();
                S.sb();
            join
        endtask
endclass
