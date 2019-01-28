%calculate features of COP pertubation
%Input - COP matrix [ML, AP], Time_s
%Output - Vibration Amplitude matrix[MLaxis,APaxis,RD(Resultant-distance)]
%         COP Velocity matrix[MLaxis,APaxis,RD(Resultant-distance)]
%         Cop sway Area
%         Sway Angle (define 0°(Bthe positive AP axis)= the angle of the 
%         vector of sway velocity
function [swayAmp,swayVel,swayAng,swayArea] = CopFeatures(COP, Time_s)
COP_offset = COP - mean(COP);
ML = COP_offset(:,1);
AP = COP_offset(:,2);
RD = sqrt(AP.^2 + ML.^2);
timeDuration = Time_s(end) - Time_s(1);

swayAmp = [mean(abs(ML)), mean(abs(AP)),mean(RD)];
swayVel = [sum(abs(diff(ML)))/timeDuration,...
    sum(abs(diff(AP)))/timeDuration,...
    sum(sqrt((diff(AP).^2 + diff(ML).^2)))/timeDuration];
%APが負方向の速度を持つ場合は180°回転したベクトルを考える
diffAP_modified = diff(AP);
diffAP_modified(diff(AP)<0) = -diffAP_modified(diff(AP)<0);
diffML_modified = diff(ML);
diffML_modified(diff(AP)<0) = -diffML_modified(diff(AP)<0);
veltmp = [mean(diffML_modified) mean(diffAP_modified)];
swayAng = acos(dot([0 1], veltmp(1:2))/(norm([0 1])*norm(veltmp(1:2))))*180/pi;
if veltmp(1)>0
  swayAng = -swayAng;
end

tmp = zeros(length(ML)-1,1);
for n = 1:length(ML)-1
    tmp(n) = abs(AP(n+1)*ML(n) - AP(n)*ML(n+1));
end
swayArea = sum(tmp)/(2*timeDuration);
end
