%scrpit to unite all yrange of subplots in one figure
function matchSubplot_yrange(fig)
figure(fig)
allaxis = flip(findall(fig, 'type', 'axes'));
ylim_array = [];
for axis_idx = 1:length(allaxis)
    subplot(allaxis(axis_idx));
    for ax_lr = 1:length(allaxis(axis_idx).YAxis)
        ylim_array(ax_lr, axis_idx, :) =...
            allaxis(axis_idx).YAxis(ax_lr).Limits;
    end
end

ylim_ = nan(length(allaxis(axis_idx).YAxis), 2);
for ax_lr = 1:length(allaxis(axis_idx).YAxis)
    tmp = squeeze(ylim_array(ax_lr, :,:));
    ylim_(ax_lr, :) = [min(tmp(:)), max(tmp(:))];
end

for axis_idx = 1:length(allaxis)
    subplot(allaxis(axis_idx))
    for ax_lr = 1:length(allaxis(axis_idx).YAxis)
        allaxis(axis_idx).YAxis(ax_lr).Limits = ylim_(ax_lr,:);
    end
end
end

