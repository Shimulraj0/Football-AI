import 'package:get/get.dart';
import '../controllers/curriculum_engine_controller.dart';

class CurriculumEngineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CurriculumEngineController>(() => CurriculumEngineController());
  }
}
