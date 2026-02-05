module sram;
     bit [4:0] addr;
    bit [7:0] d_in;
    bit wren,rden;

    //Types Of Trasition Bin
    covergroup cov;
                //2]Sequence value transition
                addrres: coverpoint addr{bins b1=(4 => 13 => 1 => 13);
                                         bins b2=(18=>8=>13=>0=>22);
                                         }
                datain: coverpoint d_in{bins b1=(32[*3]);//4]consicutive *4 = it will repeat continuously
                                                                   //5]non consicutive =4 it will repeat conitupus but not in order
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
