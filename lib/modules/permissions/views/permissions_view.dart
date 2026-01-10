import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/permissions_controller.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';

class PermissionsView extends GetView<PermissionsController> {
  const PermissionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Permissions & Role Assignment",
      body: Center(
        child: Text(
          'Permissions & Role Assignment',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
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
