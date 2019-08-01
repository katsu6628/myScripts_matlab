function fig_Events_Detection(pnArray,xTime_s, pValues_,pn_baseper, ...
    cohensD_, integratedFeat)
%box plot of all subject's p_n(Individual affective profile)
subplot(4,1,1);hold on;

baseAndpnArray = [[pn_baseper; nan(size(pnArray,1)-length(pn_baseper),1)],...
    [pnArray; nan(length(pn_baseper)-size(pnArray,1),size(pnArray,2))]];

xlabels_ = cellstr(num2str(xTime_s));
labelLogic = false(size(pnArray,2),1);
labelLogic(1:10:length(xlabels_)) = true;
xlabels_(~labelLogic) ={''};
xlabels_b = {'base', xlabels_{:}}';
boxplot(baseAndpnArray, 'Positions', [xTime_s(1) - mean(diff(xTime_s))*2; xTime_s],...
    'Labels', xlabels_b, 'LabelOrientation', 'inline', 'Colors', 'k');
ylabel('Individual Affective Profiles');
% xlabel('Time (s)');
xlim([xTime_s(1)- mean(diff(xTime_s))*3, xTime_s(end)]);
ylim([0, max(pnArray(:))]);
%color boxplot
color_ = ['r', repmat(['b'], 1, length(xTime_s))];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),color_(j),'FaceAlpha',.4);
end

%pValue of MAP
subplot(4,1,2);
plot_semilogPvalues(xTime_s, pValues_);
xlim([xTime_s(1)- mean(diff(xTime_s))*3, xTime_s(end)]);
%cohendD of MAP
subplot(4,1,3);
plot(xTime_s, cohensD_, 'b');hold on;
plot(xlim, [0.5, 0.5], 'k--');
plot(xlim, [0.8, 0.8], 'r--');
xlim([xTime_s(1)- mean(diff(xTime_s))*3, xTime_s(end)]);
%map
subplot(4,1,4); hold on;
h = bar(xTime_s, integratedFeat, 'FaceColor', 'flat');
xlim([xTime_s(1)- mean(diff(xTime_s))*3, xTime_s(end)]);
color_border =...
    linspace(min(integratedFeat), max(integratedFeat),100);
colormap_ = cool(length(color_border));
[~,a] = min(abs(color_border - integratedFeat),[],2);

ch = get(h, 'Children');
set(h, 'CData', colormap_(a,:));
set(ch,'CDataMapping','direct');

%pvalue line
add_significant(pValues_ < 0.01, xTime_s, max(integratedFeat), 'r');
add_significant(cohensD_ > 0.8, xTime_s, max(integratedFeat)*1.1, 'b');
end