import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../routes/app_routes.dart';

class TryoutEvalEntryView extends GetView {
  const TryoutEvalEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Tryout Evaluation Entry',
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
              title: 'Enter Scores',
              subtitle: 'Quick Scoring entry',
              icon: Icons.table_chart_outlined, // Placeholder icon
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            _buildOptionCard(
              title: 'Evaluation',
              subtitle: 'Manage pending player evaluation',
              icon: Icons.assignment_outlined, // Placeholder icon
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            _buildOptionCard(
              title: 'Coach Notes',
              subtitle: 'Add Notes',
              icon: Icons.edit_note, // Placeholder icon
              onTap: () {},
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
