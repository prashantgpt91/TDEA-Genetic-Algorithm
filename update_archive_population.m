function [report_archive,leppy]=update_archive_population(population,population_archive,propagate,transport_time,no_op_plan_job,machine_time,no_mac_plan_job,pre_fitness_log,pop_size,no_plan_job)


leppy=0;
report_archive=[];
report_archive=population_archive;
b=[];
b=size(population_archive);
f=b(1);
%disp('f hai');
%disp(f);
temp_archive_population=[];
j=1;
 gg=cal_pre_fitness_log(propagate,1,transport_time,no_op_plan_job);
for i=1:1:f
    
   % x=propagate(1,:);
    %y= population_archive(i,:);
    
    
   
    if(gg(1,1)<pre_fitness_log(i,1) && gg(1,2)>pre_fitness_log(i,2) && gg(1,3)<pre_fitness_log(i,3))   % %offspring dominates the individual
 %       b1=[];
%b1=size(population_archive);
%f1=b1(1);
%disp('f1 neeche wala hai');
%disp(f1);
        %disp('i hai');
        %disp(i);
      temp_archive_population(j,:)=population_archive(i,:);
      temp_archive_population(j,80)=i;
      j=j+1;
      leppy=0;
     
    elseif(gg(1,1)>pre_fitness_log(i,1) && gg(1,2)<pre_fitness_log(i,2) && gg(1,3)>pre_fitness_log(i,3))
     [parents]=parent_selection(population,population_archive,pop_size,pre_fitness_log);
      [crossover_population]=crossover(parents,population,pre_fitness_log,pop_size,transport_time,no_op_plan_job);
      [propagate]=mutation(crossover_population,no_plan_job,no_mac_plan_job,machine_time,no_op_plan_job,transport_time);
       % update_population(population,pop_size,propagate,population_archive,pre_fitness_log,transport_time,machine_time,no_op_plan_job,no_plan_job,no_mac_plan_job)
       j=1;
       temp_archive_population=[];
       leppy=201;
       report_archive=population_archive;
        return
    end
    
   
  
end
temp_archive_population=population_archive;
qq=[];
qq=size(temp_archive_population);                                       %deleting the particular rows
saluja=qq(1);
for dangar=1:1:saluja
    if(temp_archive_population(dangar,80)~=0)
        population_archive(temp_archive_population(dangar,80),:)=[];
        for ashay=dangar:1:saluja
            temp_archive_population(ashay,80)=temp_archive_population(ashay,80)-1;
        end
        
    end
end

        




        
  e=size(population_archive);
  %disp('dekh');
  %disp(e);
  u=e(1);
   if(u==0)
       population_archive=propagate(1,:);
       [parents]=parent_selection(population,population_archive,pop_size,pre_fitness_log);
      [crossover_population]=crossover(parents,population,pre_fitness_log,pop_size,transport_time,no_op_plan_job);
      [propagate]=mutation(crossover_population,no_plan_job,no_mac_plan_job,machine_time,no_op_plan_job,transport_time);
      leppy=202;  
      report_archive=population_archive;
        return
      % disp(population_archive);
   end
   
   
   
   cc=size(population_archive);
   ccc=cc(1);
   %disp('OM SAI NATH');
   xx=cal_pre_fitness_log(population_archive,ccc,transport_time,no_op_plan_job);
   %disp(xx);
   
   %NOW STARTS SCALING
   C=0.5;
   G=2;
  
  
  %S=((1/(1+exp(-y)))-C)*G;
  %disp('jai sree ram');
  
   rd=[];
  f1=[];
   for v=1:1:ccc
       
   f1=cal_pre_fitness_log(population_archive(v,:),1,transport_time,no_op_plan_job);
   y1=gg(1);
   y2=gg(2);
   y3=gg(3);
   
    SC1=((1/(1+exp(-y1)))-C)*G;
    SC2=((1/(1+exp(-y2)))-C)*G;
    SC3=((1/(1+exp(-y3)))-C)*G;
   
    z1=f1(1);
    z2=f1(2);
    z3=f1(3);
    SI1=((1/(1+exp(-z1)))-C)*G;
    SI2=((1/(1+exp(-z2)))-C)*G;
    SI3=((1/(1+exp(-z3)))-C)*G;
    
    rd(v)=abs(SC1-SI1)+abs(SC2-SI2)+abs(SC3-SI3);
   % disp('jhantu');
    %disp(rd);
   end
    [nn,id]=sort(rd);
    yoyo=size(id);
    %disp('yoyo');
    %disp(yoyo);
    %nn(ccc) would be maximum
    SJJ=[];
    ff=cal_pre_fitness_log(population_archive(id(ccc),:),1,transport_time,no_op_plan_job)
    
    zz1=ff(1);
    zz2=ff(2);
    zz3=ff(3);
    SJJ=((1/(1+exp(-zz1)))-C)*G;
    SJJ=((1/(1+exp(-zz2)))-C)*G;
    SJJ=((1/(1+exp(-zz3)))-C)*G;
    
    lol=max(SJJ);
    
    if(lol>=0.006)
        population_archive(ccc+1,:)=propagate(1,:);
        ankur=size(population_archive);
        pranshu=ankur(1);
        nikunj=cal_pre_fitness_log(population_archive,pranshu,transport_time,no_op_plan_job);
        disp('yahi chhaiye');
        leppy=0;
        report_archive=populaion_arhcive;
        disp(nikunj);
    else
        [parents]=parent_selection(population,population_archive,pop_size,pre_fitness_log);
      [crossover_population]=crossover(parents,population,pre_fitness_log,pop_size,transport_time,no_op_plan_job);
      [propagate]=mutation(crossover_population,no_plan_job,no_mac_plan_job,machine_time,no_op_plan_job,transport_time);
      leppy=203;  
      report_archive=population_archive;
        return
    end
    %otherwise reject the offspring
    
    
        
    
    
    
    
    
    
    
    
    
    
    
     