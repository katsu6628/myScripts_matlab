%makes a table with statistical parameters
function paramTable = makeStatisticalParameterTable(data, varNames)
paramArray = [
    mean(data);
    var(data);
    std(data);
    median(data);
    prctile(data,25);
    prctile(data,75);
    prctile(data,75)-prctile(data,25)
    ];
paramTable = array2table(paramArray, 'VariableNames', varNames, ...
    'RowNames', {'mean', 'variance', 'standardDeviation', 'median', ...
    'prc25', 'prc75', 'prcVar'});
end
    