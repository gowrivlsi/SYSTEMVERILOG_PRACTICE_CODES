//==============================UART FRAME==========================
module uart();
    bit start;
    byte data;
    bit parity;
    bit stop;

    initial begin
        $display("=======================UART FRAME====================");
        $display("START  BIT         => VALUE=%0d SIZE=%0d",start,$bits(start));
        $display("DATA   BYTE        => VALUE=%0d SIZE=%0d",data,$bits(data));
        $display("PARITY BIT         => VALUE=%0d SIZE=%0d",parity,$bits(parity));
        $display("STOP   BIT         => VALUE=%0d SIZE=%0d",stop,$bits(stop));
    end
endmodule
