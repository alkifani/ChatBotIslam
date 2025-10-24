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
        text: "Assalamu’alaikum!\nApa Yang Bisa Saya Bantu?",
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

      String botResponseText = "Maaf, terjadi masalah koneksi.";
      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        botResponseText = data['bot_response'];
      }

      final botMessage = Message(text: botResponseText, isUser: false);
      setState(() => _messages.insert(0, botMessage));
    } catch (e) {
      final errorMessage = Message(
        text:
        "⚠️ Gagal terhubung ke server. Pastikan backend berjalan dan alamat IP benar.",
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
      backgroundColor: acehLightGreen, // Warna latar hijau seperti gambar
      body: Column(
        children: [
          // ======= CUSTOM APPBAR =======
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: const BoxDecoration(
              color: Color(0xFFD9D9D9), // abu-abu terang
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Center(
              child: Text(
                'Tanya Jawab Hukum Islam',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
              ),
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
                child: LinearProgressIndicator(
                    color: Color(0xFF9DC183),
                  minHeight: 4,
                ),
            ),

          // ======= INPUT AREA =======
          InputComposer(
            controller: _controller,
            isLoading: _isLoading,
            onSend: _sendMessage,
          ),

          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
