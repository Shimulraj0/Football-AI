import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class TechnicalDirectorHomeController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 1:
        Get.toNamed(AppRoutes.aiCommunication);
        break;
      case 2:
        Get.toNamed(AppRoutes.settings);
        break;
    }
  }
}
