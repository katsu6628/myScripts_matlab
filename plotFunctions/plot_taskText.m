%draw text for each task
function plot_taskText(switchIdx, task_vec, task_name)
tmpcnt = 1;
ylim_ = ylim;
for sw_i = switchIdx
    if rem(tmpcnt,2)==1; vertPos='top'; else; vertPos='bottom'; end
    if sw_i ~= switchIdx(end)
        if task_vec(sw_i) ~= 0 && abs(task_vec(sw_i)) ~= abs(task_vec(sw_i+1))
            text(sw_i , ylim_(1), task_name{abs(task_vec(sw_i))},...
                'HorizontalAlignment', 'Right', 'VerticalAlignment', vertPos);
            tmpcnt = tmpcnt + 1;
        elseif sw_i ~= switchIdx(end) && abs(task_vec(sw_i)) ~= abs(task_vec(sw_i+1))
            %task_vec(sw_i+1) > 0)% || ...
            %(sw_i == switchIdx(end) && task_vec(sw_i) <= 0)
            %         text(sw_i , ylim_(1), 'n/a',...
            %             'HorizontalAlignment', 'Right', 'VerticalAlignment', vertPos);
            tmpcnt = tmpcnt + 1;
        end
    else
        if task_vec(sw_i) ~= 0
            text(sw_i , ylim_(1), task_name{abs(task_vec(sw_i))},...
                'HorizontalAlignment', 'Right', 'VerticalAlignment', vertPos);
            tmpcnt = tmpcnt + 1;
        end
    if task_vec(sw_i) > 0
        text(sw_i , ylim_(1), task_name{task_vec(sw_i)},...
            'HorizontalAlignment', 'Right', 'VerticalAlignment', vertPos);
        tmpcnt = tmpcnt + 1;
    elseif sw_i ~= switchIdx(end) && abs(task_vec(sw_i)) ~= abs(task_vec(sw_i+1))
        %task_vec(sw_i+1) > 0)% || ...
            %(sw_i == switchIdx(end) && task_vec(sw_i) <= 0)
        text(sw_i , ylim_(1), 'n/a',...
            'HorizontalAlignment', 'Right', 'VerticalAlignment', vertPos);
        tmpcnt = tmpcnt + 1;
    end
end
end
