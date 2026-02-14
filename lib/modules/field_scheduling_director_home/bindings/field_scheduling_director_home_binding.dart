import 'package:get/get.dart';
import '../controllers/field_scheduling_director_home_controller.dart';
import '../../home/controllers/home_controller.dart';

class FieldSchedulingDirectorHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FieldSchedulingDirectorHomeController>(
      () => FieldSchedulingDirectorHomeController(),
    );
    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }
  }
}
