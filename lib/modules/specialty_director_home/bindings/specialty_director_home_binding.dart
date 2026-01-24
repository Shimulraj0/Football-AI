import 'package:get/get.dart';
import '../controllers/specialty_director_home_controller.dart';
import '../../home/controllers/home_controller.dart';

class SpecialtyDirectorHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecialtyDirectorHomeController>(
      () => SpecialtyDirectorHomeController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
