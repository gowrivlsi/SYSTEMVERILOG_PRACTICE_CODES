class fifo_driv;
    fifo_pkt p2;
    mailbox#(fifo_pkt) g2d;
    virtual fifo_intf I;


    function new(mailbox#(fifo_pkt) g2d,virtual fifo_intf I);
        this.g2d=g2d;
        this.I=I;    
    endfunction
    
    task driv;
      p2=new;
        wait(I.rst==1); 
      forever
       begin
        g2d.get(p2);
        @(negedge I.clk)

        I.rd=p2.rd;
        I.wr=p2.wr;
        I.d_in=p2.d_in;
        p2.print("===========From Driver============="); 
       end
    endtask

endclass

