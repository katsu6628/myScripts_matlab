%calculate cohen distance of two groups
function [Cohens,Cohens_,Cohens_paired] = CohensD(data1, data2)
ave1 = nanmean(data1);
ave2 = nanmean(data2);
std1 = nanstd(data1);
std2 = nanstd(data2);
num1 = length(data1(~isnan(data1)));
num2 = length(data2(~isnan(data2)));

Cohens_top = ave1-ave2;
Cohens_bottom = sqrt(((num1-1)*std1^2 + (num2-1)*std2^2)/(num1+num2-2));
Cohens = Cohens_top/Cohens_bottom;
%%%Cohens biased
Cohens_ = Cohens * (1-(3/(4*(num1+num2)-9)));

%%%%%
%%correction for paired groups
if num1~=num2
    
end
%the correlation coefficient of the paired datas
R= corrcoef(data1, data2);
r = R(1,2);
Cohens_paired = Cohens / (sqrt(2*(1-r)));
%%%%%
end
