import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  String message;
  Color? color;
  ChatBubble({super.key, required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
