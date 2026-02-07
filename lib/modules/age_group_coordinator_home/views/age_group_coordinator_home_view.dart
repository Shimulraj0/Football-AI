import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/age_group_coordinator_home_controller.dart';
import '../../assigned_age_groups/views/age_group_detail_view.dart';

import '../../home/controllers/home_controller.dart';

class AgeGroupCoordinatorHomeView
    extends GetView<AgeGroupCoordinatorHomeController> {
  const AgeGroupCoordinatorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value =
          AppRoutes.ageGroupCoordinatorHome;
    }

    return BaseScaffold(
      headerContent: _buildHeader(),
      showBottomNav: true,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          _buildMenuCard(
            title: "Weekly Overview",
            subtitle: "U9-U12 Age Groups",
            icon: Icons.calendar_today, // Placeholder icon
            backgroundColor: const Color(0xFF012356),
            textColor: Colors.white,
            iconBackgroundColor: Colors.white,
            onTap: () {
              Get.to(
                () => const AgeGroupDetailView(),
              ); // Or AppRoutes if registered
            },
          ),
          SizedBox(height: 16.h),
          _buildMenuCard(
            title: "Age Group Oversight",
            subtitle: "See through Age Group Oversight",
            icon: Icons.chat_bubble_outline,
            backgroundColor: const Color(0xFFEAF2FD),
            textColor: const Color(0xFF012355),
            iconBackgroundColor: Colors.white,
            onTap: () {
              Get.toNamed(AppRoutes.assignedAgeGroups);
            },
          ),
          SizedBox(height: 16.h),
          _buildMenuCard(
            title: "Session Observations",
            subtitle: "Coach Mentoring",
            icon: Icons.visibility_outlined,
            backgroundColor: const Color(0xFFEAF2FD),
            textColor: const Color(0xFF012355),
            iconBackgroundColor: Colors.white,
            onTap: () {
              Get.toNamed(AppRoutes.sessionObservations);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 51.w,
          height: 51.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.w),
            image: const DecorationImage(
              image: AssetImage(
                'assets/icons/Ellipse13.png',
              ), // Or network image
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "Age Group Coordination (AGC)",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.notifications_outlined,
            color: const Color(0xFF00204A),
            size: 24.w,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color backgroundColor,
    required Color textColor,
    required Color iconBackgroundColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Icon(icon, color: const Color(0xFF202020), size: 24.w),
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
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: textColor.withValues(
                        alpha: 0.8,
                      ), // Slightly transparent for subtitle
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
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
