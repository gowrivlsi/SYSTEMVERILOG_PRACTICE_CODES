//It is used to capture  the input signals and also  it is refernce model
//It is used to convert pin level to packet level

class input_moni;
    half_pack p3;
    mailbox #(half_pack) m3;
    virtual half_intf i;


    function new(mailbox #(half_pack) m3, virtual half_intf i);
        this.m3 = m3;
        this.i = i;
    endfunction
        
    task bfm();
        p3 = new;
        forever begin
            //Pin To Packet
            @(i.a,i.b);
            p3.a = i.a;
            p3.b = i.b;
            
            //BFM logic
             {p3.carry,p3.sum} = p3.a + p3.b;

            m3.put(p3);
            p3.print("From Input Monitor With BFM");
          end
    endtask
endclass
