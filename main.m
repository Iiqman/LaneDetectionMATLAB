function main
    clc; close all;

    % ==================================================
    % TAMBAHKAN FOLDER FUNCTIONS KE PATH (WAJIB)
    % ==================================================
    addpath('functions');

    % ==================================================
    % GUI UTAMA
    % ==================================================
    fig = uifigure('Name','Lane Detection MATLAB', ...
                   'Position',[100 100 900 600]);

    ax = uiaxes(fig,'Position',[50 120 800 450]);
    title(ax,'Lane Detection Output');
    axis(ax,'off');

    % ==================================================
    % BUTTON PILIH VIDEO
    % ==================================================
    btnVideo = uibutton(fig,'push', ...
        'Text','Pilih Video', ...
        'Position',[50 50 150 40], ...
        'FontSize',12, ...
        'ButtonPushedFcn', @(btn,event) loadVideo(ax));

    % ==================================================
    % BUTTON UJI GAMBAR (KALIBRASI)
    % ==================================================
    btnImage = uibutton(fig,'push', ...
        'Text','Uji Gambar (Kalibrasi)', ...
        'Position',[220 50 220 40], ...
        'FontSize',12, ...
        'ButtonPushedFcn', @(btn,event) testImages(ax));

    % ==================================================
    % BUTTON KELUAR
    % ==================================================
    btnExit = uibutton(fig,'push', ...
        'Text','Keluar', ...
        'Position',[480 50 120 40], ...
        'FontSize',12, ...
        'ButtonPushedFcn', @(btn,event) close(fig));
end

% ==================================================
% FUNGSI LOAD & PROSES VIDEO
% ==================================================
function loadVideo(ax)
    [file, path] = uigetfile({'*.mp4;*.avi'}, 'Pilih Video');
    if isequal(file, 0)
        uialert(ax.Parent, 'Tidak ada video yang dipilih!', 'Error');
        return;
    end

    % Menampilkan nama file video yang dipilih
    disp(['File Video yang dipilih: ', fullfile(path, file)]);

    try
        vid = VideoReader(fullfile(path, file));
    catch
        uialert(ax.Parent, 'Gagal membuka video, periksa format atau codec video!', 'Error');
        return;
    end

    fps = vid.FrameRate;

    while hasFrame(vid)
        frame = readFrame(vid);

        % ===== PIPELINE DETEKSI =====
        gray  = preprocessImage(frame);
        edges = detectEdges(gray);
        lane  = detectLaneLines(edges);
        output = drawLane(frame, lane);  % Panggil dengan img (frame) dan lane

        imshow(output,'Parent',ax);
        title(ax, 'Deteksi Garis Jalan (Video)');
        drawnow;

        % Tambah sedikit delay untuk memperlambat tampilan frame
        pause(1 / fps);  % Sesuaikan kecepatan frame dengan fps video
    end
end

% ==================================================
% FUNGSI UJI GAMBAR (KALIBRASI PARAMETER)
% ==================================================
function testImages(ax)
    % Cek apakah folder images ada dan berisi gambar
    files = dir('images/*.{jpg,png}');  % Menambahkan PNG support

    if isempty(files)
        uialert(ax.Parent, 'Folder images kosong atau tidak ditemukan!', 'Error');
        return;
    end

    disp('Isi folder images:');
    disp({files.name});  % Debugging, tampilkan file yang ada di folder images

    for i = 1:length(files)
        img = imread(fullfile('images', files(i).name));

        % ===== PIPELINE DETEKSI =====
        gray  = preprocessImage(img);
        edges = detectEdges(gray);
        lane  = detectLaneLines(edges);
        output = drawLane(img, lane);  % Panggil dengan img (frame) dan lane

        imshow(output,'Parent',ax);
        title(ax, ['Kalibrasi: ', files(i).name]);
        drawnow;
        pause(1.5);  % Menunda tampilan gambar selama 1.5 detik
    end
end
