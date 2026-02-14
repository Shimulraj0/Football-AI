import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../routes/app_routes.dart';

class TryoutPlacementView extends GetView {
  const TryoutPlacementView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Tryout Placement',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'U10 Boys Tryout',
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 16.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Jan 20, Field 5',
              style: TextStyle(
                color: const Color(0xFF012356).withValues(alpha: 0.5),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.h),
            _buildPlacementCard(
              title: 'Placement (56)',
              icon: Icons.calendar_today_outlined, // Placeholder
              onTap: () {
                Get.toNamed(AppRoutes.placementList);
              },
            ),
            SizedBox(height: 16.h),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
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
              child: Column(
                children: [
                  _buildListItem(
                    title: 'Select Player',
                    icon: Icons.person_outline, // Placeholder
                    showDivider: true,
                    onTap: () {},
                  ),
                  _buildListItem(
                    title: 'Enter Scores',
                    icon: Icons.computer, // Placeholder
                    showDivider: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            _buildPlacementCard(
              title: 'Evaluation',
              icon: Icons.assignment_outlined, // Placeholder
              onTap: () {},
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPlacementCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF012356), size: 24.w),
                SizedBox(width: 12.w),
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
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

  Widget _buildListItem({
    required String title,
    required IconData icon,
    required bool showDivider,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: showDivider
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: const Color(0x1F000000), // Light divider color
                    width: 1.w,
                  ),
                ),
              )
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF012356), size: 24.w),
                SizedBox(width: 12.w),
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
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
