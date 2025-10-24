# 🕌 ChatBot Islam
**Rancang Bangun Chatbot AI Penjawab Hukum Islam Berbasis Al-Qur’an, Sunnah, dan Qiyās**

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![AI](https://img.shields.io/badge/AI-Chatbot-orange)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📖 Deskripsi Proyek

**ChatBot Islam** adalah aplikasi **chatbot AI berbasis Flutter** yang mampu memberikan jawaban terkait **hukum Islam** berdasarkan sumber **Al-Qur’an, Sunnah, dan Qiyās**.  
Aplikasi ini memanfaatkan **Natural Language Processing (NLP)** dan **Information Retrieval (IR)** untuk memahami pertanyaan pengguna dan memberikan jawaban yang kontekstual.

Proyek ini dikembangkan sebagai bagian dari upaya **digitalisasi pengetahuan Islam** dengan penerapan teknologi AI yang modern dan mudah diakses.

---

## ⚙️ Fitur Utama

- 💬 **Chat Interaktif:** Ajukan pertanyaan seputar hukum Islam dalam bahasa alami.  
- 📚 **Sumber Valid:** Jawaban diambil dari Al-Qur’an, Hadis, dan Qiyās.  
- 🔍 **Information Retrieval:** Pencarian cepat dari basis data teks Islam.  
- 🧠 **AI API Integration:** Menggunakan model LLM (AIMLAPI / OpenAI API).  
- 🎨 **Tampilan Modern:** Desain elegan dengan Flutter dan Material Design.  
- 🌙 **Tema Gelap & Terang:** Dikelola melalui file `theme.dart`.

---

## 🧩 Teknologi yang Digunakan

| Komponen | Teknologi |
|-----------|------------|
| Bahasa Pemrograman | Dart |
| Framework | Flutter |
| Backend / API | AIMLAPI / Custom REST API |
| Database | Firebase Realtime Database |
| NLP & AI | Information Retrieval, Text Embedding |
| UI Toolkit | Material Design |

---

## 🗂️ Struktur Folder

```
lib/
├── main.dart                    # Entry point aplikasi
├── screens/
│   ├── chatbot_page.dart        # Halaman utama chatbot
│   └── splash_screen.dart       # Halaman pembuka aplikasi
├── services/
│   └── api_service.dart         # Integrasi dengan API AI
├── utils/
│   ├── constants.dart           # Konstanta dan konfigurasi global
│   └── theme.dart               # Tema aplikasi
├── widgets/
│   ├── input_composer.dart      # Widget input chat pengguna
│   └── message_bubble.dart      # Tampilan pesan (user/bot)
```

---

## 🚀 Cara Menjalankan

### 1. Clone repository
```bash
git clone https://github.com/alkifani/ChatBotIslam.git
cd ChatBotIslam
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Jalankan aplikasi
```bash
flutter run
```

---

## 🧠 Arsitektur Sistem

1. **Flutter Frontend** – Menyediakan UI chat dan mengelola interaksi pengguna.  
2. **API Service** – Menghubungkan ke model AI (AIMLAPI atau OpenAI).  
3. **Knowledge Base** – Dataset teks Islam untuk referensi hukum.  
4. **IR Layer** – Mengambil informasi kontekstual dari teks sumber.  

---

## 🧑‍💻 Pengembang

**Ahmad Mufadhdhal Alkifani**  
🎓 Computer Engineering Graduate | Flutter & AI Developer  
📫 [LinkedIn](https://linkedin.com/in/alkifani)  
🌐 [GitHub](https://github.com/alkifani)

**M. Hafidz Rinaldi**
**M. Akbar Mizwar**  
**Rosmawinda**
**Najwa Razita Amani**

---

## 📜 Lisensi

Proyek ini dilisensikan di bawah [MIT License](LICENSE).

---

## 🌟 Kontribusi

Kontribusi sangat diterima!  
Jika kamu ingin menambahkan fitur baru atau memperbaiki bug:
1. Fork repository ini  
2. Buat branch baru (`feature/nama-fitur`)  
3. Lakukan perubahan dan kirim Pull Request  

---
