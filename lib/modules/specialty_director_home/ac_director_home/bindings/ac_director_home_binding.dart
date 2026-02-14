import 'package:get/get.dart';
import '../controllers/ac_director_home_controller.dart';
import '../../../home/controllers/home_controller.dart';

class AcDirectorHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcDirectorHomeController>(() => AcDirectorHomeController());
    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }
  }
}
