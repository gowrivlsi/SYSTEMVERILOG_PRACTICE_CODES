//================================================STRUCT SUBJECT NAMES=========================================
module struct_ex;
    typedef struct{int kannada,english,hindi,maths,science,social;}marks;

    marks shashi,basu,yasha,sai;

    initial begin
        shashi='{100,90,85,80,75,88};
        basu='{97,98,92,83,77,78};
        yasha='{95,88,74,76,29,22};
        sai='{95,56,47,98,91,65};

        $display("SHASHI MARKS=%p",shashi);
        $display("BASA MARKS=%p",basu);
        $display("YASHA MARKS=%p",yasha);
        $display("SAI MARKS=%p",sai);
    end
endmodule
