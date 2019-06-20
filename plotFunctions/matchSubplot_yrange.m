%scrpit to unite all yrange of subplots in one figure
function matchSubplot_yrange(fig)
figure(fig)
allaxis = flip(findall(fig, 'type', 'axes'));
ylim_array = [];
for axis_idx = 1:length(allaxis)
    subplot(allaxis(axis_idx));
    ylim_array(axis_idx, :) = ylim;
  end
  ylim_ = [min(ylim_array(:)), max(ylim_array(:))];
  for axis_idx = 1:length(allaxis)
    subplot(allaxis(axis_idx))
    ylim(ylim_)
  end
end

