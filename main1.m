[no_op_plan_job,no_mac_plan_job,no_plan_job,machine_time,transport_time]= initialisation();
%disp('akash');
%disp(no_plan_job);
%disp(no_mac_plan_job);
%disp(machine_time);



pop_size=600;
%disp(pop_size);
population=[];

[population]=pop_generator1(no_plan_job,no_mac_plan_job,machine_time,pop_size);
%disp('population generated ho gayi mast');
%caculating fitness
pre_fitness_log=[];  %stores the value for each objective given 
[pre_fitness_log]=cal_pre_fitness_log(population,pop_size,transport_time,no_op_plan_job);
%disp('kdcnk');
[fitness_ranking]=assign_fitness(pre_fitness_log);

 [population_archive,k]=create_archive(fitness_ranking,pop_size,population);
 
 %disp(k);
 
 %[pre_fitness_logii]=cal_pre_fitness_log(population_archive,k,transport_time,no_op_plan_job);
 %disp(pre_fitness_logii);
for t=1:1:30
 [parents]=parent_selection(population,population_archive,pop_size,pre_fitness_log);
 
 
 [crossover_population]=crossover(parents,population,pre_fitness_log,pop_size,transport_time,no_op_plan_job);
 
 [propagate]=mutation(crossover_population,no_plan_job,no_mac_plan_job,machine_time,no_op_plan_job,transport_time);

 
 
 
% [pre_fitness_logiii]=cal_pre_fitness_log(crossover_population,2,transport_time,no_op_plan_job);
 
 %disp(pre_fitness_logiii);
lalu=0;  
[updated_regular_population,updated_archive_population]=update_population(population,pop_size,propagate,population_archive,pre_fitness_log,transport_time,machine_time,no_op_plan_job,no_plan_job,no_mac_plan_job);
population=updated_regular_population;
population_archive=updated_archive_population;

%[report_archive]=update_archive_population(population_archive,propagate,transport_time,no_op_plan_job,machine_time,no_mac_plan_job,pre_fitness_log);


end