%Run a t-test for matrix and output a  csv Sheet
%Input - matrix(trial * condition you want to compare)
%         cond1 cond2 cond3 ...
%trial1 (                    )
%trial2 (                    )
%trial3 (                    )
%Output - [struct] result of t-test, csvsheet
function [pValueMatrix_both,pValueMatrix_right,pValueMatrix_left,allMatrix]...
    = my_ttest(DATA, alpha, pairedDet)
%make a Matrix that has all the p-value of t-test[condition * conditions]
pValueMatrix_both = zeros(size(DATA,2),size(DATA,2));
pValueMatrix_right = zeros(size(DATA,2),size(DATA,2));
pValueMatrix_left= zeros(size(DATA,2),size(DATA,2));
allMatrix = nan(size(DATA,2), size(DATA,2),11);
%Run a test for all pivot_condition vs other condition
for pivot_cond = 1:size(DATA,2)
    %do the test against every other conditions
    for cond_i = 1:size(DATA,2)
        [h,p,ci,stats,co,co_] =...
            ttestCohens(DATA(:,pivot_cond),DATA(:,cond_i),alpha,'both', pairedDet);
        outputData = [h,p,stats.tstat,co,co_];
        pValueMatrix_both(pivot_cond, cond_i) = p;
        [h,p,ci,stats,~,~] = ...
            ttestCohens(DATA(:,pivot_cond),DATA(:,cond_i),alpha/2,'right', pairedDet);
        outputData = [outputData, h,p,stats.tstat];
                pValueMatrix_right(pivot_cond, cond_i) = p;
        [h,p,ci,stats,~,~] =...
            ttestCohens(DATA(:,pivot_cond),DATA(:,cond_i),alpha/2,'left', pairedDet);
        outputData = [outputData, h,p,stats.tstat];
                pValueMatrix_left(pivot_cond, cond_i) = p;
        allMatrix(pivot_cond, cond_i, :) = outputData;
    end
end
end
