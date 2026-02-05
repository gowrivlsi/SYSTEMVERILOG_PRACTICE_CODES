//======================================================STRINGS EXAMPLES========================================
module strings_ex;
    
    string str1,str2,str3,str4,str5,str6,str7,str8;
    int A,B,C;

    initial begin : Block_1
    disable Block_1;
        str1="GOWRISH";
        //BUILT IN METHODS
            $display("The Length Of String =%0d",str1.len);//IT GIVE TOTAL NUMBER OF STRINGS
            str1.putc(2,"O");
            $display("Putting O in place of W =%s",str1);
            $display("Getting H from Index 6=%s",str1.getc(6));
            $display("Lowercase of String =%s",str1.tolower);
        str2="meghana";
            $display("Uppercase of the string m to M=%s",str2.toupper);
            $display("Uppercase of the string=%s",str2.toupper);
        str3=str1.tolower;
            $display("Comparing str2 and str3 =%d",str3.compare(str2));
            $display("Comparing str2 and str3 =%d",str3.icompare(str2));
        str4="GOWRISH BALEGAR SINDHANUR";
            $display("Printing Gowrish Balegar=%0s",str4.tolower.substr(0,14));
            $display("Printing Gowrish Balegar=%0s",str4.substr(0,7).toupper);

            
    end
        //String Convertions
        
        initial begin : Block_2
        disable Block_2;
            str5="0123456ABCDEF.123";
            $display("========================STRING CONVERTIONS=================================");
            $display("Converting String To Integer = %0d",str5.atoi());
            $display("Converting String To Hexa = %h",str5.atohex());
            $display("Converting String To Binary = %b",str5.atobin());
            $display("Converting String To Octal = %o",str5.atooct());
            $display("Converting String To Real = %0d",str5.atoreal());
        end

        //VICE VERSA

        initial begin
            A=234;
            str6.itoa(A);
          $display("Converting Integer To String = %s",str6);
            B=16'hAbc8;
            str6.hextoa(B);
          $display("Converting Hexdecimal To String = %s",str6);
            C=18'o2342;
            str7.octtoa(C);
          $display("Converting Octal To String = %s",str7);
            A=15.24;
            str7.realtoa(A);
           $display("Converting Real To String = %s",str7);
           B=9'b1011_01011;
           str7.bintoa(B);
            $display("Converting Binary To String = %s",str7);

        end
endmodule
