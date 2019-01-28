%function to output csv file summarizing test result
%input - pMatrix and other information for output
function op_pMatrixCsv(allMatrix, condNames, featName, op_path, csvName_head, alpha_)
formatSpec = '%s,%f,%f,%f,%f,%f,,%f,%f,%f,,%f,%f,%f\n';
csvName = strcat(csvName_head,'-ttest-', featName, '.csv');
csvPath = strcat(op_path, csvName);
fid = fopen(csvPath, 'wt');
sheetHeader = [featName, ',two-sided test critical p-value:',...
    num2str(alpha_),'%,one-sided test critical p-value:', ...
    num2str(alpha_/2),'%,two-sided + left one-sided + right one-sided'];
fprintf(fid, '%s\n', sheetHeader);

for pivot_cond = 1:size(allMatrix, 1)
    bigger = strcat(condNames{pivot_cond}, '>');
    smaller = strcat(condNames{pivot_cond}, '<');
    pivotHeader = [condNames{pivot_cond},...
        ',two-sided Rejected, p-value,test-static,CohensD,unbiased CohensD,,',...
        bigger, ',p-value,test-static,,', smaller, ',p-value,test-static'];
    fprintf(fid, '%s\n', pivotHeader);
    for cond_i = 1:size(allMatrix,1)
        outputData = squeeze(allMatrix(pivot_cond, cond_i,:));
        fprintf(fid,formatSpec,condNames{cond_i},outputData);
    end
    fprintf(fid, '\n');
end
fclose(fid);
end
