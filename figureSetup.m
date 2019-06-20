%% Font
set(0,'defaultAxesFontSize',20);
set(0,'defaultAxesFontName','Alias');
set(0,'defaultAxesFontWeight','demi'); % normal/demi/bold
set(0,'defaultTextFontSize',20);
set(0,'defaultTextFontName','Alias');
set(0,'defaultTextFontWeight','demi');

%% Line width
set(0,'defaultAxesLineWidth', 1.5); % axis
set(0,'defaultLineLineWidth', 4); % plot

%% color
clorder = ...
    [  0,   0, 255; % blue
       0, 128,   0; % green
     255,   0,   0; % red
     204,   8, 204; % purple
     222, 125,   0; % brown
       0,  51, 153; % amber (difficult distinguish between blue)
      64,  64,  64];% dark gray  
set(0,'defaultAxesColorOrder',clorder/255);

%% grid on & box on
set(0,'DefaultAxesXGrid','on');
set(0,'DefaultAxesYGrid','on');
set(0,'DefaultAxesBox','on');

%% don't change size in copy/paste
set(0,'DefaultFigurePaperPositionMode','auto');

f = figure;

f.PaperType

f.PaperUnits = 'centimeters';
f.PaperPosition = [2 2 18 24];

f.Units = 'centimeters';
f.Position = [2 2 18 24];

f.Color = 'w';

axh = axes('Units','centimeters','Position',[2 2 10 10]);

axh.FontName = 'Arial'; 
set(groot,'defaultAxesFontName',    'Arial');
set(groot,'defaultTextFontName',    'Arial');
set(groot,'defaultLegendFontName',  'Arial');
set(groot,'defaultColorbarFontName','Arial');