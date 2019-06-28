%calculates the static variables of ttests
%along with cohens effect size
%Input - [vec]data1, [vec]data2 (the one you want to compare),alpha, typeofTail
%Output - [h,p,ci,stats,cohens, cohens unbiased]
function [h,p,ci,stats,cohens,cohens_, cohens_pair] =...
    ttestCohens(data1, data2, alpha, tail, pairedDet)
if pairedDet
    [h,p,ci,stats] = ttest(data1,data2,'Alpha',alpha, 'Tail', tail);
else
    [h,p,ci,stats] = ttest2(data1,data2,'Alpha',alpha, 'Tail', tail);
end
[cohens, cohens_, cohens_pair] = CohensD(data1, data2);
end
