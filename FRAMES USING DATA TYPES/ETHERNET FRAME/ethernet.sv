//=======================================ETHERNET FRAME=======================================
module ethernet ();
    bit[55:0] preamble;
    byte sfd;//Start Frame Delimiter
    bit [47:0]da;
    bit[47:0]sa;
    shortint length;
    bit[367:0]payload;
    int crc;

    initial begin
        $display("BIT       -> PREAMBLE VALUE=%0d SIZE=%0d",preamble,$bits(preamble));
        $display("BYTE      -> SFD      VALUE=%0d SIZE=%0d",sfd,$bits(sfd));
        $display("BIT       -> DA       VALUE=%0d SIZE=%0d",da,$bits(da));
        $display("BIT       -> SA       VALUE=%0d SIZE=%0d",sa,$bits(sa));
        $display("SHORTINT  -> LENGTH   VALUE=%0d SIZE=%0d",length,$bits(length));
        $display("BIT       -> PAYLOAD  VALUE=%0d SIZE=%0d",payload,$bits(payload));
        $display("INT       -> CRC      VALUE=%0d SIZE=%0d",crc,$bits(crc));
    end
endmodule
