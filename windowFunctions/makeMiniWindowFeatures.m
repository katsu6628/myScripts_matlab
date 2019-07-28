function [miniWindowTable, miniWindowRawData] = makeMiniWindowFeatures...
    (data_, time_s,task_vec, step_width, windowLength_mini, sub, day)

%get windows info
[window_border, TaskLabel] = getMiniWindow(time_s, task_vec, ...
    step_width, windowLength_mini);

%cut into windows
miniWindowRawData = cell(size(window_border,1),2);
for win_i = 1:size(window_border,1)
    win_logic = and(time_s >= window_border(win_i,1), ...
        time_s < window_border(win_i,end));
    miniWindowRawData{win_i,1} = time_s(win_logic);
    miniWindowRawData{win_i,2} = data_(win_logic, :);
end

%make table
index = [1:size(window_border,1)]';
ParticipantID = repmat(sub, size(window_border,1), 1);
Day = repmat(day, size(window_border,1), 1);
Starttime_s = window_border(:,1);
Endtime_s = window_border(:,2);

varNames = {'index', 'ParticipantID', 'Day',...
    'Starttime_s', 'Endtime_s', 'TaskLabel'};
miniWindowTable =  table(index, ParticipantID, Day,...
    Starttime_s, Endtime_s, TaskLabel, 'VariableNames', varNames);
end