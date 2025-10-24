import 'package:chatbotislam/screens/chatbot_page.dart';
import 'package:chatbotislam/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // Tunggu beberapa detik sebelum pindah halaman
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChatbotPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: acehLightGreen, // Warna background
        child: Center(
          child: Image.asset(
            'assets/landing.png', // Ganti dengan path gambar kamu
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
