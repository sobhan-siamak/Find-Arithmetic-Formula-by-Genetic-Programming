function [ Msearr ] = PrefixResult( precell,population,interval )

   
%%%%% 'x' is 1000 , '+' is 100 , '-' is 200 , '*' is 300 , '/' is 400 
   Msearr=zeros(population,size(interval,2));
   ind=0;
   
   for i=1:population       
       precell{i}=fliplr(precell{i});       
   end
   
   for i=1:population  
      m=size(precell{i},2);
      %%%%%arry=zeros(1,m);
      stackarr=zeros(1,m);%%%%%  stack
      sp=0;%%%%% stack pointer
      %%%%ind=1;
        for x=interval(1):interval(end)
            for j=1:m
                if(precell{i}(j)==1000)
                    precell{i}(j)=x;
                end
                if(precell{i}(j)==x || precell{i}(j)==1 || precell{i}(j)==2 || precell{i}(j)==3 || precell{i}(j)==4 || precell{i}(j)==5 || precell{i}(j)==6 || precell{i}(j)==7 || precell{i}(j)==8 || precell{i}(j)==9)
                    sp=sp+1;
                    stackarr(sp)=precell{i}(j);
                    
                end
                if(precell{i}(j)==100 || precell{i}(j)==200 || precell{i}(j)==300 || precell{i}(j)==400 )
                    temp1=stackarr(sp);
                    stackarr(sp)=0;
                    sp=sp-1;
                    temp2=stackarr(sp);
                    stackarr(sp)=0;
                    sp=sp-1;
                    if(precell{i}(j)==100)
                        sp=sp+1;
                        stackarr(sp)=temp1+temp2;
                    end
                    if(precell{i}(j)==200)
                        sp=sp+1;
                        stackarr(sp)=temp1-temp2;
                    end
                    if(precell{i}(j)==300)
                        sp=sp+1;
                        stackarr(sp)=temp1*temp2;
                    end
                    if(precell{i}(j)==400 && temp2~=0)
                        sp=sp+1;
                        stackarr(sp)=temp1/temp2;
                    end
                    if(precell{i}(j)==400 && temp2==0)
                        sp=sp+1;
                        stackarr(sp)=temp1-temp2;
                    end
                    
                end
             
            end%%%%% end of j=m and length precell{i}
            ind=ind+1;
            Msearr(i,ind)=stackarr(sp);
            
        end %%%%%% end of th interval
         
   end
     

end

