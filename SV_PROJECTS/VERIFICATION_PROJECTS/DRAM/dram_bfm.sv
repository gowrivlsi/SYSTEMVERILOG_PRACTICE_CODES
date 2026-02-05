class dram_bfm;
    dram_pkt p3;
    mailbox #(dram_pkt) b2s;//geting from gen
    virtual dram_intf I;
    logic [7:0]mem[7:0];

        function new(mailbox #(dram_pkt)b2s, virtual dram_intf I);
                this.b2s = b2s;
                this.I   = I;
        endfunction


        task bfm();
            p3 = new;
               // wait(I.rst==1)
                forever begin
                    b2s.get(p3);

                    @(p3.d_in,p3.addr,p3.clk,p3.rst)
                        p3.clk = I.clk;
                        p3.rst = I.rst;
                    
                    //for refresh
                    if(p3.refresh==1)begin
                                for(int i=0; i<8; i++)
                                        mem[i]<=mem[i];
                                end
                    //Write operation
                        else if(p3.wren==1) begin
                               mem[p3.addr]<=p3.d_in;
                            end
                    //read operation
                        else if(p3.wren==0) begin
                                p3.d_out<=mem[p3.addr];
                            end
                    b2s.put(p3);
                    p3.print("=======FROM BFM=======");

                end
        endtask
endclass
