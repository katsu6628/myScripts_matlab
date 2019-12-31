function plot_coloredBarGraph(time_s, feat_vec)
h = bar(time_s, feat_vec, 1,'FaceColor', 'flat');%,...
%     'EdgeColor',[0.3, 0.3, 0.3],'LineWidth',0.01);
xlim([time_s(1), time_s(end)]);
color_border = linspace(min(feat_vec), max(feat_vec),100);
% color_border = linspace(0, 1,100);
% color_border = [zeros(1,50), ones(1,50)];
colormap_ = cool(length(color_border));
% 
% colormap_(1,:) = [0.00,     0.00,    0.00 ];
% colormap_(51,:) = [0.93,     0.00,    0.00 ];
[~,a] = min(abs(color_border - feat_vec),[],2);

ch = get(h, 'Children');
set(h, 'CData', colormap_(a,:));
set(ch,'CDataMapping','direct');
end