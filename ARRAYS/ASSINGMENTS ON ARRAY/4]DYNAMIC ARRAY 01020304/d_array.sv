//===================================================DYNAMIC ARRAY FILLING WITH 01020304050607=================================================
module d_array;
    int d[];

    initial begin
        d=new[10];

        $display("The Dynamic Array =%p",d);

        for(int i=0;i <10; i++) 
            begin
                if(i%2==0)//if even index fill wit 0
                    d[i]=0;
                else
                    d[i]=((i+1)/2)+1;//odd index fill values 2,3,4,
                    //$display("The D Array of [%0d]=%d",i,d[i]);
            end

            $display("The D array content=%p",d);
    end
endmodule
