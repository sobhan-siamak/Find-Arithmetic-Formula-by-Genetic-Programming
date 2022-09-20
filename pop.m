function [ exp,stackarry,sp ] = pop( stackarry,sp )

     

    if(sp>1 && stackarry(sp)~=-100000)        
        exp=stackarry(sp);
        sp=sp-1;        
    end



end

