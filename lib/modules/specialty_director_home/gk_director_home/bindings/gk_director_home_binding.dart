import 'package:get/get.dart';
import '../controllers/gk_director_home_controller.dart';
import '../../../home/controllers/home_controller.dart';

class GkDirectorHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GkDirectorHomeController>(() => GkDirectorHomeController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
