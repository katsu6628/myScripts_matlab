function plot_significantDiffAsterisks(pValueMatrix, ...
    sigDiffLineY_mat, sigDiffLineX_mat, ...
    delta_y, doubleStar_alpha)

for pivot_cond = 1:size(sigDiffLineX_mat,2)-1
    %Plot the bars
    for cond_i = pivot_cond+1:size(sigDiffLineX_mat,2)
        if sigDiffLineX_mat(pivot_cond, cond_i) == -1
            continue
        end
        barX1 = sigDiffLineX_mat(pivot_cond, cond_i);
        barX2 = sigDiffLineX_mat(cond_i, pivot_cond);
        barY = sigDiffLineY_mat(pivot_cond, cond_i);
        plot([barX1 barX2], [barY barY], 'k', 'LineWidth', 1);
        plot([barX1 barX1],...
            [barY barY-delta_y],'k','LineWidth',1);
        plot([barX2 barX2],...
            [barY barY-delta_y],'k','LineWidth',1);
        %plot asterisks in the middle of bars
        if pValueMatrix(pivot_cond, cond_i) <= doubleStar_alpha
            text(mean([barX1 barX2]), barY-delta_y, '**', 'VerticalAlignment',...
                'bottom','horizontalAlignment', 'center','Color', 'r',...
                'Fontsize', 25);
        else
            text(mean([barX1 barX2]), barY-delta_y, '*', 'VerticalAlignment',...
                'bottom','horizontalAlignment', 'center','Fontsize', 25);
        end
    end
end
end