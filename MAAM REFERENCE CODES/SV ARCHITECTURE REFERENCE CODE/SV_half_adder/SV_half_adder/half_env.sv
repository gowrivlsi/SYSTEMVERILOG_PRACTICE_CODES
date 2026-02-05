class half_env;
    half_gen g1;
    half_driver d1;
    half_bfm    b1;
    half_moni   m1;
    half_sb     s1;
    mailbox#(half_packet)  g2d;
    mailbox#(half_packet)  b2s;
    mailbox#(half_packet)  m2s;
    virtual half_intf i;
    int n=1;

    function new(virtual  half_intf i);
      this.i=i;
    endfunction

    function void build();
       g2d=new;
       b2s=new;
       m2s=new;
     endfunction


    task env();
       build();
       g1=new(g2d,n);
       d1=new(g2d,i);
       b1=new(b2s,i);
       m1=new(m2s,i);
       s1=new(b2s,m2s);
          
          fork
            g1.gen;
            d1.div;
            b1.bfm;
            m1.moni;
            s1.sb;
        join
    endtask
endclass
