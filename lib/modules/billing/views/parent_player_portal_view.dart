import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import 'child_development_summary_view.dart';
import 'session_explanation_view.dart';
import '../controllers/parent_player_portal_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../global_widgets/coach_floating_button.dart';

class ParentPlayerPortalView extends GetView<ParentPlayerPortalController> {
  const ParentPlayerPortalView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value =
          AppRoutes.parentPlayerPortal;
    }

    return BaseScaffold(
      showHeader: true,
      headerHeight: 127.h,
      headerContent: _buildHeaderContent(),
      backgroundColor: const Color(0xFFFEFEFE), // White background per snippet
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                _buildInteractiveCard(
                  title: 'Child Development Summary',
                  subtitle: 'Upcoming Practices/Games',
                  icon: Icons
                      .calendar_today_outlined, // Specific icon for this one
                  onTap: () {
                    Get.to(() => const ChildDevelopmentSummaryView());
                  },
                ),
                SizedBox(height: 16.h),
                _buildInteractiveCard(
                  title: 'Session Explanation',
                  subtitle:
                      'What we trained today\nWhy it matters\nHow to support child',
                  onTap: () {
                    Get.to(() => const SessionExplanationView());
                  },
                ),
                SizedBox(height: 16.h),
                _buildInteractiveCard(
                  title: 'Simplified Evaluation',
                  subtitle:
                      'Strength\nAreas to improve\nSuggested Home Practice',
                ),
                SizedBox(height: 16.h),
                _buildInteractiveCard(
                  title: 'Home Training Task',
                  subtitle: 'Weekly Practice Card',
                ),
                SizedBox(height: 16.h),
                _buildInteractiveCard(
                  title: 'Ask Parent AI',
                  subtitle:
                      'Playing Time Concern\nDevelopment Concern\nConfidence Issues',
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.aiCommunication,
                      arguments: {'title': 'Parent AI'},
                    );
                  },
                ),
                SizedBox(height: 80.h), // Space for floating button
              ],
            ),
          ),
          const Positioned(right: 0, bottom: 0, child: CoachFloatingButton()),
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
        } else {
          return null;
        }
      }(),
    );
  }

  Widget _buildHeaderContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 51.w,
                height: 51.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/icons/Ellipse13.png",
                    ), // Placeholder or asset
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: const Color(0xFFFEFEFE),
                      fontSize: 18.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Danialvez',
                    style: TextStyle(
                      color: const Color(0xFFFEFEFE),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 38.w,
            height: 38.w,
            decoration: const BoxDecoration(
              color: Color(0xFFFEFEFE),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.notifications_none,
                color: const Color(0xFF012355),
                size: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveCard({
    required String title,
    required String subtitle,
    IconData? icon,
    VoidCallback? onTap,
  }) {
    return Obx(() {
      final isSelected = controller.selectedCardTitle.value == title;
      return GestureDetector(
        onTap: () {
          controller.selectCard(title);
          if (onTap != null) onTap();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF012356)
                : const Color(0xFFEAF2FD),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEFEFE),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Icon(
                    icon ?? _getIconForTitle(title),
                    color: const Color(0xFF012356),
                    size: 24.w,
                  ),
                ),
              ),
              SizedBox(width: 13.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF012355),
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF012355),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  IconData _getIconForTitle(String title) {
    if (title.contains("Session")) return Icons.chat_bubble_outline;
    if (title.contains("Evaluation")) return Icons.check_circle_outline;
    if (title.contains("Training")) return Icons.assignment_outlined;
    if (title.contains("Ask")) return Icons.help_outline;
    return Icons.info_outline;
  }

  // Removed _buildCoachMessageButton as it is now a global widget
}
