

       %%%%%@copy sobhan siamak %%%%%%
       
clc;
clear;
close all;

%% init Definition

FSet=char('+','-','*','/'); %%%%%Function Set
FSetFinal=[100,200,300,400];%%%%% 100='+'  200='-'  300='*'  400='/' 
TSet=char('1','x','2','x','3','x','4','x','5','x','6','x','7','x','8','x','9','x');  %%%%%Terminal Set
TSetFinal=[1,1000,2,1000,3,1000,4,1000,5,1000,6,1000,7,1000,8,1000,9,1000];%%%%%%%% 1000='x'
population=1000;
pc=0.87;
pm=0.1;
generationcount=150;
%% Enter Your Expression 
exp='x*x+2*x+1';  %%%%%expression

p=size((exp),2);
count=0;
for i=1:p
    if(exp(i)=='*'||exp(i)=='/'||exp(i)=='+'||exp(i)=='-')
        count=count+1;
    end
end
Dmax=count-1;

interval=[-10:10];
% Ytrue=zeros(21,1);
Ytrue=zeros(size(interval,2),1);

[m,n]=size(Ytrue);
for i=1:m
    Ytrue(i)=Func(interval(i));
end

init=zeros(population,(2.^(Dmax+1)-1));

generation=initgeneration(population,Dmax,FSetFinal,TSetFinal,init);


%% convert array with some zeros  ellement to cell array without zeros ellement
[m1,n1]=size(generation);  
generationcell=cell(population,1);

for i=1:m1
    for j=1:n1
        if(generation(i,j)~=0)
            generationcell{i}(j)=generation(i,j);
        end
        
    end
end

%postfix=Postfix2( generationcell , population,Dmax);
% c=Prefix( generationcell,population );
% 
 Fitness=FitnessEvaluation(generationcell,Ytrue,interval,population,Dmax);




