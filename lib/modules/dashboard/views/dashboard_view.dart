import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/role_selector_grid.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 100,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Column(
            children: [
              // Grid of Options
              Obx(
                () => RoleSelectorGrid(
                  roles: controller.roles,
                  selectedRole: controller.selectedRole.value,
                  onRoleSelected: controller.selectRole,
                ),
              ),
              const SizedBox(height: 20),
            ],
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
