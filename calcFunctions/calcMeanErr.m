%Calculate standard error values and mean for parametric data Array
%Input - matrix(trial * condition you want to compare)
%         cond1 cond2 cond3 ...
%trial1 (                    )
%trial2 (                    )
%trial3 (                    )
function [meanVec, stdError] = calcMeanErr(DATA)
meanVec = nanmean(DATA);
stdError = nanstd(DATA)/sqrt(size(DATA, 1));
end