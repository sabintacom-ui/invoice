# SABINTA — Sistem Invoice & Keuangan

Aplikasi web (single-file `index.html`) untuk usaha Sabinta: Buku Kas, Invoice,
Percetakan, Utang/Piutang, Laporan, plus sinkronisasi cloud Supabase + PWA.

## Cara menjalankan lokal

```bat
jalankan.bat
```

lalu buka http://127.0.0.1:8000 di browser.
(Jangan tutup jendela `jalankan.bat` selama dipakai.)

Alternatif: `python -m http.server 8000` dari folder ini.

## Fitur utama

- Dashboard: saldo, arus kas 6 bulan, top pengeluaran, pengingat jatuh tempo
- Buku Kas: multi-rekening, transfer antar rekening, filter, export Excel
- Invoice: multi-item, pajak, DP/cicilan, PDF, struk thermal 58mm, share WA
- Percetakan: order Baru→Proses→Selesai→Diambil, bayar masuk kas, struk, daftar harga editable
- Utang/Piutang: cicilan + progress + pengingat
- Laporan: filter tanggal, export PDF/Excel/CSV
- Cloud sync Supabase (lihat `SUPABASE_SETUP.sql`), backup/restore JSON
- Mobile: bottom-nav + tombol + tengah + sheet aksi cepat; dark mode

## Struktur

| File | Keterangan |
| --- | --- |
| `index.html` | Seluruh aplikasi (HTML+CSS+JS) |
| `sw.js` | Service worker PWA |
| `manifest.json` | Manifest PWA |
| `SUPABASE_SETUP.sql` | Skema tabel Supabase (`app_state`) |
| `jalankan.bat` | Server lokal sekali klik (Windows) |

## Changelog singkat

- v3.6: invoice urut terbaru, validasi form order, tombol ✕ popup, kotak gradasi
- v3.5: tema Oreo • v3.4: pilihan sidebar • v3.3: tema fresh • v3.2: colorful
- v3.0: cicilan, struk thermal, export CSV, bottom-nav, dark mode
