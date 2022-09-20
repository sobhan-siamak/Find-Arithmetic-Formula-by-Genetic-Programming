function [ postfixvalue ] = PostfixEval( postfix,x)

%%%%% attention that you have to convert 1000 to x
   m=size(postfix,2);
   epsilon=0.0001;
   stackarry=zeros(1,m+1);
   stacklen=m+1;
   sp=1;
   stackarry(1)=-100000;
   
   for i=1:m
       symb=postfix(i);
       if(operand(symb))
           [ stackarry,sp,top ]=push( stackarry,sp,symb,stacklen);
       else
           [ op2,stackarry,sp ]=pop( stackarry,sp );
           [ op1,stackarry,sp ]=pop( stackarry,sp );
           if(op1==1000)
               op1=x;
           end
           if(op2==1000)
               op2=x;
           end
           switch symb
               case 100
                   value=op1+op2;
               case 200
                   value=op1-op2;
               case 300
                   value=op1*op2;
               case 400
                   if(op2~=0)
                       value=op1/op2;
                   else
                       value=op1/(op2+epsilon);
                   end
           end
           
           [ stackarry,sp,top ]=push( stackarry,sp,value,stacklen);
           
       end
       
   end%%%%% end of for
   
      
   
   [ FinalValue,stackarry,sp ]=pop( stackarry,sp );
   
   postfixvalue=FinalValue;
   
   
   
   
   
   
   
   
   
   
   
%    for i=1:m
%        if(postfix(i)==1000)
%            postfix(i)=x;
%        end       
%    end
    
   
   
   
   


end

