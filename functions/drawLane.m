function output = drawLane(img, lane)
    output = img;
    [h, w, ~] = size(img);

    % Gambar garis kiri
    if ~isempty(lane.left)
        p1 = lane.left.point1;
        p2 = lane.left.point2;
        output = insertShape(output, 'Line', ...
            [p1 p2], 'Color','green','LineWidth',5, 'Opacity', 0.8);
    end

    % Gambar garis kanan
    if ~isempty(lane.right)
        p1 = lane.right.point1;
        p2 = lane.right.point2;
        output = insertShape(output, 'Line', ...
            [p1 p2], 'Color','green','LineWidth',5, 'Opacity', 0.8);
    end

    % TAMBAHAN: Area jalur (filled polygon)
    if ~isempty(lane.left) && ~isempty(lane.right)
        % Buat polygon dari 4 titik
        pts = [
            lane.left.point1(1), lane.left.point1(2), ...
            lane.left.point2(1), lane.left.point2(2), ...
            lane.right.point2(1), lane.right.point2(2), ...
            lane.right.point1(1), lane.right.point1(2)
        ];
        
        output = insertShape(output, 'FilledPolygon', ...
            pts, 'Color', 'cyan', 'Opacity', 0.25);
        
        % Garis tengah jalan
        left_x1  = lane.left.point1(1);
        left_x2  = lane.left.point2(1);
        right_x1 = lane.right.point1(1);
        right_x2 = lane.right.point2(1);
        
        midX1 = (left_x1 + right_x1) / 2;
        midX2 = (left_x2 + right_x2) / 2;
        
        y1 = lane.left.point1(2);
        y2 = lane.left.point2(2);
        
        output = insertShape(output, 'Line', ...
            [midX1 y1 midX2 y2], ...
            'Color','red','LineWidth',4, 'Opacity', 0.9);
            
        % TAMBAHAN: Tampilkan info deviasi
        frameCenter = w / 2;
        laneCenter = midX1;
        deviation = laneCenter - frameCenter;
        
        if abs(deviation) < 50
            direction = 'LURUS';
            color = 'green';
        elseif deviation > 0
            direction = 'BELOK KANAN';
            color = 'yellow';
        else
            direction = 'BELOK KIRI';
            color = 'yellow';
        end
        
        output = insertText(output, [20 20], ...
            sprintf('Arah: %s | Deviasi: %.0f px', direction, deviation), ...
            'FontSize', 18, 'BoxColor', color, 'BoxOpacity', 0.7);
    else
        % Jika jalur tidak terdeteksi
        output = insertText(output, [20 20], ...
            'JALUR TIDAK TERDETEKSI', ...
            'FontSize', 18, 'BoxColor', 'red', 'BoxOpacity', 0.7);
    end
end