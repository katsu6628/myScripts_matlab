%Run a t-test for matrix and output a  csv Sheet/boxplot figure
%Input - Data matrix(trial * condition you want to compare)
%         cond1 cond2 cond3 ...
%trial1 (                    )
%trial2 (                    )
%trial3 (                    )
%Output - [struct] result of t-test, excelsheet
function [pValueMatrix_both,pValueMatrix_right,pValueMatrix_left,...
    pValueMatrix_mult, allMatrix] = testAnalysis(DATA, parametricDet,...
    pairedDet, singleStar_alpha)

if all(isnan(DATA(:)))
    pValueMatrix_both=[];
    pValueMatrix_right=[];
    pValueMatrix_left=[];
    pValueMatrix_mult=[];
    allMatrix = [];
    return;
end

%% do test depending on parametric or non-parametric
if parametricDet
        [pValueMatrix_both,pValueMatrix_right,pValueMatrix_left,allMatrix] =...
        my_ttest(DATA, singleStar_alpha, pairedDet);
    
    [~,~,stats] = anova1(DATA,[],'off');
else
    [pValueMatrix_both,pValueMatrix_right,pValueMatrix_left,allMatrix] =...
        my_wilcoxon(DATA, singleStar_alpha, pairedDet);
    
    % hypothesis_n = length(nchoosek(size(DATA,2),2));
    % pValueMatrix_both = bonferroniCorrection(pValueMatrix_both, size(DATA, 2));
    % pValueMatrix_right = bonferroniCorrection(pValueMatrix_right, size(DATA, 2));
    % pValueMatrix_left = bonferroniCorrection(pValueMatrix_left, size(DATA, 2));
    
    %kruskalwallis - method
    [~,~,stats] = kruskalwallis(DATA,[],'off');
end

pValueMatrix_mult = zeros(size(DATA,2),size(DATA,2));
% [multiple compare Tukey method or steel-dwass
[C, ~,~,~] = multcompare(stats,'Display','off');
for i = 1:size(C, 1)
    pValueMatrix_mult(C(i,1),C(i,2)) = C(i,6);
    pValueMatrix_mult(C(i,2),C(i,1)) = C(i,6);
end
end
