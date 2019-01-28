 %Output a boxplot from data matrix
%Output scatter plot for all data
%Input - matrix(trial * condition you want to compare)
%         cond1 cond2 cond3 ...
%trial1 (                    )
%trial2 (                    )
%trial3 (                    )
%Output - figure
function boxplotErr(DATA, condNames, featName, scatter_det)
%if no instructuions, scatter plot is ON;
if nargin == 3
    scatter_det = 1;
end
h=boxplot(DATA, 'labels', condNames);
hold on
%scatter each data
if scatter_det
    for i = 1:size(DATA,2)
        tmp = ones(size(DATA,1),1) * i;
        scatter(tmp, DATA(:,i), 'k');
    end
end
ylabel(featName);
h = gca;
% h.XTickLabelRotation = -20;
end
