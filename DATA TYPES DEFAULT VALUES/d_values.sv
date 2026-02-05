
// SV practice file

module d_values();
    reg a;
    wire b;
    integer c;
    real d;
    time e;
    realtime f;

    bit g;
    byte h;
    int i;
    longint j;
    shortint k;
    shortreal l;
    logic m;

    initial begin
        $display("=============================FOR VERILOG========================");
        $display(" reg      A => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",a,$bits(a));
        $display(" wire     B => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",b,$bits(b));
        $display(" integre  C => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",c,$bits(c));
        $display(" real     D => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",d,$bits(d));
        $display(" time     E => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",e,$bits(e));
        $display(" realtime F => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",f,$bits(f));
        $display("=============================FOR SYSTEM VERILOG=================");
        $display(" bit      G => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",g,$bits(g));
        $display(" byte     H => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",h,$bits(h));
        $display(" int      I => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",i,$bits(i));
        $display(" longint  J => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",j,$bits(j));
        $display(" shortint K => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",k,$bits(k));
        $display(" shortrealL => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",l,$bits(l));
        $display(" logic    M => DEFAULT VALUE = %0b DEFAULT SIZE = %0d",m,$bits(m));
    end
endmodule
