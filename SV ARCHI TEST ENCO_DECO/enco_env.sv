class enco_env;
    enco_gen    G;
    enco_driv   D;
    enco_iomoni M;
    enco_sb     S;

    mailbox #(enco_pack) G2D,G2S;
    mailbox #(enco_pack) M2S;

    virtual enco_intf I;
    int n = 5;

            function new(virtual enco_intf I);
                this.I = I;
            endfunction

            task built();
                G2D = new;
                G2S = new;
                M2S = new;
            endtask

            task env();
                built();

                G = new(G2D,G2S,n);
                D = new(G2D,I);
                M = new(M2S,I);
                S = new(G2S,M2S);

                fork
                    G.gen();
                    D.driv();
                    M.moni();
                    S.sb();
                join
            endtask

endclass
