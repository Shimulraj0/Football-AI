import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ai_communication_controller.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';

class AiCommunicationView extends GetView<AiCommunicationController> {
  const AiCommunicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "AI Communication",
      body: Center(
        child: Text(
          'AI Communication',
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
