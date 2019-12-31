myPath = '\\jps00007386\project\vitalsensor\share\katsumata\Scripts\MATLAB';
allPath = genpath(myPath);
tmp = split(allPath, ';');
tmp(contains(tmp, 'git')) = [];
tmp = join(tmp, ';');
addpath(tmp{1});

figureSetup
clearvars
