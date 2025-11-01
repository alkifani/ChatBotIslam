import 'package:chatbotislam/screens/about_us.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import '../widgets/message_bubble.dart';
import '../widgets/input_composer.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _messages.add(
      Message(
        text:
        "🕌 Assalamu’alaikum warahmatullahi wabarakatuh 🌸\n\nSaya siap membantu Anda memahami hukum Islam berdasarkan Al-Qur’an, Hadis, dan Sunnah.\n\nSilakan ajukan pertanyaan Anda dengan tenang 😊",
        isUser: false,
      ),
    );
  }

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) return;
    final userMessage = Message(text: _controller.text, isUser: true);

    setState(() {
      _messages.insert(0, userMessage);
      _isLoading = true;
    });

    final textToSend = _controller.text;
    _controller.clear();

    try {
      final response = await http
          .post(
        Uri.parse('$BACKEND_URL/hukum_fiqih'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': textToSend}),
      )
          .timeout(const Duration(seconds: 180));

      String botResponseText =
          "⚠️ Maaf, terjadi gangguan koneksi. Silakan coba beberapa saat lagi.";

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        botResponseText = data['bot_response'];
      }

      final botMessage = Message(text: botResponseText, isUser: false);
      setState(() => _messages.insert(0, botMessage));
    } catch (e) {
      final errorMessage = Message(
        text:
        "⚠️ Mohon maaf, koneksi ke server sedang bermasalah.\nInsyaAllah akan diperbaiki segera. Silakan coba kembali nanti. 🤲",
        isUser: false,
      );
      setState(() => _messages.insert(0, errorMessage));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: acehLightGreen,
      body: Column(
        children: [
          // ======= CUSTOM APPBAR =======
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 3),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text(
                        '🕌 Asisten Fiqih Qur’an & Sunnah',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.info_outline_rounded, color: Colors.green),
                      tooltip: 'Tentang Aplikasi',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AboutUs()),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Menjawab pertanyaan seputar shalat & puasa berdasarkan Al-Qur’an, Hadis, dan Sunnah.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.italic,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.verified_outlined, color: Colors.green, size: 14),
                    SizedBox(width: 4),
                    Text(
                      'Versi 1.3.0  •  Sumber: Qur’an • Hadis • Mazhab',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ======= AREA PESAN =======
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return MessageBubble(message: message);
              },
            ),
          ),

          // ======= LOADING BAR =======
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    color: Color(0xFF9DC183),
                    minHeight: 4,
                  ),
                  SizedBox(height: 6),
                  Text(
                    "🔍 Sedang mencari jawaban berdasarkan Al-Qur’an dan Hadis...",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

          // ======= INPUT AREA =======
          InputComposer(
            controller: _controller,
            isLoading: _isLoading,
            onSend: _sendMessage,
          ),

          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFe8f5e9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              border: Border(
                top: BorderSide(color: Colors.green.shade700, width: 2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, -2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(
                        text: '⚠️ Disclaimer\n',
                        style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const TextSpan(
                        text:
                        'Jawaban yang diberikan berasal dari sistem AI berbasis Al-Qur’an, Hadis, dan sumber fiqh. '
                            'Hasilnya ditujukan untuk pembelajaran dan referensi ilmiah, '
                            'bukan sebagai fatwa hukum resmi. Verifikasi tetap diperlukan kepada ulama dan sumber sahih.',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
