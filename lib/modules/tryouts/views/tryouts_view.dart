import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tryouts_controller.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_back_button.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';

class TryoutsView extends GetView<TryoutsController> {
  const TryoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CustomBackButton(),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Tryouts Module',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
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
