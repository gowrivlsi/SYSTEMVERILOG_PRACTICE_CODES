//==========================================PCIE FRAME================================================
module pcie();
    byte start;
    shortint seq;
    longint  header;
    logic[55:0]payload;
    int ecrc;
    int lcrc;
    byte End;

    initial begin
        $display("=====================PCIE FRAME==============================");
        $display("START     BYTE     VALUE = %0d SIZE=%0d",start,$bits(start));
        $display("SEQUENCE  SHORTINT VALUE = %0d SIZE=%0d",seq,$bits(seq));
        $display("HEADER    LONGINT  VALUE = %0d SIZE=%0d",header,$bits(header));
        $display("PAYLOAD   LOGIC    VALUE = %0d SIZE=%0d",payload,$bits(payload));
        $display("ECRC      INT      VALUE = %0d SIZE=%0d",ecrc,$bits(ecrc));
        $display("LCRC      INT      VALUE = %0d SIZE=%0d",lcrc,$bits(lcrc));
        $display("END       BYTE     VALUE = %0d SIZE=%0d",End,$bits(End));
    end
endmodule
