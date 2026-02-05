class dff_bfm;
    dff_pack p3;
    mailbox #(dff_pack) m4;//geting gen to bfm
    virtual dff_intf I;
        
        function new(mailbox #(dff_pack) m4 , virtual dff_intf I);
                this.m4  = m4;
                this.I   = I;
        endfunction

        task bfm();
            p3 = new;
                forever begin
                    m4.get(p3);//Geting from generator 
                     @( p3.din)
                    //@(posedge I.clk)

                    p3.rst = I.rst;
                    p3.clk = I.clk;

                    if(!I.rst)
                        p3.q = 1'b0;
                    else
                        p3.q = p3.din;
                    
                    
                    m4.put(p3);
                    p3.print("FROM ->   BFM");
                end
        endtask
endclass
