module  sram_packet;
     bit [7:0]addr;
     bit [7:0]data_in;
     bit wen,rden;
     bit rst;
     int covered,total;


     covergroup  sram;
        //  option.auto_bin_max=256;
         address:coverpoint addr iff(rst)
                                  {bins b1={10,20,30};
                                  bins b2[]={[100:200]};
                                  bins b3[]={50,60,[70:90]};
                                   }
        data:coverpoint data_in{bins x1={[1:50]};
                                  bins x2[]={[200:255]};
                                  bins x3[]={[100:199],[60:90]};
                                  }
       ctrl1:coverpoint wen {bins c1={0,1};}
       ctrl2:coverpoint rden {bins c2[]={0,1};}
      // cross1:cross addr,data_in;
      /* cross2:cross address,data {bins cx1=binsof(address.b2);
                                  bins cx2=binsof(data.x2)&&binsof(address.b3);
                                  bins cx3=binsof(data.x2)||binsof(address.b3);
                                  bins cx4=binsof(data)intersect{[120:240]};
                                  }*/
    endgroup

  sram p1,p2;


    initial begin
      p1=new;
      p2=new;
      p1.set_inst_name("happy new year");
      p2.set_inst_name("advance happy sankranthi");
      rst=1;
      repeat(10)
        begin
         std::randomize(addr,data_in,wen,rden);
         p1.sample();
         $display("addr=%d,data=%d,wen=%d,rden=%d",addr,data_in,wen,rden);
        end

    for(int i=0;i<10;i++)
        begin
         std::randomize(addr,data_in,wen,rden);
         p2.sample();
         $display("addr2=%d,data2=%d,wen2=%d,rden2=%d",addr,data_in,wen,rden);
         if(i==5)
          p2.stop;
        end
       $display("coverage1=%d,covered1=%d,total1=%d,coverage2=%d,covered2=%d,total2=%d",p1.get_inst_coverage(covered,total),covered,total,p2.get_inst_coverage(covered,total),covered,total);
    //   $display("coverage=%d",sram::get_coverage);
       $display("coverage withot static=%d,covered=%d,total=%d",p1.get_coverage(covered,total),covered,total);
     end
endmodule
