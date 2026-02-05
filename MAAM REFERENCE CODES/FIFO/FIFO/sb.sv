class sb;

packet pdut,pbfm;
mailbox#(packet) mdut,mbfm;
event e4;

function new(mailbox#(packet)mdut,mbfm,event e4);
  this.mdut=mdut;
  this.mbfm=mbfm;
  this.e4=e4;
endfunction

task sb;
pdut=new;
pbfm=new;

forever
  begin
   mdut.get(pdut);
   mbfm.get(pbfm);

//   @(pdut.dout or pbfm.dout)
   // @(e4)
   if(pdut.dout==pbfm.dout)
        begin
            pbfm.print("BFM ----OUTPUT");
            pdut.print("DUT ----OUTPUT");
            $display("''''''''''''''''''''OUTPUT IS VALID'''''''''''''''''''''''''''''");
         end
     else
          begin
            pbfm.print("BFM OUTPUT");
            pdut.print("DUT OUTPUT");
            $display("''''''''''''''''''''OUTPUT IS NOT VALID'''''''''''''''''''''''''''''");
         end


  end

endtask

endclass
