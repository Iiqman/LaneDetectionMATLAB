function edges = detectEdges(gray)
    % Deteksi tepi dengan menggunakan metode Canny
    edges = edge(gray, 'canny', [0.1 0.3]);
end
