import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../routes/app_routes.dart';
import '../../home/controllers/home_controller.dart';

import '../controllers/tryouts_controller.dart';

class TryoutsView extends GetView<TryoutsController> {
  const TryoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showBackButton: false,
      headerContent: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
        child: Row(
          children: [
            Container(
              width: 51.w,
              height: 51.w,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/icons/Ellipse13.png"),
                  fit: BoxFit.cover,
                ),
                shape: OvalBorder(
                  side: BorderSide(width: 1, color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 13.w),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                ),
                Text(
                  "TRYOUTS MODULE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 38.w,
              height: 38.w,
              decoration: ShapeDecoration(
                color: const Color(0xFFFEFEFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.notifications_outlined,
                  size: 20.w,
                  color: const Color(0xFF012355),
                ),
              ),
            ),
          ],
        ),
      ),
      showBottomNav: true, // Use the standard bottom nav which matches design
      backgroundColor: const Color(0xFFF5F9FF),
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
          // Fallback if HomeController is not present (e.g. direct navigation)
          return CustomBottomNavBar(
            selectedIndex: 0,
            onItemTapped: (index) {
              if (index == 0) {
                Get.offAllNamed(AppRoutes.home);
              } else if (index == 1) {
                Get.offNamed(AppRoutes.aiCommunication);
              } else if (index == 2) {
                Get.offNamed(AppRoutes.settings);
              }
            },
          );
        }
      }(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              _buildMenuCard(
                title: 'Tryout Setup',
                icon: Icons.settings_outlined,
                onTap: controller.navigateToSetup,
              ),
              SizedBox(height: 16.h),
              _buildMenuCard(
                title: 'Tryout Eval Entry',
                icon: Icons.input_rounded,
                onTap: controller.navigateToEvalEntry,
              ),
              SizedBox(height: 16.h),
              _buildMenuCard(
                title: 'Tryout Scoring',
                icon: Icons.sports_score_rounded,
                onTap: controller.navigateToScoring,
              ),
              SizedBox(height: 16.h),
              _buildMenuCard(
                title: 'Tryout Placement',
                icon: Icons.transform_rounded,
                onTap: controller.navigateToPlacement,
              ),
              SizedBox(height: 16.h),
              _buildMenuCard(
                title: 'Tryout Invites',
                icon: Icons.send_rounded,
                onTap: controller.navigateToInvites,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 97.h,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        decoration: ShapeDecoration(
          color: const Color(0xFFEAF2FD),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: [
            BoxShadow(
              color: const Color(0x28000000),
              blurRadius: 6,
              offset: const Offset(0, 3),
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
                color: const Color(0xFFFEFEFE),
                shape: OvalBorder(),
              ),
              child: Center(
                child: Icon(icon, color: const Color(0xFF012355), size: 24.w),
              ),
            ),
            SizedBox(width: 13.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF012355),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
