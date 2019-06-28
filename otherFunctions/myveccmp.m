function compare_index = myveccmp(cmpVec, hitVec)
compare_index = zeros(1, length(cmpVec));
for k = 1:length(hitVec)
    compare_index(find(cmpVec == hitVec(k))) = k;
end
end