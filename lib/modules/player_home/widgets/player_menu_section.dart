import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../routes/app_routes.dart';
import '../controllers/player_home_controller.dart';
import 'mindset_tip_card.dart';

class PlayerMenuSection extends StatelessWidget {
  const PlayerMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlayerHomeController>();

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      children: [
        const MindsetTipCard(),
        SizedBox(height: 16.h),
        // Training Feedback
        _buildTrainingFeedbackCard(
          onTap: () => Get.toNamed(AppRoutes.trainingFeedback),
        ),
        SizedBox(height: 16.h),
        // Skill Progress Tracker
        _buildActionCard(
          title: "Skill Progress Tracker",
          subtitle: "View your improvement over time with detailed charts",
          iconColor: const Color(0xFFFEFEFE), // White icon box
          iconBoxColor: const Color(0xFFFEFEFE),
          textColor: const Color(0xFF012355),
          backgroundColor: const Color(0xFFEAF2FD),
          borderColor: const Color(0xFF012355),
          onTap: () => Get.toNamed(AppRoutes.skillProgressTracker),
        ),
        SizedBox(height: 16.h),
        // Talk to Player AI
        _buildActionCard(
          title: "Talk to Player AI",
          subtitle: "Get instant help with technique, tactics and mindset",
          iconColor: const Color(0xFFFEFEFE),
          iconBoxColor: const Color(0xFFFEFEFE),
          textColor: const Color(0xFF012355),
          backgroundColor: const Color(0xFFEAF2FD),
          borderColor: const Color(0xFF012355),
          onTap: () => controller.changeTabIndex(1),
        ),
        SizedBox(height: 16.h),
        // Product Suggestions
        _buildActionCard(
          title: "Product Suggestions",
          subtitle: "Discover training guides to accelerate your development",
          iconColor: const Color(0xFFDCFCE7), // Light green icon box
          iconBoxColor: const Color(0xFFDCFCE7),
          textColor: const Color(0xFF202020),
          subtitleColor: const Color(0xFF575757),
          backgroundColor: const Color(0xFFFEFEFE),
          borderColor: const Color(0xFFE0E0E0),
          onTap: () {
            // Action for product suggestions
          },
        ),
      ],
    );
  }

  Widget _buildTrainingFeedbackCard({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 335.w,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        decoration: ShapeDecoration(
          color: const Color(0xFF012355),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: ShapeDecoration(
                color: const Color(0xFFFEFEFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.black,
                  size: 24.w,
                ),
              ),
            ),
            SizedBox(width: 13.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Training Feedback',
                    style: TextStyle(
                      color: const Color(0xFFFEFEFE),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Share your training experience and get personalized advice',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.90),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required Color iconBoxColor,
    required Color textColor,
    required Color backgroundColor,
    required Color borderColor,
    Color? iconColor,
    Color? subtitleColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 335.w,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: borderColor),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: ShapeDecoration(
                color: iconBoxColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Center(
                // Placeholder logic for icons based on title or random,
                // matching the snippet's "Stack" placeholder
                child: Icon(
                  title.contains("Skill")
                      ? Icons.show_chart
                      : title.contains("Chat") || title.contains("Talk")
                      ? Icons.chat_bubble_outline
                      : Icons.shopping_bag_outlined,
                  color: Colors.black,
                  size: 24.w,
                ),
              ),
            ),
            SizedBox(width: 13.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: subtitleColor ?? textColor,
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
