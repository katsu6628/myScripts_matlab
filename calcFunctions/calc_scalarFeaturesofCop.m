%function to calculate scalar features of body sway
function scalarFeat = calc_scalarFeaturesofCop(cop, time_s, psdParam)
sFreq = 1/mean(diff(time_s));
  [swayAmp, swayVel, swayAng, swayArea] = CopFeatures(cop, time_s);
  [pxx, f,pxxc] = calcPeriodogram(cop, sFreq);
  try
  [psdSum, psd_mat] = calcRangePSD...
      (pxx, f, psdParam.psd_binw, psdParam.psd_nbin, psdParam.psd_v);
  psdNorm = rangeSum(pxx(:,2),f,[0.01, 5], psdParam.psd_binw);
  psdSumNorm = psdSum / psdNorm;
  catch
      psdSum = nan(1, length(psdParam.psd_v));psdSumNorm =nan(1, length(psdParam.psd_v));
  end
 scalarFeat = [swayAmp, swayVel, swayAng, swayArea, psdSum, psdSumNorm];
end