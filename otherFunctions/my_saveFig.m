%save figure my style
function my_saveFig(opDir, saveName, fig, pngDet, pdfDet)
set(fig, 'Units', 'Inches');
pos = get(fig, 'Position');
set(fig, 'PaperPositionMode', 'Auto', 'PaperUnits', ...
    'Inches', 'PaperSize', [pos(3), pos(4)]);
if pngDet
%     tmp = [opDir, 'png/'];
tmp = opDir;
    [~,~,~]=mkdir(tmp);
    saveas(fig, [tmp, saveName], 'png');
end
if pdfDet
%     tmp = [opDir, 'pdf/'];
tmp = opDir;
    [~,~,~]=mkdir(tmp);
    print(fig, [tmp, saveName], '-dpdf', '-r0');
end
end
