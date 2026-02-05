//===================================================CLASS AS A DATA TYPES==================================================
module class_ex;
    
    class movie;
        //properties
        string name;
        shortint minit;
        string genere;
    endclass
    
    movie m,g;//declaration of handle/pointer

    initial begin
        g=new;//allocating memory

        g.name="SALAR";
        g.minit=167;
        g.genere="Action-Triller Drama";

        $display("Movie G=%p",g);
        //g=null;
        //$display("Movie=%p",g);
        m=g;
        $display("Movie M=%p",m);

        m.name="KGF";
         $display("Movie M=%p",m);
         $display("Movie G=%p",g);
    end
    
endmodule
