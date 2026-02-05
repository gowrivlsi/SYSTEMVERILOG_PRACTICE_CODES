class gen;

  packet p1;
  mailbox #(packet) g2d,g2b,g2c;
  virtual inter i;
  int num;
  event e1;
  string op;

  function new(mailbox #(packet) g2d,g2b,g2c,virtual inter i,event e1, int num,string op);
       this.g2d=g2d;
       this.g2b=g2b;
       this.g2c=g2c;
       this.i=i;
       this.num=num;
       this.e1=e1;
       this.op=op;
  endfunction

  task gen();
  p1=new();
   wait(i.rst==1)
   @(posedge i.clk);

     begin
      case(op)
        "write"       :   begin
                            repeat(num)
                                begin
                                  write();
                                end
                          end

        "read"        :   begin
                             repeat(num)
                                begin
                                  write();
                                end

                            repeat(num)
                                begin
                                  read();
                                end
                          end

       "write_read"   :   begin
                            repeat(num)
                               begin
                                 write();
                                 read();
                               end
                          end
      endcase
     end

  endtask

  task write();
   p1.wr=1;
   p1.rd=0;
   assert(p1.randomize);
         g2d.put(p1);
         g2b.put(p1);
         g2c.put(p1);
         p1.print("From Generator");
         ->e1;
         @(posedge i.clk);
  endtask

   task read();
   p1.rd=1;
   p1.wr=0;
         g2d.put(p1);
         g2b.put(p1);
         g2c.put(p1);
         p1.print("From Generator");
         ->e1;
         @(posedge i.clk);
  endtask


  
endclass
