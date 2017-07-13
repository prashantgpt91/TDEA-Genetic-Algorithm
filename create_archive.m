function [population_archive,k]=create_archive(fitness_ranking,pop_size,population)
population_archive=[];
p=1;
index_archive=zeros(1,pop_size);
j=1;
for i=1:1:1
   index_archive=find(fitness_ranking(i,:)==0);
   for j=1:1:index_archive(1)-1
        population_archive(p,:)=population(fitness_ranking(i,j),:);
        p=p+1;
   end
 
end

size_archive=size(population_archive);
k=size_archive(1);
%disp('dangar');
%disp(population_archive);

   
   
   