module sram;
    bit [4:0] addr;
    bit [7:0] d_in;
    bit wren,rden;


        //Declaration of covergroup for automatic or Implicit 
        /*
        covergroup cov;
            //lable : coverpoint <variablr>
                addrres: coverpoint addr;
                datain: coverpoint d_in;
                wr_en: coverpoint  wren;
                rd_en:  coverpoint  rden;
        endgroup
        */

        //Declaration of coverage group of explicit
        covergroup cov;
                option.auto_bin_max = 16;
                addrres: coverpoint addr{bins b1={[10:30],35};
                                         bins b2[3]={1,3,5,6,7};
                                        }
                datain: coverpoint d_in{bins b1[5]={[50:100],65};
                                        bins b2[]={[200:$]};
                                        }
                wr_en: coverpoint  wren{bins b1={0};
                                        bins b2={1};
                                        }
                rd_en:  coverpoint  rden{bins b1[2]={0,1};}
        endgroup

        cov c1;
        initial begin
            c1 = new;
            
            repeat(10) begin
                addr =$random;
                //$display("addr =%0d",addr);
                d_in = $random;
                $display("Addr =%0d | data =%0d",addr,d_in);
                wren =$random;
                //$display("wren =%0d",wren);
                rden = $random;
                //$display("rden =%0d",rden);
                c1.sample();
            end
        end
endmodule
