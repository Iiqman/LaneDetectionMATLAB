function output = drawLane(img, lane)
    output = img; 
    imshow(output); 
    hold on;

    % Menggambar garis kiri
    for i = 1:length(lane.left)
        xy = [lane.left(i).point1; lane.left(i).point2];
        plot(xy(:,1), xy(:,2), 'g', 'LineWidth', 2);
    end

    % Menggambar garis kanan
    for i = 1:length(lane.right)
        xy = [lane.right(i).point1; lane.right(i).point2];
        plot(xy(:,1), xy(:,2), 'g', 'LineWidth', 2);
    end

    % Menggambar garis tengah jalan
    if ~isempty(lane.left) && ~isempty(lane.right)
        % Ambil x koordinat titik pertama dari garis kiri dan kanan
        left_x = lane.left(1).point1(1);  % Titik pertama dari garis kiri
        right_x = lane.right(1).point1(1);  % Titik pertama dari garis kanan

        % Menghitung posisi tengah jalan
        midX = (left_x + right_x) / 2;  % Rata-rata antara garis kiri dan kanan

        % Menentukan posisi tengah jalan
        plot([midX midX], [size(img, 1) * 0.8, size(img, 1)], 'r--', 'LineWidth', 2);
    end

    hold off;
    frame = getframe(gca);
    output = frame.cdata;
end
