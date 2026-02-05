//===============================================ARRAY MANUPULATION METHOD=======================================
module array_manup;
    //For queues [1.Array Element Locator Method]
    int q[$];
    int m[$];

    //For Associate [2.Array Index Locator Method 3.Array Iterator Index Method]
    int a[int];
    int g[$];

    //For Dynamic Array [4.Array Sorting Method]
    byte d[];
    //byte r[$];

    //Queues Array
    initial begin : Block_1
    disable Block_1;
        $display("===================Array Manupulation Methods======================");
        q='{45,25,47,25,34,57,87,98,99};
        $display("Queues Contents=%p",q);
        
        //1.Array Element Locator Method
        $display("=========================Array Element Locator Method==================================");
        m=q.find with(item==98);
        $display("Finding The 98=%p",m);

        m=q.find_first(x) with(x >57);
        $display("Finding > 57 =%p",m);

        m=q.find_last(c) with(c < 34);
        $display("Finding < 34 =%p",m);

        $display("Minium of queues =%p",q.min);
        $display("Maximum of queues =%p",q.max);
        m=q.unique();
        $display("Unique of queues =%p",m);
    end

    //Associative Array
    initial begin : Block_2
    disable Block_2;
        $display("===================Array Manupulation Methods======================");
        a='{0:45,1:25,2:47,3:25,4:34,5:57,6:87,7:98,8:99,9:34};
        $display("Associative Contents=%p",a);

        //2.Array Index Locator Method
        $display("=========================Array Index Locator Method==================================");
        g=a.find_index with(item==98);
        $display("Finding The 98 index=%p",g);

        g=a.find_first_index(x) with(x >57);
        $display("Finding > 57 index =%p",g);

        g=a.find_last_index(c) with(c < 34);
        $display("Finding < 34 index =%p",g);

        g=a.unique_index();
        $display("Unique of queues =%p",g);

        //3.Array Iterator Index Locator Method
        $display("=========================Array Iterator Index Locator Method==================================");
        a='{45:45,1:25,2:47,3:25,34:34,5:57,87:87,7:98,8:99,9:34};
        $display("Associative Contents=%p",a);

        g=a.find(d) with(d == d.index);//{45,34,87}
        $display("Finding The iterator index=%p",g);
        g=a.find_index(d) with(d > d.index);
        $display("Finding The iterator index=%p",g);
    end
    //Dynamic Array
    initial begin : Block_3
       //4.Array Ordering Method
        $display("=========================Array Ordering Locator Method==================================");
        d=new[10];
        d='{12,18,15,24,56,22,35,82,78,24};
        $display("Dynamic Contents =%p",d);
        d.sort();
        $display("Sorting=%p",d);

        d.rsort();
        $display(" Reverse Sorting=%p",d);

        d.reverse();
        $display("Reverse Dynamic Contents=%p",d);

        d.shuffle();
        $display("Shaffuleing Dynamic Contents=%p",d);
        
        //5.Array Reduction Method
        $display("=========================Array Reduction Method==================================");
        d=new[5];
        d='{1,2,3,4,5};
 $display("Dynamic Contents =%p",d);
       
        $display("OR IN D_Array=%p",d.or);
        $display("AND IN D_Array=%p",d.and);
        $display("XOR IN D_Array=%p",d.xor);
        $display("SUM IN D_Array=%p",d.sum);
        $display("PRODUCT IN D_Array=%p",d.product);
    end
endmodule
