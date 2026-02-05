class half_sb;
    half_pack in_pac;//for input_monitor
    half_pack out_pac; //For output monitor

    mailbox #(half_pack) in_m;
    mailbox #(half_pack) out_m;

    function new(mailbox#(half_pack)in_m,out_m);
        this.in_m = in_m;
        this.out_m = out_m;
    endfunction

    task sb();
        in_pac = new;
        out_pac = new;

        forever begin
            in_m.get(in_pac);
            out_m.get(out_pac);

            if(in_pac.sum == out_pac.sum && in_pac.carry == out_pac.carry)
                begin
                    $info("============TEST PASSED====================");
                    in_pac.print("Input Monitor BFM");
                    out_pac.print("Output Monitor From DUT");
                end
            else 
                begin
                    $info("============TEST FAILED====================");
                    in_pac.print("Input Monitor BFM");
                    out_pac.print("Output Monitor From DUT");
                end

        end
    endtask
endclass
