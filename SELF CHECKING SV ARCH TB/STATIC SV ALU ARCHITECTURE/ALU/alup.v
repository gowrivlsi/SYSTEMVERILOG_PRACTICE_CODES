//=======================================================ALU PARAMITARISED DESIGN CODE==============================================
module alup #(parameter w=8) (
                                input [w-1:0]a,b,
                                input [$clog2(w):0]opc,
                                output reg [w-1:0]y
   
                            );
    always @(*) begin

    case(opc)
        0 : begin y = a +  b; $display("a=%d b =%d ADDITHION 0 = %d",a,b,y);end
        1 : begin y = a -  b; $display("a =%d b= %d SUB 1 = %d",a,b,y);end
        2 : begin y = a *  b; $display("a=%d b=%d MUL 2 = %d",a,b,y);end
        3 : y = a /  b;
        4 : y = a %  b;
        5 : y = a ** b;
        6 : y = a |  b;
        7 : y = a &  b;
        8 : y = a ^  b;
        default : y = ~(a & b);

    endcase
    end

endmodule
