function [ Fitness ] = FitnessEvaluation( generationcell,Ytrue,interval,population,Dmax )



%%%%% 'x' is 1000 , '+' is 100 ,'-' is 200 , '*' is 300 , '/' is 400 

Fitness=zeros(population,1);%%% Fitness is the inverse of MSE Error
Msefinal=zeros(population,1);

epsilon=0.00001;
%%%%%convert infix to prefix
postcell=Postfix2(generationcell,population,Dmax);


Ytilda=zeros(population,size(interval,2));
m=size(interval,2);
%%%%%%calculate result of exp
for i=1:population
    postf=postcell{i};
    for j=1:m
        Ytilda(i,j)=PostfixEval( postf,interval(j));
    end
end






% Msearr=zeros(1000,size(interval,2));
% Msearr=PrefixResult(precell,population,interval);
% n=(interval(end)-interval(1))+1;%%%%% n=21 in this interval
n=size(interval,2);
for i=1:population
%     Msefinal(i)=sum((Ytrue-Ytilda(i,:)').^2)/n;
    Msefinal(i)=sum((Ytrue-Ytilda(i,:)').^2)/1000;

end                                                  



% for i=1:population
%      Fitness(i)=-Msefinal(i);
% end

for i=1:population
    if(Msefinal(i)~=0)
        Fitness(i)=(1/Msefinal(i));
    end
    
    if(Msefinal(i)==0)
        Fitness(i)=(1/epsilon);
    end
    
end












% [m,n]=size(generation);  
% generationcell=cell(population,1);
% 
% 
% for i=1:m
%     for j=1:n
%         if(generation(i,j)~=0)
%             generationcell{i}(j)=generation(i,j);
%         end
%         
%     end
% end
% 

end

