%cohensD discription could change between researchers
%some use different algorithm between paired- and non-paired
function [x,y] = CohensD(data1, data2)
ave1 = mean(data1);
ave2 = mean(data2);
std1 = std(data1);
std2 = std(data2);
num1 = length(data1);
num2 = length(data2);

Cohens_top = ave1-ave2;
Cohens_bottom = sqrt(((num1-1)*std1^2 + (num2-1)*std2^2)/(num1+num2-2));
Cohens = Cohens_top/Cohens_bottom;
Cohens_ = Cohens * (1-(3/(4*(num1+num2)-9)));

x = Cohens;
y = Cohens_;
end