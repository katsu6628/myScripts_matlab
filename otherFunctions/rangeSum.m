%calculate sum of any range in vector
function y = rangeSum(data_y, data_x, range_v, binwidth)
queri = data_x(1):binwidth:data_x(end);
data_yq = interp1(data_x, data_y, queri);
range_logical = logical(myveccmp(queri, range_v));
y = sum(data_yq(range_logical));
end