//=================================================INTERDACE CODE===================================
interface intf();
    logic[3:0]y;
    logic[1:0]i;

    //DECODER OUTPUT
    logic[3:0]d_o;
    
  modport e(input y,output i);
  modport d(output d_o);
   

endinterface
