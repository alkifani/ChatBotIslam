import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E7D32), // hijau islami
      appBar: AppBar(
        backgroundColor: const Color(0xFFD9D9D9),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "About Us",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ==== GAMBAR DUMMY ====
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  'assets/logo_app.png', // Ganti dengan path gambar kamu
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ==== DESKRIPSI UTAMA ====
            const Text(
              "Chatbot AI Penjawab Hukum Islam dikembangkan oleh Mahasiswa "
                  "Program Studi Magister Teknik Elektro Universitas Syiah Kuala.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 13,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),

            // ==== TUJUAN PENGEMBANGAN ====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tujuan Pengembangan:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "1. Menghadirkan platform digital yang dapat memberikan "
                        "penjelasan hukum Islam berdasarkan sumber yang terpercaya.\n"
                        "2. Menyediakan media dakwah interaktif yang dapat menjangkau masyarakat luas.\n"
                        "3. Mendukung integrasi pendidikan berbasis AI di lingkungan Perguruan Tinggi Islam.",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ==== SUMBER RUJUKAN ====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sumber Rujukan Aplikasi:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• Al-Qur’an\n"
                        "• Hadis Shahih dari berbagai kitab utama\n"
                        "• Qiyas dan pendapat empat mazhab (Syafi’i, Hanafi, Maliki, Hanbali)",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ==== NAMA PENGEMBANG ====
            const Text(
              "Ahmad Mufadhdhal Alkifani  2504230110007\n"
                  "Akbar Mizwar             2504030110003\n"
                  "M. Hafidz Rinaldi        2504090110008\n"
                  "Rosmawinda               2504080110006\n"
                  "Najwa Razita Amani       2204105010003",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
