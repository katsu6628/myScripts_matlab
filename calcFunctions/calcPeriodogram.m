function [pxx, f,pxxc] = calcPeriodogram(data, fs)
[pxx, f,pxxc] = periodogram(data, hanning(length(data)), length(data), fs);
end