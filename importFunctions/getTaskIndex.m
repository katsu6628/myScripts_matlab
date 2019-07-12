%compare the INPUT TIME DATA and start/end of TASK TIME from info-file
%and get the data-index of start/end of tasks
function [trigger_index, startend_index] = ...
    getTaskIndex(task_time_abs, startend_time, Time_abs)
%% edit the data to make it useful
task_no = length(task_time_abs);
%calculate the index of the start/end time of each tasks
trigger_index = zeros(task_no,2);
for i = 1:task_no
    for j = 1:2
        a=find(Time_abs >= task_time_abs(i,j));  
        if i==1 && j==1
            trigger_index(i,j)=a(1);
        else
          %store the first index of Time, when it goes beyond task_time(i,j)
%           try
            trigger_index(i,j) = a(1)-1;
%           catch
%               keyboard
%           end
        end
    end
end
a=find(Time_abs >= startend_time(1));
b=find(Time_abs >= startend_time(2));
%keep the start/end index of experiment
startend_index = [a(1), b(1)];
end
