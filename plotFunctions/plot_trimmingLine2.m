%plot trimming line referring the value of time(xAxis)
%the difference of this script and plot_trimmingLine.m is whether it refers
%index number or the x Value
%plot trimming line between tasks
function plot_trimmingLine2(task_vec, x_vec)
  switchX = [x_vec(find(diff(task_vec)))', length(task_vec)];
%plot trimming lines for each tasks
ylim_ = ylim;
for sw_i = switchX
  winIdx = find(sw_i==x_vec);
    if sw_i ~= switchX(end) && (abs(task_vec(winIdx)) ~= abs(task_vec(winIdx+1)))
        %task_vec(sw_i) > 0 || task_vec(sw_i+1) > 0)
        a = plot([sw_i, sw_i], ylim_, 'k--');
        text(sw_i, ylim_(2), num2str(x_vec(winIdx)), ...
            'HorizontalAlignment', 'Right', 'VerticalAlignment', 'top');
        set(get(get(a(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
    end
end

%beginning and the end
text(0, ylim_(2), num2str(x_vec(1)), ...
    'HorizontalAlignment', 'Left', 'VerticalAlignment', 'top');
% text(length(x_vec), ylim_(2), num2str(x_vec(end)), ...
%     'HorizontalAlignment', 'Right', 'VerticalAlignment', 'top');
end
