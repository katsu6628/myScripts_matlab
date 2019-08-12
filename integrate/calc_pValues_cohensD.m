%define the baseline of multiple participant time-series data and do a 
%test for each time window
function [pValues_ ,cohensD_, baseline_vec] = ...
    calc_pValues_cohensD(feat_array, baselineLogic)
% 
% if max(NBackCvNBackT_array(:))<1.0
%     baseline_vec = ones(1,size(NBackCvNBackT_array,2))*0.5;
% else
    baseline_vec = median(feat_array(baselineLogic,:),1);
% baseline_vec = prctile(feat_array(baselineLogic,:),25);
% baseline_vec = prctile(feat_array(baselineLogic,:),40);
% baseline_vec = mean(feat_array(baselineLogic,:),1);
% end

singleStar_alpha = 0.05;
pairedDet = true;

pValues_ = nan(size(feat_array,1),1);
cohensD_ = nan(size(feat_array,1),1);
for movie_t = 1:size(feat_array,1)
    NBackCvNBackT_t = feat_array(movie_t, :);
    
    compareArray = [baseline_vec', NBackCvNBackT_t'];
    [pValueMatrix_both,pValueMatrix_right,pValueMatrix_left,allMatrix] =...
        my_wilcoxon(compareArray, singleStar_alpha, pairedDet);
    pValues_(movie_t) = pValueMatrix_right(2,1); %* size(pn_array,1);
    
    [~,~,cohensD_(movie_t)] = CohensD(compareArray(:,2),compareArray(:,1));
end
end
