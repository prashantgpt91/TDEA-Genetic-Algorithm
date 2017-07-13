function [population]=pop_generator1(no_plan_job,no_mac_plan_job,machine_time,pop_size)
%disp('kdcnk');
% only these four variables are needed to create the chromosome
%where pop_size has been taken from main.m and first three variables are
%taken from initialisation.m

population=[];

% total length of our chromosome will be 81,becoz 6 for process plan level
% design chromosome and 12 each for these six as there can be a maximum of
% 6 machines with their corresponding times taken to complete the operation
% and three extra for our three objectives values for each choromosome.so
% therefore we have not make two level chromosome.we have made only one
% choromosome of 81 length

population=zeros(200,81);  %this will create an array of 200x81 with fractional values between 0 and 1

for j=1:1:pop_size
    for i=1:1:6
        p=no_plan_job(i);
         
        if(i==1)
            q=0;
        else
            q=no_plan_job(i-1);
        end
        
    x=q+ceil(rand(1)*(p-q));
    
    population(j,i)=x;
    
    
     for k=1:1:6
        a=no_mac_plan_job(x,k);
        if k==1
            if x==1
                b=0;
            else
                b=no_mac_plan_job(x-1,6);
            end
        else
            b=no_mac_plan_job(x,k-1);
        end
        w=b+ceil(rand(1)*(a-b));
        
        %now move to the machine_time to get the details of the selected
        %machine for a particular opeartion
        if w~=b    % it means opeartion exist
            population(j,6+12*(i-1)+2*(k-1)+1)=machine_time(w,1);    %6 for the process plan,12 for the each process plan(0-11,12-23....),2*(k-1 for travesrsing along those 12 bits,+1 for machine & +2 for time)   
            population(j,6+12*(i-1)+2*(k-1)+2)=machine_time(w,2);
        
        else 
            break;% if w==b it means this particular opration k does not exist in a plan so k+1 also wont exist
        end
    end
    end  
end
%disp(population);

       
 
    
            
        
        






