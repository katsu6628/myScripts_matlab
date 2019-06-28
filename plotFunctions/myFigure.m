function fig= myFigure(posDet, figRatio)
if nargin == 0
    posDet = 0;
end
if nargin == 1
    figRatio = 0;
end
%define figure size by
%posDet 1 - full screen
%       2 - half screen
%       4 - quarter screen
%       8 - 1/8 screen
%       0 - left corner of screen
P1 = [0, 0, 1920, 1080];
P2 = P1; P2(4) = P2(4)/2;
P4 = P2; P4(4) = P4(4)/2;
P8 = P4; P8(4) = P8(4)/2;
P0 = P1; P0([3,4]) = P0([3,4])/2;
switch posDet
    case 1
        P = P1;
    case 2
        P = P2;
    case 4
        P = P4;
    case 8
        P = P8;
    case 0
        P = P0;
end
% modify figure size by ratio
if figRatio ~= 0
    if P(3) <= P(4)
        P(4) = P(3) * figRatio(2)/figRatio(1);
    end
    if P(4) <= P(3)
        P(3) = P(4) * figRatio(1)/figRatio(2);
    end
end
fig = figure('Position', P);

fig.PaperUnits = 'centimeters';
fig.Color = [1,1,1];


end
