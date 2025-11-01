import 'package:flutter/material.dart';
import '../utils/constants.dart';

class InputComposer extends StatefulWidget {
  final TextEditingController controller;
  final bool isLoading;
  final VoidCallback onSend;

  const InputComposer({
    super.key,
    required this.controller,
    required this.onSend,
    required this.isLoading,
  });

  @override
  State<InputComposer> createState() => _InputComposerState();
}

class _InputComposerState extends State<InputComposer> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        focusNode: _focusNode,
        controller: widget.controller,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
        decoration: InputDecoration(
          hintText: "Tulis Pertanyaan",
          hintStyle: const TextStyle(
            color: Color(0xFF504F4F),
            fontFamily: 'Poppins',
          ),

          // 🌿 Background berubah sesuai fokus
          filled: true,
          fillColor: _isFocused
              ? const Color(0xFFF8EDE3) // krem lembut saat fokus
              : const Color(0xFFD9D9D9), // abu saat normal

          contentPadding:
          const EdgeInsets.symmetric(vertical: 14, horizontal: 20),

          // 🔹 Normal border (tidak fokus)
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),

          // 🔹 Fokus border — muncul saat diklik
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Color(0xFF9DC183), // hijau zaitun lembut
              width: 2,
            ),
          ),

          // 🔹 Ikon kirim di dalam text field
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 6),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xFFCF9557), // emas hangat
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white, size: 20),
                onPressed: widget.isLoading ? null : widget.onSend,
              ),
            ),
          ),
        ),
        onSubmitted: (_) => widget.onSend(),
      ),
    );
  }
}
