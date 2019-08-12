%plot feature change with task trim, the x-axis is on the time range
function switchIdx = ...
    plot_taskFeatures_byTime(feat_vec, task_vec, time_vec, ...
    winIdx_vec, task_name, color_)
if nargin == 5
    tmp = get(gca, 'colororder');
    color_ = tmp(1,:);
end


hold on
switchIdx = [find(diff(task_vec)); length(task_vec)]';
presw = 1;
xtickLabels_ = []; xticks_ = [];

validYlim = [];
%plot time series of probability
for sw_i = switchIdx
    %define the color of this task plot
    if task_vec(sw_i) > 0; co = color_; else; co = 'k';end
    a = plot(time_vec(presw:sw_i), feat_vec(presw:sw_i, 1),'-',...
        'Color', co, 'Marker', 'none', 'LineWidth', 2);
    presw = sw_i;
    if sw_i ~= switchIdx(1)
        set(get(get(a(1),'Annotation'),'LegendInformation'),...
            'IconDisplayStyle','off');
    end
end
set(gca,'XLim', [time_vec(1), time_vec(end)]);
% plot_trimmingLine(time_vec(switchIdx)', task_vec(switchIdx), winIdx_vec, time_vec)
% plot_taskText(time_vec(switchIdx)', task_vec(switchIdx), task_name)
xticklabels({})
end
