%%modify imported time to task times
%%sync time by -info file
% importedTable needs to have - .time_abs class
function rawTable = syncTime_Info_Data(importedTable, task_time_abs,...
    startend_time)
%cut data to TASK parts
[trigger_index, startend_idx] = ...
    getTaskIndex(task_time_abs, startend_time, importedTable.time_abs);
importedTable = importedTable(startend_idx(1):startend_idx(2),:);

trigger_index = trigger_index - startend_idx(1) + 1;
time_s = importedTable.time_abs - importedTable.time_abs(1);

task_vec = zeros(size(importedTable,1), 1);
for task_i = 1:size(trigger_index,1)
    if trigger_index(task_i,1)>trigger_index(task_i,2)
        trigger_index(task_i,2) = trigger_index(task_i,1);
    end
        if trigger_index(task_i,1)==0
       trigger_index(task_i,1) = 1;
        end
    
    task_vec(trigger_index(task_i,1):trigger_index(task_i,2)) = task_i;
end

importedTable = addvars(importedTable,time_s,'After','time_abs');
rawTable = addvars(importedTable,task_vec,'After','time_s');