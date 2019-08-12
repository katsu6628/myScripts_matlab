function plot_coloredBarGraph(time_s, feat_vec)
h = bar(time_s, feat_vec, 1,'FaceColor', 'flat');%,...
%     'EdgeColor',[0.3, 0.3, 0.3],'LineWidth',0.01);
xlim([time_s(1)- mean(diff(time_s))*3, time_s(end)]);
color_border =...
    linspace(min(feat_vec), max(feat_vec),100);
colormap_ = cool(length(color_border));
[~,a] = min(abs(color_border - feat_vec),[],2);

ch = get(h, 'Children');
set(h, 'CData', colormap_(a,:));
set(ch,'CDataMapping','direct');
end