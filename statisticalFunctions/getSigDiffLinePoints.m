%Get the [x,y]Points for all condition*condition that have
%significant difference according to pValueMatrix
%Input - pValueMatrix: [condition*condition] matrix that has pValues
%Output -- sigDiffLineX_mat, sigDiffLineY_mat: [condition*condition] Matrix
%that consists of [x,y] Points to draw lines and asterisk for significant
%difference pairs
function [sigDiffLineX_mat, sigDiffLineY_mat] = ...
    getSigDiffLinePoints(pValueMatrix, xtickPoints, yLim_, singleStar_alpha)
%Find (X,Y) to draw a significant difference Line and asterisks
xDelta = mean(diff(xtickPoints)) * 0.01;
%make a matrix with all the xaxis of the bar for each condition*condition
sigDiffLineX_mat = zeros(size(pValueMatrix));
for pivot_cond = 1:size(pValueMatrix,2)
    star_ind = pValueMatrix(pivot_cond,:) <= singleStar_alpha;
%     x_candi = linspace(pivot_cond-xDelta, pivot_cond+xDelta,sum(star_ind));
    x_candi = linspace(xtickPoints(pivot_cond)-xDelta, ...
        xtickPoints(pivot_cond)+xDelta,sum(star_ind));

    %If there pValue is more than singleStar_alpha, no bar is needed
    sigDiffLineX_mat(pivot_cond, ~star_ind) = -1;
    %for the opponent in the right side of the pivot
    %Get them the most right xaxis candidate for the bar
    right_cnt = 0;
    if pivot_cond+1 <= length(star_ind)
        for star_rightindex = find(star_ind(pivot_cond+1:end))
            sigDiffLineX_mat(pivot_cond, star_rightindex+pivot_cond) = x_candi(end-right_cnt);
            right_cnt = right_cnt+1;
        end
    end
    %for the opponent in the left side of the pivot
    %Get them the left side of candidate
    left_cnt = 0;
    if pivot_cond-1 >= 1
        for star_leftindex = find(star_ind(1:pivot_cond-1))
            sigDiffLineX_mat(pivot_cond, star_leftindex) = x_candi(end-right_cnt-left_cnt);
            left_cnt = left_cnt+1;
        end
    end
end

%Define them the yaxis candidate so that there are no overlaying
numBars = sum(sum(pValueMatrix < singleStar_alpha))/2;
y_candi= max(yLim_) + diff(yLim_)/60*4* linspace(0,numBars-1,numBars);
%make a matrix with all the Yaxis of the bar for each condition*condition
sigDiffLineY_mat = zeros(size(pValueMatrix));
topLine = 0;
for pivot_cond = 1:size(pValueMatrix,2)
    for cond_i = pivot_cond+1:size(pValueMatrix,2)
        if sigDiffLineX_mat(pivot_cond, cond_i) == -1
            sigDiffLineY_mat(pivot_cond, cond_i) = -1;
        elseif topLine == 0
            sigDiffLineY_mat(pivot_cond, cond_i) = y_candi(1);
            topLine = 1;
        elseif topLine >= 1
            %Run a roop for every Line occupied to check if there is space
            for checkLine = 1:topLine
                [checkTarget_pcond, checkTarget_cond] =...
                    find(sigDiffLineY_mat == y_candi(checkLine));
                overlayDet = 0;
                %check if there is an overlay
                for check_i = 1:length(checkTarget_pcond)
                    x1 = checkTarget_pcond(check_i);
                    x2 = checkTarget_cond(check_i);
                    overlayDet = overlayDet || ...
                        or(x1 < pivot_cond && pivot_cond < x2, ...
                        x1 < cond_i && cond_i < x2);
                    overlayDet = overlayDet || ...
                        or(pivot_cond < x1 && x1 < cond_i, ...
                        pivot_cond < x2 && x2 < cond_i);
                end
                %If there is space put the line on this height
                if ~overlayDet
                    sigDiffLineY_mat(pivot_cond, cond_i) = y_candi(checkLine);
                    break
                end
            end
            %If there were no space in other heights, make new height
            if sigDiffLineY_mat(pivot_cond, cond_i) == 0
                topLine = topLine + 1;
                sigDiffLineY_mat(pivot_cond, cond_i) = y_candi(topLine);
            end
        end
    end
end
end