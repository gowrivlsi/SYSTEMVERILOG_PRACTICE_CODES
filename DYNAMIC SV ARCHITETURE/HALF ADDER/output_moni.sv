//Capturing The Output signals

class output_moni;
    
    half_pack p4;
    mailbox #(half_pack) m4;
    virtual half_intf i;

    function new(mailbox #(half_pack)m4,virtual half_intf i);
        this.m4 = m4;
        this.i = i;
    endfunction
    
    task moni();
        p4 = new;
        forever begin
            //Pin to Pack
            @(i.sum,i.carry);
            p4.sum = i.sum;
            p4.carry = i.carry;

            m4.put(p4);
            p4.print("From Output Monitor");
        end
    endtask
endclass
