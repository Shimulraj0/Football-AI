import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoachAiController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  // Dummy messages for UI
  final messages = <Map<String, String>>[
    {
      "sender": "ai",
      "text":
          "Hello vdsv! I'm your AI coach assistant. How can I help you today?",
      "time": "11:47 PM",
    },
  ].obs;

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    // Add user message
    messages.add({
      "sender": "user",
      "text": messageController.text.trim(),
      "time": _formatTime(DateTime.now()),
    });

    messageController.clear();

    // Simulate AI response capability or placeholder
  }

  String _formatTime(DateTime time) {
    // Simple time formatter
    final hour = time.hour > 12
        ? time.hour - 12
        : (time.hour == 0 ? 12 : time.hour);
    final period = time.hour >= 12 ? 'PM' : 'AM';
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute $period";
  }
}
