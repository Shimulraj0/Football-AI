import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';

import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/billing_controller.dart';
import '../widgets/billing_add_on_card.dart';

class BillingView extends GetView<BillingController> {
  const BillingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      // We'll provide our own header content via headerContent param
      showHeader: true,
      title: "Billing",
      // headerHeight: 124.h, // Custom height as per design
      // headerContent: _buildHeaderContent(),
      body: Column(
        children: [
          SizedBox(height: 16.h), // Reduced top spacing

          _buildWelcomeCard(),
          SizedBox(height: 20.h), // Reduced spacing

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Add-Ons',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h), // Reduced spacing
          // Use Expanded or Flexible to allow list to take remaining space if needed,
          // or just standard column with tight spacing.
          // Since we want to ensure it fits, let's just use the column but with MainAxisSize.min or similar
          // if we were in a scroll view, but here we are in a fixed height slot.
          // We'll wrap the list in a container or just leave as is with reduced gaps.
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Expanded(
                    child: BillingAddOnCard(
                      title: 'Smart Analytics',
                      subtitle: 'See deep performance status & trends',
                      imagePath: "assets/images/statess.png",
                      onTap: () => Get.toNamed(AppRoutes.smartAnalytics),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: BillingAddOnCard(
                      title: 'Pro Curriculum Engine',
                      subtitle:
                          'Access enhance training curricula', // Typo in original file "enhance" vs "enhanced", keeping for now to minimize diff or fixing? I'll just keep the line context.
                      imagePath: "assets/images/files.png",
                      onTap: () => Get.toNamed(AppRoutes.proCurriculumEngine),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: BillingAddOnCard(
                      title: 'Parent-Player Portal',
                      subtitle: 'Elevate parent & Player engagement',
                      imagePath: "assets/images/peoples.png",
                      onTap: () => Get.toNamed(AppRoutes.parentPlayerPortal),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: BillingAddOnCard(
                      title: 'Injury Risk AI Alerts',
                      subtitle: 'Track & prevent injury risks',
                      imagePath: "assets/images/risk.png",
                      onTap: () => Get.toNamed(AppRoutes.injuryRisk),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h), // Bottom padding
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
          // Fallback if HomeController is not present (e.g. direct navigation)
          // We assume index 2 (Settings) as Billing is often related to Settings
          return CustomBottomNavBar(
            selectedIndex: 0,
            onItemTapped: (index) {
              if (index == 0) {
                // Already on Home (Billing Home)
              } else if (index == 1) {
                Get.offAllNamed(AppRoutes.home);
              } else if (index == 2) {
                Get.offNamed(AppRoutes.settings);
              }
            },
          );
        }
      }(),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      width: 335.w,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
      decoration: ShapeDecoration(
        color: const Color(0xFFEAF2FD),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/neuron.png"),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          SizedBox(width: 13.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      const TextSpan(text: 'Enhance your club’s platform\n'),
                      const TextSpan(text: 'With powerful upgrades.'),
                    ],
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
