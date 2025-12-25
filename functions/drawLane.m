function output = drawLane(img, lane)
    output = img;

    % Gambar garis kiri
    for i = 1:length(lane.left)
        p1 = lane.left(i).point1;
        p2 = lane.left(i).point2;
        output = insertShape(output, 'Line', ...
            [p1 p2], 'Color','green','LineWidth',3);
    end

    % Gambar garis kanan
    for i = 1:length(lane.right)
        p1 = lane.right(i).point1;
        p2 = lane.right(i).point2;
        output = insertShape(output, 'Line', ...
            [p1 p2], 'Color','green','LineWidth',3);
    end

    % Garis tengah jalan
    if ~isempty(lane.left) && ~isempty(lane.right)
        left_x  = lane.left(1).point1(1);
        right_x = lane.right(1).point1(1);
        midX = (left_x + right_x) / 2;

        y1 = size(img,1)*0.8;
        y2 = size(img,1);

        output = insertShape(output, 'Line', ...
            [midX y1 midX y2], ...
            'Color','red','LineWidth',3);
    end
end
