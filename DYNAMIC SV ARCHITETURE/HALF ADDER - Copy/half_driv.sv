//To Get Stimulus from the Genrator and converting packet level data to pin level data Through VIRTUAL INTERFACE

class half_driv;
    half_pack p2;
    mailbox #(half_pack) m2;
    virtual half_intf i;

    event driv_done,gen_done;

    function new(mailbox#(half_pack)m2,virtual half_intf i, 
    event driv_done,gen_done);
            this.m2 = m2;
            this.i = i;
            this.driv_done = driv_done;
            this.gen_done  = gen_done;
    endfunction
    
    task driv();
        p2 = new;
        forever begin
            @(gen_done);//Wating for genrator triggered
            m2.get(p2);
            p2.print("From Driver");

           // @(p2.a,p2.b); //Packet To Pin Level
            i.a = p2.a;
            i.b = p2.b;
            -> driv_done;//driver triggering
        end
    endtask
endclass
