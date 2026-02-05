class sram_bfm;
    sram_pkt p4;
    mailbox #(sram_pkt) m4;//g2b
    virtual sram_intf I;
    bit [7:0] mem[7:0];

        function new(mailbox #(sram_pkt) m4, virtual sram_intf I);
                this.m4 = m4;
                this.I  = I;
        endfunction

        task bfm();
              p4 = new;
                forever begin
                    m4.get(p4);

                    //@(p4.d_in,p4.addr,p4.clk,p4.rst)
                    @(posedge I.clk)

                    p4.clk = I.clk;
                    p4.rst = I.rst;

                     if(!I.rst)
                           begin
                            p4.d_out <= 8'd0;
                            for(int i = 0; i<8; i++)
                                mem[i] <= 8'd0;
                           end
                    else begin
                        // WRITE operation
                        if (p4.wren) begin
                            mem[p4.addr] <= p4.d_in;
                            end

                        // READ operation
                        if (p4.rden) begin
                            p4.d_out <= mem[p4.addr];
                            end
                     end
                   m4.put(p4);
                   p4.print("======FROM BFM======");
                end
        endtask
endclass
