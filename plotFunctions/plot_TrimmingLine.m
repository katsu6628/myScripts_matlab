%plot trimming line between tasks
function plot_trimmingLine(switchIdx, task_vec, winIdx_vec, time_vec)
%plot trimming lines for each tasks
ylim_ = ylim;
for sw_i = switchIdx
    if sw_i ~= switchIdx(end) && (abs(task_vec(sw_i)) ~= abs(task_vec(sw_i+1)))
        %task_vec(sw_i) > 0 || task_vec(sw_i+1) > 0)
        a = plot([sw_i, sw_i], ylim_, 'k--');
        text(sw_i, ylim_(2), num2str(time_vec(sw_i)), ...
            'HorizontalAlignment', 'Right', 'VerticalAlignment', 'top');
        set(get(get(a(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
    end
end


%plot trimming line if the time series is discontinuing
discontinuityIdx = find(diff(winIdx_vec)>1)';
if ~isempty(discontinuityIdx)
    for dis_i = discontinuityIdx
        plot([dis_i, dis_i], ylim_, 'r');
        text(dis_i, ylim_(2), num2str(time_vec(dis_i)), ...
            'HorizontalAlignment', 'Right', 'VerticalAlignment', 'top');
    end
end
%beginning and the end
text(0, ylim_(2), num2str(time_vec(1)), ...
    'HorizontalAlignment', 'Left', 'VerticalAlignment', 'top');
% text(length(time_vec), ylim_(2), num2str(time_vec(end)), ...
%     'HorizontalAlignment', 'Right', 'VerticalAlignment', 'top');
end
