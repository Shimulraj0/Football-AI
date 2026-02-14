import 'package:get/get.dart';
import '../controllers/evaluation_controller.dart';
import '../../home/controllers/home_controller.dart';

class EvaluationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EvaluationController>(() => EvaluationController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
