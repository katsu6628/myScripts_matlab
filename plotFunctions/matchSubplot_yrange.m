%scrpit to unite all yrange of subplots in one figure
function matchSubplot_yrange(fig, axisArray)
figure(fig)
allaxis = flip(findall(fig, 'type', 'axes'));

if nargin == 1
    axisArray = [length(allaxis), 1];
end


%get ylim of each graph at this point
ylim_array = [];
for axis_idx = 1:length(allaxis)
    subplot(allaxis(axis_idx));
    for ax_lr = 1:length(allaxis(axis_idx).YAxis)
        ylim_array(ax_lr, axis_idx, :) =...
            allaxis(axis_idx).YAxis(ax_lr).Limits;
    end
end

%modify ylim to make them match
ylim_ = nan(axisArray(2), length(allaxis(axis_idx).YAxis), 2);
for sub_col = 1:axisArray(2)
    thisCol_subIdx = ...
        sub_col:axisArray(2):axisArray(2)*(axisArray(1)-1)+sub_col;
    for ax_lr = 1:length(allaxis(axis_idx).YAxis)
        tmp = squeeze(ylim_array(ax_lr, :,:));
        tmp = tmp(thisCol_subIdx,:);
        ylim_(sub_col, ax_lr, :) = [min(tmp(:)), max(tmp(:))];
    end
end

for sub_col = 1:axisArray(2)
    thisCol_subIdx = ...
        sub_col:axisArray(2):axisArray(2)*(axisArray(1)-1)+sub_col;
    for axis_idx = thisCol_subIdx
        for ax_lr = 1:length(allaxis(axis_idx).YAxis)
            allaxis(axis_idx).YAxis(ax_lr).Limits =...
                squeeze(ylim_(sub_col, ax_lr,:));
        end
    end
end
