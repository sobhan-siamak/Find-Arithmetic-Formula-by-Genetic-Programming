function [ generation ] = initgeneration( population,Dmax,FSetFinal,TSetFinal,init )
   

[m,n]=size(init);

n1=(2^(Dmax+1)-1);
oddarray=[1:2:n1];
evenarray=[2:2:n1];

%% Full Method
%%%%%%  index of last element of array is n=(2.^(Dmax+1)-1))
%%%%%% the index of first leaf is floor(n/2)+1 or 2.^Dmax

%% Fulling array in Order
% for i=1:m
%     for j=1:n
%         if(j<(2^Dmax))
%             a=randi([1,size(FSetFinal,2)]);
%             init(i,j)=FSetFinal(a);
%         else
%             b=randi([1,size(TSetFinal,2)]);
%             init(i,j)=TSetFinal(b);
%         end
%         
%         
%     end
% end
%% Fulling array in this order that odd elements are leaf(Terminal Set) and even elements are Function set


%%%%% Full Method
for i=1:2:m
    for j=1:2:n
        
            a=randi([1,size(TSetFinal,2)]);
            init(i,j)=TSetFinal(a);
    end
    for j=2:2:n
            b=randi([1,size(FSetFinal,2)]);
            init(i,j)=FSetFinal(b);
    end   
        
    
end


%%%% Grow Method
   
for i=2:2:m
    
    k=randi([5 oddarray(end)]);
    for j=1:k
        if(ismember(j,oddarray)==1)%%%%%means index is odd and should select the terminal set
            a=randi([1,size(TSetFinal,2)]);
            init(i,j)=TSetFinal(a);
        else    
            b=randi([1,size(FSetFinal,2)]);
            init(i,j)=FSetFinal(b);
        end
    end   
        
    
end

  for i=1:m
      for j=2:n
          if((init(i,j)==0) &&(init(i,j-1)==100)||(init(i,j-1)==200)||(init(i,j-1)==300)||(init(i,j-1)==400) )
              a=randi([1 10]);
              if(a==10)
                  init(i,j)=1000;
              else
                  init(i,j)=a;
              end
          end
      end
  end

generation=init;


end

