function [mac_time,mac_buffer,job_status,mac_be_free]=generate_basic_buffer(temp,mac_time,mac_buffer,job_status,mac_be_free,ideal_fitness_job)


for i=1:1:6                                %this loop is for the preference for each job,means the machine it wants for it's completion
    machine=temp(6+12*(i-1)+1);            %this line identifies the particular machine that the particular job wants
    buff=[];                                    
    buff=mac_buffer(machine,:);        %checks for buffer
    ind=[];                            
    ind=find(buff==0);                    % find function returns us the index of all those positions whose value is 0 in increasing order
    mac_buffer(machine,ind(1))=i;         %but this order is done only for first operation of each job
end
                          
for i=1:1:6
    mac=[];
    mac=mac_buffer(i,:);    
    
    tt=[];
    tt=find(mac==0);                         %finds the index of the one having it's index =0
    
    poff=[];
    for j=1:1:tt(1)-1                        %loop will run upto that index-1
        poff(j)=ideal_fitness_job(mac(j));
    end
    
    [tr,id]=sort(poff,'descend');              %A = [3 14 7 4 1 8 12 5]
                                               %[sorted,indices]=sort(A,'descend')
                                               %and I will have
                                               %sorted = [14 12 8 7 5 4 3 1]
                                               %indices = [2 7 6 3 8 4 1 5]
                                               %this we are doing becoz the
                                               %one having maximum number
                                               %of will be allowed to enter
                                               %into the machine first.So
                                               %that overall performance
                                               %should increase.
                                               
                                             
    for j=1:1:tt(1)-1                          
        mac_buffer(i,j)=mac(id(j));            %ordering of jobs    
    end
end
for i=1:1:6              % for machines
    if mac_buffer(i,1)~=0
        j=mac_buffer(i,1);   % id of the job
        job_status(j,1)=1;
        t=temp(6+12*(j-1)+2);
        mac_time(i)=t;
        mac_be_free(i)=t;
    end
end


for i=1:1:6          % for jobs
    if job_status(i,1)~=1
        job_status(i,3)=1;
    end
end
 %disp('basic buffer completed'); 
 %this function basically gives us the queue to be considered based upon
 %the ideal time taken by each job;
