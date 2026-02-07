import 'package:get/get.dart';
import '../controllers/director_of_coaching_home_controller.dart';
import '../../home/controllers/home_controller.dart';

class DirectorOfCoachingHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DirectorOfCoachingHomeController>(
      () => DirectorOfCoachingHomeController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
