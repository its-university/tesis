# Berkontribusi pada Template Tesis ITS

Terima kasih telah membantu memperbaiki template tesis Program Magister ITS!

## Cara Berkontribusi

- **Laporkan bug.** Buka [issue](https://github.com/its-university/tesis/issues) dan sertakan sistem operasi, distribusi dan versi TeX (atau Overleaf), langkah untuk mereproduksi masalah, serta potongan `main.log` yang relevan.
- **Jaga kesesuaian format.** Panduan penyusunan tesis ITS dapat berubah. Jika menemukan ketidaksesuaian, sebutkan panduan dan tahun yang Anda acu, beserta halaman atau butirnya.
- **Perbaiki dokumentasi.** Klarifikasi, terjemahan, dan perbaikan salah ketik selalu diterima.

## Alur Pull Request

1. Fork repositori ini, lalu buat branch dari `main`:

   ```bash
   git checkout -b fix/deskripsi-singkat
   ```

2. Lakukan perubahan.
3. Kompilasi template dan periksa PDF hasilnya:

   ```bash
   bash scripts/build.sh
   ```

   Skrip gagal jika kompilasi gagal atau jika masih ada rujukan atau sitasi yang belum terselesaikan (tampil sebagai `??` di PDF). GitHub Actions menjalankan skrip yang sama pada setiap push dan pull request.
4. **Jangan commit berkas hasil build** (`*.aux`, `*.log`, `*.toc`, `*.bbl`, `main.pdf`, dan sebagainya); semuanya sudah tercantum di `.gitignore`. Jika Anda mengubah `cover.tex`, sertakan `cover.pdf` hasil kompilasinya karena berkas itu dipakai oleh `main.tex`.
5. Tambahkan diri Anda ke [CONTRIBUTORS.md](CONTRIBUTORS.md).
6. Buka pull request yang menjelaskan **apa** yang berubah dan **mengapa**. Jika tata letak berubah, lampirkan tangkapan layar halaman yang terdampak.

## Pedoman

- Jangan sertakan isi tesis pribadi (nama asli, NRP, abstrak, atau penelitian yang belum terbit) dalam pull request. Gunakan teks contoh.
- Utamakan pull request yang kecil dan terfokus daripada yang besar dan bercampur.
- Perubahan pada `its-thesis.cls` dan `cover.tex` berdampak pada semua pengguna, jadi jelaskan alasannya dengan jelas dan rujuk butir panduan yang mendasarinya.
- Jangan mengganti atau mengubah logo dan aset identitas visual ITS di `figures/` tanpa rujukan ke sumber resmi ITS.

## Lisensi

Dengan berkontribusi, Anda setuju bahwa kontribusi Anda dilisensikan di bawah [Lisensi MIT](LICENSE), sama seperti repositori ini.
