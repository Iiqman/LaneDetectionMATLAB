# Lane Detection Project

## Deskripsi

Project ini bertujuan untuk melakukan **deteksi garis jalan** pada citra atau video menggunakan **Pengolahan Citra Digital**. Dengan memanfaatkan teknik seperti **deteksi tepi Canny**, **Transformasi Hough**, dan **analisis garis**, aplikasi ini mampu mendeteksi garis kiri dan kanan serta garis tengah jalan pada gambar dan video.

### Makalah:
*Ongoing BAB 1
https://docs.google.com/document/d/1xOZaWGbHqvW25ZGGR-eh39nMWkPUY915g1pBokkqs00/edit?usp=sharing

### Fitur:

* **Deteksi garis jalan** menggunakan teknik **Hough Transform**.
* **Deteksi otomatis** pada citra statis (.jpg, .png) dan video (.mp4, .avi).
* **Visualisasi hasil deteksi garis jalan** dengan GUI MATLAB.

### Persyaratan Sistem

Untuk menjalankan project ini dengan **optimal**, disarankan untuk menginstal **OpenCV** pada sistem Anda. **OpenCV** akan membantu mempercepat dan meningkatkan akurasi deteksi garis jalan pada gambar dan video, terutama dengan pemrosesan citra yang lebih cepat dan efisien.

## Instalasi

**Sangat disarankan** untuk menginstal **OpenCV** guna mendapatkan hasil deteksi yang lebih akurat dan optimal. Anda dapat menginstal **OpenCV untuk Python** dan menghubungkannya dengan MATLAB untuk mengakses fungsionalitas OpenCV. Berikut adalah saran untuk memastikan **OpenCV** diinstal dengan benar untuk peningkatan kinerja:

* **Menggunakan OpenCV untuk meningkatkan akurasi deteksi**.
* **Pengolahan citra lebih cepat dan efisien** menggunakan **OpenCV**, yang mendukung berbagai fitur pemrosesan gambar.

Untuk informasi lebih lanjut mengenai instalasi **OpenCV**, Anda dapat mencari dokumentasi resmi OpenCV dan cara menghubungkannya dengan MATLAB. Setelah OpenCV terinstal, Anda akan dapat memanfaatkan kekuatan pemrosesan citra dan video OpenCV dalam project ini.

## Cara Menjalankan Project

1. **Persiapkan File Project**:

   * Pastikan semua file dan folder project terstruktur dengan benar:

     ```
     LaneDetectionMATLAB/
     ├── main.m
     ├── functions/
     │   ├── preprocessImage.m
     │   ├── detectEdges.m
     │   ├── detectLaneLines.m
     │   ├── drawLane.m
     ├── images/           # Gambar untuk kalibrasi
     │   ├── jalan1.png
     │   ├── jalan2.jpg
     ├── videos/           # Video untuk deteksi garis jalan
     │   ├── jalan1.mp4
     │   ├── jalan2.avi
     ```

2. **Buka MATLAB**:

   * Pastikan Anda sudah membuka MATLAB dan menavigasi ke folder **LaneDetectionMATLAB/**.

3. **Jalankan `main.m`**:

   * Buka file `main.m` di MATLAB dan jalankan.
   * GUI akan muncul, memungkinkan Anda untuk memilih **video** atau **gambar** untuk deteksi garis jalan.

4. **Pilih File untuk Deteksi**:

   * **Untuk Video**: Pilih video (format `.mp4` atau `.avi`), dan program akan memprosesnya frame per frame.
   * **Untuk Gambar**: Pilih gambar (format `.jpg` atau `.png`) untuk menguji akurasi deteksi garis.

5. **Lihat Hasil Deteksi**:

   * Hasil deteksi garis akan ditampilkan di GUI, dengan **garis kiri, kanan, dan tengah** jalan digambar dengan warna **hijau** dan **merah**.

## Penggunaan OpenCV (Opsional, untuk Akurasi yang Lebih Baik)

Sebaiknya Anda menginstal **OpenCV** untuk memastikan deteksi garis yang lebih **akurat dan cepat**. OpenCV dapat membantu mempercepat pemrosesan citra dan memberikan lebih banyak kemampuan untuk menangani noise atau gangguan pada gambar.

OpenCV dapat digunakan melalui MATLAB dengan mengaksesnya melalui Python bindings. Dengan menggunakan **OpenCV di Python**, Anda dapat memperluas fungsionalitas project ini lebih lanjut.

---

### **Catatan Tambahan**

* **Jika Anda mengalami masalah** dalam pemrosesan video atau gambar yang lambat, pertimbangkan untuk mengurangi **ukuran gambar** atau memilih **bagian ROI (Region of Interest)** dari citra yang relevan.
* Untuk **optimasi kecepatan**, Anda juga dapat mengatur agar hanya **setiap beberapa frame video** yang diproses untuk mempercepat waktu eksekusi.
