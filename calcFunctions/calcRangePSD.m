function [psdSum, psd_mat] = ...
    calcRangePSD(pxx, f, psd_binw, psd_nbin, psd_v)
%calculate range sum of PSD by input psd inforomation
  psd_mat = zeros(length(psd_v),psd_nbin);
  for n = 1:length(psd_v)
    psd_b = psd_v(n) - psd_binw * (psd_nbin-1)/2;
    psd_e = psd_v(n) + psd_binw * (psd_nbin-1)/2;
    psd_mat(n,:) = linspace(psd_b, psd_e,psd_nbin);
  end

  %calculate sum of interested range
  psdSum = zeros(size(psd_v));
  for n = 1:length(psd_v)
    psdSum(n) = ...
      rangeSum(pxx(:,2), f, psd_mat(n,:),psd_binw);
  end
end
