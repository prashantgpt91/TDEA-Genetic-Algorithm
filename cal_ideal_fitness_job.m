function [ideal_fitness_job] = cal_ideal_fitness_job(temp,transport_time,no_op_plan_job)

ideal_fitness_job=[0 0 0 0 0 0];   % stores ideal time taken by jobs to complete in case machine is availaible all the time for one particular solution so that we give more preference to the one that takes more time can  

for i=1:1:6          %for plan
    for j=1:1:6      %for operations
        %disp(temp);
        if j==1 || j>no_op_plan_job(temp(i))       %t=1 means that it is the first machine and therefore transportation time=0;and second condition implies that the selected plan in our chromosome doen't exists;
            t_time=0;                              % t_time is the transfer time from one machine to other
        else
           % disp('aise taise');
            %disp(temp);
            %disp(j);
            %disp(i);
            mac1=temp(6+12*(i-1)+(2*(j-1))-1);       %positioning the FROM machine to considered for transportation time   
            mac2=temp(6+12*(i-1)+2*(j)-1);           %positioning the TO machine to considered for transportation time
            t_time=transport_time(mac1,mac2);        %calculating the transportation time
        end
        ideal_fitness_job(i)=ideal_fitness_job(i)+temp(6+12*(i-1)+2*j)+t_time; %adding    
        
    end
end                                      

  % disp('ideal_fitness_allocated');