function fig_Events_Detection(pnArray,time_vec, pValues_,pn_baseper, ...
    cohensD_, integratedFeat)
%box plot of all subject's p_n(Individual affective profile)
ax1 = subplot(4,1,1);hold on;
% baseAndpnArray = [[pn_baseper; nan(size(pnArray,1)-length(pn_baseper),1)],...
%     [pnArray; nan(length(pn_baseper)-size(pnArray,1),size(pnArray,2))]];

baseAndpnArray = [[pn_baseper; nan(size(pnArray,1)-length(pn_baseper),1)],...
    [pnArray; nan(length(pn_baseper)-size(pnArray,1),size(pnArray,2))]];

xlabels_ = cellstr(num2str(time_vec));
labelLogic = false(size(pnArray,2),1);
labelLogic(1:round(length(xlabels_)/10):length(xlabels_)) = true;
xlabels_(~labelLogic) ={''};
xlabels_b = {'base', xlabels_{:}}';
% boxplot(baseAndpnArray, 'Positions', [time_vec(1) - mean(diff(time_vec))*2; time_vec],...
%      'Colors', 'k');
% xlabel('Time (s)');
xlim([time_vec(1)- mean(diff(time_vec))*3, time_vec(end)]);
ylim([min(pnArray(:)), max(pnArray(:))]);
%color boxplot
color_ = ['r', repmat(['b'], 1, length(time_vec))];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),color_(j),'FaceAlpha',.4);
end

%pValue of MAP
subplot(4,1,2);
plot_semilogPvalues(time_vec, pValues_);
xlim([time_vec(1)- mean(diff(time_vec))*3, time_vec(end)]);


%get xtick from subplot2 and transfer to subplot1
xtick_ = xticks;xticklabels_ = xticklabels;
ax1.XTick = [time_vec(1)-mean(diff(time_vec))*2, xtick_]; 
ax1.XTickLabel = {'base', xticklabels_{:}};
ax1.XTickLabelRotation = 90;

%cohendD of MAP
subplot(4,1,3);
plot(time_vec, cohensD_, 'b');hold on;
plot(xlim, [0.5, 0.5], 'k--');
plot(xlim, [0.8, 0.8], 'r--');
xlim([time_vec(1)- mean(diff(time_vec))*3, time_vec(end)]);

%map
subplot(4,1,4); hold on;
plot_coloredBarGraph(time_vec, integratedFeat)
xlim([time_vec(1)- mean(diff(time_vec))*3, time_vec(end)]);
%pvalue line
add_significant(pValues_ < 0.01, time_vec, max(integratedFeat), 'r');
add_significant(cohensD_ > 0.5, time_vec, max(integratedFeat)*1.1, 'b');
end