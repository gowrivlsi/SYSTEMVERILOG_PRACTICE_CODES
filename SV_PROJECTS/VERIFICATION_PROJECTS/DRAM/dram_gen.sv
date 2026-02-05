class dram_gen;

    dram_pkt p1;
    mailbox #(dram_pkt) g2d,g2b;
    virtual dram_intf I;
    int num;

    string ope,typ; //for write, read, write_read

    //int addr,data=10;// for Increment
    int addr,data=100;//for decrement
    //int addr,data;//for randomize
    //int addr,data;//for constant

        function new(mailbox#(dram_pkt) g2d,g2b, virtual dram_intf I, int num, string ope,typ);
                this.g2d = g2d;
                this.g2b = g2b;
                this.I   = I;
                this.num = num;
                this.ope = ope;
                this.typ = typ;
        endfunction


        task gen();
            p1 = new;
            wait(I.rst==1)
            @(posedge I.clk)
                case(ope)
                    "write"         : begin
                                        repeat(num) write();
                                      end
                    "read"          : begin
                                        repeat(num) write();

                                        repeat(num) read();
                                      end
                    "write_read"    : begin
                                        repeat(num)begin
                                            write();
                                            read();
                                        end
                                      end
                endcase
        endtask


        //for type
        task dram_typ();
            case(typ)
                "increment" : begin
                                addr++;
                                data +=10;
                              end
                "decrement" : begin
                                addr--;
                                data -=10;
                              end
                "randomixe" : begin
                                assert(p1.randomize());
                                p1.d_in = data;
                                p1.addr = addr;
                              end
                "constant" : begin
                                addr=6;
                                data =60;
                              end

            endcase
        endtask



         
        //for write operation
        task write();
            p1.refresh = 0;
            p1.wren = 1;
                p1.addr = addr;
                p1.d_in = data;

                g2d.put(p1);
                g2b.put(p1);

                p1.print("=======FROM GENRATOR - WRITE======");
                dram_typ();
                @(posedge I.clk);
        endtask

        //for read operation
            task read();
                p1.refresh=0;
                p1.wren=0;

                p1.addr = addr;
                g2d.put(p1);
                g2b.put(p1);
                p1.print("=======FROM GENERATOR - READ=======");
                dram_typ();
                @(posedge I.clk);
            endtask
endclass
