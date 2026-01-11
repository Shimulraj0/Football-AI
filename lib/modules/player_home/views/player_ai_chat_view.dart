import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/player_ai_chat_controller.dart';

class PlayerAiChatView extends StatelessWidget {
  const PlayerAiChatView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller lazily if not already present, or use GetView if bound
    // Since we are showing this inside PlayerHome body, we might need manual put if not in binding
    // For safety, let's assume it's put in the binding or put here
    final controller = Get.put(PlayerAiChatController());

    return Container(
      color: const Color(0xFFEEF5FF),
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(16),
                reverse: true, // Reverse list to anchor to bottom
                // Add +1 for the header text
                itemCount: controller.messages.length + 1,
                itemBuilder: (context, index) {
                  // In a reversed list:
                  // Index 0 = Bottom-most item
                  // Index Max = Top-most item

                  // If index is the last one (messages.length), show the Header (which stays at top)
                  if (index == controller.messages.length) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 8.0,
                        right: 8.0,
                        bottom: 24.0,
                      ),
                      child: Text(
                        "Ask for helpful advice on technique, tactics and mindset:",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                    );
                  }

                  // Data Mapping:
                  // Reversed List Index 0 -> Newest Message (Last in List)
                  // Reversed List Index N -> Oldest Message (First in List)
                  // List access: messages.length - 1 - index

                  final int messageIndex =
                      controller.messages.length - 1 - index;
                  final msg = controller.messages[messageIndex];

                  final isAi = msg['sender'] == 'ai';
                  return Align(
                    // Align AI left, User right
                    alignment: isAi
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8,
                      ),
                      decoration: BoxDecoration(
                        color: isAi
                            ? Colors.white
                            : const Color(0xFF4EEeb2), // User buuble Teal
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft: isAi
                              ? Radius.zero
                              : const Radius.circular(16),
                          bottomRight: isAi
                              ? const Radius.circular(16)
                              : Radius.zero,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            msg['text']!,
                            style: TextStyle(
                              color: isAi
                                  ? const Color(0xFF00204A)
                                  : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            msg['time']!,
                            style: TextStyle(
                              color: isAi ? Colors.grey[600] : Colors.white70,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                    ),
                    child: TextField(
                      controller: controller.messageController,
                      decoration: InputDecoration(
                        hintText: "Ask Player AI",
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.grey[400],
                          size: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      style: const TextStyle(color: Color(0xFF00204A)),
                      onSubmitted: (_) => controller.sendMessage(),
                    ),
                  ),
                ),
                // Hide send button if empty or show it
                // Using just keyboard submit or simple icon for now as per "Ask Player AI" design
              ],
            ),
          ),
        ],
      ),
    );
  }
}
