function plot_statisticalBoxplot_fromCell(pMatrix_cell, targetArray_cell, ...
    input_head, testTypeLabel, Label_cell, singleStar_alpha, doubleStar_alpha,...
    opDir_cell, P1)
if size(pMatrix_cell, 1) <= 4
    subplot_row = 2;
    subplot_col = 2;
else
    subplot_row = 2;
    subplot_col = 3;
end
subidx = 1;
figidx = 0;
% plot subplot for every features in the cell
for features_i = 1:size(pMatrix_cell, 1)
    featName = Label_cell{features_i};
    targetArray = targetArray_cell{features_i};
    if ~any(targetArray(:))
        continue
    end
    if subidx == 1
        figidx = figidx + 1;
        fig((figidx-1)*4 + 1) =  figure('Position', P1);
        fig((figidx-1)*4 + 2) = figure('Position', P1);
        fig((figidx-1)*4 + 3) =  figure('Position', P1);
        fig((figidx-1)*4 + 4) = figure('Position', P1);
    end
    
    % static feature of visual task plot parametric and non parametric graph
    figure(fig((figidx-1)*4 + 1));
    subplot(subplot_row, subplot_col,subidx);
    pValue_bothP = pMatrix_cell{features_i, 1};
    plot_statisticalBoxplot(targetArray, pValue_bothP, testTypeLabel,...
        featName, doubleStar_alpha, singleStar_alpha);
    title([input_head, '-', featName, '-Parametric'])
    set(gca, 'XTickLabel', testTypeLabel);
    
    figure(fig((figidx-1)*4 + 2));
    subplot(subplot_row, subplot_col,subidx);
    pValue_multP = pMatrix_cell{features_i, 2};
    plot_statisticalBoxplot(targetArray, pValue_multP, testTypeLabel,...
        featName, doubleStar_alpha, singleStar_alpha);
    title([input_head, '-', featName, '-multiParametric'])
    set(gca, 'XTickLabel', testTypeLabel);
    
    figure(fig((figidx-1)*4 + 3));
    subplot(subplot_row, subplot_col,subidx);
    pValue_bothNP = pMatrix_cell{features_i, 4};
    plot_statisticalBoxplot(targetArray, pValue_bothNP, testTypeLabel,...
        featName, doubleStar_alpha, singleStar_alpha);
    title([input_head, '-', featName, '-NonParametric'])
    set(gca, 'XTickLabel', testTypeLabel);
    
    figure(fig((figidx-1)*4 + 4));
    subplot(subplot_row, subplot_col,subidx);
    pValue_multNP = pMatrix_cell{features_i, 5};
    plot_statisticalBoxplot(targetArray, pValue_multNP, testTypeLabel,...
        featName, doubleStar_alpha, singleStar_alpha);
    title([input_head, '-', featName, '-multiNonParametric'])
    set(gca, 'XTickLabel', testTypeLabel);
    
    if features_i == length(Label_cell) || subidx == 6
        saveName = [input_head, num2str(figidx)];
        mySaveFig(opDir_cell{1}, saveName, fig((figidx-1)*4 + 1), true, true);
        mySaveFig(opDir_cell{2}, saveName, fig((figidx-1)*4 + 2), true, true);
        mySaveFig(opDir_cell{3}, saveName, fig((figidx-1)*4 + 3), true, true);
        mySaveFig(opDir_cell{4}, saveName, fig((figidx-1)*4 + 4), true, true);
        subidx = 0;
    end
    subidx = subidx + 1;
    
    %save csv
    allMatrix_P = pMatrix_cell{features_i, 3};
    op_pMatrixCsv(allMatrix_P, testTypeLabel, featName, opDir_cell{1},...
        input_head, singleStar_alpha);
    allMatrix_NP = pMatrix_cell{features_i, 6};
    op_pMatrixCsv(allMatrix_NP, testTypeLabel, featName, opDir_cell{3},...
        input_head, singleStar_alpha);
end
end
