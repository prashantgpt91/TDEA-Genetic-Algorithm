function [fitness_ranking]=assign_fitness(pre_fitness_log)

x=[];


x=size(pre_fitness_log);
pre_fitness_log_size=x(1);
%disp(pre_fitness_log_size);


rank=[];
rank=zeros(1,pre_fitness_log_size);
fitness_ranking=[];
fitness_ranking=zeros(pre_fitness_log_size,pre_fitness_log_size);
N=zeros(1,pre_fitness_log_size);
S=zeros(pre_fitness_log_size,pre_fitness_log_size);
for i=1:1:pre_fitness_log_size
    for j=1:1:pre_fitness_log_size
        if i~=j
            x=dominates(i,j,pre_fitness_log); % checks if i dominates j
            z=dominates(j,i,pre_fitness_log);
            if x==1 % i dominates j
                y=[];
                y=find(S(i,:)==0);
                S(i,y(1))=j;
            elseif z==1
                N(i)=N(i)+1;
            end
        end
    end
    if N(i)==0
        rank(i)=1;
        x=[];
        x=find(fitness_ranking(1,:)==0);
        fitness_ranking(1,x(1))=i;
    end
        
end
%{
    disp(fitness_ranking(1,:));
disp(' ');
disp(S);
disp(N);
%}
i=1;
temp=[];
Q=zeros(1,pre_fitness_log_size);
while (~isempty(find(fitness_ranking(i,:)==0)) && i<pre_fitness_log_size)
    a=find(fitness_ranking(i,:)==0);
    temp=zeros(1,pre_fitness_log_size);
    for j=1:1:a(1)-1
       
        e=fitness_ranking(i,j);
        
        b=find(S(e,:)==0);
        
        for k=1:1:b(1)-1
            c=S(e,k);
            N(c)=N(c)-1;
            
            if N(c)==0
                rank(c)=i+1;
                d=find(Q==0);
                Q(d(1))=c;
            
            end
        end
    end
    i=i+1;
    
    fitness_ranking(i,:)=Q;
    Q=zeros(1,pre_fitness_log_size);
    
end
%disp(rank);

%disp(fitness_ranking);


   
        

        
         
                
                
            
    
    
    
