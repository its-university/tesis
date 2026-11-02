# Template Tesis ITS

Template LaTeX untuk penulisan tesis Program Magister Institut Teknologi Sepuluh Nopember (ITS) Surabaya, disusun berdasarkan **Panduan Penyusunan Tesis Program Magister ITS 2021**.

[![Build thesis](https://github.com/its-university/tesis/actions/workflows/build.yml/badge.svg)](https://github.com/its-university/tesis/actions/workflows/build.yml)

## Struktur Proyek

```text
tesis/
├── main.tex                 # Dokumen utama
├── cover.tex                # Sumber sampul luar
├── cover.pdf                # Sampul hasil kompilasi, digunakan oleh main.tex
├── its-thesis.cls           # Class dan format dokumen ITS
├── references.bib           # Referensi BibTeX
├── chapters/                # Bab 1–5
├── frontmatter/             # Halaman awal, abstrak, daftar, dan pengesahan
├── backmatter/              # Biografi penulis
├── figures/                 # Logo dan gambar
├── scripts/
│   └── build.sh             # Kompilasi sampul dan tesis
└── .github/workflows/
    └── build.yml            # Pemeriksaan kompilasi otomatis
```

Edit `main.tex` untuk mengisi identitas tesis, lalu lengkapi berkas di `frontmatter/`, `chapters/`, `backmatter/`, dan `references.bib`. Sesuaikan `cover.tex` jika informasi atau desain sampul perlu diubah.

## Prasyarat

Pasang distribusi LaTeX yang menyediakan **pdfLaTeX**, **BibTeX**, dan paket LaTeX tambahan. Contoh untuk Ubuntu/Debian:

```bash
sudo apt-get update
sudo apt-get install texlive-latex-extra texlive-fonts-recommended texlive-science tex-gyre
```

## Kompilasi

Dari direktori utama proyek, jalankan:

```bash
bash scripts/build.sh
```

Skrip mengompilasi `cover.tex`, lalu menjalankan urutan pdfLaTeX–BibTeX–pdfLaTeX dua kali untuk `main.tex`. Hasilnya adalah `cover.pdf` dan `main.pdf`. Perintah yang sama dijalankan oleh GitHub Actions pada setiap push dan pull request; PDF hasil CI tersedia sebagai artefak workflow.

Kompilasi manual:

```bash
pdflatex -interaction=nonstopmode -halt-on-error -file-line-error cover.tex
pdflatex -interaction=nonstopmode -halt-on-error -file-line-error main.tex
bibtex main
pdflatex -interaction=nonstopmode -halt-on-error -file-line-error main.tex
pdflatex -interaction=nonstopmode -halt-on-error -file-line-error main.tex
```

## Menggunakan Overleaf

1. Unggah seluruh isi proyek dan pastikan `main.tex`, `cover.pdf`, serta direktori pendukung berada di tingkat teratas proyek.
2. Pilih `main.tex` sebagai dokumen utama.
3. Jika mengubah `cover.tex`, kompilasi sampul dengan pdfLaTeX terlebih dahulu dan unggah PDF hasilnya sebagai `cover.pdf`.
4. Kompilasi `main.tex`; Overleaf akan menangani beberapa putaran kompilasi dan BibTeX.

## Spesifikasi Format

Mengacu pada Panduan Penyusunan Tesis Program Magister ITS 2021:

| Item | Spesifikasi |
|---|---|
| Kertas | A4 (210 × 297 mm), 80 gram |
| Font | Times Roman 12 pt |
| Spasi | 1,5 baris |
| Margin halaman ganjil | Atas 3,5 cm; bawah 3 cm; kiri 4 cm; kanan 3 cm |
| Margin halaman genap | Atas 3,5 cm; bawah 3 cm; kiri 3 cm; kanan 4 cm |
| Indentasi paragraf | 1 cm |

## Pengakuan

Inisiator template: [@kurniacf](https://github.com/kurniacf). Repositori ini mengembangkan template untuk kebutuhan tesis Program Magister ITS.

## Lisensi

Repositori ini belum menyertakan berkas lisensi. Silakan hubungi pengelola repositori untuk ketentuan penggunaan dan distribusi.
