class sram;
   rand bit [4:0] addr;
    rand bit [7:0] d_in;
    rand bit wren,rden;


        //Declaration of covergroup for automatic or Implicit 
        
        covergroup cov;
            //lable : coverpoint <variablr>
                option.auto_bin_max = 16;
                addrres: coverpoint addr;
                datain: coverpoint d_in;
                wr_en: coverpoint  wren;
                rd_en:  coverpoint  rden;
        endgroup

        function new();
            cov = new;
        endfunction

endclass

module top;
    sram s1;
    
       // s1 = new;

    initial begin
        s1 = new;
       repeat(10) begin
        assert(s1.randomize());
        s1.cov.sample();
        $display("addr= %0d | D_in =%0d",s1.addr,s1.d_in);
    end
    end
        
endmodule

