//====================================================UNION DATA TYPES===================================
module union_ex;
    typedef union{int id;
                  int salary;
                  logic[4:0]exp;
          }employee;

          employee shashi,basu,yashu;

    initial begin
        shashi.id=15;
        shashi.salary=2000000;
        shashi.exp=10;

        $display("Details=%p",shashi);
    end
endmodule
