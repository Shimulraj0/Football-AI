import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/dashboard_card.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../routes/app_routes.dart';
import '../../../core/utils/size_utils.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 20.w,
            right: 20.w,
            bottom: 10.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Club Command Center
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: DashboardCard(
                    title: 'Club Command Center',
                    icon: SvgPicture.asset('assets/icons/Membership.svg'),
                    onTap: () => Get.toNamed(AppRoutes.clubCommandCenter),
                  ),
                ),

                // Staff Workspace (Highlighted)
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: DashboardCard(
                    title: 'Staff Workspace',
                    icon: SvgPicture.asset('assets/icons/Grouping.svg'),
                    isHighlighted: true,
                    onTap: () => Get.toNamed(AppRoutes.staffWorkspace),
                  ),
                ),

                // Player & Family Hub
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: DashboardCard(
                    title: 'Player & Family Hub',
                    icon: SvgPicture.asset('assets/icons/Grou.svg'),
                    onTap: () => Get.toNamed(AppRoutes.playerFamilyHub),
                  ),
                ),

                // Operations & Admin
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: DashboardCard(
                    title: 'Operations & Admin',
                    icon: SvgPicture.asset('assets/icons/Settings.svg'),
                    onTap: () => Get.toNamed(AppRoutes.operationsAdmin),
                  ),
                ),

                // AI Communication
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: DashboardCard(
                    title: 'AI Communication',
                    icon: SvgPicture.asset(
                      'assets/icons/Virtual Assistant.svg',
                    ),
                    onTap: () {},
                    showAction: false,
                  ),
                ),
              ],
            ),
          ),
        ),
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
}
