//IT has The all the class packet handle and creating object
class half_env;
    //Creatin All Classes Handle
    half_gen    G;
    half_driv   D;
    half_sb     S;
    input_moni  I;
    output_moni O;
    
    //Creating Events
        event gen_done;
        event driv_done;
        event imoni_done;
        event omoni_done;
        

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
        G = new(G2D,num,gen_done);
        D = new(G2D,i,driv_done,gen_done);
        S = new(I2S,O2S,imoni_done,omoni_done);
        I = new(I2S,i,imoni_done,driv_done);
        O = new(O2S,i,omoni_done,driv_done);

        fork
            G.gen();
            //wait(gen_done);
            D.driv();
           // wait(driv_done);
            I.bfm();
           // wait(imoni_done);
            O.moni();
           // wait(imoni_done);
           // wait(omoni_done);
            S.sb();
        join

    endtask
endclass
