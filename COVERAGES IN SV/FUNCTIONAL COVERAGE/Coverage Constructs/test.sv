module sram_pkt;
     bit [7:0]addr;
     bit [7:0]d_in;
     bit wen,rden;
     bit rst;
     int covered,total;
      covergroup sram;
            //option.auto_bin_max = 256;
            address:coverpoint addr iff(rst==1)
                                    {bins b1={10,20,30};
                                    bins b2[]={[100:200]};
                                    bins b3[]={50,60,[70:100]};
                                    }
            data:coverpoint d_in{bins d1={[1:50]};
                                  bins d2[]={[200:255]};
                                  bins d3[]={[100:199],[60:90]};
                                  }
                             
                                     
            ctrl1:coverpoint wen {bins c1={0,1};}
            ctrl2:coverpoint rden {bins c2[]={0,1};}

            //cross1:cross addr,d_in;
           /* cross2:cross address,data{bins c1=binsof (address.b2);
                                      bins c2=binsof(data.d2)&&binsof(address.b3);
                                      bins c3=binsof(data.d2)||binsof(address.b3);
                                      bins c4=binsof(data)intersect{[120:240]};
                                        } */
      endgroup

    sram s1,s2;
      initial begin
        s1 = new;
        s2 = new;
        rst = 1;
            repeat(15)begin
                std::randomize(d_in,addr,wen,rden);
                s1.sample();
                $display("addr=%d|data=%d|wen=%d|rden=%d",addr,d_in,wen,rden); 
            end

        for(int i=0;i<10;i++)
        begin
         std::randomize(addr,d_in,wen,rden);
         s2.sample();
         $display("addr2=%d,data2=%d,wen2=%d,rden2=%d",addr,d_in,wen,rden);
         if(i==5)
          s2.stop;
        end
     //  $display("coverage=%d",sram::get_coverage);
       $display("coverag=%0d,covered=%0d,total=%0d",s1.get_coverage(covered,total),covered,total);
        
      end
endmodule
