function gray = preprocessImage(img)
    % Mengonversi gambar ke grayscale
    gray = rgb2gray(img);

    % Menggunakan filter Gaussian untuk mengurangi noise
    gray = imgaussfilt(gray, 2);

    % Menyesuaikan kontras gambar untuk meningkatkan deteksi tepi
    gray = imadjust(gray);
end
