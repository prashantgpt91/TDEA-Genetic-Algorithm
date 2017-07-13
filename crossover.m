function [crossover_population]=crossover(parents,population,pre_fitness_log,pop_size,transport_time,no_op_plan_job)
crossover_population=[];
pre_fitness_logII=[];

pre_fitness_logII=pre_fitness_log;

%FMIN=max(pre_fitness_logII(:,1));
%FMAX=min(pre_fitness_logII(:,1));
%FAVG=mean(pre_fitness_logII(:,1));
%fitness value has been taken to be span time



%disp(FMIN);
%disp(FMAX);
%disp(FAVG);

% A=cal_pre_fitness_log(parents,2,transport_time,no_op_plan_job);
 
 %disp(A);
 
% FF=max(A(:,1));
 
 %disp(FF);
 
%Pc0=0.9;
%Pc1=0.8;
%Pc2=0.6;

%if(FF>FAVG)
 %   Pc=((Pc1+Pc0)/2)+((Pc1-Pc0)/2)*cos(((FF-FAVG)/(FMAX-FAVG))*pi);
%elseif(FF<FAVG)
 %Pc=((Pc1+Pc2)/2)+((Pc1-Pc2)/2)*cos(((FAVG-FF)/(FAVG-FMIN))*pi);
 
%end
 
 %disp(Pc);
 
 
 %we will not use Pc becoz this is not sprcific to our algorithm
 %now starts two point crossover
 
 
 c1=ceil(1+2*rand(1));
 c2=ceil(3+3*rand(1));
 
 
 
 
 for i=c1:1:c2
     temp1=parents(1,i);
     parents(1,i)=parents(2,i);
     parents(2,i)=temp1;
 end
 
 for j=((c1-1)*12)+6+1:1:(c2*12)+6;
     temp2=parents(1,j);
     parents(1,j)=parents(2,j);
     parents(2,j)=temp2;
 end
     
 crossover_population=parents;
 %disp('ye lo crossover');
%disp(crossover_population);

      
     % zz=[];
      % zz=cal_pre_fitness_log(crossover_population,2,transport_time,no_op_plan_job);
    %disp(zz);

 
 
 