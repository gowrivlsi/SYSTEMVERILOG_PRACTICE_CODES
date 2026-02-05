`include"fifo_pkt.sv"
`include"fifo_gen.sv"
`include"fifo_driv.sv"
`include"fifo_bfm.sv"
`include"fifo_moni.sv"
`include"fifo_sb.sv"
`include"fifo_cove.sv"

class fifo_env;
    fifo_gen    G;
    fifo_driv   D;
    fifo_bfm    B;
    fifo_moni   M;
    fifo_sb     S;
    fifo_cove   C;

    string op;

    mailbox #(fifo_pkt) G2D,G2B,G2C;
    mailbox #(fifo_pkt) M2S,B2S;

    virtual fifo_intf I;
    int n = 8;

    event g,d,b,m,s;

        function new(virtual fifo_intf I,string op);
            this.I = I;
            this.op = op;
        endfunction

        task build();
            G2D = new;
            G2B = new;
            M2S = new;
            B2S = new;
            G2C = new;
        endtask

        task env();
            build();

            G = new(G2D,G2B,G2C,I,n,op,g);
            D = new(G2D,I,g,d);
            B = new(G2B,B2S,I,d,m);
            M = new(M2S,I,s,m);
            S = new(B2S,M2S,s);
            C = new(G2C,I);


            fork
                G.gen();
                D.driv();
                B.bfm();
                M.moni();
                S.sb();
                C.cove();
            join
        endtask
endclass
