import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final selectedIndex = 0.obs;

  void increment() => count.value++;

  void startChat() {
    // Navigate to Chat
  }

  void changeTabIndex(int index) {
    if (index == selectedIndex.value) {
      // If tapping Home again, check if we need to pop to root
      if (index == 0) {
        // If we are deep in the navigation stack (not on HomeView), pop to Home
        if (Get.currentRoute != AppRoutes.home) {
          Get.offNamedUntil(AppRoutes.home, (route) => false);
        }
      }
      return;
    }

    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamedUntil(
          AppRoutes.home,
          (route) => false,
        ); // Reset stack to home
        break;
      case 1:
        // Get.toNamed(AppRoutes.coachAi); // Placeholder
        break;
      case 2:
        // Get.toNamed(AppRoutes.settings); // Placeholder
        break;
    }
  }
}
