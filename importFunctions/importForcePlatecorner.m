%function for reading motive output data
function [fpId, fpLocation_cell] =...
    importForcePlatecorner(motiveFilePath)
% import force plate location information in the first row
fId = fopen(motiveFilePath, 'r');
% read text one row by one from the head until forceplate info is done
fp_i = 1;
while 1
    tmp = fgetl(fId);
    if ~contains(tmp, 'ForcePlate')
        break
    end
    fpText_cell{fp_i} = tmp;
        fp_i = fp_i + 1;
end
fclose(fId);
% put fp corner info into cells 
fpNumber = length(fpText_cell);
fpId = cell(fpNumber, 1);
fpLocation_cell =  cell(fpNumber, 1);
for fp_i = 1:fpNumber
    tmp = textscan(fpText_cell{fp_i}, '%s%s', 'delimiter', '_');
    fpId{fp_i} = tmp{1};
    tmp = strsplit(tmp{2}{1}, ',');
    fpLocation = nan(4, 3);     %location Matrix [number of corners]x[xyz]
    for corner_i = 1:4
        fpLocation_vec = [str2double(extractAfter(...
            tmp{(corner_i-1)*3+1}, ['Corner', num2str(corner_i-1), ':XYZ']))...
            str2double(tmp{(corner_i-1)*3+2}), str2double(tmp{corner_i*3})];
        fpLocation(corner_i, :) = fpLocation_vec;
    end
    fpLocation_cell{fp_i} = fpLocation;
end
end