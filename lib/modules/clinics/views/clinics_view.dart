import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/clinics_controller.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';

class ClinicsView extends GetView<ClinicsController> {
  const ClinicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Clinics & Camps",
      body: Center(
        child: Text(
          'Clinics & Camps Module',
          style: Theme.of(context).textTheme.headlineSmall,
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
