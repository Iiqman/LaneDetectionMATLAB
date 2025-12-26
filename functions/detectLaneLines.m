function lane = detectLaneLines(edges)
    [h, w] = size(edges);

    % Transformasi Hough dengan parameter lebih optimal
    [H, T, R] = hough(edges);
    P = houghpeaks(H, 20, 'threshold', ceil(0.3*max(H(:))));

    % Deteksi garis dengan parameter minimum length dan gap
    lines = houghlines(edges, T, R, P, 'FillGap', 30, 'MinLength', 40);

    left_lines = [];
    right_lines = [];

    % Filter garis berdasarkan slope dan posisi
    for i = 1:length(lines)
        dx = lines(i).point2(1) - lines(i).point1(1);
        dy = lines(i).point2(2) - lines(i).point1(2);
        
        if dx == 0
            continue;
        end
        
        slope = dy / dx;
        
        % Hitung posisi tengah garis
        midX = (lines(i).point1(1) + lines(i).point2(1)) / 2;
        
        % Filter garis kiri: slope negatif, posisi di kiri
        if slope < -0.4 && slope > -2 && midX < w*0.5
            left_lines = [left_lines; lines(i)];
        % Filter garis kanan: slope positif, posisi di kanan
        elseif slope > 0.4 && slope < 2 && midX > w*0.5
            right_lines = [right_lines; lines(i)];
        end
    end

    % TAMBAHAN: Rata-ratakan garis untuk hasil lebih stabil
    lane.left = averageLines(left_lines, h);
    lane.right = averageLines(right_lines, h);
end

function avgLine = averageLines(lines, imgHeight)
    if isempty(lines)
        avgLine = [];
        return;
    end
    
    % Kumpulkan semua titik
    x_coords = [];
    y_coords = [];
    
    for i = 1:length(lines)
        x_coords = [x_coords, lines(i).point1(1), lines(i).point2(1)];
        y_coords = [y_coords, lines(i).point1(2), lines(i).point2(2)];
    end
    
    % Fit polynomial (linear)
    if length(x_coords) >= 2
        p = polyfit(y_coords, x_coords, 1);
        
        % Buat garis rata-rata dari bawah ke tengah gambar
        y1 = imgHeight;
        y2 = round(imgHeight * 0.6);
        x1 = round(polyval(p, y1));
        x2 = round(polyval(p, y2));
        
        % Buat struktur line
        avgLine.point1 = [x1, y1];
        avgLine.point2 = [x2, y2];
    else
        avgLine = [];
    end
end