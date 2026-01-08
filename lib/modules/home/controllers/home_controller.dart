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
    // If the same tab is clicked
    if (index == selectedIndex.value) {
      // If we are not on the main HomeView (e.g., inside a sub-page), pop to HomeView
      if (Get.currentRoute != AppRoutes.home) {
        Get.offNamedUntil(AppRoutes.home, (route) => false);
      }
      return;
    }

    // Update the selected index
    selectedIndex.value = index;

    // Logic to ensure we are on the HomeView (root of navigation for tabs)
    // If we are currently on a sub-page (like settings sub-page or team management),
    // we need to clear the stack and go back to HomeView so the body updates correctly.
    if (Get.currentRoute != AppRoutes.home) {
      Get.offNamedUntil(AppRoutes.home, (route) => false);
    }
  }
}
