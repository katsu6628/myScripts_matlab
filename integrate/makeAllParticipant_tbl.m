%% calculate the mean affective profile that integrates all subject profile
function dataTagettasks_tbl = makeAllParticipant_tbl(data_cell, targetTasks,...
    step_width, windowLength, varNames, sub_vec)

dataArray = [];
taskVec = [];
for task_i = targetTasks
    dataTask_i = squeeze(data_cell(:, targetTasks==task_i, :));
    minimumLength = min(cellfun(@length, dataTask_i(:,1)));
    dataArray_i = make_AllParticipant_array(dataTask_i,minimumLength);
    dataArray_ii = reshape(dataArray_i, ...
        size(dataArray_i,1)*size(dataArray_i,2), size(dataArray_i,3))';
    taskVec_i = ones(minimumLength,1)*task_i;
    
    dataArray = [dataArray; [dataArray_ii, squeeze(mean(dataArray_i,2))']];
    taskVec = [taskVec; taskVec_i];
end

allLength = length(taskVec);
idx_vec = [1:allLength]';
Participant_vec = zeros(allLength, 1);
Day_vec = Participant_vec;
time_vec = linspace(0, step_width*(allLength-1), allLength);


varNameCell = strcat(cellstr(repmat(varNames',size(data_cell,1),1)),...
    '_sub',reshape(repmat(cellstr(num2str([sub_vec]'))', length(varNames),1),[],1));
varNameCell = strrep(varNameCell, ' ', '');

dataTagettasks_tbl = array2table([idx_vec, Participant_vec, Day_vec, ...
    time_vec', taskVec, dataArray],...
    'VariableNames', {'index','ParticipantID', 'Day', 'Starttime_s', ...
        'TaskLabel', varNameCell{:}, varNames{:}});
end


function dataTask_ = makeOneTask_tbl(data_cell, targetTask)
minimumLength = min(cellfun(@length, data_cell(:,1)));
data_array = make_AllParticipant_array(data_cell,minimumLength);

%%%%%%%%%
%make up this table following the shimmer_wintbl variables
%%%%%%%%%
idx_vec = [1:minimumLength]';
Participant_vec = zeros(minimumLength, 1);
Day_vec = Participant_vec;
window_border = linspace(0, step_width*(minimumLength-1), minimumLength);
window_border = [window_border', window_border' + windowLength];
taskLabel = ones(minimumLength,1) * targetTasks;
dataMovie_tbl = array2table([idx_vec, Participant_vec, Day_vec, ...
    window_border, taskLabel, squeeze(mean(data_ensemble_array,2))'],...
    'VariableNames', varNames);
end