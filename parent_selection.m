function [parents]=parent_selection(population,population_archive,pop_size,pre_fitness_log)

parents=zeros(2,81);

p1=ceil(rand(1)*pop_size);
p2=ceil(rand(1)*pop_size);
temp1=zeros(1,81);
temp2=zeros(1,81);
temp1=population(p1,:);
temp2=population(p2,:);

t1=dominates(p1,p2,pre_fitness_log);
t2=dominates(p2,p1,pre_fitness_log);
m=rand(1);
if(t1==1)
    parents(1,:)=population(p1,:);
elseif(t2==1)   
    parents(1,:)=population(p2,:);
 elseif(m>0.5)
     parents(1,:)=population(p2,:);
 elseif(m<=0.5)
     parents(1,:)=population(p1,:);
     
end

%parent 1 selected succesfully

size_archive=size(population_archive);
k=size_archive(1);
 
h=ceil(rand(1)*k);

parents(2,:)=population_archive(h,:);

%parent2 selected succefully
%disp('parents');
%disp(parents);



     
     
     
     
    
    
