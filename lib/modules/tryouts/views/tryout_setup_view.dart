import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../routes/app_routes.dart';

class TryoutSetupView extends GetView {
  const TryoutSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Tryout Setup',
      showBackButton: true,
      backgroundColor: const Color(0xFFF5F9FF),
      showBottomNav: true,
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
          return CustomBottomNavBar(
            selectedIndex: 0,
            onItemTapped: (index) {
              if (index == 0) Get.offAllNamed(AppRoutes.home);
            },
          );
        }
      }(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            _buildOptionCard(
              title: 'Create New Tryout',
              subtitle: 'Event Creation Setting',
              icon: Icons.add_box_outlined, // Placeholder icon
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            _buildOptionCard(
              title: 'Manage Existing Tryout',
              subtitle: 'View & Edit Upcoming Tryout',
              icon: Icons.grid_view, // Placeholder icon
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            _buildOptionCard(
              title: 'Configure Age Groups',
              subtitle: 'Define Age Evaluation',
              icon: Icons.people_outline, // Placeholder icon
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            _buildOptionCard(
              title: 'Customize Evaluation From',
              subtitle: 'Setup Evaluation criteria',
              icon: Icons.settings_outlined, // Placeholder icon
              onTap: () {},
            ),
            SizedBox(height: 32.h),
            GestureDetector(
              onTap: () {
                // Handle Create Tryout action
              },
              child: Container(
                width: 175.w,
                padding: EdgeInsets.all(10.w),
                decoration: ShapeDecoration(
                  color: const Color(0xFF3064AB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.white, size: 24.w),
                    SizedBox(width: 10.w),
                    Text(
                      'Create Tryout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: ShapeDecoration(
          color: const Color(0xFFFEFEFE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          shadows: [
            BoxShadow(
              color: const Color(0x28000000),
              blurRadius: 6.r,
              offset: Offset(0, 3.h),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Center(
                child: Icon(icon, color: const Color(0xFF012355), size: 24.w),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: const Color(0xFF012356).withValues(alpha: 0.6),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: const Color(0xFF012356),
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
