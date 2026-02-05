//IT has The all the class packet handle and creating object
class half_env;
    //Creatin All Classes Handle
    half_gen    G;
    half_driv   D;
    half_sb     S;
    input_moni  I;
    output_moni O;
    
    //Creating Mailbox
    mailbox #(half_pack) G2D;
    mailbox #(half_pack) I2S;
    mailbox #(half_pack) O2S;
    
    virtual half_intf i;
    int num = 5;
    function new(virtual half_intf i);
        this.i = i;
    endfunction

    function void build();
        G2D = new;
        I2S = new;
        O2S = new;
    endfunction

    task env();
        build();
        G = new(G2D,num);
        D = new(G2D,i);
        S = new(I2S,O2S);
        I = new(I2S,i);
        O = new(O2S,i);

        fork
            G.gen();
            D.driv();
            I.bfm();
            O.moni();
            S.sb();
        join

    endtask
endclass
