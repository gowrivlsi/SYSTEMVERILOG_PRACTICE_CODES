//it is used to compare vip and ip output
class half_sb; 
   half_packet ref_pac;
   half_packet dut_pac;
   mailbox#(half_packet)  m5;//bfm
   mailbox#(half_packet)  m6;//monitor


   function new(mailbox#(half_packet) m5,m6);
     this.m5=m5;
     this.m6=m6;
   endfunction


   task sb();
      ref_pac=new;
      dut_pac=new;

     forever begin
       m5.get(ref_pac);
       m6.get(dut_pac);
          if(ref_pac.sum==dut_pac.sum && ref_pac.carry==dut_pac.carry)
              begin
              $info("========TEST PASSED==========");
              ref_pac.print("BFM");
              dut_pac.print("DUT");
              end
          else
              begin
              $info("========TEST FAILED==========");
              ref_pac.print("BFM");
              dut_pac.print("DUT");
              end

         end
   endtask
  

endclass
