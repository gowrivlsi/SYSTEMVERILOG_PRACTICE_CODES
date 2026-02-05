//=============================================STRUCT EXAMPLE=================================
module struct_ex;
    typedef struct{
                    string name;
                    string usn;
                    int year;
                   }student_info;

    student_info shashi,basu,yashu;

    initial begin
        shashi='{"Shashi","1AM21EC075",2004};
        basu='{"Basavaraja p m","1AM21EC016",2002};
        yashu='{"Yashwanth","1AM21EC102",2003};

        $display("Info Of Shashi=%p",shashi);
        $display("Info Of Basuvaraja=%p",basu);
        $display("Info Of Yashwanth=%p",yashu);
    end
endmodule
