# Muse API Proxy

OpenAI-compatible reverse proxy untuk Meta Muse.ai (`muse-spark-1.3`). 
Dukung load balancing multi-akun via Round-Robin. Jalan pakai Docker (multi-arch `amd64` / `arm64`).

## Instalasi & Cara Pakai

1. Clone repo utama dan submodulenya:
   ```bash
   git clone --recursive <URL_REPO_UTAMA>
   # Jika sudah terlanjur clone biasa:
   # git submodule update --init --recursive
   ```
2. Siapkan file cookie:
   ```bash
   cp muse-proxy/cookies.example.txt muse-proxy/cookies.txt
   ```
3. Isi `muse-proxy/cookies.txt` dengan cookie asli (1 baris = 1 akun).
4. Jalankan Docker:
   ```bash
   docker compose up -d --build
   ```
5. Server API siap di: `http://localhost:20133/v1`
   Gunakan layaknya OpenAI API Endpoint biasa.

## Cara Dapat Cookie

1. Buka situs Meta Muse.ai. Login.
2. Buka Developer Tools (F12) -> masuk tab **Network**.
3. Refresh halaman (F5).
4. Klik salah satu request (misal: nama domain utama atau request ke API).
5. Pada panel kanan, cari bagian **Request Headers**.
6. Cari header bernama `cookie:`.
7. Klik kanan nilai cookie tersebut -> Copy value.
8. Paste (Ctrl+V) ke dalam file `muse-proxy/cookies.txt` (pastikan 1 baris penuh tanpa putus). Simpan.
