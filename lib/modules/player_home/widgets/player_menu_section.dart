import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../../core/values/app_padding.dart';
import '../controllers/player_home_controller.dart';
import '../../home/widgets/home_action_card.dart';

class PlayerMenuSection extends StatelessWidget {
  const PlayerMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlayerHomeController>();

    // Using a list for data to keep build method clean
    // Define the menu items directly to handle specific styling
    return ListView(
      padding: AppPadding.pagePadding,
      children: [
        // 1. Daily Mindset Tip (Gradient)
        HomeActionCard(
          title: "Daily Mindset Tip",
          subtitle: "The harder you work, the luckier you get.",
          iconData: Icons.auto_awesome_outlined,
          backgroundGradient: const LinearGradient(
            colors: [Color(0xFF4CD8C4), Color(0xFF36C3B5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          titleColor: Colors.white,
          subtitleColor: Colors.white,
          iconColor: Colors.white,
          iconBackgroundColor: Colors.transparent, // Make icon box transparent
          onTap: () {
            // Static tile, no action
          },
        ),

        // 2. Training Feedback (Dark Blue)
        HomeActionCard(
          title: "Training Feedback",
          subtitle:
              "Share your training experience and get personalized advice",
          iconData: Icons.chat_bubble_outline_rounded,
          backgroundColor: const Color(0xFF00204A),
          titleColor: Colors.white,
          subtitleColor: Colors.white.withValues(alpha: 0.9),
          iconColor: const Color(0xFF00204A), // Contrast with white icon box
          onTap: () {
            Get.toNamed(AppRoutes.trainingFeedback);
          },
        ),

        // 3. Skill Progress Tracker (White)
        HomeActionCard(
          title: "Skill Progress Tracker",
          subtitle: "View your improvement over time with detailed charts",
          // Use similar icon to "Performance Reports" if available, else standard icon
          iconData: Icons.show_chart_rounded,
          // Default white background style matches this, so just need text/icon default
          onTap: () {
            Get.toNamed(AppRoutes.skillProgressTracker);
          },
        ),

        // 4. Talk to Player AI (White)
        HomeActionCard(
          title: "Talk to Player AI",
          subtitle: "Get instant help with technique, tactics and mindset",
          iconData: Icons.chat_bubble_outline_rounded, // Reusing chat icon
          onTap: () {
            controller.changeTabIndex(1); // Switch to Coach/Player AI tab
          },
        ),
      ],
    );
  }
}
