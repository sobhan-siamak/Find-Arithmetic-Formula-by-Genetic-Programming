function [ precell ] = Prefix( generationcell,population )

  
%%%%% 'x' is 1000 , '+' is 100 , '-' is 200 , '*' is 300 , '/' is 400 


  precell=cell(population,1);
%   stackarr=zeros(100,1);%%%%%  stack
%   sp=1;%%%%% stack pointer
  
  
  %% step1 is Reverse expression
  for i=1:population
      generationcell{i}=fliplr(generationcell{i});
  end
%% step2
  for i=1:population  
      m=size(generationcell{i},2);
      arry=zeros(1,m);
      stackarr=zeros(1,m);%%%%%  stack
      sp=1;%%%%% stack pointer
      ind=1;
         for j=1:m
          
             if(generationcell{i}(j)==1000 ||generationcell{i}(j)==1 || generationcell{i}(j)==2 || generationcell{i}(j)==3 || generationcell{i}(j)==4 || generationcell{i}(j)==5 || generationcell{i}(j)==6 || generationcell{i}(j)==7 || generationcell{i}(j)==8 || generationcell{i}(j)==9)
                 arry(ind)=generationcell{i}(j);
                 ind=ind+1;
             end
             if(generationcell{i}(j)==100 ||generationcell{i}(j)==200 ||generationcell{i}(j)==300 ||generationcell{i}(j)==400)
%                  sp=sp+1;
                 if(stackarr(sp)==0)
                     stackarr(sp)=generationcell{i}(j);
                 end
                 if(generationcell{i}(j)==300 || generationcell{i}(j)==400)
                     sp=sp+1;
                     stackarr(sp)=generationcell{i}(j);
                 end
                 if((generationcell{i}(j)==100 || generationcell{i}(j)==200) && (stackarr(sp)==100 || stackarr(sp)==200))
                     sp=sp+1;
                     stackarr(sp)=generationcell{i}(j);
                 end
                 if((generationcell{i}(j)==100 || generationcell{i}(j)==200) && (stackarr(sp)==300 || stackarr(sp)==400))
%                      while((stackarr(sp)==300 || stackarr(sp)==400) && sp>0)
                       for k=sp:1
                           if((stackarr(sp)==300 || stackarr(sp)==400))
                                arry(ind)=stackarr(sp);
                                ind=ind+1;
                                sp=sp-1;
                           else
                               break;
                           end
%                      end
                       end
                     if(sp==0)
                         sp=sp+1;
                     end
                     stackarr(sp)=generationcell{i}(j);
                 end
                 
             end
             
         end
         %%%%% at the end should empty stack
        while(sp~=0 && sp>0)
           
             arry(ind)=stackarr(sp);
             ind=ind+1;
             sp=sp-1;
           
        end
        %% step3 Reverse again
         precell{i}=fliplr(arry);
  end
   
   for i=1:population
       if(precell{i}(1)==0)
           a=randi([1 4]);
           if(a==1)
               precell{i}(1)=100;
           end
           if(a==2)
               precell{i}(1)=200;
           end
           if(a==3)
               precell{i}(1)=300;
           end
           if(a==4)
               precell{i}(1)=400;
           end
       end
   end
  
  
end

