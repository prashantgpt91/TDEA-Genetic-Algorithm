function [propagate]=mutation(crossover_population,no_plan_job,no_mac_plan_job,machine_time,no_op_plan_job,transport_time)


mutation_population=[];
mutation_population=crossover_population;

%disp(mutation_population);

for j=1:1:2
      c1=ceil(rand(1)*6);
      p1=no_plan_job(c1);

      if(c1==1)
          p2=0;
      else
         p2=no_plan_job(c1-1);
      end
      p3=p1-p2;
      pp=p2+ceil(rand(1)*p3);
      
      mutation_population(j,c1)=pp;
     
          
      
      for k=1:1:6
        a=no_mac_plan_job(pp,k);
        if k==1
            if pp==1
                b=0;
            else
                b=no_mac_plan_job(pp-1,6);
            end
        else
            b=no_mac_plan_job(pp,k-1);
        end
        w=b+ceil(rand(1)*(a-b));
        
        %now move to the machine_time to get the details of the selected
        %machine for a particular opeartion
        if w~=b    % it means opeartion exist
            mutation_population(j,6+12*(c1-1)+2*(k-1)+1)=machine_time(w,1);    %6 for the process plan,12 for the each process plan(0-11,12-23....),2*(k-1 for travesrsing along those 12 bits,+1 for machine & +2 for time)   
            mutation_population(j,6+12*(c1-1)+2*(k-1)+2)=machine_time(w,2);
        
        else 
            break;% if w==b it means this particular opration k does not exist in a plan so k+1 also wont exist
        end
      end
end
      
%disp('sabse alag');
%disp(mutation_population);
%disp('ye lo mutation');
%disp(mutation_population);
     zz=[];
       zz=cal_pre_fitness_log(mutation_population,2,transport_time,no_op_plan_job);
      propagate=[];
      if(zz(1,1)>zz(2,1))
          propagate(1,:)=mutation_population(2,:);
      elseif(zz(1,1)<=zz(2,1))
          propagate(1,:)=mutation_population(1,:);
          
      end
       %disp('mutation wlaa propagate');
      %disp(propagate);
         % disp(zz);
       
      
      
      
      
      
 
      
      
      