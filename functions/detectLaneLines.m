function lane = detectLaneLines(edges)
    % Menentukan ukuran citra
    [h, w] = size(edges);

    % Menerapkan transformasi Hough
    [H, T, R] = hough(edges);
    P = houghpeaks(H, 10);

    % Menggunakan HoughLines untuk mendeteksi garis
    lines = houghlines(edges, T, R, P);

    left = [];
    right = [];

    for i = 1:length(lines)
        dx = lines(i).point2(1) - lines(i).point1(1);
        dy = lines(i).point2(2) - lines(i).point1(2);
        slope = dy / dx;

        % Menentukan garis kiri dan kanan berdasarkan kemiringan (slope)
        if slope < -0.3
            left = [left; lines(i)];
        elseif slope > 0.3
            right = [right; lines(i)];
        end
    end

    lane.left = left;
    lane.right = right;
end
