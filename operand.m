function [ flagop ] = operand( op )

   flagop=0;
   if(op==1 || op==2 || op==3 || op==4 || op==5 || op==6 || op==7 || op==8 || op==9 || op==1000)
       flagop=1;
   else
       flagop=0;
   end
     

end

