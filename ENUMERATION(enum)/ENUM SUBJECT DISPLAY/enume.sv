//==================================================ENUMERATION SUBJECT DISPLAY===========================================
module enume();
    int i;

    typedef enum {English=85,Maths=75,Science=65,Kannada=95,Social=80}subject;
    subject Shashi,Basu,Yashwanth,SaiMeghana;

    initial begin
        $display("===================================SHASHI MARKS==================================");
        Shashi=English;
            for(i=0;i<Shashi.num;i++)
            begin
                $display("Subject=%0s|Marks=%0d",Shashi.next(i),Shashi.next(i));
                #10;
            end
        $display("===================================Basu MARKS==================================");
        Basu=English;
            for(i=0;i<Basu.num;i++)
            begin
                $display("Subject=%0s|Marks=%0d",Basu.next(i),Basu.next(i));
                #10;
            end
        $display("===================================YASHWANTH MARKS==================================");
        Yashwanth=English;
            for(i=0;i<Yashwanth.num;i++)
            begin
                $display("Subject=%0s|Marks=%0d",Yashwanth.next(i),Yashwanth.next(i));
                #10;
            end
        $display("===================================SAI MEGHANA MARKS==================================");
        SaiMeghana=English;
            for(i=0;i<SaiMeghana.num;i++)
            begin
                $display("Subject=%0s|Marks=%0d",SaiMeghana.next(i),SaiMeghana.next(i));
                #10;
            end

    end
endmodule
