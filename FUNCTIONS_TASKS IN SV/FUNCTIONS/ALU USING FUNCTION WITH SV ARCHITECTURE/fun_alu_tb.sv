//=======================================================TEST BENCH CODE=====================================
program fun_alu_tb(intf t);
    
    //FOR STIMULUS GENERATION
        initial begin
            t.sel=3'b000; 
            t.a=4;t.b=5;#5;
            $display("ADD=%0d a=%0d b=%0d",t.y,t.a,t.b);
            t.sel=3'b001; 
            t.a=9;t.b=4;#6;
            $display("SUB=%0d a=%0d b=%0d",t.y,t.a,t.b);
            t.sel=3'b010; 
            t.a=5;t.b=4;#5
            $display("MUL=%0d a=%0d b=%0d",t.y,t.a,t.b);
            t.sel=3'b011; 
            t.a=16;t.b=8;#5;
            $display("DIV=%0d a=%0d b=%0d",t.y,t.a,t.b);
            t.sel=3'b100;
            t.a=3;t.b=2;#6;
            $display("a=%0d b=%0d L_AND=%0b L_OR=%0b L_NOT=%0b B_AND=%0b B_OR=%0b B_XOR=%0b B_XNOR=%0b",t.a,t.b,t.A,t.B,t.C,t.D,t.G,t.R,t.T);
        end
endprogram
