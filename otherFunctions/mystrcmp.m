function cmpLogic = mystrcmp(baseString_cell, targetString_cell)
if iscell(baseString_cell)
cmpLogic = zeros(size(baseString_cell));
else
    cmpLogic = [];
end
if ~iscell(targetString_cell)
    targetString_cell = {targetString_cell};
end
for idx = 1:length(targetString_cell)
   targetString = targetString_cell{idx};
   cmpLogic(strcmp(baseString_cell, targetString)) = idx;
end

end
