%calculate transition features of COP pertubation from one condition to
%another condition, input the index of transition
%Input - COP matrix[ML, AP], logical vector of Condition for each index
%                                                              
%Output - COP transition vector[ML, AP] 
%         COP transition vector norm
%         COP transition vector angle
function [transVec,transAmp,transAng] = calc_transVector(cop_former, cop_latter)
transVec = mean(cop_latter) - mean(cop_former);
transAmp = norm(transVec, 2);
tmpCos = dot([0 1], transVec)/(norm([0 1])*norm(transVec));
transAng = acos(tmpCos)*180/pi;
if transVec(1) > 0
  transAng = -transAng;
end
end
