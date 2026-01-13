import 'package:get/get.dart';
import '../controllers/technical_director_home_controller.dart';

class TechnicalDirectorHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TechnicalDirectorHomeController>(
      () => TechnicalDirectorHomeController(),
    );
  }
}
