function cmpLogic = strcmp_mult(baseString_cell, targetString_cell)
cmpLogic = zeros(size(baseString_cell));

for idx = 1:length(targetString_cell)
   targetString = targetString_cell{idx};
   cmpLogic(strcmp(baseString_cell, targetString)) = idx;
end

end
