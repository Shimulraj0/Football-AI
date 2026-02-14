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

  final RxList<String> suggestedQuestions = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    String title = "Coach AI"; // Default

    // Check for arguments to populate suggested questions
    if (Get.arguments != null && Get.arguments is Map) {
      if (Get.arguments.containsKey('title')) {
        title = Get.arguments['title'];
      }
    }

    // Initialize with the design's specific suggestions based on title
    if (title == "Parent AI") {
      suggestedQuestions.assignAll([
        "Nutrition & Recovery Advice",
        "Skill Development Tips",
        "Team Schedule & Updates",
        "Feedback Ideas",
      ]);
    } else if (title == "Player AI") {
      suggestedQuestions.assignAll([
        "Nutrition & Recovery Advice",
        "Skill Drill Ideas",
        "Ask About Tactics",
        "Feedback Ideas",
        "Coach Announcements",
      ]);
    } else if (title == "TD AI") {
      suggestedQuestions.assignAll([
        "Facility Optimization",
        "View Financial Trend",
        "Curriculum Gap Analysis",
        "Feedback Ideas",
      ]);
    } else if (title == "DOC AI") {
      suggestedQuestions.assignAll([
        "Staff Performance",
        "Curriculum Compliance",
        "Evaluation Builder",
        "Professional Development",
      ]);
    } else {
      // Default to Coach AI suggestions
      suggestedQuestions.assignAll([
        "Player Feedback",
        "Drill Library Search",
        "Feedback Ideas",
        "Team Performance Review",
      ]);
    }
  }

  void sendSuggestedQuestion(String question) {
    messageController.text = question;
    sendMessage();
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
