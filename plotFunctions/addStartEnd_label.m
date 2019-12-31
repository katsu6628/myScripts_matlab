%this script adds a text to the begginng/end of the graph to indicate the points!
%input data should be 2-length cell with labels for beggining/end
function addStartEnd_label(begginingEnd_cell)
if ~strcmp(begginingEnd_cell{1}, '')
    xlim_ = xlim;
    ylim_ = ylim;
    
    text(xlim_(1), ylim_(2), begginingEnd_cell{1},...
        'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');
end

if length(begginingEnd_cell) ~= 1
    if ~strcmp(begginingEnd_cell{2}, '')
        text(xlim_(2), ylim_(2), begginingEnd_cell{2},...
            'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');
    end
end

end