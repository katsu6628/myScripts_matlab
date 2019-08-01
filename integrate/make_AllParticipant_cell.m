function data_cell_i = make_AllParticipant_cell(data_tbl, usingVars,targetTasks)
data_task = data_tbl.TaskLabel;
data_cell_i = cell(length(targetTasks), length(usingVars));
for i = 1:length(usingVars)
    for task_i = targetTasks
data_cell_i{targetTasks==task_i, i} = ...
    data_tbl(data_task==task_i, usingVars{i}).Variables;
    end
end
end