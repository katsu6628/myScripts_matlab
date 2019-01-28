% define pre, post Cop as 5 seconds before/after trigger
function transVector = calc_vectorFeaturesofCop(fpCop, time_s, triggerIndex, psdParamaters)
%define pre features
preCop_startTime = time_s(triggerIndex) - 1.5;
tmp = find(time_s > preCop_startTime);
preCop_startIndex = tmp(1);
preCop_endIndex = triggerIndex - 1;
preCop = fpCop(preCop_startIndex:preCop_endIndex, :);
preTime = time_s(preCop_startIndex:preCop_endIndex);
%define post features
postCop_endTime = time_s(triggerIndex) + 5;
tmp = find(time_s > postCop_endTime);
if isempty(tmp)
    postCop_endIndex = length(time_s);
else
    postCop_endIndex = tmp(1);
end
postCop = fpCop(triggerIndex:postCop_endIndex, :);
postTime = time_s(triggerIndex:postCop_endIndex);
%calculate the features
[transVec,transAmp,transAng]  = calc_transVector(preCop, postCop);
transVector = [transVec,transAmp,transAng, ...
    calc_scalarFeaturesofCop(postCop, postTime, psdParamaters) - ...
    calc_scalarFeaturesofCop(preCop, preTime, psdParamaters)];
end