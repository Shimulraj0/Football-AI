import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../../home/controllers/home_controller.dart';

class AiCommunicationView extends StatelessWidget {
  const AiCommunicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FF),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                const Text(
                  "U10 Boys Silver",
                  style: TextStyle(
                    color: Color(0xFF00204A),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Your team needs defensive shape work",
                  style: TextStyle(color: Color(0xFF00204A), fontSize: 14),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Analysis",
                  style: TextStyle(
                    color: Color(0xFF00204A),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "The U10 boys silver team is struggling with defensive shape, as indicated by a high rate of goals conceded. The team trends to be out of position and struggles to close down attacker effectively.",
                  style: TextStyle(
                    color: const Color(0xFF00204A).withValues(alpha: 0.8),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Suggestions",
                  style: TextStyle(
                    color: Color(0xFF00204A),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _buildSuggestionItem(
                  "Implement a defensive drill focusing on maintaining shape.",
                ),
                const SizedBox(height: 12),
                _buildSuggestionItem("Review position in training sessions."),
                const SizedBox(height: 12),
                _buildSuggestionItem(
                  "Encourage communication and teamwork among players.",
                ),
                const SizedBox(height: 12),
                _buildSuggestionItem(
                  "Monitor and adjust during games to ensure proper defensive structure.",
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: () {
        if (Get.isRegistered<HomeController>()) {
          final homeController = Get.find<HomeController>();
          return Obx(
            () => CustomBottomNavBar(
              selectedIndex: homeController.selectedIndex.value,
              onItemTapped: homeController.changeTabIndex,
            ),
          );
        }
        return null;
      }(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(
        top: 60.0,
        left: 20.0,
        right: 20.0,
        bottom: 30.0,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF00204A),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          CustomBackButton(
            onPressed: () => Get.back(),
            backgroundColor: Colors.white,
            iconColor: const Color(0xFF00204A),
          ),
          Expanded(
            child: Center(
              child: Text(
                "AI Communication",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildSuggestionItem(String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Color(0xFF00204A),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Color(0xFF00204A), fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
