% plot cop and evaluation only trim them by task type
function plot_dataByTask(x, y, statusArray, sw_vec, color_vec)
hold on;
presw_i = 1;
for sw_i = sw_vec
    status_i = statusArray(sw_i, :);
    if 1 <= status_i(1) && status_i(1) < size(color_vec, 1)
        linespec = color_vec(status_i(1), :);
    else
        linespec = 'k';
    end
    if status_i(2)
        linespec = 'r';
    end
    
    plot(x(presw_i:sw_i), y(presw_i:sw_i), 'Color', linespec);
    presw_i = sw_i;
end
end
