import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerAiChatController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  // Initial prompt is handled in the View as a static widget now
  final messages = <Map<String, String>>[].obs;

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    // Add user message
    messages.add({
      "sender": "user",
      "text": text,
      "time": _formatTime(DateTime.now()),
    });

    messageController.clear();

    // Simulate AI response
    _simulateAiResponse(text);
  }

  void _simulateAiResponse(String userMessage) async {
    // Simulate typing delay
    await Future.delayed(const Duration(seconds: 1));

    String responseText = "";
    final lowerCaseMsg = userMessage.toLowerCase();

    if (lowerCaseMsg.contains("hi")) {
      responseText = "Hello there";
    } else if (lowerCaseMsg.contains("how are you")) {
      responseText = "I'm Fine";
    } else if (lowerCaseMsg.contains("scanning")) {
      // Specific structured mock response as per design
      responseText = """
Training Drills: Use this simple activity to develop your scanning:
• Three-Cone Overshoulder Drill

Pro Tip: Mimic game pressure
• Perform drills at game speed for split-second decision making

Weekly Goal: Make quicker decisions
• Aim to speed up your scanning process by 15% this week.""";
    } else if (lowerCaseMsg.contains("day today")) {
      // Get current date
      final now = DateTime.now();
      // Simple day formatting
      final days = [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      ];
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      responseText =
          "Today is ${days[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}, ${now.year}";
    } else {
      responseText =
          "I'm here to help with your football training. Ask me about drills, tactics, or mindset!";
    }

    messages.add({
      "sender": "ai",
      "text": responseText,
      "time": _formatTime(DateTime.now()),
    });

    // Scroll to bottom (0.0 in reverse list)
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0.0, // Scroll to start (bottom) for reversed list
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _formatTime(DateTime time) {
    final hour = time.hour > 12
        ? time.hour - 12
        : (time.hour == 0 ? 12 : time.hour);
    final period = time.hour >= 12 ? 'PM' : 'AM';
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute $period";
  }
}
