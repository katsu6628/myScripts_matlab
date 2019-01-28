%function for reading motive output data
function [fpId, fpLocation_cell] =...
    importForcePlatecorner2(motiveFilePath)
% import force plate location information in the first row
fId = fopen(motiveFilePath, 'r');
% read text one row by one from the head until for                                             ceplate info is done
fp_i = 0;
while 1
    fpLabelstr = fgetl(fId);
    if ~contains(fpLabelstr, 'ForcePlate')
        break
    end
    fp_i = fp_i + 1;
    eachLabels = split(fpLabelstr, ',');
    tmp = textscan(eachLabels{1}, '%s%s', 'delimiter', '_');
    fpId{fp_i} = tmp{1};
    fpDatastr = fgetl(fId);
    fpDataCell = split(fpDatastr, ',');
    fpLocation = nan(4, 3);
    for corner_i = 1:4
        fpLocation_vec = [str2double(fpDataCell{(corner_i-1)*3+1}), str2double(fpDataCell{(corner_i-1)*3+2}),str2double(fpDataCell{(corner_i-1)*3+3})];
        fpLocation(corner_i, :) = fpLocation_vec;
    end
    fpLocation_cell{fp_i} = fpLocation;
end
fclose(fId);
end
