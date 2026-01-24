import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final String time;

  ChatMessage({required this.text, required this.isUser, required this.time});
}

class AiCommunicationController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Add initial welcome message
    messages.add(
      ChatMessage(
        text: "Hello! I'm your AI coach assistant. How can I help you today?",
        isUser: false,
        time:
            "11:47 PM", // Dynamic time would be better but static for now matches design
      ),
    );
  }

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    final text = messageController.text;
    final currentTime = _formatTime(DateTime.now());

    // Add User Message
    messages.add(ChatMessage(text: text, isUser: true, time: currentTime));

    messageController.clear();

    // Simulate AI Response (Optional, can be removed if real backend is connected later)
    Future.delayed(const Duration(seconds: 1), () {
      messages.add(
        ChatMessage(
          text: "I'm processing your request regarding '$text'...",
          isUser: false,
          time: _formatTime(DateTime.now()),
        ),
      );
    });
  }

  String _formatTime(DateTime time) {
    // Simple formatter, can use intl package if available
    String hour = time.hour > 12 ? '${time.hour - 12}' : '${time.hour}';
    String minute = time.minute.toString().padLeft(2, '0');
    String period = time.hour >= 12 ? 'PM' : 'AM';
    return "$hour:$minute $period";
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
