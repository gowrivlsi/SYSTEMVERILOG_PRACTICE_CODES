//===================================================JUMPING STATEMENT===========================================
module jump_ex;
    int a[15];

    int i=0;

    initial begin : b1
    disable b1;
        while(i<15) begin 
             if(i==10)
                break;//Break after i=10
                 a[i]=i*3;  
             $display("A[%0d]=%0d",i,a[i]); 
                i++;      
        end
        $display("A of Contents=%p",a);
    end

        initial begin : b2
        //disable b2;
        while(i<15) begin 
             if(i==5) begin
                i++;
                continue;//Continue after i=5
                end
                 a[i]=i*3;  
             $display("A[%0d]=%0d",i,a[i]); 
                i++;      
        end
        $display("A of Contents=%p",a);
    end

endmodule
