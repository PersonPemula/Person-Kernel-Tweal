# Changelog V1.0.5 (191224)
- Nope
# Changelog V2.1.6 (191224)
- Fix .log no write in /storage/emulated/0/person-kt.log
- Fix Conflict With Updater-binary
- Separation between core code and latest service
# Changelog V3.2.7 (201224)
- Penghapusan Redundansi: Menghilangkan baris yang berulang dan tidak perlu.
- Penggabungan Perintah: Menggabungkan beberapa perintah yang serupa untuk mengurangi jumlah baris.
- Optimalisasi Nilai: Menyesuaikan nilai-nilai untuk meningkatkan kinerja berdasarkan pengalaman umum.
- Pembersihan Cache: Menambahkan perintah untuk membersihkan cache setelah menerapkan pengaturan.
- Penerapan Pengaturan: Menggunakan sysctl -p untuk menerapkan semua pengaturan yang telah diatur.
- Kernel Panic dan Debugging:
Nilai untuk panic, panic_on_oops, panic_on_warn, pause_on_oops, dan panic_on_oom diubah menjadi 0 untuk mencegah kernel panic dan reboot otomatis.
- Manajemen Memori:
enable_adaptive_lmk diubah menjadi 0 untuk menonaktifkan low memory killer adaptif.
- max_comp_streams untuk zram diubah menjadi 8 untuk mengoptimalkan kompresi.
- overcommit_ratio diubah menjadi 100 untuk mengatur jumlah memori yang dapat dialokasikan melebihi fisik.
- vfs_cache_pressure diubah menjadi 20 untuk mengurangi tekanan pada cache sistem file.
- extra_free_kbytes dan min_free_kbytes disesuaikan untuk meningkatkan jumlah memori bebas yang tersedia.
- CPU dan I/O Scheduler:
scheduler untuk mmcblk diubah menjadi deadline untuk mengoptimalkan I/O.
- read_ahead_kb diubah menjadi 1024 untuk meningkatkan performa baca.
- Pengaturan cpuset dan stune disederhanakan dengan mengatur nilai boost menjadi 0 untuk kebanyakan stune dan 70 untuk top-app.
- Uclamp Configuration:
Nilai uclamp.max dan uclamp.min disederhanakan dengan mengatur max dan 10 secara universal untuk semua cpuset.
- Pengaturan Lainnya:
read_wakeup_threshold dan write_wakeup_threshold diubah menjadi 2048 untuk mengoptimalkan entropi.
- sysctl_writes_strict dan sched_tunable_scaling diubah menjadi 0 untuk mengurangi pembatasan pada penulisan sysctl dan scaling penjadwalan.

