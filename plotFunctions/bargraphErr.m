%Output a bargraph with error bars from data and error values
%Output - figure
function b = bargraphErr(data, errhigh, errlow, condNames, featName, xticks_)
if nargin == 1
    errhigh = 0; errlow = 0; condNames = ''; featName = '';
end
if nargin < 6
    xticks_ = 1:length(data);
end

b = bar(xticks_, data);
xticks(xticks_);
set(gca, 'XTickLabel', condNames);
hold on
er = errorbar(xticks_, data(:), errlow, errhigh);
er.Color = [0 0 0];
er.LineStyle = 'none';

ylabel(featName);
end