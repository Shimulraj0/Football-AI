import 'package:get/get.dart';
import '../controllers/new_schedule_controller.dart';
import '../../../../modules/home/controllers/home_controller.dart';

class NewScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewScheduleController>(() => NewScheduleController());
    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }
  }
}
