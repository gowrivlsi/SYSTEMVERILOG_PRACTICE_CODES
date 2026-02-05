//To Get Stimulus from the Genrator and converting packet level data to pin level data Through VIRTUAL INTERFACE

class half_driv;
    half_pack p2;
    mailbox #(half_pack) m2;
    virtual half_intf i;

    function new(mailbox#(half_pack)m2,virtual half_intf i);
            this.m2 = m2;
            this.i = i;
    endfunction
    
    task driv();
        p2 = new;
        forever begin
           
            m2.get(p2);
            p2.print("From Driver");

            @(p2.a,p2.b); //Packet To Pin Level
            i.a = p2.a;
            i.b = p2.b;
        end
    endtask
endclass
