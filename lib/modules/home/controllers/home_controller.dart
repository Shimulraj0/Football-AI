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
    // Prevent reloading the same page if tapped again (except Home which might reset)
    if (index == selectedIndex.value) {
      if (index == 0) {
        // If on Home tab and not at root of Home, go back to root
        if (Get.currentRoute != currentHomeRoute.value) {
          Get.offNamedUntil(currentHomeRoute.value, (route) => false);
        }
      }
      return;
    }

    int previousIndex = selectedIndex.value;
    selectedIndex.value = index;

    if (index == 0) {
      // Going back to Home
      if (Get.currentRoute != currentHomeRoute.value) {
        Get.offNamedUntil(currentHomeRoute.value, (route) => false);
      }
    } else {
      // Going to other tabs
      String targetRoute;
      if (index == 1) {
        targetRoute = AppRoutes.aiCommunicationHub;
      } else if (index == 2) {
        targetRoute = AppRoutes.settings;
      } else {
        return;
      }

      // If coming from Home (0), push the new route so we can go back to Home
      // If coming from another tab (!= 0), replace the current route
      if (previousIndex == 0) {
        Get.toNamed(targetRoute);
      } else {
        Get.offNamed(targetRoute);
      }
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
