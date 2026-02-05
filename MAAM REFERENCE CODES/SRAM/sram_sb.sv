class sram_sb;
    sram_packet1 ref_pac,dut_pac;
    mailbox#(sram_packet1) s2b,s2m;

    function new(mailbox#(sram_packet1) s2b,s2m);
      this.s2b=s2b;
      this.s2m=s2m;
    endfunction

    task sb;
       ref_pac=new();
       dut_pac=new();
         forever begin
           s2b.get(ref_pac);
           s2m.get(dut_pac);
            @(dut_pac.data_out)
            if(ref_pac.data_out==dut_pac.data_out)
               begin
                $display("***********TEST PASSED*************");
                $display("ref_pac=%0d,dut_pac=%0d",ref_pac.data_out,dut_pac.data_out);
               end
             else
                 begin
                $display("***********TEST FAILED*************");
                $display("ref_pac=%0d,dut_pac=%0d",ref_pac.data_out,dut_pac.data_out);
                end
        end
     endtask
endclass
