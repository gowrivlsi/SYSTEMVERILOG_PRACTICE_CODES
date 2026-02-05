class mux_sb;
    mux_pack i_pac,o_pac;
    mailbox #(mux_pack) i_m,o_m;
    static int trans, pass, fail;

        function new(mailbox#(mux_pack) i_m,o_m);
                this.i_m  = i_m;
                this.o_m  = o_m;
        endfunction


        task sb();
            bit e;
            i_pac = new;
            o_pac = new;
                

                forever begin
                    i_m.get(i_pac);
                    o_m.get(o_pac);
                    
                    //BFM MUX LOGIC
                     e = i_pac.i[i_pac.s]; //y = i[s]

                   
                    if (o_pac.d_o[i_pac.s] == e)//i[s] = y
                        begin
                            pass++;
                            $info("==========================TEST PASSED=========================");
                            i_pac.print("=====INPUT MONITOR=======");
                            o_pac.print("=====OUTPUT MONITOR======");
                        end
                    else
                        begin
                            fail++;
                            $info("==========================TEST FAILED=========================");
                            i_pac.print("=====INPUT MONITOR=======");
                            o_pac.print("=====OUTPUT MONITOR======");
                        end
                    trans = pass+fail;
                end
        endtask 
endclass
