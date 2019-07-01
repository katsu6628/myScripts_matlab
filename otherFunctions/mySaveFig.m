%save figure my style
function mySaveFig(opDir_cell, saveName, fig, pngDet, pdfDet)
%modify figure before saving
% fig.PaperPositionMode = 'auto';
% pos = fig.PaperPosition;
% fig.PaperSize = [pos(3), pos(4)];
% %modify axesa
% ax_all = fig.Children;
% for ax = ax_all
%     %add minor ticks
%     ax.XMinorTick = 'on';
%     ax.YMinorTick = 'on';
%     ax.ZMinorTick = 'on';
%     ax.TickDir = 'in';
%     ax.TickLength = [.02 .02];
%     ax.XMinorGrid = 'off';
%     ax.YMinorGrid = 'off';
%     ax.ZMinorGrid = 'off';
%     %expand axes to fill figures
%     outerpos = ax.OuterPosition;
%     ti = ax.TightInset;
%     left = outerpos(1) + ti(1);
%     bottom = outerpos(2) + ti(2);
%     ax_width = outerpos(3) - ti(1) - ti(3);
%     ax_height = outerpos(4) - ti(2) - ti(4);
%     ax.Position = [left bottom ax_width ax_height];
% end

%save to all directories inside opDir_cell
  if iscell(opDir_cell)
    for op_i = 1:length(opDir_cell)
      opDir = opDir_cell{op_i};
      saveFig(opDir, fig, saveName, pngDet, pdfDet);
    end
  else
      opDir = opDir_cell;
    saveFig(opDir, fig, saveName, pngDet, pdfDet);
  end
end


function saveFig(opDir, fig, saveName, pngDet, pdfDet)
      if pngDet
        %     tmp = [opDir, 'png/'];
        tmp = opDir;
        [~,~,~]=mkdir(tmp);
        saveas(fig, [tmp, saveName, '.png'], 'png');
      end
      if pdfDet
        %     tmp = [opDir, 'pdf/'];
        tmp = opDir;
        [~,~,~]=mkdir(tmp);
        print(fig, [tmp, '/',saveName, '.pdf'], '-dpdf',  '-painters', '-r0', '-bestfit');
      end
    end
