import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/dashboard_card.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../routes/app_routes.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20, // Reduced from 100
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Club Command Center
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: DashboardCard(
                    title: 'Club Command Center',
                    icon: SvgPicture.asset('assets/icons/Membership.svg'),
                    onTap: () => controller.selectRole('Club Setup'),
                  ),
                ),

                // Staff Workspace (Highlighted)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: DashboardCard(
                    title: 'Staff Workspace',
                    icon: SvgPicture.asset('assets/icons/Grouping.svg'),
                    isHighlighted: true,
                    onTap: () => controller.selectRole('Technical Director'),
                  ),
                ),

                // Player & Family Hub
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: DashboardCard(
                    title: 'Player & Family Hub',
                    icon: SvgPicture.asset('assets/icons/Grou.svg'),
                    onTap: () => Get.toNamed(AppRoutes.playerFamilyHub),
                  ),
                ),

                // Operations & Admin
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: DashboardCard(
                    title: 'Operations & Admin',
                    icon: SvgPicture.asset('assets/icons/Settings.svg'),
                    onTap: () => controller.selectRole('Permissions'),
                  ),
                ),

                // AI Communication
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: DashboardCard(
                    title: 'AI Communication',
                    icon: SvgPicture.asset('assets/icons/Grouping.svg'),
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
