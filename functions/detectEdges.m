function edges = detectEdges(gray)
    % Deteksi tepi dengan metode Canny - threshold disesuaikan
    % Threshold lebih rendah = deteksi lebih sensitif
    edges = edge(gray, 'canny', [0.05 0.15]);
    
    % TAMBAHAN: Operasi morfologi untuk memperjelas garis
    se = strel('line', 3, 0);
    edges = imdilate(edges, se);
end