class sram_gen;
    sram_pkt p1;
    mailbox #(sram_pkt) m1,m2; //m1 for driv m2 for bfm
    int num;
    virtual sram_intf I;
    string sram_ope;//write,read,write_read;
    string sram_typ;//incre,decre,randomize,const
     
    int inc_addr,inc_d_in=10; //for increment
    //int inc_addr,inc_d_in=100; //for increment
    //int inc_addr,inc_d_in; //for randomize
    //int inc_addr,inc_d_in;//for constant
      

        function new(mailbox #(sram_pkt)m1,m2, int num, virtual sram_intf I,string sram_ope,sram_typ);
                this.m1  = m1;//for driv
                this.m2  = m2;//for bfm
                this.num = num;
                this.I   = I;
                this.sram_ope = sram_ope;
                this.sram_typ = sram_typ;
        endfunction

        task gen();
            p1 = new;
               wait(I.rst==1)
               @(posedge I.clk);
                begin
                    case(sram_ope)
                        "write" : begin
                                     repeat(num) begin
                                        write();
                                     end
                                  end
                                
                                
                         "read" : begin
                                    repeat(num)begin
                                        write();
                                      
                                    end
                                    
                                    repeat(num)begin
                                        read();
                                        
                                    end

                                  end

                   "write_read" : begin
                                    repeat(num)begin
                                        write();
                                        read();
                                    end
                                  end
                    endcase
                end
               /*
               repeat(num)begin
                    p1.wren=1;
                   
                    assert(p1.randomize());

                    m1.put(p1);
                    m2.put(p1);

                    p1.print("======FROM GENRATOR - WRITE=====");
                    @(posedge I.clk);
                end */

        endtask

        task sram_typ1();
            case(sram_typ)
                
          "increment":begin
                        inc_addr++;
                        inc_d_in=inc_d_in+10;
                      end
          "decrement":begin
                        inc_addr--;
                        inc_d_in=inc_d_in - 10;
                      end
          "randomixe":begin
                        assert(p1.randomize());
                        inc_addr = p1.addr;
                        inc_d_in = p1.d_in;
                      end
          "constant":begin
                        inc_addr = 7;
                        inc_d_in = 50;
                     end

            endcase
        endtask

        //task for write
            task write();
               p1.wren=1;
               
                 p1.addr = inc_addr;
                 p1.d_in = inc_d_in;
                 m2.put(p1);
                 m1.put(p1);
                 p1.print("======FROM GENRATOR - WRITE=====");
                
                sram_typ1();
                @(posedge I.clk);
                                   
            endtask

        //task for read
            task read();
                p1.wren=0;

                p1.addr = inc_addr;
                m1.put(p1);
                m2.put(p1);
                p1.print("=======FROM GENERATOR - READ=======");
                sram_typ1();
                @(posedge I.clk);
            endtask
endclass
