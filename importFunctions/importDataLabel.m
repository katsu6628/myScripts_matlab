%import motive data from text file
function [dataMat, labels] = importDataLabel(FilePath, headerLine)
fId = fopen(FilePath);
for k = 1:headerLine
    fgetl(fId);
end
labels = strsplit(fgetl(fId), ',');
dataNumber = length(labels);
formatSpec = '%f';
for i = 1:dataNumber-1
    formatSpec = [formatSpec, ',%f'];
end
C = textscan(fId, formatSpec, 'Delimiter', '\n');
fclose(fId);
dataMat = cell2mat(C);
end