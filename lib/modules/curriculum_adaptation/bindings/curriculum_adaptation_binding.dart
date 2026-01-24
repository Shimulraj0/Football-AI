import 'package:get/get.dart';
import '../controllers/curriculum_adaptation_controller.dart';
import '../../home/controllers/home_controller.dart';

class CurriculumAdaptationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CurriculumAdaptationController>(
      () => CurriculumAdaptationController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
