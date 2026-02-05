class fifo_gen;
    fifo_pkt p1;
    mailbox #(fifo_pkt) g2d,g2b; 

    virtual fifo_intf I;
    int num;
    string fifo_op;
    

        function new(mailbox#(fifo_pkt)m1,m2, int n,virtual fifo_intf I,string op);
            this.g2d = m1;
            this.g2b = m2;
            this.I = I;
            this.fifo_op = op;
            this.num = n;
        endfunction

        task gen();
            p1 = new;
                wait(I.rst==1)
                @(posedge I.clk)
                begin
                    case(fifo_op)
                        "writr"  : begin 
                                     repeat(num)begin
                                        write();
                                     end
                                   end
                        "read"   : begin
                                    repeat(num)begin
                                        write();
                                    end

                                    repeat(num) begin
                                        read();
                                    end
                                   end

                        "write_read" : begin
                                        repeat(num) begin
                                            write();
                                            read();
                                        end
                                       end

                         "rset"    : begin
                                        p1.d_out=0;
                                     end

                         "full"    : begin
                                        
                                     end

                         "empty"   : begin
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
         
         p1.print("===============From Generator============");
        endtask


        task read();
            p1.rd=1;
            p1.wr=0;
         g2d.put(p1);
         g2b.put(p1);
         
         p1.print("===============From Generator===========");  
       endtask

endclass
