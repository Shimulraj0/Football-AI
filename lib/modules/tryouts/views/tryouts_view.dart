import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tryouts_controller.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';

class TryoutsView extends GetView<TryoutsController> {
  const TryoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Tryouts",
      body: Center(
        child: Text(
          'Tryouts Module',
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
