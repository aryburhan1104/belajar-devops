# Gunakan base image Linux yang sudah terpasang Node.js versi spesifik (Menghindari skenario buruk perbedaan versi)
FROM node:18-alpine

# Tentukan folder kerja di dalam kontainer
WORKDIR /app

# Salin file package.json terlebih dahulu untuk instalasi dependensi
COPY package.json ./

# Jalankan instalasi (jika nanti ada dependensi tambahan)
RUN npm install

# Salin seluruh kode aplikasi dari laptop ke dalam kontainer
COPY . .

# Buka jalur komunikasi (port) sesuai kode app.js kita
EXPOSE 3000

# Perintah untuk menyalakan aplikasi di dalam kontainer
CMD ["node", "app.js"]