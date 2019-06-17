function switchIdx = plot_taskFeatures(feat_vec, task_vec, time_vec, ...
    winIdx_vec, task_name, color_)
  hold on
switchIdx = [find(diff(task_vec)); length(task_vec)]';
presw = 1;
xtickLabels_ = []; xticks_ = [];
%plot time series of probability
for sw_i = switchIdx
    %define the color of this task plot
    if task_vec(sw_i) > 0; co = color_; else; co = 'k';end
    plot(presw:sw_i, feat_vec(presw:sw_i, 1),...
        'Color', co, 'LineWidth', 2);
    presw = sw_i;
end
set(gca,'XLim', [1 length(feat_vec)]);
plot_trimmingLine(switchIdx, task_vec, winIdx_vec, time_vec)
plot_taskText(switchIdx, task_vec, task_name)
xticklabels({})
end
