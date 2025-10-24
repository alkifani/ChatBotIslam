import 'package:flutter/material.dart';
import '../utils/constants.dart';

class Message {
  final String text;
  final bool isUser;
  Message({required this.text, required this.isUser});
}

class MessageBubble extends StatelessWidget {
  final Message message;

  // Tambahkan parameter opsional untuk warna custom
  final Color userColor;
  final Color botColor;
  final Color userTextColor;
  final Color botTextColor;

  const MessageBubble({
    super.key,
    required this.message,
    this.userColor = const Color(0xFF9DE2A9), // hijau lembut
    this.botColor = const Color(0xFFCDE5D1),  // krem lembut
    this.userTextColor = Colors.black87,
    this.botTextColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
        decoration: BoxDecoration(
          color: isUser ? userColor : botColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
            bottomLeft: Radius.circular(isUser ? 20.0 : 4.0),
            bottomRight: Radius.circular(isUser ? 4.0 : 20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(2, 2),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isUser) ...[
              const Padding(
                padding: EdgeInsets.only(right: 6.0, top: 3),
                child: Icon(Icons.mosque, size: 18, color: Colors.brown),
              ),
            ],
            Flexible(
              child: Text(
                message.text,
                style: TextStyle(
                  color: isUser ? userTextColor : botTextColor,
                  fontSize: 15,
                  height: 1.4,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
