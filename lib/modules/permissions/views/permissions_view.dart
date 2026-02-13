import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/permissions_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../global_widgets/base_scaffold.dart';

import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../core/utils/size_utils.dart';
import 'team_assignment_view.dart';
import 'age_group_assignment_view.dart';
import 'parent_child_linking_view.dart';

class PermissionsView extends GetView<PermissionsController> {
  const PermissionsView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value = AppRoutes.permissions;
    }

    return BaseScaffold(
      showHeader: true,
      title: "Permissions",
      // headerHeight: 124.h,
      // headerContent: _buildCustomHeaderContent(),
      backgroundColor: const Color(0xFFF9F9F9),
      body: Column(
        children: [
          // Header is now handled by BaseScaffold
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("Role & Assignment"),
                  SizedBox(height: 16.h),
                  _buildMenuCard(
                    title: "Role Assignment",
                    subtitle: "Plan session & drills",
                    icon: Icons.manage_accounts_outlined, // Placeholder icon
                    onTap: () {
                      Get.toNamed(AppRoutes.roleAssignment);
                    },
                  ),
                  SizedBox(height: 16.h),
                  _buildMenuCard(
                    title: "Team Assignment",
                    subtitle: "Personalized feedback",
                    icon: Icons.groups_outlined,
                    onTap: () {
                      Get.to(() => const TeamAssignmentView());
                    },
                  ),
                  SizedBox(height: 16.h),
                  _buildMenuCard(
                    title: "Age Group Assignment",
                    subtitle: "Updates & logistics",
                    icon: Icons.category_outlined,
                    onTap: () {
                      Get.to(() => const AgeGroupAssignmentView());
                    },
                  ),
                  SizedBox(height: 16.h),
                  _buildMenuCard(
                    title: "Parent-Child Linking",
                    subtitle: "Club methodology & strategy",
                    icon: Icons.family_restroom_outlined,
                    onTap: () {
                      Get.to(() => const ParentChildLinkingView());
                    },
                  ),
                ],
              ),
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
        } else {
          return null;
        }
      }(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: const Color(0xFF012356),
        fontSize: 16.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildMenuCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0x28000000),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Icon(icon, color: const Color(0xFF012356), size: 24.w),
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
                      color: const Color(0xFF575757),
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
