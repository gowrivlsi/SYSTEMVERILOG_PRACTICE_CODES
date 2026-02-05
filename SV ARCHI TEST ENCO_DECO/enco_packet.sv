class enco_pack;
    rand bit[3:0]i;
         bit[1:0]y;

         bit [3:0]d_o;//Deco Output

         //bit[3:0]m;

        extern function void print(string n = "");

        //extern function void post_randomize();

        extern constraint c1;
endclass

function void enco_pack::print(string n = "");
        $display("NAME: %0s",n);
        $display("ENCO -> INPUT : i = %b | OUTPUT : y =%b",i,y);
        $display("DECO -> OUTPUT : d_o =%b",d_o);
endfunction

/*
function void enco_pack::post_randomize();
        m[0] = i[0];
        m[1] = i[1];
        m[2] = i[2];
        m[3] = i[3];
endfunction 
*/

constraint enco_pack::c1{i>0;(i &(i - 1))==0;}
