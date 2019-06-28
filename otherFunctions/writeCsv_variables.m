%% Output csv with data and it's labels
function writeCsv_variables(opPath, csvName, data, labels)
csvPath = [opPath, csvName];
fl = fopen(csvPath, 'w');
fprintf(fl, '%s,', labels{:}); fprintf(fl, '\n');
fclose(fl);
dlmwrite(csvPath, data, '-append');
end
