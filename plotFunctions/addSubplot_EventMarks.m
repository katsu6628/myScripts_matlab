%plot event marks to subplots
%x-axis is following the index - 1, if following time - 0
function addSubplot_EventMarks(eventLabels,...
     eventTime,time_vec, colors_, thisAxis_subAxisIsIndex)
    ylim_ = ylim;
%     title('');
    %according to the subplots x-axis, set the plotting x-axis
    if thisAxis_subAxisIsIndex
        % if this x-axis is on the index of time_vector, modify the
        % eventTime data to get the correct plotting x-axis
        plotIdx = nan(size(eventTime));
        for i = 1:size(plotIdx,1)
            for j = 1:size(plotIdx,2)
                if isnan(eventTime(i,j)); plotIdx(i,j)=nan;else
                    [~, plotIdx(i,j)] = min(abs(eventTime(i, j)-time_vec));
                end
            end
        end
    else
        plotIdx = eventTime;
    end
    
    deltaY = diff(ylim_)/150;
    cnt = 0;
    for event = eventLabels
        cnt = cnt + 1;
        if rem(cnt,4)==1;vertPlt=ylim_(2)-deltaY;vertPos='top';...
                horzPos='right';horzD=0;rot_=0;
        elseif rem(cnt,4)==2;vertPlt=ylim_(2)-deltaY;vertPos='bottom';...
                horzPos='right';horzD=0;rot_=0;
        elseif rem(cnt,4)==3;vertPlt=ylim_(2)+deltaY;vertPos='top';...
                horzPos='right';horzD=0;rot_=0;
        elseif rem(cnt,4)==0;vertPlt=ylim_(2)+deltaY;vertPos='bottom';...
                horzPos='right';horzD=0;rot_=0;
        end
%         if rem(cnt,2)==1;vertPlt=ylim_(2);vertPos='bottom';...
%                 horzPos='right';horzD=+deltaY;rot_=90;
%         elseif rem(cnt,2)==0;vertPlt=ylim_(2);vertPos='bottom';...
%                 horzPos='left';horzD=-deltaY;rot_=90;
%         end
        %start point of this event
        if ~isnan(plotIdx(1,cnt))
           a =  scatter(plotIdx(1, cnt), ylim_(2),...
                'v', 'MarkerFaceColor', colors_(cnt, :),...
                'MarkerEdgeColor',[0 .5 .5]);
        set(get(get(a(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
            text(plotIdx(1,cnt)+horzD , vertPlt, event,...
                'HorizontalAlignment', horzPos,...
                'VerticalAlignment', vertPos, ...
                'EdgeColor', colors_(cnt, :), ...
                'Rotation', rot_, 'FontSize', 8);
        end
        if~isnan(plotIdx(2,cnt))
        a= scatter(plotIdx(2, cnt), ylim_(2),...
                '^', 'MarkerFaceColor', colors_(cnt, :),...
                'MarkerEdgeColor',[0 .5 .5]);
        set(get(get(a(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
        end
    end
end