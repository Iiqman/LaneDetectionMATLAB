function gray = preprocessImage(img)
    % Mengonversi gambar ke grayscale
    gray = rgb2gray(img);
    
    % Menggunakan filter Gaussian untuk mengurangi noise
    gray = imgaussfilt(gray, 1.5);
    
    % Menyesuaikan kontras gambar untuk meningkatkan deteksi tepi
    gray = imadjust(gray, [0.3 0.7], [0 1]);
    
    % TAMBAHAN: Region of Interest (ROI) - fokus pada area jalan
    [h, w] = size(gray);
    mask = zeros(h, w);
    
    % Definisi ROI berbentuk trapesium (area jalan)
    vertices = [
        0.1*w, h;           % kiri bawah
        0.45*w, 0.6*h;      % kiri atas
        0.55*w, 0.6*h;      % kanan atas
        0.9*w, h            % kanan bawah
    ];
    
    mask = poly2mask(vertices(:,1), vertices(:,2), h, w);
    gray = gray .* uint8(mask);
end