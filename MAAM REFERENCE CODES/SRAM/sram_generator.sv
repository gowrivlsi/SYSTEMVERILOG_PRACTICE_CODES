class sram_generator;
   sram_packet1 p1;
   mailbox#(sram_packet1) g2d,g2c;
   int num;
   string operation;//write,read,write_read
   string typ;//incr,decre,randomize,constant
   int inc_addr;
   int inc_data;
   virtual sram_intf i1;
   
 
    function new(mailbox#(sram_packet1) g2d,g2c,string operation,typ,virtual sram_intf i1);
      this.g2d=g2d;
      this.g2c=g2c;
      this.operation=operation;
      this.typ=typ;
      this.i1=i1;
    endfunction

    task gen();
     p1=new();
         wait(i1.rst==1);
          @(posedge i1.clk);
          begin
            case(operation)
             "write":begin
                     p1.wr_en=1;
                     repeat(8)
                      begin
                     p1.addr=inc_addr;
                     p1.data=inc_data;
                      g2d.put(p1);
                      g2c.put(p1);
                      p1.print("FROM GENERATOR");

                      type_op();
                    @(posedge i1.clk);
                    end
                end
             "read"      :begin
                          end
             "write_read":begin
                          end   
        endcase
         end
    endtask


    task type_op;
        case(typ)
          "increment":begin
                      inc_addr++;
                      inc_data++;
                    end
          "decrement":begin
                    end
          "randomixe":begin
                     end
          "constant":begin
                
                end
        endcase
      endtask


             
endclass
