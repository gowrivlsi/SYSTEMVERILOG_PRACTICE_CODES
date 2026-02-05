//====================================================DYNAMIC ARRAY AVERAGE_DIVISION====================================
module fun_test;
    int d_array[];

    function int avg(input int d_array[]);
        int sum;
        sum=0;

        return (d_array.sum())/(d_array.size());

        /*
        for(int i=0;i<d_array.size();i++)
            sum+=d_array[i];//Adding each element

            if(d_array.size() > 0)
                return sum / d_array.size();//integer division
            else
                return 0;
                */

    endfunction

    initial begin
        d_array=new[5];
        d_array={10,20,30,40,50};#5
        $display("Array=%0p",d_array);
        $display("Average=%0d",avg(d_array));

        d_array=new[4];
        d_array={20,5,4,20};
        $display("Array=%0p",d_array);
        $display("Average=%0d",avg(d_array));
    end
endmodule
