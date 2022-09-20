function [ stackarry,sp,top ] = push( stackarry,sp,exp,stacklen)
     

    if(sp<=stacklen+1)
        sp=sp+1;
        stackarry(sp)=exp;
    else
        disp('OverFlow Occured');
    end
   top= stackarry(sp);
end

