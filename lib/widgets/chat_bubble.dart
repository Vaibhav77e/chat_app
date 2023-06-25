import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  String message;
  ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(12)),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
