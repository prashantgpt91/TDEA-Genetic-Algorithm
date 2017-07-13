function [updated_regular_population,updated_archive_population]=update_population(population,pop_size,propagate,population_archive,pre_fitness_log,transport_time,machine_time,no_op_plan_job,no_plan_job,no_mac_plan_job)


updated_regular_population=[];
leppy=0;
%disp('update wla propagate');
%disp(propagate);
%y=[];
%y=size(propagate);
%disp('y hai');
 % disp(y);

    
 %   x=[];
 % x=size(propagate);
  %disp('x hai');
  %disp(x);
  while(1)
  gg=cal_pre_fitness_log(propagate,1,transport_time,no_op_plan_job);
  temp_population=[];
  j=1;
  bbb=0;
for i=1:1:pop_size
   
% x=propagate(1,:);
 
 %   y=population(i,:);
   
    if(gg(1,1)<pre_fitness_log(i,1) && gg(1,2)>pre_fitness_log(i,2) && gg(1,3)<pre_fitness_log(i,3))   %offspring dominates the individual
       temp_population(j,:)=population(i,:);
       temp_population(j,80)=i;
       j=j+1;
       
    elseif(gg(1,1)>pre_fitness_log(i,1) && gg(1,2)<pre_fitness_log(i,2) && gg(1,3)>pre_fitness_log(i,3))
      [parents]=parent_selection(population,population_archive,pop_size,pre_fitness_log);
      [crossover_population]=crossover(parents,population,pre_fitness_log,pop_size,transport_time,no_op_plan_job);
      [propagate]=mutation(crossover_population,no_plan_job,no_mac_plan_job,machine_time,no_op_plan_job,transport_time);
      i=0;
      j=1;
      temp_population=[];
      bbb=100;
      break;
    end
    
end
if(bbb==100)
    continue;
end 
    
    

g=[];
g=size(temp_population);

j=g(1);
if(j~=0)
d=ceil(j*rand(1)); 
hhh=1;
temp_population(d,80)=hhh;
population(hhh,:)=propagate(1,:);

elseif(j==0)
h=ceil(pop_size*rand(1));
population(h,:)=propagate(1,:);
end
%check of the offspring for the P(0) has been completed now it will be checked for the A(0);

%therefore now we will call update_archive_population

updated_regular_population=population;

 [report_archive,leppy]=update_archive_population(population,population_archive,propagate,transport_time,no_op_plan_job,machine_time,no_mac_plan_job,pre_fitness_log,pop_size,no_plan_job);
%disp('jhacbascbasc');
%disp(leppy);
if(leppy==0)
    updated_population_archive=report_archive;
    break; 
    
end
    
  end
    
    




