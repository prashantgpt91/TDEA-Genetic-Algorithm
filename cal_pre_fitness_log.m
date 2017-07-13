function [pre_fitness_log] = cal_pre_fitness_log(population,pop_size,transport_time,no_op_plan_job)
cal_pre_fitness_log=zeros(pop_size,3);

pre_fitness_log=[];
 best_time=[];
for i=1:1:pop_size
    temp=population(i,:);
    [ideal_fitness_job]=cal_ideal_fitness_job(temp,transport_time,no_op_plan_job);
    mac_be_free=[0 0 0 0 0 0];
    job_status=[];
    job_status=zeros(6,5);   
    
    %here six denotes no. of jobs 
    %job status maintains the state of our job that whether it is in
    %processing stage/termination stage etc....
    %here for job_status array
    
    %COLUMN 1 indicates->if the selected operation is in processing,then
    %it's value will be 1 or else 0;
    
    %COLUMN 2 indicates->if the selected operation is in
    %transportation,then it's value will be 1 or else 0;
    
    %COLUMN 3 indicates->if the selected operation is in buffer or in
    %queue.if in buffer then it's value will be 1 otherwise it's value will
    %be 0;
    
    %COLUMN 4 indicates->whether job is completed or not.if completed then
    %value will be 1 otherwise 0;
    
    %COLUMN 5 indicates->how many operations have occurred for a particular
    %job.if one operations have completed then it's value is 1,if two
    %operations are completed then it's value is 2 and likewise
    
    
    
    mac_buffer=[];
    mac_buffer=zeros(6,7);
    
    %for this array 6 denotes the no. of machines.and there respective
    %seven columns denote that at max each machine can have a maximum of 6
    %jobs.where these column denotes that which job is the machine
    %processing and the remainng columns denote the pending jobs
    
    
    
    
    mac_time=[0 0 0 0 0 0];
    
    job_termination_time=[0 0 0 0 0 0];
    
    tt_time=[0 0 0 0 0 0];    % for each job
    [mac_time,mac_buffer,job_status,mac_be_free]=generate_basic_buffer(temp,mac_time,mac_buffer,job_status,mac_be_free,ideal_fitness_job);
    
    time=0;
    
    while (length(find(job_status(:,4)==0))~=0)    %means this loop will run untill all row values in coloumn 4 becomes 1,meaning all jobs are completed         
        %disp('recursion in main while loop');
        %disp('machine buffer');
        %disp(mac_buffer);
        %disp('termination time');
        %disp(job_termination_time');
        
        time=time+1;              %clock runs
        for j=1:1:6            % for six machines
            if mac_be_free(j)~=0
                mac_be_free(j)=mac_be_free(j)-1;
            end
        end
                
        for j=1:1:6             % for six jobs
            if tt_time(j)~=0
                tt_time(j)=tt_time(j)-1;
            end
        end
        
        
        % if any machine becomes free then assign next task
        
        for j=1:1:6
            
            if mac_be_free(j)==0 && mac_buffer(j,1)~=0
                %disp('recusrion in any machine becomes free');
                % check if the operation just completed completes the job
                % if not transport the task
                k=mac_buffer(j,1);
                job_status(k,5)=job_status(k,5)+1;
               
                job_status(k,1)=0;
                % checking if job is completed or not
                
                m=temp(k);
           
                if no_op_plan_job(m) == job_status(k,5)
                    job_termination_time(k)=time;
                    job_status(k,4)=1;
                    
                else
                    op=job_status(k,5);
                    x=temp(6+12*(k-1)+op*2+1);
                    tt_time(k)=transport_time(j,x);
                   
                    job_status(k,2)=1;
                end
                
                x=1;
                
                % updating the buffer
                while mac_buffer(j,x)~=0
                    mac_buffer(j,x)=mac_buffer(j,x+1);
                    x=x+1;
                end
                
                if mac_buffer(j,1)~=0
                    k=mac_buffer(j,1);
                    p=job_status(k,5);
                    x=temp(6+12*(k-1)+2*p+2);
                    mac_time(j)=mac_time(j)+x;
                    mac_be_free(j)=x;
                    
                    job_status(k,1)=1;
                    
                    job_status(k,3)=0;
                end
            end
        end
        
        % when job is reached through transportation to destination
        
        for k=1:1:6
            
            if (tt_time(k)==0 && job_status(k,2)==1)
                %disp('recusrion in job is reached to destination');
                job_status(k,2)=0;
                op=job_status(k,5);
                x=temp(6+12*(k-1)+op*2+1);
                if mac_be_free(x)==0
                    mac_buffer(x,1)=k;
                    mac_time(x)=mac_time(x)+temp(6+12*(k-1)+op*2+2);
                    job_status(k,1)=1;
                    mac_be_free(x)=temp(6+12*(k-1)+op*2+2);
                else
                    mac=[];
                    mac=mac_buffer(x,:);
                    id=[];
                    id=find(mac==0);
                    mac_buffer(x,id(1))=k;
                    job_status(k,3)=1;
                end
            end
        end
        %pause;
    end
                        
    
    %%%% job_termination_time[] has when each job terminated also            
    %%%% time contains the total time taken
    %%%% also mac_time[]  contains the total time taken by each machine
    %disp(time);
   
    %best_time(i)=time;
    %pre_fitness_log(i,1)=time;
    %pre_fitness_log(i,2)=(round(mean(job_termination_time)*100))*100/10000;
    %pre_fitness_log(i,3)=round((mean(mac_time)/time),2);
    
    pre_fitness_log(i,1)=time;
t=sum(mac_time);
t=t*100;
t=t/(6*time);


% avg utilization of machines
t=round(t*100+0.5);
t=t/100;
pre_fitness_log(i,2)=t;


jt=sum(job_termination_time);
jt=jt/6;
jt=round(jt*100+0.5);
jt=jt/100;

pre_fitness_log(i,3)=jt;

    
    
end
%disp(pre_fitness_log);
%disp(job_termination_time);
    %disp(best_time);
    %[sort_best_time,index_best_time]=sort(best_time);
    %disp(sort_best_time);
    
    %for v=1:1:100
     %   population_archive(v,:)=population(index_best_time(v),:);
    %end
    
 
    %disp(population_archive);
    
    
    
    
    
