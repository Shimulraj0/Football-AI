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
    // Always update the selected index to reflect the tap
    int previousIndex = selectedIndex.value;
    selectedIndex.value = index;

    // Handle Home Navigation (Index 0)
    if (index == 0) {
      // "Home button take me on logged in persona's home page"
      // Use offAllNamed to reset the stack and ensure we land on the correct home
      Get.offAllNamed(currentHomeRoute.value);
      return;
    }

    // Handle Other Tabs
    String targetRoute;
    if (index == 1) {
      // "Coach Ai button will open Coach AI chat section"
      targetRoute = AppRoutes.aiCommunicationHub;
    } else if (index == 2) {
      // "setting button will open the global setting page from anywhere"
      targetRoute = AppRoutes.settings;
    } else {
      return;
    }

    // Navigation Logic for Non-Home Tabs
    if (previousIndex == 0) {
      // If coming from Home, push the new route so we can go back
      Get.toNamed(targetRoute);
    } else {
      // If switching between non-home tabs (e.g., Settings -> Coach AI),
      // replace the current route to avoid infinite stack buildup
      // Exception: If we are already on the target tab/route, we might want to pop to root of that tab?
      // For now, replacing is safer to prevent "freeze" and deep stack issues.
      Get.offNamed(targetRoute);
    }
  }

  bool get isAtTabRoot {
    if (selectedIndex.value == 0) return true; // Home is always root
    if (selectedIndex.value == 1 &&
        Get.currentRoute == AppRoutes.aiCommunicationHub) {
      return true;
    }
    if (selectedIndex.value == 2 && Get.currentRoute == AppRoutes.settings) {
      return true;
    }
    return false;
  }

  void onBack() {
    // Logic to handle back navigation:
    // If not on Home tab, and at the root of the tab, go back to Home (0).
    // Otherwise, just pop.

    if (selectedIndex.value != 0 && isAtTabRoot) {
      changeTabIndex(0);
    } else {
      Get.back();
    }
  }
}
