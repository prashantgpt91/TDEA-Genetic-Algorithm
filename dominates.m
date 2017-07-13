function y = dominates(i,j,pre_fitness_log)

y=0;
if pre_fitness_log(i,1)<pre_fitness_log(j,1) && pre_fitness_log(i,2)>pre_fitness_log(j,2) && pre_fitness_log(i,3)<pre_fitness_log(j,3)
    y=1;
    
end

%disp('dominates working correctly');