function addPlot_EventMarks(fig, eventLabels, eventTime, time_vec, subAxisIsIndex)
%plot task4 events
%subAxisDet is vector to tell the type of x-axis of each subplot if the
%x-axis is following the index - 1, if following time - 0
colors_ = lines(length(eventLabels));
figure(fig)
hold on;
allaxis = flip(findall(fig, 'type', 'axes'));
for axis_idx = 1:length(allaxis)
    subplot(allaxis(axis_idx));
    thisAxis_subAxisIsIndex = subAxisIsIndex(axis_idx);
    
    addSubplot_EventMarks(eventLabels, eventTime,time_vec,...
        colors_, thisAxis_subAxisIsIndex)
end
end