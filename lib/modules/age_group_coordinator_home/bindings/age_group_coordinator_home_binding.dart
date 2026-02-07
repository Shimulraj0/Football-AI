import 'package:get/get.dart';
import '../controllers/age_group_coordinator_home_controller.dart';
import '../../home/controllers/home_controller.dart';

class AgeGroupCoordinatorHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgeGroupCoordinatorHomeController>(
      () => AgeGroupCoordinatorHomeController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
