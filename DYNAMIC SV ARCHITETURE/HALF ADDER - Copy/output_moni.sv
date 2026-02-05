//Capturing The Output signals

class output_moni;
    
    half_pack p4;
    mailbox #(half_pack) m4;
    virtual half_intf i;

    event omoni_done,driv_done;

    function new(mailbox #(half_pack)m4,virtual half_intf i, 
    event omoni_done,driv_done);
        this.m4 = m4;
        this.i = i;
        this.omoni_done = omoni_done;
        this.driv_done  = driv_done;
    endfunction
    
    task moni();
        p4 = new;
        forever begin
            //Pin to Pack
            //@(i.sum,i.carry);
            @(driv_done); //Waiting input monitor trigger
            #5;

            p4.sum = i.sum;
            p4.carry = i.carry;

            m4.put(p4);
            p4.print("From Output Monitor");
            
            -> omoni_done; //Output monitor triggered
        end
    endtask
endclass
