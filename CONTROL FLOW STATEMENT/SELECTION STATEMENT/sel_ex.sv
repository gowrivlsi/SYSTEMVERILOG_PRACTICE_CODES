//====================================================SELECTION STATEMENT========================================
module sel_ex;
    int a,b;
    
    initial begin : b1
    //disable b1;
    a=25;b=60;

    //PRIORITY IF
    priority if(a > 40)
            $display("A is Greater=%0d",a);
             else if(a > b)
            $display("A is Greater Than B=%0d",a);

            else
            $display("NONE",a);

    //UNIQUE IF
    unique if(a < b)
            $display("A is Grater=%0d",a);
            else if(a < 30)
                $display("A is Lessthan=%0d",a);

               //else
                //$display("NONE",a);
            
    unique0 if(a < b)
            $display("A is Grater=%0d",a);
            else if(a < 30)
                $display("A is Lessthan=%0d",a);

               else
                $display("NONE",a);


end

       initial begin : b2
      // disable b2;
       shortint a,b;
       a=10;b=12;
            priority case({a,b})
            32'h000a000c : $display("Condition True");
            32'h000c000a : $display("Condition False");
            endcase
       end
endmodule
