import 'package:get/get.dart';
import '../controllers/sc_director_home_controller.dart';
import '../../../home/controllers/home_controller.dart';

class ScDirectorHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScDirectorHomeController>(() => ScDirectorHomeController());
    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }
  }
}
