% plot trimming additional line for graphs to distinguish tasks
function plot_TrimmingLine(x, sw_vec, ylim_, taskInfo)
presw_i = 1;
for sw_i = sw_vec
    plot([x(sw_i) x(sw_i)], ylim_, 'k--')
    % change position for even/odd tasks
    if rem(find(sw_vec==sw_i),2)==1
        vertPos = 'top';
    else
        vertPos = 'bottom';
    end
    text(x(presw_i), ylim_(1), taskInfo(sw_vec==sw_i, :),...
        'HorizontalAlignment', 'left', 'VerticalAlignment', vertPos);
    presw_i = sw_i;
end
end