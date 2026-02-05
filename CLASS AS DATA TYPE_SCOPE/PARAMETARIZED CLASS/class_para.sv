/*=========================================PARAMETARIZED CLASS========================================================
                                           1] Parametarized Class : For values
                                           2] Type Parmetarized Class : For data types using "type" keyword
                                           */

class pack #(parameter type M = int, G = shortint);
//#(parameter w=8,d=16);
    M a;
    G b;
   // bit [w-1:0]a;
    //bit [d-1:0]b;

        function void dis(string n="");
        $display("Name=%0s",n);
        $display("a=%d",$bits(a));
        $display("b=%d",$bits(b));
        endfunction
endclass

module top;
       // pack #(bit,byte)p1;//Over Ride by Order For "type"
        pack #(.G(byte),.M(longint))p1;
       //pack #(16,32)p1;// over ride by order
       //pack #(.w(32),.d(64))p1;//over ride by name
       initial begin
            p1=new;
           p1.dis("Parametarized Class For values");
       end
endmodule
