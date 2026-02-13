import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';

import '../../../../global_widgets/coach_floating_button.dart';

class SessionExplanationView extends StatelessWidget {
  const SessionExplanationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      title: "Session Explanation",
      // headerHeight: 120.h,
      // headerContent: _buildHeaderContent(),
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoCard(
                  title: 'What We Trained Today',
                  subtitle:
                      'A brief explanation of exercises or activities trained.',
                  backgroundColor: const Color(0xFF012356),
                  textColor: Colors.white,
                  icon: Icons
                      .notifications_none_outlined, // Placeholder for the bell icon
                  iconColor: const Color(0xFF012356),
                  iconBgColor: const Color(0xFFFEFEFE),
                ),
                SizedBox(height: 16.h),
                _buildInfoCard(
                  title: 'Why It Matter',
                  subtitle: 'Short summary of the importance and benefits.',
                  backgroundColor: const Color(0xFFEAF2FD),
                  textColor: const Color(0xFF012355),
                  icon: Icons.lightbulb_outline,
                  iconColor: const Color(0xFF012356),
                  iconBgColor: const Color(0xFFFEFEFE),
                ),
                SizedBox(height: 16.h),
                _buildInfoCard(
                  title: 'How to Support Your Child',
                  subtitle:
                      'Suggestions or tips for parents to help continue development.',
                  backgroundColor: const Color(0xFFEAF2FD),
                  textColor: const Color(0xFF012355),
                  icon: Icons.favorite_border,
                  iconColor: const Color(0xFF012356),
                  iconBgColor: const Color(0xFFFEFEFE),
                ),
                SizedBox(height: 80.h),
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

  Widget _buildInfoCard({
    required String title,
    required String subtitle,
    required Color backgroundColor,
    required Color textColor,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Icon(icon, color: iconColor, size: 24.w),
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
                    color: textColor,
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
    );
  }
}
