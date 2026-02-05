module sram_read_assert(sram_intf I);
    
    //1] if(!rst) dout=0
        property rst_read;
            @(posedge I.clk)
                !I.rst |-> (I.d_out == 0);
        endproperty

   //2]wr_en = 0
        property wr_en_read;
            @(posedge I.clk)
            I.rst && !I.wren;
        endproperty

  /*
  //3]While reading addr should be stable
        property read_addr;
            @(posedge I.clk)
            (!I.wren) |-> $stable(I.addr);
        endproperty
        

   //4]SRAM output stable in negedge clk
        property read_out;
            @(negedge I.clk)
                $stable(I.d_out);
        endproperty
        */

   //5]output should not X
        property read_x;
            @(posedge I.clk)
            (I.rst && !I.wren) |-> (!$isunknown(I.d_out));
        endproperty


    assert property(rst_read)
        else
            $error("Fail");
    assert property(wr_en_read)
        else
            $error("Fail");
   // assert property(read_addr)
     //   else
       //     $error("Fail");
    //assert property(read_out)
      //  else
       //     $error("Fail");
    assert property(read_x)
        else
            $error("Fail");

endmodule
