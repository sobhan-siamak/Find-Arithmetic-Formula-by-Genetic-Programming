function [ postcell ] = Postfix2( generationcell , population,Dmax )


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
            if(operand(infix(j)))
                arry(ind)=infix(j);
                ind=ind+1;
            else
                while(~emtstack(stackarry,sp) && priority(stackarry(sp),infix(j)))
                    [ exp,stackarry,sp ] = pop( stackarry,sp );
                    arry(ind)=exp;
                    ind=ind+1;
                end
                [ stackarry,sp,top ]=push(stackarry,sp,infix(j),stacklen);
            end            
            
        end
        while(~emtstack(stackarry,sp))
            [ exp,stackarry,sp ] = pop( stackarry,sp );
            arry(ind)=exp;
            ind=ind+1;
        end
      postcell{i}=arry;
    
end





end

