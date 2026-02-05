//=======================================DESIGN OF INTERFACE===========================
interface comp4b_intf();
    logic [3:0]a,b;
    logic g,e,l;

    //MODPORTS DECLARATIONS

    modport DUT (input a,b,output g,e,l);
    modport TB (input g,e,l,output a,b);
endinterface
