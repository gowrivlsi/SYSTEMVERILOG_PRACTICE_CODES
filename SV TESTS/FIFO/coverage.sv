class coverage;

 packet p5;
 mailbox#(packet) g2c;
 virtual inter i;

 covergroup cov @(posedge i.clk);
  data1:coverpoint p5.din{bins b1[]={[0:$]};}
  data2:coverpoint p5.din{bins b11[]=(36=>46);}
  write1:coverpoint p5.wr{bins b2[]=(0=>1);}
  write2:coverpoint p5.wr{bins b3[]=(0=>1=>0);}
 endgroup

 function new(mailbox#(packet) g2c,virtual inter i);
   this.i=i;
   this.g2c=g2c;
   cov=new;
   cov.set_inst_name("Shashank");   
 endfunction

 task covi();
  p5=new;

  forever
    begin
      g2c.get(p5);
     // cov.set_inst_name("coverage1");
      @(p5.din);
      
    end


 endtask



endclass
