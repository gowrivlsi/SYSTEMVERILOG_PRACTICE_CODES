class fifo_gen;
    fifo_pkt p1;

    mailbox #(fifo_pkt) g2d,g2b,g2c;
    virtual fifo_intf I;
    int num;
    string op;
    event g;
        
        function new(mailbox#(fifo_pkt)g2d,g2b,virtual fifo_intf I,int num,string op,event g);
                this.g2d = g2d;
                this.g2b = g2b;
                this.I   = I;
                this.num = num;
                this.op  = op;
                this.g   = g;
        endfunction

        task gen();
            p1 = new;
            wait(I.rst==1)
            @(posedge I.clk)
            begin
                case(op)
                    "write"      : begin
                                    repeat(num) write();
                                   end

                    "read"       : begin
                                    repeat(num) begin
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

                    "full"       : begin
                                      repeat(num) begin
                                        write();
                                      end
                                   end

                    "empty"      : begin
                                       repeat(num) write();
                                       repeat(num) read();
                                       
                                   end

                  /*  "rst"        : begin
                                    write();
                                    write();
                                    rst();
                                    write();
                                    read();
                                   end */

                    default      : begin
                                    $display("*******Invalid op*******");
                                   end
                endcase

            end
        endtask

        task write();
            p1.wr = 1;
            p1.rd = 0;

            assert(p1.randomize());
                g2d.put(p1);
                g2b.put(p1);
                p1.print("===============WR_from generator================");
                ->g;
                @(posedge I.clk);
        endtask

        task read();
            p1.wr = 0;
            p1.rd = 1;

            g2d.put(p1);
            g2b.put(p1);
            p1.print("==================RD_from generator===================");
            ->g;
            @(posedge I.clk);
        endtask

         
        /*
        task rst();
            // Stop any operation
            p1.wr = 0;
            p1.rd = 0;

            // Apply reset
            I.rst = 0;
            p1.print("======== GEN RESET ASSERTED ========");
            repeat(2) @(posedge I.clk);

            // Release reset
            I.rst = 1;
            @(posedge I.clk);

            p1.print("======== GEN RESET RELEASED ========");
        endtask */
             
endclass




/*
class fifo_gen;
    fifo_pkt p1;

    mailbox #(fifo_pkt) g2d, g2b;
    virtual fifo_intf I;
    int num;
    string op;
        
    function new(mailbox#(fifo_pkt) g2d, g2b,
                 virtual fifo_intf I, int num, string op);
        this.g2d = g2d;
        this.g2b = g2b;
        this.I   = I;
        this.num = num;
        this.op  = op;
    endfunction

    task gen();
        wait(I.rst == 1);
        @(posedge I.clk);

        case (op)

            "write": repeat(num) write();

            "read": begin
                repeat(num) write();
                repeat(num) read();
            end

            "write_read": repeat(num) begin
                write();
                read();
            end

            "full": repeat(num) write();

            "empty": begin
                repeat(num) write();
                repeat(num) read();
            end

            "rst": begin
                write();
                write();
                reset();
                write();
                read();
            end

            default:
                $display("******* Invalid op *******");

        endcase
    endtask

    task write();
        fifo_pkt p;
        p = new();

        p.wr = 1;
        p.rd = 0;
        assert(p.randomize());

        g2d.put(p);
        g2b.put(p);

        p.print("WR_FROM_GEN");
        @(posedge I.clk);
    endtask

    task read();
        fifo_pkt p;
        p = new();

        p.wr = 0;
        p.rd = 1;

        g2d.put(p);
        g2b.put(p);

        p.print("RD_FROM_GEN");
        @(posedge I.clk);
    endtask

    task reset();
        fifo_pkt p;
        p = new();

        p.wr  = 0;
        p.rd  = 0;
        p.rst = 0;

        g2d.put(p);
        g2b.put(p);
        p.print("RESET_ASSERT");

        repeat(2) @(posedge I.clk);

        p = new();
        p.rst = 1;

        g2d.put(p);
        g2b.put(p);
        p.print("RESET_RELEASE");

        @(posedge I.clk);
    endtask
endclass
    
*/
