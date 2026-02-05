`include"dram_pkt.sv"
`include"dram_gen.sv"
`include"dram_driv.sv"
`include"dram_bfm.sv"
`include"dram_moni.sv"
`include"dram_sb.sv"
`include"dram_cov.sv"

class dram_env;
    
    dram_gen    G;
    dram_driv   D;
    dram_bfm    B;
    dram_moni   M;
    dram_sb     S;
    dram_cov    C;
    
    string ope,typ;
    virtual dram_intf I;
    int num = 8;

    //creating mailbox
    mailbox #(dram_pkt) g2d,g2b;
    mailbox #(dram_pkt) m2s;
    
        function new(virtual dram_intf I, string ope,typ);
                this.I   = I;
                this.ope = ope;
                this.typ = typ;
        endfunction

        function void build();
            g2d = new;
            g2b = new;
            m2s = new;

            G   = new(g2d,g2b,I,num,ope,typ);
            D   = new(g2d,I);
            B   = new(g2b,I);
            M   = new(m2s,I);
            S   = new(g2b,m2s);
            C   = new(g2d,I);
        endfunction


        task env();
            build();

                fork
                    G.gen();
                    D.driv();
                    B.bfm();
                    C.cov();
                    M.moni();
                    S.sb();
                join_any
        endtask
endclass
