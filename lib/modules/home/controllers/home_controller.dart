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
        targetRoute = AppRoutes.aiCommunication;
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
}
