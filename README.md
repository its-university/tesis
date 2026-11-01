# Template Tesis ITS

Template LaTeX untuk penulisan Tesis Program Magister Institut Teknologi Sepuluh Nopember (ITS) Surabaya.

Berdasarkan **Panduan Penyusunan Tesis Program Magister ITS 2021**.

## Struktur Direktori

```
thesis-template/
├── main.tex              # Dokumen utama
├── cover.tex             # Sampul luar (compile terpisah)
├── its-thesis.cls        # Class file
├── references.bib        # Daftar pustaka
├── chapters/
│   ├── bab1.tex          # BAB 1 - Pendahuluan
│   ├── bab2.tex          # BAB 2 - Kajian Pustaka
│   ├── bab3.tex          # BAB 3 - Metodologi Penelitian
│   ├── bab4.tex          # BAB 4 - Hasil dan Pembahasan
│   └── bab5.tex          # BAB 5 - Kesimpulan dan Saran
├── frontmatter/
│   ├── abstrak-id.tex    # Abstrak Bahasa Indonesia
│   ├── abstrak-en.tex    # Abstract English
│   └── kata-pengantar.tex # Kata Pengantar
├── backmatter/
│   └── biografi.tex      # Biografi Penulis
└── figures/
    └── logo-its.png      # Logo ITS
```

## Cara Kompilasi

### 1. Compile Cover (Sampul Luar)

```bash
pdflatex cover.tex
```

### 2. Compile Dokumen Utama

```bash
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

### Menggunakan Overleaf

1. Upload semua file ke project Overleaf
2. Set `main.tex` sebagai main document
3. Compile `cover.tex` terpisah untuk menghasilkan `cover.pdf`
4. Upload `cover.pdf` ke project
5. Compile `main.tex`

## Spesifikasi Format

Sesuai Panduan Penyusunan Tesis ITS 2021:

| Item | Spesifikasi |
|------|-------------|
| Kertas | A4 (210mm x 297mm), 80 gram |
| Font | Times Roman 12pt |
| Spasi | 1,5 baris |
| Margin (hal. ganjil) | Atas: 3,5cm, Bawah: 3cm, Kiri: 4cm, Kanan: 3cm |
| Margin (hal. genap) | Atas: 3,5cm, Bawah: 3cm, Kiri: 3cm, Kanan: 4cm |
| Indent paragraf | 1,5 cm |

### Sampul Luar

| Item | Spesifikasi |
|------|-------------|
| Area putih | 0,6 dari tinggi halaman |
| Area kuning (FTEIC) | 0,4 dari tinggi halaman |
| Garis biru ITS | Di antara area putih dan kuning |
| Font | Trebuchet MS (TeX Gyre Heros untuk pdfLaTeX) |
| Kode tesis | 12pt bold |
| Judul | 18pt bold |
| Lainnya | 12pt bold |

## Warna Sampul per Fakultas

| Fakultas | Warna | Kode Hex |
|----------|-------|----------|
| FSAD | Salem | #0F8140 |
| FTIRS | Fire Brick | #b31e23 |
| FTEIC | Gold | #FFD700 |
| FTSPK | Nero Black | #231F20 |
| FTK | Summer Sky | #26AEE4 |
| FDKBD | Indigo | #4b0082 |

## Catatan Penting

1. **Judul tesis** maksimum 20 kata
2. **Abstrak** maksimum 350 kata
3. **Kata kunci** 3-5 kata, diurutkan alfabetis
4. **Daftar pustaka** minimal 30% dari artikel jurnal ilmiah
5. Penomoran halaman:
   - Front matter: angka Romawi kecil (i, ii, iii, ...)
   - Main matter: angka Arabic (1, 2, 3, ...)

## Lisensi

Template ini bebas digunakan untuk keperluan akademik di ITS.

## Kontak

Jika ada pertanyaan atau saran, silakan hubungi Program Pascasarjana ITS.
