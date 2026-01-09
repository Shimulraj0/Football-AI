import 'package:get/get.dart';
import '../controllers/surveys_controller.dart';

class SurveysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveysController>(() => SurveysController());
  }
}
