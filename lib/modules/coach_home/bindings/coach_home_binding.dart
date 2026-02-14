import 'package:get/get.dart';
import '../controllers/coach_home_controller.dart';
import '../../home/controllers/home_controller.dart';

class CoachHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoachHomeController>(() => CoachHomeController());
    // Ensure HomeController is available for the bottom nav bar
    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }
  }
}
