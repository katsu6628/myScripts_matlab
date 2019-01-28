function plot_statisticalBoxplot(DATA, pValueMatrix, condNames, ...
    featName,doubleStar_alpha,singleStar_alpha)

if any(~isnan(DATA(:)))
    %Make boxplot without asterisks
    boxplotErr(DATA, condNames, featName, 0);
    
    yLim_ = get(gca, 'YLim');
    [sigDiffLineX_mat, sigDiffLineY_mat] = ...
        getSigDiffLinePoints(pValueMatrix,get(gca,'XTick') ,yLim_, singleStar_alpha);
    
    ylim([min(yLim_) max([max(sigDiffLineY_mat(:))+diff(yLim_)/60*5, yLim_])]);
    
    delta_y = diff(yLim_)/60;
    plot_significantDiffAsterisks(pValueMatrix, sigDiffLineY_mat, sigDiffLineX_mat,...
        delta_y, doubleStar_alpha);
    
end
end
