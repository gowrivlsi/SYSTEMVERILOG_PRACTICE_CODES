//==================================================DYNAMIC ARRAY WITH ODD EVEN INDEX===============================================
module d_array;
    int d[];

    initial begin
        d=new[10];
        $display("Dnamic Array Contents=%p",d);

        for(int i=0;i<10;i++)
            begin
                if(i%2==0) 
                    begin
                    d[i]=(((i/2)*2)+1);
                    $display("Odd Index Even No of D_array[%0d]=%0d",i,d[i]);
                    end
                else begin
                        d[i]=((i+1)/2)*2;
                        $display("Even INdex Odd No Of D_array[%0d]=%0d",i,d[i]);
                    end
            end
            $display("The Dynamic Array of Contents=%p",d);
    end
endmodule
