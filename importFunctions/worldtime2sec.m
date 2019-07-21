%% Function to convert hh:mm:ss style time into seconds
function worldtime_s = worldtime2sec (worldtime)
%split hh:mm:ss into cells
worldtime_cell= textscan(char(worldtime), '%s %s %s', 'Delimiter', ':');
howMany = sum(~cellfun(@isempty, worldtime_cell));
worldtime_s = 0;
for idx = 1:howMany
    worldtime_s = worldtime_s + ...
        str2double(worldtime_cell{idx}{1})*power(60, howMany-idx);
end
end
