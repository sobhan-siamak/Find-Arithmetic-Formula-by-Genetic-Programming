function [ postcell ] = Postfix( generationcell , population,Dmax)

%%%%% post cell means postorder of generation cell
postcell=cell(population,1);
%postcell=generationcell;
stacklen=2.^(Dmax+1)-1;%%%%%% len in this example is 15
stackarry=zeros(1,stacklen+1);
stackarry(1)=-100000;%%%%% -100000 means bottom of stack 
sp=1;
for i=1:population
    infix=generationcell{i};
    m=size(infix,2);
    stackarry=zeros(1,stacklen+1);
    stackarry(1)=-100000;%%%%% -100000 means bottom of stack 
    sp=1;    
    arry=zeros(1,m);
    ind=1;
    for j=1:m
        if(infix(j)==1000 ||infix(j)==1 || infix(j)==2 || infix(j)==3 || infix(j)==4 || infix(j)==5 || infix(j)==6 || infix(j)==7 || infix(j)==8 || infix(j)==9)
            %postcell{i}(j)=infix(j);
            arry(ind)=infix(j);
            ind=ind+1;
        end
%         if(infix(j)==1000)
%             %postcell{i}(j)=infix(j);
%             arry(ind)=infix(j);
%             ind=ind+1;
%         end
        if(emtstack(stackarry,sp) && ((infix(j)==100)||(infix(j)==200)||(infix(j)==300)||(infix(j)==400)))
            [stackarry,sp,top]=push(stackarry,sp,infix(j),stacklen);            
        end
%         if(~emtstack(stackarry,sp) && ((infix(j)==100)||(infix(j)==200)||(infix(j)==300)||(infix(j)==400)) )
%                 priority(stackarry,sp,infix,postcell,i,j);             
%         end
       if(~emtstack(stackarry,sp))
           while(((infix(j)==100) || (infix(j)==200) )&& ((stackarry(sp)==100)||(stackarry(sp)==200)||(stackarry(sp)==300)||(stackarry(sp)==400)))
               [ exp,stackarry,sp ]=pop( stackarry,sp );
               %postcell{i}(j)=exp;
               arry(ind)=exp;
               ind=ind+1;

           end
           
           while(((infix(j)==300) && (stackarry(sp)==400))||((infix(j)==400) && (stackarry(sp)==300))||((infix(j)==300) && (stackarry(sp)==300))||((infix(j)==400) && (stackarry(sp)==400)))
               [ exp,stackarry,sp ]=pop( stackarry,sp );
               %postcell{i}(j)=exp;
               arry(ind)=exp;
               ind=ind+1;
           end
           while((stackarry(sp)==100 || stackarry(sp)==200)&&((infix(j)==300)||(infix(j)==400)))
               [stackarry,sp,top]=push(stackarry,sp,infix(j),stacklen);            
           end
       end
          
              
    end
    
     %%%%% at the end should empty stack
      
     while(~emtstack(stackarry,sp))
         [ exp,stackarry,sp ]=pop( stackarry,sp );
         %postcell{i}(j)=exp;
         arry(ind)=exp;
         ind=ind+1;
     end
     postcell{i}=arry;
     
end




    

end

