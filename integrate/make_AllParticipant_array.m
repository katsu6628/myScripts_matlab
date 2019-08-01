%arrange the size of each cell to make them same
function data_array = make_AllParticipant_array(data_cell,minimumLength)
data_array = ...
    nan(size(data_cell,2),size(data_cell,1),minimumLength);
for i = 1:size(data_cell, 1)
    for feat_i = 1:size(data_cell,2)
        feat_vec = data_cell{i,feat_i};
        data_array(feat_i,i, :) = feat_vec(1:minimumLength);
    end
end
end