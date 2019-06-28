%this function deletes outliers defined by
%more than three scaled median absolute deviations(MAD)
function op_vec = deleteOutliers(ip_vec, time_vec, winLength)
window_border = time_vec(1):winLength:time_vec(end);
op_vec = nan(length(ip_vec), 1);
%divide them into windows with no overlap
for w = 1:length(window_border)-1
    win_logic = and(time_vec >= window_border(w), ...
        time_vec < window_border(w+1));
    win_vec = ip_vec(win_logic);
    TF = isoutlier(win_vec);
    %if the point is an outlier, substitute the former value 
    if any(TF)
    for everyOut = find(TF)
        if everyOut ~= 1
        win_vec(everyOut) = win_vec(everyOut-1);
        else
            thisIdx = find(win_logic);
            win_vec(everyOut) = ip_vec(thisIdx(1)-1);
        end
    end
    else
    end
    op_vec(win_logic) = win_vec;
end
end