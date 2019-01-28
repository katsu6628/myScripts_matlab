% make a matrix with different row of logical type
% size of dataArray and targetLogical must be the same
function targetArray = makeTargetArray(dataArray, targetLogical)
uniqueLogicals = unique(targetLogical, 'sort')';
targetCell = cell(1, length(uniqueLogicals));
maxLength = 0;
for k = uniqueLogicals
    k_logical = targetLogical==k;
    thisLength = sum(sum(k_logical));
    if maxLength < thisLength
        maxLength = thisLength;
    end
end
for k = uniqueLogicals
    k_logical = targetLogical==k;
    thisLength = sum(sum(k_logical));
    targetCell{find(uniqueLogicals==k)} = ...
        [dataArray(k_logical); nan(maxLength-thisLength, 1)];
end

targetArray = cell2mat(targetCell);
end