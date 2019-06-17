%get Window information out of times
function [window_border, taskType_vec] = ...
    getMiniWindow(time_vec, task_vec, step_width, windowLength)

window_border = time_vec(1):step_width:time_vec(end)-windowLength;
window_border = [window_border', window_border' + windowLength];

window_no = size(window_border, 1);
%% taskType_vec: taskType of each miniWindow
%0 : is not involved in any tasks
%-1 : the miniWindow crosses over the boundary of tasks
%1~ : number of Tasks
alltask_vec = unique(task_vec(task_vec>0))';
taskType_vec = nan(window_no, 1);
preTaskBorder = 0;
for k = alltask_vec
    timetask_s = time_vec(task_vec==k);
    task_logic = and(timetask_s(1) <= window_border(:,1),...
        window_border(:,end) <= timetask_s(end));
    taskType_vec(task_logic) = k;
    
    postTaskBorder = timetask_s(1);
    nontask_logic = and(preTaskBorder < window_border(:,1), ...
        window_border(:,end) < postTaskBorder);
    taskType_vec(nontask_logic) = 0;
    
    % define the window that crosses task borders
    crossingTask_logic = and(isnan(taskType_vec),...
        window_border(:,1) < timetask_s(1));
    a = find(crossingTask_logic); %separete into half
    if any(a)
        precrossingTask_logic = false(window_no,1);
        postcrossingTask_logic = false(window_no,1);
        precrossingTask_logic(a(1):floor(mean(a))) = true;
        precrossingTask_logic = and(isnan(taskType_vec), ...
            precrossingTask_logic);
        postcrossingTask_logic(floor(mean(a))+1:a(end)) = true;
        postcrossingTask_logic = and(isnan(taskType_vec), ...
            postcrossingTask_logic);
        taskType_vec(precrossingTask_logic) = -(k-1);
        taskType_vec(postcrossingTask_logic) = -k;
    end
    preTaskBorder = timetask_s(end);
end
end
