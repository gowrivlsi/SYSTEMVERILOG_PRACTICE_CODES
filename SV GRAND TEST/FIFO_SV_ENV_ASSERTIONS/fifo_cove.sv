class fifo_cove;
    fifo_pkt p5;
    mailbox #(fifo_pkt) g2c;
    virtual fifo_intf I;

        covergroup cov@(posedge I.clk);
            data1  : coverpoint p5.d_in{
                        bins low = {[0:31]};
                        bins mid = {[32:127]};
                        bins high={[128:255]};
                     }
             empty_full : coverpoint {p5.empty,p5.full}{
                                bins empty = {2'b10};
                                bins mid   = {2'b00};
                                bins full  = {2'b01};
                          }
             e2n   : coverpoint p5.empty{bins e2n=(1 => 0);}
             f2n   : coverpoint p5.full{bins f2n=(0 => 1);}
            //data1 : coverpoint p5.d_in{bins b1[]={[10:95]};}
            //data2 : coverpoint p5.d_in{bins b2[]=(42 => 51);}
           // read1 : coverpoint p5.read{bins b3[]={[30:100]};}
            //write1: coverpoint p5.write{bins b4[]={[25:96]};}
            wr1   : coverpoint p5.wr{bins b5=(0 => 1);}
            rd1   : coverpoint p5.rd{bins b6=(0 => 1);}
        endgroup

        function new(mailbox#(fifo_pkt) g2c,virtual fifo_intf I);
            this.g2c = g2c;
            this.I   = I;
            cov = new;
            cov.set_inst_name("GOWRISH");
        endfunction
        
        task cove();
            p5 = new;
                forever begin
                    g2c.get(p5);
                    @(p5.d_in);
                end
        endtask
endclass
