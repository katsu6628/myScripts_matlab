%since one point includes all the windowLength_large, get the net region of one
%point including its influence
function relatedRegion = getThisRegionRelated_logic...
    (time_array, targetRegion, detectPercentage)
if isnan(targetRegion(2)); targetRegion(2) = targetRegion(1)+0.1;end
windowtime_logic = nan(size(time_array));
windowtime_logic(find(time_array < targetRegion(1))) = -1;
windowtime_logic(find(and(time_array >= targetRegion(1),...
    time_array<=targetRegion(2)))) = 1;
windowtime_logic(find(time_array > targetRegion(2))) = 2;
%AND regions of large Windows and targetRegion(event)
windowANDregion = nan(size(time_array));
windowANDregion(windowtime_logic==-1) = targetRegion(1);
windowANDregion(windowtime_logic==1) = time_array(windowtime_logic==1);
windowANDregion(windowtime_logic==2) = targetRegion(2);

windowANDregion_time = diff(windowANDregion, [],2);

%%%% make the subject TARGETREGION
% minimumTime = diff(targetRegion) * (1-detectPercentage);
%%%% make the subject LARGEWINDOW
windowLength = unique(diff(time_array, [], 2));
windowLength = unique(round(windowLength));
minimumTime = windowLength * (1-detectPercentage);

relatedRegion = zeros(size(windowANDregion_time));
relatedRegion(windowANDregion_time>=minimumTime) = 1;
relatedRegion(windowANDregion_time==0) = 0;
relatedRegion = logical(relatedRegion);
end