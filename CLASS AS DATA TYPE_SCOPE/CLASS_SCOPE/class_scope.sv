class encoder;
//legal to write in class scope
    //1]Properties 
      logic[3:0]i;
      logic[1:0]y;
    
    //2]Methods or Subroutines
      function void dis(string name="Encoder",int j);
            $display("Packet name=%s handle=%0d",name,j);
            $display("i = %0d",i);
            $display("y = %0d",y);
      endfunction

    //3]custom new constructor
        function new(bit[3:0]i,bit[1:0]y);
            this.i=i;//if name of variable different then no need to use "this" keyword
            this.y=y;
            
        endfunction
    //4]call_backs
    //5]contraints
endclass


module test;

//1]creating handle or pointer
    //encoder e1;//single handle creation
    encoder e[4]; //multiple handle creation

    initial begin
        foreach(e[i]) begin
            e[i] = new($urandom_range(10,15),$random);
            e[i].dis(,i);
        end
        /*
//2]Creating object to allocate memory by "new()" construct
        e[1] = new;
//3]Access the members of Class by handle name like e1.i and so on............
        e[1].i = 2;
        e[1].y = 1;
        e[1].dis(); */       
        end
endmodule
