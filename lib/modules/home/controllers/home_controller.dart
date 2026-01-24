import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final selectedIndex = 0.obs;
  final RxString currentHomeRoute = AppRoutes.home.obs;

  void increment() => count.value++;

  void startChat() {
    // Navigate to Chat
  }

  void changeTabIndex(int index) {
    // If the same tab is clicked
    if (index == selectedIndex.value) {
      // If we are not on the main HomeView (e.g., inside a sub-page), pop to HomeView
      if (Get.currentRoute != currentHomeRoute.value) {
        Get.offNamedUntil(currentHomeRoute.value, (route) => false);
      }
      return;
    }

    // Update the selected index
    selectedIndex.value = index;

    if (index == 0) {
      // Home Tab
      if (Get.currentRoute != currentHomeRoute.value) {
        Get.offNamedUntil(currentHomeRoute.value, (route) => false);
      }
    } else if (index == 1) {
      // Coach AI
      Get.toNamed(AppRoutes.aiCommunication);
    } else if (index == 2) {
      // Settings
      Get.toNamed(AppRoutes.settings);
    }
  }
}
