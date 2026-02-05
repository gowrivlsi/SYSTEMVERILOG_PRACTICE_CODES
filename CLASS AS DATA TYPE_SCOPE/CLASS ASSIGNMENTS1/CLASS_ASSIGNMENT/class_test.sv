class test;
   //static int a=0,b=0,c=0;//TO Remember the previous stored number and continue to next each time by calling function(values belog to the class itself, NOT the object)
   //No memory for a,b,c until we create memory by "new();" the memory is null[variable belongs to object But object must be created using new.]
    function void dis1(string name="Class_Test");
        int a,b,c;
        $display("Name=%0d",name);
       
        a++;
        b++;
        c++;
        $display("a=%0d b=%0d c=%0d",a,b,c); 
    endfunction
endclass


module test1;
    test t1;

    initial begin
        repeat(4) begin
        t1.dis1();
        end
    end
endmodule
