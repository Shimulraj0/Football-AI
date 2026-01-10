import 'package:get/get.dart';

class PlayerHomeController extends GetxController {
  final selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    // If asking for same tab or logic needs check
    if (selectedIndex.value == index && index == 0) {
      // Already on home, maybe refresh?
      return;
    }

    // Handle navigation to other tabs or views explicitly if needed
    // For now, mirroring HomeController logic for these 3 specific tabs
    selectedIndex.value = index;

    // If we want to ensure we are on the right "page" logic (though in PlayerHomeView it's swapped via Obx)
    // nothing else needed for pure UI switching within the scaffold.
  }
}
