function cmpLogic = strcmp_mult(baseString_cell, targetString_cell)
cmpLogic = false(length(baseString_cell), 1);

for idx = 1:length(targetString_cell)
   targetString = targetString_cell{idx};
   cmpLogic = or(cmpLogic, strcmp(baseString_cell, targetString));
end

end